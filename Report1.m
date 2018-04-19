Matlab code inputs:
m=1000
k=1666.7
b=1200

// Note: Force Simulink diagram is -k + 5kt w/out damper
velocity=simout3.signals.values;
maximum_Vel=max(velocity)
acceleration=simout2.signals.values;
maximum_Acc=max(acceleration)
force=simout.signals.values;
maximum_Force=max(force);
timeout_Force=simout1.signals.values;
for i=1:401
if force(i)==maximum_Force
time_Force=timeout(i)
else
end
end
acceleration=simout2.signals.values;
maximum_Acc=max(acceleration)
timeout_Acc=simout1.signals.values;
for i=1:401
if acceleration(i)==maximum_Acc
time_Acc=timeout_Acc(i)
else
end
end

velocity=simout3.signals.values;
maximum_Vel=max(velocity)
timeout_Vel=simout1.signals.values;
for i=1:401
if velocity(i)==maximum_Vel
time_Vel=timeout_Vel(i)
else
end
end
plot(timeout,force)
plot(timeout,force,timeout,force2)
xlabel('Time, s')
ylabel('Force, lbs')
title('Force vs Time')
legend('Force 1', 'Force 2')
elongation=simout4.signals.values;
elongation2=simout4_PartD.signals.values;
plot(timeout,elongation)
plot(timeout,elongation,timeout,elongation2)
xlabel('Time, s')
ylabel('Elongation, ft')
title('Elongation vs Time')
legend('Elongation 1', 'Elongation 2')
velocity=simout3.signals.values;
velocity2=simout3_PartD.signals.values;
plot(timeout,velocity,timeout,velocity2)

xlabel('Time, s')
ylabel('Velocity, ft/s')
title('Velocity vs Time')
legend(' Velocity 1', ' Velocity 2')
position2=simout5_PartD.signals.values;
plot(timeout,position2)
hold on
syms f(x)
f(x) = 16.66*exp(-0.6*x)+4.996*x*exp(-0.6*x)+5*x-16.66;
fplot(f,[0 20],'*')
hold off
xlabel('Time, s')
ylabel('Position, ft')
title('Position vs Time')
legend('Numeric', 'Analytic')