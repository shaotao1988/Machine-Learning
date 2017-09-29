function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

hypothesis = X*theta;
error = (hypothesis - y).^2;
J = sum(error(:))/(2*m);
theta_squared = theta.^2;
punishment = sum(theta_squared(2:end))*lambda/(2*m);
J += punishment;

error = hypothesis - y;
grad = X'*error/m;
theta_p = theta*lambda/m;
theta_p(1) = 0;
grad += theta_p;








% =========================================================================

grad = grad(:);

end
