#We will plot sin(x+t) in this gif animation
reset
set term gif animate
set output "animate_neg.gif"
imax=101    #n frames
i=1
iglobe=1
nsamp_prev=1
load "square.plt"
set output

