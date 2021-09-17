clear all;
clc;

source = 0; screen_dist = 35; observer_y = 0; observer_x = 50;
k = 1; % omega = k
num_rays = 100;
straight_path_time = sqrt((observer_x - source)^2 + (observer_y - source)^2) / k;
all_path=zeros(1,num_rays); all_delay = zeros(1,num_rays);

%for rays = 1:num_rays
%a = -pi/4;
%b = pi/4;

index=1;

for rays = linspace(-pi/4,pi/4,num_rays)
r01 = screen_dist/cos(phi); r01_phase = exp(1i*k*r01);
r12 = sqrt((observer_x - screen_dist)^2 + (r01*sin(phi)-observer_y)^2); r12_phase = exp(1i*k*r12);
total_phase = r01_phase*r12_phase;

all_path(1,index)=total_phase;

time_of_path = (r01/k) + (r12/k);
time_delay = time_of_path - straight_path_time;
all_delay(1,index)=time_delay;

index=index+1;
end

scatter(all_path,all_delay)
  
