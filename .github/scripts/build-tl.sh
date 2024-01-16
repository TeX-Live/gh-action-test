#!/bin/sh -l

arch="$1"
echo "Building TL for arch = $arch"

destdir="$2"

# for CentOS we need to activate gcc-9
if [ -f /opt/rh/devtoolset-9/enable ]
then
  # we cannot call scl enable devtoolset-9 here since we need
  # the settings in the running shell
  . /opt/rh/devtoolset-9/enable
fi

echo "file /bin/ls"
file /bin/ls
cp /bin/ls texlive-bin-$arch.tar.gz

if [ -n "$destdir" ] ; then
  mv texlive-bin-$arch.tar.gz "$destdir"
  ls "$destdir"
fi

