# Maintainer: Maxime Deraspe <maxime@deraspe.net>

pkgname=("ray" "ray-doc" "ray-extra")
pkgver=2.1.0
pkgrel=1
pkgdesc="Parallel genome assemblies for parallel DNA sequencing"
arch=("i686" "x86_64")
url="http://denovoassembler.sf.net"
license=('GPLv3')
depends=("openmpi" "zlib" "bzip2")
makedepends=("openmpi" "zlib" "bzip2" "help2man")
optdepends=()
source=(http://downloads.sourceforge.net/project/denovoassembler/Ray-v$pkgver.tar.bz2)
sha1sums=(4c09f2731445852857af53b65aa47e444792eeb0)
md5sums=(81c6a029039600fdfaad1e819abed11d)

build() {
  cd "$srcdir/Ray-v$pkgver"

  sed -i 's! $(LDFLAGS)  code/TheRayGenomeAssembler.a!   code/TheRayGenomeAssembler.a $(LDFLAGS)!g' Makefile
  make HAVE_LIBZ=y HAVE_LIBBZ2=y

  export OMPI_MCA_orte_rsh_agent=/bin/false
  help2man --no-info --help-option=--help -o Ray.1.man \
    -n "assemble genomes in parallel using the message-passing interface" \
    ./Ray

  sed 's/S??bastien/Sebastien/g' \
    Ray.1.man > Ray.1

  rm Ray.1.man
}

package_ray() {
  pkgdesc="Parallel genome assemblies for parallel DNA sequencing"
  depends=("openmpi" "zlib" "bzip2")

  cd "$srcdir/Ray-v$pkgver"

  mkdir -p $pkgdir/usr/{bin,share/man/man1,share/doc/ray}

  install -m755 Ray $pkgdir/usr/bin/
  install -m644 Ray.1 $pkgdir/usr/share/man/man1/
  install -m644 README.md $pkgdir/usr/share/doc/ray/README
  install -m644 RayPlatform/README $pkgdir/usr/share/doc/ray/README.RayPlatform
  install -m644 MANUAL_PAGE.txt $pkgdir/usr/share/doc/ray/
  install -m644 AUTHORS $pkgdir/usr/share/doc/ray/
  install -m644 LICENSE.txt $pkgdir/usr/share/doc/ray/
  install -m644 gpl-3.0.txt $pkgdir/usr/share/doc/ray/
  install -m644 RayPlatform/lgpl-3.0.txt $pkgdir/usr/share/doc/ray/
  install -m644 RayPlatform/AUTHORS $pkgdir/usr/share/doc/ray/AUTHORS.RayPlatform

}

package_ray-doc() {
  pkgdesc="Ray documentation"
  depends=("ray")

  cd "$srcdir/Ray-v$pkgver"

  mkdir -p $pkgdir/usr/share/doc/ray/RayPlatform
  
  chmod -R 644 Documentation
  cp -r Documentation/ $pkgdir/usr/share/doc/ray
  chmod -R 644 RayPlatform/Documentation
  cp -r RayPlatform/Documentation/ $pkgdir/usr/share/doc/ray/RayPlatform
}

package_ray-extra() {
  pkgdesc="Ray scripts and XSL sheets for post-processing"
  depends=("ray" "python" "r")

  cd "$srcdir/Ray-v$pkgver"

  mkdir -p $pkgdir/usr/share/ray
  chmod -R 755 scripts
  cp -r scripts/ $pkgdir/usr/share/ray
}


