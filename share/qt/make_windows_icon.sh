#!/bin/bash
# create multiresolution windows icon
ICON_DST=../../src/qt/res/icons/milancoin.ico

convert ../../src/qt/res/icons/milancoin-16.png ../../src/qt/res/icons/milancoin-32.png ../../src/qt/res/icons/milancoin-48.png ${ICON_DST}
