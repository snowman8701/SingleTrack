%%
clear all;
close all;

%% Initial State Values
initV = 10;
initBeta = 0;
initR = 0;

%% Car Parameters to set-up
car.m = 1200;
car.I = 2688;
car.lf = 1.4;
car.lr = 1.6;
car.p = 0.33;

%% Tire Parameters
car.Tire.Cdy = 1;
car.Tire.Cby = 6.9;
car.Tire.Ccy = 1.8;
car.Tire.Cey = 0.1;

car.Tire.Cdx = 1;
car.Tire.Cbx = 15;
car.Tire.Ccx = 1.7;
car.Tire.Cex = -0.5;

%% Input Boundaries
df_max = 0.35;
dr_max = 0;
omegaF_max = 200;
omegaR_max = 200;

%% Car Par-ms Subcalculation
car.Fzf = 9.81 * car.m * car.lr / (car.lr + car.lf);
car.Fzr = 9.81 * car.m * car.lf / (car.lr + car.lf);

%% Bus creation for Simulink
busInfo = Simulink.Bus.createObject(car);
tmp = Simulink.Bus.objectToCell({busInfo.busName});
tmp2 = tmp{1};
tmp2{1} = 'car_bus';
tmp{1} = tmp2;
Simulink.Bus.cellToObject(tmp);
clear tmp tmp2