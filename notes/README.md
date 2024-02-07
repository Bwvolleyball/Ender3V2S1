# Custom Firmware Build Notes

## Generate A Configuration.
> I've forked the configuration repo [here](https://github.com/Bwvolleyball/ender3v2-professional-firmware-configurations)

Using this repository, I can run `pythonw Configurator.pyw` to run the configuration wizard to create the base configurations for my build.
This may not always be necessary time will tell.

This generates a few files, in a folder named the same as the configuration I generate.

* `Configuration.h` - The main configuration file. Contains settings like:
    * Skew
* `Configuration_adv.h` - advanced configurations
* `platformio.ini`
* `Version.h`

These files will need to be used in the custom build.

### Edits

Edit any special values now. Such as Skew, this is done in these config files.

### My Edits

* `NOZZLE_TO_PROBE_OFFSET` - `{ x, y, z }` (values tbd)
* `LEVELING_BED_TEMP` - `60` - for PLA...

### Interesting Ones to Research

* `BED_TRAMMING_PROBE_TOLERANCE` - default is `0.05`, can this go lower for a more level bed?

## Copying Over Files For the Custom Build

Start with copying `Configuration.h`, `Configuration_adv.h`, and `Version.h` from the configuration you generated and edited into the [`/Marlin`](./Marlin) directory of this project.

Overwrite the contents.

Move `platformio.ini` to the root and overwrite it.

> [!TIP]
> **TBD - should automate this**

## Compiling Marlin

> [!IMPORTANT]  
> First, RTFM.
> But be warned, some of these docs are out of date and slightly incorrect. Notes have any corrections.


* [Basics of Installing Marlin](https://marlinfw.org/docs/basics/install.html)
* [Platformio](https://marlinfw.org/docs/basics/install_platformio.html)
* [Marlin CLI](https://marlinfw.org/docs/basics/install_platformio_cli.html)

### Python Version
 Must be on Python 2.7. for these CLI instructions. I'm using `pyenv`. `pyenv local` to verify, `pyenv install `.

### Platformio

[Install platformio](https://docs.platformio.org/en/latest/core/installation/index.html)

And find your printer's board in [pins.h](./Marlin/src/pins/pins.h) - The 4.x.x boards for Creality are probably `RAMPS_ENDER_4.h`, and the env flag is `env:mega2560`.

TBD skipping more Platformio steps in favor of using 'Auto Build', which is also included in this project.

### Running Marlin Auto Build from the CLI

> [!CAUTION]
> Remember, Docs say Python 2.7. is required.

After you've setup `platformio.ini` in the root, try running:

> [!NOTE]  
> Probably want to run `clean` first, then `build`?

```bash
python buildroot/share/vscode/auto_build.py build
```

> [!CAUTION]
> This autobuild sucks a little ass... all commands pops open a little window with options you have to click through with random numbers.
> I just spammed continue.


> [!IMPORTANT]  
> Notes about the MCU and environment selector...
>
> [Thank you Reddit...](https://www.reddit.com/r/MarlinFirmware/comments/u9l8b0/comment/k7legwj/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
>
> According to this for the creality boards V4.2.2, V4.2.3, V4.2.7, V4.3.1 there are two chips available STM32F103RCT6=256k and STM32F103RET6=512k
> Marling Auto Build drops the T6 and will simply show RC(256k) or RE(512k)
>
> Pick the right chip, or you'll probably fry your board.



All commands from the Marlin docs are:

* `build` - build the thing?
* `clean`
* `upload`
* `traceback`
* `program`
* `test`
* `remote`
* `debug`

#### Build

After running the `build` command, your firmware is located at `./.pio/build/<SELECTED_MCU + ENVIRONMENT>/firmware-<date + timestamp>.bin`

Good luck, Have fun.
