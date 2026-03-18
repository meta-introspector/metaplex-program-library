{
  description = "Wormhole fork of mpl-token-metadata";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    naersk = { url = "github:nix-community/naersk"; inputs.nixpkgs.follows = "nixpkgs"; };
  };
  outputs = { self, nixpkgs, naersk }:
    let
      system = "x86_64-linux";
      naersk' = naersk.lib.${system};
    in {
      packages.${system}.default = naersk'.buildPackage {
        pname = "mpl-token-metadata";
        version = "0.0.1";
        src = ./token-metadata/program;
        doCheck = false;
      };
    };
}
