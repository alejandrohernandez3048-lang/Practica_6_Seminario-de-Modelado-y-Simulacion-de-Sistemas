L = 2e-3;    
R = 10;      
C = 10e-6;   
Uin = 32;    

f = 100e3;        
T = 1/f;          
duty = 0.40;      

d_func = @(t) double(mod(t, T) < (duty * T));

x0 = [0; 0]; 

t_final = 0.005;
tspan = [0, t_final];

opciones = odeset('MaxStep', 1e-6);

ode_sistema = @(t, x) dinamica_CDDC(t, x, L, R, C, Uin, d_func);


[t, x] = ode45(ode_sistema, tspan, x0, opciones);

iL = x(:, 1);
Vc = x(:, 2);

figure;
subplot(2,1,1);
plot(t, iL, 'b');
grid on;
title(' Inductor');
xlabel('Tiempo (s)');
ylabel('Corriente (A)');

subplot(2,1,2);
plot(t, Vc, 'r');
grid on;
title('Capacitor');
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');