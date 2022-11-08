% WRITE YOU CODE HERE

function [out1, out2] = myPCA(x)
    cov_mat = cov(x);
    [e_vec, e_val] = eig(cov_mat,'vector');
    out1 = e_vec; %columns are eigen vectors
    out2 = e_val;
end