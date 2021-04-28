#gnuplot5

datafile   ='energies.dat'
outputfile ='energy-plot.png'

set colorsequence podo

#set terminal pngcairo size 3200,2400 enhanced font 'Arial,28'
set size ratio 0.75
set terminal png enhanced font 'Arial,14'
set encoding iso_8859_1
set output outputfile

set style line 11 lt 1 dashtype 2 lc rgb '#0072bd' # blue
set style line 12 lt 1 dashtype 2 lc rgb '#d95319' # orange
set style line 13 lt 1 dashtype 2 lc rgb '#edb120' # yellow
set style line 14 lt 1 dashtype 2 lc rgb '#7e2f8e' # purple
set style line 15 lt 1 dashtype 2 lc rgb '#77ac30' # green
set style line 16 lt 1 dashtype 2 lc rgb '#4dbeee' # light-blue
set style line 17 lt 1 dashtype 1 lc rgb '#a2142f' # red
set style line 18 lt 1 dashtype 1 lc rgb '#4dbeee' # light-blue

#set xrange[10:145]
#set yrange[0:120]

#set xtics  25 nomirror
#set ytics  10

#set mxtics 2
#set mytics

set xlabel "H-H distance / {\305}"
set ylabel "{/:Italic E} / a.u."

#set format y '%.2f'

set key top left
set key font ",10"

#set samples 1500

#set xzeroaxis linetype 1 linewidth 0.55

#set arrow from 10,20 to 145,20 nohead lc 2 lw 2.25

#set label 1 at 25,-193 '{Exp: -157.4 °C}' font 'Arial,10'


pi=3.14; sig=0.1; mu=0.1;
Gauss(x) = 1./(sig*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sig**2) )
fit Gauss(x) datafile using 1:2 via sig, mu

#Create main plot
plot [][] datafile u 1:2 title "RHF"  lc 2 ps 0.6 pt 7 lw 3 w lines, \
Gauss(x) title "Approximation" with line