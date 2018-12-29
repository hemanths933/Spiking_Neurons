Ne=800; Ni=200;
re=rand(Ne,1); ri=rand(Ni,1);
a=[0.02*ones(Ne,1); 0.02+0.08*ri];
b=[0.25*ones(Ne,1); 0.25-0.05*ri];
c=[-55+15*re.^2; -55*ones(Ni,1)];
d=[8-0.05*re.^2; 0.05*ones(Ni,1)];
S=[0.5*rand(Ne+Ni,Ne), -rand(Ne+Ni,Ni)];
v=-65*ones(Ne+Ni,1); % Initial values of v
u=b.*v; % Initial values of u
firings=[]; % spike timings
tempv = v
tempu = u
for t=1:1000 % simulation of 1000 ms
disp("iteration");
disp(t);
I=[5*randn(Ne,1);2*randn(Ni,1)]; % thalamic input
tempI = I;
disp("I shape of I is ");
disp(size(I));
fired=find(v>=30); % indices of spikes
disp("fired is ");
disp(fired);
disp("fired shape is ");
disp(size(fired));
firings=[firings; t+0*fired,fired];
disp("firings shae is ");
disp(size(firings));
v(fired)=c(fired);
u(fired)=u(fired)+d(fired);
I=I+sum(S(:,fired),2);
disp("shape of s[] is");
disp(size(sum(S(:,fired),2  )));
disp("I shape of I is ");
disp(size(I));
v=v+0.5*(0.04*v.^2+5*v+140-u+I); % step 0.5 ms
v=v+0.5*(0.04*v.^2+5*v+140-u+I); % for numerical
u=u+a.*(b.*v-u); % stability
disp("u shape is ");
disp(size(u));
disp("v shape is ");
disp(size(v));
end;

plot(firings(:,1),firings(:,2),'.');