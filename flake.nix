{
  inputs = { };

  outputs = _: {
    overlays.default = final: prev: {
      xrt_1 = final.python3Packages.callPackage ./pkgs/xrt/1.nix { };
    };
  };
}
