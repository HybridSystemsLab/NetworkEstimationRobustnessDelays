%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialization for hybrid observer with delays
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc

A = [
    0  0  1  0  0;
    0  0  0  1  0;
    -2 1 -1  0  0;
    2 -2  0 -2  0;
    0  0  0  0  0;
    ];
B = [0 0 1 0 0]';
Q = [1 0 0 0 1];
L = [0.77524 0.18123 -0.12123 -0.17406 0.22469]';

T1   = 0.2;         % lower sampling period bound
T2   = 3;           % upper sampling period bound

% Tdel should be less than T1
Tdel = 0.15;        % fixed delay length

% Randomly select initial conditions for plant state and memory state
e0  = 10*(2*rand(5,1)-ones(5,1));
mu0 = 10*(2*rand(5,1)-ones(5,1));

% 5th state is the bias state-set to 1 in the simulations
e0(5) = 1;

% Randomly select initial conditions for timers
r       = rand(1);
taus0   = r*T1+(1-r)*T2;
r       = rand(1);
tau0    = r*Tdel;

% Make sure sampling timer is larger than delay timer to prevent errors.
% The jump set/map are coded not to consider this case.
if(tau0>=taus0)
    tau0 = r*taus0;
end

clear r

% Initial condition
x0 = [taus0; e0; mu0; tau0];

% Simulation horizon                                                  
T = 50;         % maximum time
J = 50;         % maximum number of jumps
                                                                        
% Rule for jumps                                                        
% rule = 1 -> priority for jumps                                        
% rule = 2 -> priority for flows                                        
% rule = 3 -> no priority, random selection when simultaneous conditions
rule = 1;                                                               
                                                                        
% Solver tolerances
RelTol = 1e-5;
MaxStep = .0005;

eps = 1e-3;     %jump tolerance for robust simulation
                % prevents premature termination