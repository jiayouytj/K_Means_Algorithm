% Do not change the function name. You have to write your code here
% Zihao Yan
% 40066713
% you have to submit this function
function segmentedImage = KMeans(featureImageIn, numberofClusters, clusterCentersIn)

% Get the dimensions of the input feature image
[M, N, noF] = size(featureImageIn);
% some initialization
% if no clusterCentersIn or it is empty, randomize the clusterCentersIn
% and run kmeans several times and keep the best one
if (nargin == 3) && (~isempty(clusterCentersIn))
    NofRadomization = 1;
else
    NofRadomization = 5;    % Should be greater than one
end


segmentedImage = zeros(M, N); %initialize. This will be the output

BestDfit = 1e10;  % Just a big number!

% run KMeans NofRadomization times
for KMeanNo = 1 : NofRadomization

    % randomize if clusterCentersIn was empty
    if NofRadomization>1
        clusterCentersIn = rand(numberofClusters, noF); %randomize initialization
         for k = 1:M
            for j = 1:N
            for i = 1:numberofClusters
                coor = [featureImageIn(k,j,1),featureImageIn(k,j,2),featureImageIn(k,j,3)];
                center = clusterCentersIn(i,:,:);
                dist = sum((coor - center).^2).^0.5;
                if (dist < BestDfit)
                    BestDfit = dist;
                    s = i;
               
                end
               
            end
            segmentedImage(k,j) = 0.2*s-0.1;
            BestDfit = 1e10;
            end
            
        end
    end

% ----------------------------------- % 
% -You have to write your code here-- %
% ----------------------------------- % 
    if NofRadomization == 1
       clusterCentersIn = [1 1 1; 1 1 0; 1 0 1; 0 1 1; 1 0 0; 0 1 0; 0 0 1; 0 0 0];
        
    end
end