{
  description = "PlatformIO development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self , nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in 
    {
      devShells.default = (pkgs.buildFHSUserEnv {
        name = "platformio-fhs";
        targetPkgs = pkgs: (with pkgs; [
          platformio
          platformio-core
          avrdude
        ]);
        runScript = pkgs.writeScript "init.sh" ''
          echo "Initializing PlatformIO environment"
          exec bash
        '';
      }).env;
    });
}
