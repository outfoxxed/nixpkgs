{
  qtModule,
  qtbase,
  stdenv,
  lib,
  pkgsBuildHost,
}:

qtModule {
  pname = "qtshadertools";
  propagatedBuildInputs = [ qtbase ];
  cmakeFlags = lib.optionals (!stdenv.buildPlatform.canExecute stdenv.hostPlatform) [
    "-DQt6ShaderToolsTools_DIR=${pkgsBuildHost.qt6.qtshadertools}/lib/cmake/Qt6ShaderToolsTools"
  ];
  meta.mainProgram = "qsb";
}
