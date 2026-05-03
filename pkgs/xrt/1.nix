{
  python,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  numpy_2,
  scipy,
  matplotlib,
  pyqtwebengine,
  pyqt5,
  pyopencl,
  pyopengl,
  pyopengl-accelerate,
  colorama,
  sphinx,
  sphinxcontrib-jquery,
  distro,
  sphinx-tabs,
}:

buildPythonPackage rec {
  pname = "xrt";
  version = "1.6.2";
  src = fetchFromGitHub {
    inherit version;
    owner = "kklmn";
    repo = "xrt";
    tag = version;
    sha256 = "sha256-8eWnvruXeoE0gRHgzHEhO/IgNk1pq9GM4ru3ditOyeA=";
  };
  pyproject = true;
  build-system = [ setuptools ];

  propagatedBuildInputs = [
    numpy_2
    scipy
    matplotlib
    pyqtwebengine
    pyqt5
    pyopencl
    pyopengl
    pyopengl-accelerate
    colorama
    sphinx
    sphinxcontrib-jquery
    distro
    sphinx-tabs
  ];

  postInstall = ''
    makeWrapper $out/bin/xrtQookStart.py $out/bin/xrtQook --run "chmod -R 777 \$HOME/.xrt"
    makeWrapper ${python.interpreter} $out/bin/xrtBentXtal \
    --add-flags "$out/lib/python3.12/site-packages/xrt/gui/xrtBentXtal.py" \
    --run "chmod -R 777 \$HOME/.xrt"
  '';
}
