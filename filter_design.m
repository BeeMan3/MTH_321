t=-1:.01:1;
r=sqrt(1-t.^2); %bottom circle on graph      
r2=-sqrt(1-t.^2); %top circle on graph
plot(t,r)       % plot the first circle
hold on
grid on
plot(t,r2)      % plot the second circle
axis([-1.5 1.5 -1.5 1.5])
title('Insert the poles')
[xp,yp]=ginput;     % take user input on the unit circle graph 
for k=1:length(xp)       
    if yp(k)~=0
       %calculate the conjugate of the location clicked by the user 
       xp(length(yp)+1)=xp(k);
       yp(length(yp)+1)=-yp(k);     
    end
end
plot(xp,yp,'x')     % plot the poles on the graph
title('Insert the zeros')
[xz,yz]=ginput;     % take user input on the unit circle graph 
for k=1:length(xz)
    if yz(k)~=0
        %calculate the conjugate of the location clicked by the user
       xz(length(yz)+1)=xz(k);
       yz(length(yz)+1)=-yz(k);    
    end
end
plot(xz,yz,'o')     % plot the zeros on the graph
zr=xz+i.*yz;     % place zeros in vector
pl=xp+i.*yp;     % place poles in vector


H=zpk(zr,pl,1,-1);    % create zero pole gain model with zpk
hold off
%graph the magnitude and frequency response of the designed system
figure
options=bodeoptions;
options.grid = 'on';
options.freqscale = 'linear';
options.magscale= 'linear';
options.magunits = 'abs';
options.Xlim= [0 3];
bode(H,options)