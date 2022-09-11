{ lib
, stdenv
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "gdu";
  version = "5.17.0";

  src = fetchFromGitHub {
    owner = "dundee";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-8YC0KUf+kSVnSt1436Ob1CdLJT/w5VYDOEHV0mDkO7E=";
  };

  vendorSha256 = "sha256-rppVLeX1VDOW+eUHSM77DgY2KjOrUHdyqGWRAYRIbUE=";

  nativeBuildInputs = [ installShellFiles ];

  ldflags = [
    "-s"
    "-w"
    "-X github.com/dundee/gdu/v${lib.versions.major version}/build.Version=${version}"
  ];

  postPatch = ''
    substituteInPlace cmd/gdu/app/app_test.go --replace "development" "${version}"
  '';

  postInstall = ''
    installManPage gdu.1
  '';

  doCheck = !stdenv.isDarwin;

  meta = with lib; {
    description = "Disk usage analyzer with console interface";
    longDescription = ''
      Gdu is intended primarily for SSD disks where it can fully
      utilize parallel processing. However HDDs work as well, but
      the performance gain is not so huge.
    '';
    homepage = "https://github.com/dundee/gdu";
    license = with licenses; [ mit ];
    maintainers = [ maintainers.fab maintainers.zowoq ];
    platforms = platforms.unix;
  };
}
