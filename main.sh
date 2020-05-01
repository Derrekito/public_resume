#!/bin/bash
#TODO - latex page count requires two compile rounds

OUTPUT=`git branch | grep '\*' | grep -E -o '[^*\ ]*'`
FORMAT='pdf'
DIR=`pwd`
rm *\.$FORMAT

pdflatex "main.tex" -output-format="$FORMAT" -output-directory="$DIR"
#pdflatex coverletter.tex -output-format=$FORMAT -output-directory=$DIR

#rm *\.aux # CAREFUL, tcolorbox requires the doc to be compiled twice to read the aux to make columns the same size.
rm *\.log
#rm *\.out

mv Main.$FORMAT $OUTPUT.$FORMAT

#gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dAutoRotatePages=/None \
#   -sOutputFile=$OUTPUT.$FORMAT coverletter.$FORMAT main.$FORMAT
evince $OUTPUT.$FORMAT &
