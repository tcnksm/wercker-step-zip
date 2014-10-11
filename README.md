Wercker step zip [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/tcnksm/wercker-step-zip/blob/master/LICENCE)
====

[![wercker status](https://app.wercker.com/status/baa21833038c688310273d15e47a54fe/m "wercker status")](https://app.wercker.com/project/bykey/baa21833038c688310273d15e47a54fe)

This is [wercker](http://wercker.com/) build step script to package your directories as `.zip`. 

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
steps:
   - tcnksm/zip:
     input: $WERCKER_OUTPUT_DIR/pkg
     output: $WERCKER_OUTPUT_DIR/dist
```

You must set `input` directory where directories you want to package are in and `output` directory where zip archeives will be generated. Both must be set as absolte path (`$WERCKER_OUTPUT_PATH` is built-in environmental valiable which is used for pass the artifacts between build step and deploy step). 

## Requirements

If you use wercker-box which is not installed `zip`, you need additional step:

```yaml
steps:
    - script:
      name: install zip
      code: |
        sudo apt-get update -y
        sudo apt-get upgrade -y
        sudo apt-get install -y zip
    - tcnksm/zip
        input: "pkg"
        output: "dist"
```

## Author

[tcnksm](https://github.com/tcnksm)
