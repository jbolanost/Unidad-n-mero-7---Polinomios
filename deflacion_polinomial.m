clc; clear; close all;

function [Q, residue] = deflation_polynomial(coefficients, root)
    % Inputs:
    %   coefficients: Vector [a_n, a_{n-1}, ..., a_0] of the polynomial P(x).
    %   root: Known root r (P(r) = 0).
    % Outputs:
    %   Q: Coefficients of the deflated polynomial (degree n-1).
    %   residue: Value residual (must be 0 if r is an exact root).

    n = length(coefficients) - 1;  % Degree of the polynomial
    Q = zeros(1, n);  % Initialize array for the deflated polynomial
    Q(1) = coefficients(1);  % Copy the first coefficient

    for i = 2:n
        Q(i) = Q(i-1) * root + coefficients(i);  % Synthetic division
    end

    residue = Q(end) * root + coefficients(end);  % Calculation of the residue
end

function [Q, residue] = deflation_polynomial_while(coefficients, root)
    % Inputs:
    %   coefficients: Vector [a_n, a_{n-1}, ..., a_0] of the polynomial P(x).
    %   root: Known root r (P(r) = 0).
    % Outputs:
    %   Q: Coefficients of the deflated polynomial (degree n-1).
    %   residue: Value residual (0 if r is an exact root).

    n = length(coefficients) - 1;  % Degree of the polynomial
    Q = zeros(1, n);  % Initialize array for Q(x)
    Q(1) = coefficients(1);  % First coefficient remains

    % --- While loop equivalent to the original for loop ---
    i = 2;  % Start from the second coefficient
    while i <= n
        Q(i) = Q(i-1) * root + coefficients(i);
        i = i + 1;  % Increment counter
    end

    residue = Q(end) * root + coefficients(end);  % Calculate residue
end

coefficients = [1, 2, -24];  % P(x) = x² + 2x - 24
root = 4;

[Q, residue] = deflation_polynomial(coefficients, root);

disp('Polinomio deflacionado Q(x):'); disp(Q);
disp('Residuo:'); disp(residue);