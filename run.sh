#!/bin/bash

# Environmental variables
INPUT="$WERCKER_ZIP_INPUT"
OUTPUT="$WERCKER_ZIP_OUTPUT"

if [ -z "${INPUT}" ]; then
    fail "You need to set `input` directory where directories you want to package are in"
fi

if [ -z "${OUTPUT}" ]; then
    fail "You need to set `output` directory where archieves will be generated"
fi

mkdir -p ${OUTPUT}
for TARGET in $(find ${INPUT} -mindepth 1 -maxdepth 1 -type d); do
    ARCHIVE_NAME=$(basename ${TARGET})
    pushd ${TARGET}
    zip -r ${OUTPUT}/${ARCHIVE_NAME}.zip ./*
    popd
done

# Generate shasum
pushd ${OUTPUT}
shasum * > ./SHASUMS
popd

ls -l ${OUTPUT}
