clear;

% p = 8000;
% Dens = 1060;
% Areatrue = pi()*0.0025^2;
% Area = 1.9555296e-05;
% 
% wave1 = .1+.1*sin(pi*linspace(-.5,1.5,400))';
% wave2 = .015+.015*sin(pi*linspace(-.5,1.5,400))';
% wave3 = .020+.020*sin(pi*linspace(-.5,1.5,200))';
% 
% t = linspace(0,.8,1000);
% 
% u(1:1000,1) =.47;
% u(1:400) = u(1:400)+ wave2(1:400);
% u(401:600) = u(401:600)+ wave3(1:200);
% u(601:1000) = u(601:1000)+ wave1(1:400);
% u(301:500) = u(301:500) - .05*wave3(1:200);
% u(701:900) = u(701:900) + .1*wave3(1:200);
% 
% m=Dens*Area*u;

dataflow = dlmread('FlowrateOut-output-Rp-Rd-C3-240steps.out',' ',3,0);
time = dataflow(1:max(size(dataflow)),1);
flow = -60000000*dataflow(1:max(size(dataflow)),2);

datapres = dlmread('PressureOut-output-Rp-Rd-C-240steps.out',' ',3,0);
datapresC3 = dlmread('PressureOut-output-Rp-Rd-C3-240steps.out',' ',3,0);
datapresRd2 = dlmread('PressureOut-output-Rp-Rd2-C-240steps.out',' ',3,0);
datapresRd2C3 = dlmread('PressureOut-output-Rp-Rd2-C3-240steps.out',' ',3,0);
datapresRp20C05 = dlmread('PressureOut-output-Rp20-Rd-C05-240steps.out',' ',3,0);

%timepress = dataflow(1:max(size(dataflow)),1);
%timepress = dataflow(1:max(size(dataflow)),1)+.01;
pressure = datapres(1:max(size(datapres)),2);
pressureC3 = datapresC3(1:max(size(datapresC3)),2);
pressureRd2 = datapresRd2(1:max(size(datapresRd2)),2);
pressureRd2C3 = datapresRd2C3(1:max(size(datapresRd2C3)),2);
pressureRp20C05 = datapresRp20C05(1:max(size(datapresRp20C05)),2);

figure % new figure
[hAx,hLine1,hLine2] = plotyy(time,flow,[time,time,time,time,time],[pressure,pressureC3,pressureRd2,pressureRd2C3,pressureRp20C05]);
hleg1 = legend('flow','pressure','pressureC3','pressureRd2','pressureRd2C3','pressureRp20C05','Location','NorthWest');
% plotyy(time,pressure,t,m)

title('Pressure and flowrate over time')
xlabel('Time (min)')

ylabel(hAx(1),'Flowrate') % right y-axis
ylabel(hAx(2),'Pressure') % left y-axis

set(hAx(1),'ycolor','k') 
set(hAx(2),'ycolor','k')

set(hAx(1),'YLim',[500 800])
set(hAx(1),'YTick',500:100:800)
set(hAx(2),'YLim',[5500 8500])
set(hAx(2),'YTick',5500:500:8500)
