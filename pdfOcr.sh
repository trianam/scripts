#!/bin/sh
if [ $# -eq 2 ]; then
    fileNameOrig=${1::-4}
    rm -fR /tmp/pdfOcr
    rm $2
    touch $2
    mkdir /tmp/pdfOcr
    mkdir /tmp/pdfOcr/img
    mkdir /tmp/pdfOcr/out
    echo "Convert pdf in images"
    convert -density 300 $1 -depth 8 /tmp/pdfOcr/img/$fileNameOrig.png
    numImages=$(ls /tmp/pdfOcr/img |wc -l)
    currImage=0
    for file in $(ls -v /tmp/pdfOcr/img); do
        currImage=$(( currImage+1 ))
        echo "Processing image $currImage of $numImages"
        fileName=${file::-4}
        tesseract /tmp/pdfOcr/img/$file /tmp/pdfOcr/out/$filename -l ita 1>/dev/null 2>&1
        cat $2 /tmp/pdfOcr/out/$filename.txt >> $2 2>/dev/null
    done
    rm -fR /tmp/pdfOcr
else
    echo "Use $0 input.pdf output.txt"
fi

