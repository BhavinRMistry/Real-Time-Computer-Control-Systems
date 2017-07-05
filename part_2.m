clc
clear

%Plant transfer function

G = tf(7.461,[1 .2701 0]);

%Discrete transfer function

G0 = c2d(G,.269)

%Transfer function of controller

K = tf(1.828*[1 -1.7979 .8072],[1 -.0239 -0.9761],.269);

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

Gcl_dist = feedback(G0,K)

figure

step(Gcl_dist)

stepinfo(Gcl_dist)

ss(K)

%State space models

F = [0 1 0 0;-2.7451 -0.2828 0 0;0 0 0 1;0 0 0 -0.2701];

G = [0 0;37.2021 3.5306;0 0;2.3892 7.461];

H = [1 0 0 0;0 0 1 0];

E = [0 0;0 0];

system = ss(F,G,H,E);

system_d = c2d(system,.269);

ss(system_d)

K1 = tf(.009483*[1 -1.742 .9272],[1 -1.8499 0.8499],.269);

ss(K1)

K2 = tf(1.828*[1 -1.7979 .8072],[1 -.0239 -0.9761],.269);

ss(K2)

K = append(K1,K2)

ss(K)

Kol = series(K,system_d)

Kcl = feedback(Kol,[1 0;0 1],[1 2],[1 2])

figure

step(Kcl)
