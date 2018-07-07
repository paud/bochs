#!/bin/sh

set echo

./configure --target=pentium-windows \
            --enable-sb16 \
            --enable-ne2000 \
            --enable-all-optimizations \
            --enable-cpu-level=6 \
            --enable-x86-64 \
            --enable-vmx=2 \
            --enable-pci \
            --enable-clgd54xx \
            --enable-voodoo \
            --enable-usb \
            --enable-usb-ohci \
            --enable-usb-ehci \
            --enable-usb-xhci \
            --enable-busmouse \
            --enable-es1370 \
            --enable-e1000 \
            --enable-show-ips \
            --disable-readline \
            --without-x \
	    --enable-debugger \
            --with-win32 --with-rfb --with-nogui

unset echo

# Fix up all makefiles so that nmake can handle them.
for i in `find . -name Makefile`; do
  echo Removing curly brackets in $i for NMAKE.
  mv $i $i.tmp
  sed -e 's/{/(/g' -e 's/}/)/g' < $i.tmp > $i
  rm -f $i.tmp
done
