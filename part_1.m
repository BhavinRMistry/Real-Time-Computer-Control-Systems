clc
clear

%Plant transfer function

G = tf(37.2021,[1 .283 2.7452]);

%Discrete transfer function

G0 = c2d(G,.269)

%Transfer function of controller

K = tf(.009483*[1 -1.742 .9272],[1 -1.8499 0.8499],.269);

%Open loop transfer function

Gol = series(K,G0);

%Closed loop transfer function

Gcl = feedback(Gol,1)

%Step response of closed loop transfer function

figure

step(Gcl)

stepinfo(Gcl)

figure

rlocus(G0*K)

figure

rlocus(G0)

%Response of the output to step disturbance

Gcl_dist=feedback(G0,K)

figure

step(Gcl_dist)

stepinfo(Gcl_dist)

%Response of the motor voltage to step input

Gcl_mv=feedback(K,G0)

figure

step(Gcl_mv)

stepinfo(Gcl_mv)
