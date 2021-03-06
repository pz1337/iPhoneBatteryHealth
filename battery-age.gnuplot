#!/usr/bin/env gnuplot

set datafile separator ","

set term svg size 1000,800 dynamic
set output "dist/battery-age.svg"

set key top autotitle columnhead
set style data linespoints
set title "iPhone Battery Health"
set ylabel "Battery Health"
set ytics format "%0.0f %%"
set xlabel "Age of Battery in Months"

set style line 100 lc rgb "black" lw 1 dashtype 3
set style line 101 lc rgb "dark-gray" lw 1 dashtype 3
set grid xtics mxtics ytics linestyle 100, linestyle 101
set xtics 12
set mxtics 4

plot for [i=1:lines] "tmp/age-".i.".csv" using 1:2

set term pdfcairo size 20cm,15cm
set output "dist/battery-age.pdf"
replot

set term pngcairo size 1000,800
set output "dist/battery-age.png"
replot
