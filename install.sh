#!/bin/sh

[[ "$UID" -ne "0" ]] && { echo "You do not have permissions, try sudo ./install.sh" >&2; exit 1; }

dest='/usr/'

if [ echo $1 | -q "DESTDIR=" ]; then
    dest="${1#DESTDIR=}"
    dest="${dest%/}"
fi

if ! cp rockpkg "$dest/sbin" && mkdir -p "/usr/lib/rockpkg" \
    && mkdir -p "$dest/share/doc/rockpkg"; then
    echo "error with $dest path" >&2
    exit 1
fi

chmod +x create help info install remove rockpkg

cp create help info install remove "/usr/lib/rockpkg"

cp README LICENSE "$dest/share/doc/rockpkg"

echo "Installation successful!"

