function outKurtosis = IPEMGetKurtosis (varargin)
% Usage:
%   outKurtosis = IPEMGetKurtosis(inData)
%
% Description:
%   Gets the kurtosis of the data, which is defined here as:
%     Kurtosis(X) = sum((X-mu)^4) / (N*sigma^4) - 3
%   where
%     mu = average of X
%     sigma = standard deviation (normalized using N) of X
%     N = number of data points in X
%
% Input arguments:
%   inData = data vector
%
% Output:
%   outKurtosis = the kurtosis of the data
%
% Example:
%   X = [1 2 3 1 5 6 4 3];
%   Kurtosis = IPEMGetKurtosis(X);
%
% Authors:
%   Koen Tanghe - 20030415
% ------------------------------------------------------------------------------

% ------------------------------------------------------------------------------
% IPEM Toolbox - Toolbox for perception-based music analysis 
% Copyright (C) 2005 Ghent University
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
% ------------------------------------------------------------------------------

% Handle input arguments
[inData] = IPEMHandleInputArguments(varargin,0,{[]});

[R,C] = size(inData);
num = sum((inData-repmat(mean(inData,2),1,C)).^4,2);
den = C*std(inData,1,2).^4;
I = find(den ~= 0);
outKurtosis = zeros(R,1);
outKurtosis(I) = num(I)./den(I) - 3;

