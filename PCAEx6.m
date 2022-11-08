% WRITE YOU CODE HERE
data = load('pcadata.mat');
X = data.X;

figure(1)
hold on;
scatter(X(:,1),X(:,2),'b','Marker','o')
xlim([0,7])
ylim([2,8])
title('Datapoints and their 2 principal components')

[Xmu, mu] = subtractMean(X);
[U, S] = myPCA(Xmu);
[S, ind] = sort(S, 'descend');
U = U(:,ind);
line([mu(1), U(1,1)+mu(1)], [mu(2), U(2,1)+mu(2)], 'Color', 'r', 'LineWidth', 2 )
line([mu(1), U(1,2)+mu(1)], [mu(2), U(2,2)+mu(2) ], 'Color', 'g', 'LineWidth', 2 )

Z = projectData(Xmu, U, 1);
fprintf('Projection of first 3 points\n')
disp(Z(1:3,:))
Xrec = recoverData(Z, U, 1, mu);

figure(2);
hold on;
scatter(X(:,1),X(:,2),'b','Marker','o')
scatter(Xrec(:,1), Xrec(:,2),'r','Marker','*')
xlim([0,7])
ylim([2,8])
title('Datapoints and thier reconstruction')

data_r = load('pcafaces.mat');
X = data_r.X;

figure(3)
displayData(X(1:100,:));

[Xmu, mu] = subtractMean(X);
[U, S] = myPCA(Xmu);
[S, ind] = sort(S, 'descend');
U = U(:,ind);
Z = projectData(Xmu, U, 200); %projecting data on 200 principle components
Xrec = recoverData(Z, U, 200, mu);

figure(4)
tiledlayout(1,2)
nexttile
displayData(X(1:100,:));
title('Originl faces')
nexttile
displayData(Xrec(1:100,:));
title('Recovered faces')

