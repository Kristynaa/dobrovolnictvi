#!/bin/bash

echo "Checking EXIF metadata"

if ! which exiv2 > /dev/null; then
    echo "Please install the exiv2 tool"
    exit 1
fi

IMAGES=`find . \( -iname '*.png' -or -iname '*.jpg' -or -iname '*.jpeg' \) -print | grep -v _site`

for image in $IMAGES; do
    exiv2 -d a $image
    exiv2 \
        -M"add Xmp.xmpRights.WebStatement XmpText https://creativecommons.org/licenses/by-nc/4.0/" \
        -M"set Xmp.dc.creator XmpSeq kreslimevdesti.cz" \
        -M"set Xmp.dc.rights LangAlt Copyright kreslimevdesti.cz. CC BY-NC 4.0" \
        -M"set Xmp.photoshop.Credit XmpText kreslimevdesti.cz" \
      $image
    git add $image
done
