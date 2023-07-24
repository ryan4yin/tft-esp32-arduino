# tft-esp32-auduino


## Environment Setup

For NixOS, adding the following to your configuration to install the required udev rules:

```nix
{
  services.udev.packages = [ 
    pkgs.platformio  # required for accessing the tty device
    pkgs.openocd    # required for accessing the tty device
  ];
}
```

For other systems, follow the instructions on <https://docs.platformio.org/en/latest/core/installation/udev-rules.html> to install the udev rules.

All Systems should have nix installed with flakes enabled.

## Usage

```shell
# enter the enviroment with platformio
nix develop

# build the project
pio run --environment esp32dev -t build

# upload the built firmware to the board
pio run --environment esp32dev -t upload

# monitor the serial output
pio run --environment esp32dev -t monitor
```
