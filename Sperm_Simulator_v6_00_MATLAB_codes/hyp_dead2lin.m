function [distribution,velocity,Direction,ribbon_y,ribbon_x,d_angle_s,angle_s,x,y] = ...
          hyp_dead2lin(variance_LV,desired_LV,variance_rib_y,desired_rib_y,variance_rib_x,desired_rib_x,...
            variance_A,desired_A,x_L,y_L)


% Change swim type from circular to linear
distribution = 0;

% Desired linear velocity
velocity =  abs((variance_LV^.5*randn)+desired_LV);

% Desired size of ribbon
ribbon_y = (variance_rib_y^.5*randn)+desired_rib_y;
ribbon_x = (variance_rib_x^.5*randn)+desired_rib_x;

% Desired Angle change rate
d_angle_s = abs((variance_A^.5*randn)+desired_A);

angle_s = rand*360;
Direction = rand*360;

rib_mov(:) = [ribbon_x*-sind(2*angle_s); ribbon_y*-sind(angle_s)];
%Rotation
TF = [cosd(Direction) -sind(Direction); sind(Direction) cosd(Direction)];

rot_rib(:) = TF*rib_mov(:);

x = x_L - rot_rib(1);
y = y_L - rot_rib(2);