Matlab code inputs:
%Stiffness and Damping%
cf=3000
cr=3000
kf=30000
kr=30000
%Givens%
L1=1
L2=1.5
j=2500
m=2000
%Road Conditions%
A=0.01
wv=5
v=13.8889
f=v/wv

Mode Shapes:
%An example of Programming in MATLAB to obtain
%natural frequencies and mode shapes of MDOF
%systems
%Define [M] and [K] matrices
M=[m 0;0 j]
K=[-kf-kr kf*L1-kr*L2;kf*L1-kr*L2 -kf*L1^2-kr*L2^2]
%Form the system matrix
A=inv(M)*K
%Obtain eigenvalues and eigenvectors of A
[V,D]=eig(A)
%V and D above are matrices.
%V-matrix gives the eigenvectors and
%the diagonal of D-matrix gives the eigenvalues
% Sort eigen-values and eigen-vectors
[D_sorted, ind] = sort(diag(D),'ascend');
V_sorted = V(:,ind);
%Obtain natural frequencies and mode shapes
nat_freq_1 = sqrt(D_sorted(1))
nat_freq_2 = sqrt(D_sorted(2))
mode_shape_1 = V_sorted(:,1)
mode_shape_2 = V_sorted(:,2)

%equations_m
%Equations of motion%
alpha1=(-kf-kr)/m;
alpha2=(-cf-cr)/m;
alpha3=(kf*L1-kr*L2)/m;
alpha4=(cf*L1-cr*L2)/m;
alpha5=kf/m;
alpha6=cf/m;
alpha7=kr/m;
alpha8=cr/m;
beta1=(kf*L1-kr*L2)/j;
beta2=(cf*L1-cr*L2)/j;
beta3=(-kf*L1^2-kr*L2^2)/j;
beta4=(-cf*L1^2-cr*L2^2)/j;
beta5=(-kf*L1)/j;
beta6=(-cf*L1)/j;
beta7=(kr*L2)/j;
beta8=(cr*L2)/j;
%Optimize Suspension
%Initial stiffness
kf=27000

%Loop interation
for a=1:10
%adjust for increment
kf=kf-250;
kr=kf;
cf=1500;
for b=1:20
%adjust for increment
cf=cf-50;
cr=cf;
equations_run
sim('lab5')
bounce=bounce.signals.values;
bounce=abs(bounce);
pitch=pitch.signals.values;
pitch=abs(pitch);
%Observe only steady state values
g=bounce(1500:2500,:);
maxbounce=max(g(:);
h=pitch(1500:2500,:);
maxpitch=max(h(:))
%Find desired outputs
if maxpitch<10^-3

if maxbounce<2.5*10-3
damping = cf
stiffness = kf
return
end
end
end
end