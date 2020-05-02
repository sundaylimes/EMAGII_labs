% ECE332: lab 3

% part 1)
% Plot I(z) vs z for a dipole antenna of length L = 1.25*lambda
% oriented in the z-direction.  Assume z = 0 is the middle of the 
% antenna, so your plot goes from z = -L/2 to L/2.  Let Io (the 
% magnitude of the current  phasor) = 1.

c = 2.99792458*10^8;% speed of light
I0 = 1;             % current amplitude
f = 2.4*10^9;       % frequency of both a microwave oven and wifi
lambda = c/f;       % wavelength
k = (2*pi)/lambda;  % wave #
L = 1.25*lambda;    % length of antenna
N = 100;            % # of data points
z = linspace(-L/2,L/2,N);

% piecewise equation for current phasor I~(z)
%{
for i = 1:N
    if z(i) < 0
        I(i) = I0*sin(k*(L/2+z(i)));
    elseif abs(z(i)) > L/2
        disp('error: z out of bounds')
    else
        I(i) = I0*sin(k*(L/2-z(i)));
    end
end
%}
% the above code works, but is bulky. use below instead:
I = I0.*sin(k.*(L/2-abs(z)));

plot(z,I)
title('$\widetilde{I}$(z) vs z','Interpreter','latex');
xlabel('z, length of antenna (m)','Interpreter','latex');
ylabel('$\widetilde{I}$(z) (A)','Interpreter','latex');
grid minor



