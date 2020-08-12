function [X, y] = CreateFeatures(trial)
%CREATEFEATURES Crude method for generating statistical features from data
%   1) initialize the number of packets P in each chunk
%   2) initialize y (vector of labels)
%   3) arrayfun used to split data into P chunks and compute stat for each
%   chunk. It returns a vector of results that is equal to # of chunks. 
%   Note: partial chunks that are sized less than P packets are discarded.
%   4) combine all features to form m x n matrix X (samples by features)

% packets in each sample
P = 100;

% Initialize labels as m x 1 vector
y = zeros(floor(size(trial,1)/100), 1);

% Create Statistical features
F1 = arrayfun(@(i) mean(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';
F2 = arrayfun(@(i) median(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';
F3 = arrayfun(@(i) mad(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';
F4 = arrayfun(@(i) std(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';
F5 = arrayfun(@(i) skewness(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';
F6 = arrayfun(@(i) kurtosis(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';
F7 = arrayfun(@(i) max(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';
F8 = arrayfun(@(i) min(trial.Length(i:i+P-1)),1:P:length(trial.Length)-P+1)';

% Combine columns of features for this trial
X = [F1 F2 F3 F4 F5 F6 F7 F8];
end

