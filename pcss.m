clear all;
close all;

f=[0 1 -1];
A=[0.1 1 0.2];

f=[0 f];
A=[0 A];

T=1;
dt=0.01;
t=(0:(T/dt))*dt;

c=A'.*exp(1i*2*pi*f'*t);
c2=sum(c,1);
c3=sum(c([1 2],:),1);

%

c0=c;
cn=[];
for i=1:size(c,1)
    cn=[cn; sum(c([1:i],:),1)];
end

figure;
    for k=1:size(cn,1)
        hold on;
        plot(t,real(cn(k,:)),'k.-');
    end

figure;
set(gcf, 'Position', get(0, 'Screensize'));
for i=1:length(t)
    clf;
    
    subplot(1,2,1);
    for k=2:size(cn,1)
        hold on;
        plot(real(cn(size(cn,1),1:i)),imag(cn(size(cn,1),1:i)),'r.-');
        plot([real(cn(k-1,i)),real(cn(k,i))],[imag(cn(k-1,i)),imag(cn(k,i))],'k.-');
    end
    xlim([-2 2]);
    ylim([-2 2]);
    title(t(i));
    axis square;
    grid on;
    
    subplot(1,2,2);
    for k=1:size(cn,1)
        hold on;
        c0=c(k,i);
        plot([0,real(c0)],[0,imag(c0)],'k.-');
    end
    xlim([-2 2]);
    ylim([-2 2]);
    title(t(i));
    axis square;
    grid on;
    
    pause(0.1);
end
