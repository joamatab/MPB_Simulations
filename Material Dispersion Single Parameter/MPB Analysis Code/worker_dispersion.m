%%% Script that load the data generated by 'batch_submitter.cmd' that
%%% compiles the script 'wgd_on_SiO2.ctl' with different parameters. This
%%% scrit has to be in the folder in whith all al subfolders like '0.1-0.2'
%%% are generated
clear all
close all

%Parameters
%Import the parameters which were simulated
tuple_file = matfile('tuples.mat');
tuples = tuple_file.tuples;
omega = tuples(:,3);

%d = h, w = w2 for double block code
%h = tuples(:,1); % heights of the waveguide in units f a
%w = tuples(:,2); % widths of the waveguide in units of a

%Loading the data in the different subfolders
%Generates an N x 4 matrix where each row contains the data 
%[h w vg_diff mode_overlap]

N = length(omega);
master_data = zeros(N,4);
neff = zeros(N,1);
k = zeros(N,1);
vg = zeros(N,1);


%Import the group velocity data
%for each h, we sweep all possible w before moving to next h value
n=0;
for i = 1:N        
        [k(i), omega(i), neff(i)] = n_eff_calc(omega(i));
        vg(i) = vg_import(omega(i));
        
        %Compile all the data together
        master_data(i,:) = [omega(i) k(i) neff(i) vg(i)];         
end

%Save all the outputs
%Save the output variables
%File to write output data to
fid_master_data = fopen('output.txt', 'wt');
fprintf(fid_master_data,'Wavelength (um) \t k_mpb \t neff \t vg \n');
formatspec = '%f \t %f \t %f \t %f';
for n = 1:N
    fprintf(fid_master_data,formatspec,1./master_data(n,1),master_data(n,2),master_data(n,3),master_data(n,4));
    fprintf(fid_master_data,'\n');
end
fclose(fid_master_data);
