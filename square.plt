##set terminal postscript eps enhanced color font 'Helvetica,20'
##set output 'squared.eps'
reset
nsm0=1
nsmax=22000
exp_c=-2
rat_exp=(exp(exp_c*real(i-1)/real(imax-1))-1.0)/(exp(exp_c)-1.0)
ni=nsm0+(nsmax-nsm0)*(rat_exp)
nsamp = int(ni)
print nsamp
# Generate N random data points.
set print $random
do for [is=1:nsamp] {
    print sprintf("%5.4f %5.4f", rand(0), rand(0))
}
unset print

set format x "%3.2f" 
set format y "%3.2f"
set format z "%3.2f" 
#set key bottom right font ",12"
set key at graph 0.6, 0.3 left font ",12"
set samples 50
set style data lines
set style function dots

set grid
set xrange [0.:1.] noreverse nowriteback; set xlabel 'x' font ",18" offset 0,1,0; set xtics out scale 0.5 font ",14"

set yrange [0.:1.] noreverse nowriteback; set ylabel 'x^2' font ",18" offset 2,0,0; set ytics out scale 0.5 font ",14"
#set xrange [ 0.00000 : 1.00000 ] noreverse nowriteback
set size ratio 1
#set x2range [ * : * ] noreverse writeback
#set ylabel "rand(n + 1) ->" 
#set ylabel  offset character 0, -1, 0 font "" textcolor lt -1 rotate parallel
#set yrange [ 0.00000 : 1.00000 ] reverse nowriteback
set ytics
set xtics
y=rand(0)
x=rand(0)

set title sprintf("N= %5i, Integral = %4.3f ", nsamp,real(count)/real(nsamp_prev)) font ",16" 
count=0
#set label 1 sprintf("i=%3.5g",count) at graph 0.5, 0.5 center font ",16"
plot x**2 w l ls 3 lc rgb "black" notitle, \
$random using 1:($2<=$1**2?(count=count+1,$2):1/0) with points pointtype 6 lc rgb "#D6604D" notitle , \
$random using 1:($2>$1**2?$2:1/0) with points pointtype 6 lc rgb "#878787" notitle sprintf("Integral = %4.3f",real(count)/real(nsamp)) 
nsamp_prev=nsamp
i=i+1
if (i<imax) reread

