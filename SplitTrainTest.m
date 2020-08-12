function [train_data, test_data, train_labels, test_labels] = SplitTrainTest(data,labels, PD)
%SPLITTRAINTEST Given sample data and labels. Split into train and test
% data/labels based on percentage PD. 
%   PD corresponds to percentage of data for training. The remainder will
%   be for testing. The randperm function is used to randomize the
%   selection of data before split.

N = size(labels,1);
rp = randperm(size(labels,1));

train_data = data(rp(1:round(N*PD)),:);
train_labels = labels(rp(1:round(N*PD)),1);

test_data = data(rp(round(N*PD)+1:end),:);
test_labels = labels(rp(round(N*PD)+1:end),:);


end

