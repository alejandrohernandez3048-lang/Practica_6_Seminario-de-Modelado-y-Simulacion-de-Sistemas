function dxdt = dinamica_CDDC(t, x, L, R, C, Uin, d_func)

A = [0, -1/L;
    1/C, -1/(R*C)];

B = [Uin/L;
    0];


d = d_func(t);

dxdt = A * x + B * d;
end