{
  description = "broot";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = _inputs@{ self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachSystem [ "aarch64-linux" ] (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.clashctl = pkgs.rustPlatform.buildRustPackage {
      pname = "clashctl";
      version = "0.3.3";
      src = pkgs.fetchFromGitHub {
        owner = "George-Miao";
        repo = "clashctl";
        rev = "b09e1faf80f1a25fa855499d8b34d36491e5a081";
        hash = "sha256-c7y64SsZEKdC8+umCY8+XBwxAHxn4YpqR48ASbHpkdM=";
      };
      cargoHash = "sha256-G0mAcB80D7/s9kwkNhJkGLkVYpXMwqpLq/T9gLuYj4E=";
      doCheck = false;
    };
  });
}
