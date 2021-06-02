t = SimOut.w(:,1);
u = SimOut.w(:,2);
i = SimOut.w(:,4);
w = SimOut.w(:,3);
figure 
grid on 
hold on

plot(t,i)
plot(t,u)

xlim([5 7.5])
%%
clear i_rez

i_rez(50000) = 0
for j = 1:9
    i_rez = i_rez + i(50000*j+1:50000*(j+1))';
end
i_rez = i_rez/9
%%
figure
grid on 
hold on
%plot(t(1:50000),i(1:50000))
plot(t(1:50000),i_rez)
xlim([0 0.1])
tau = 0.013
A = 1.05;
i_est = A*(1-exp(-t(1:50000)/tau));
plot(t(1:50000),i_est)

%%
figure 
grid on 
hold on
plot(t,u)
plot(t,w)
%%

clear w_rez

w_rez(50000) = 0
for j = 1:9
    w_rez = w_rez + w(50000*j+1:50000*(j+1))';
end
w_rez = w_rez/9
%%
figure
grid on 
hold on

plot(t(1:50000),w_rez)

xlim([0 5])


B = 0.5
B0 = 0
tau2 = 0.5
w_est = B*(1-2*exp(-t(1:50000)/tau2));

plot(t(1:50000),w_est)

Ce = max(u)/B
R =(max(u)+B*Ce)/A
Te = tau
L = Te*R
J = tau2*Ce^2/R

%%
figure 
tiledlayout(3,1)
%h = figure
%set(h, 'DefaultAxesFontSize', 12, 'DefaultAxesFontName', 'Times New Roman');
nexttile

plot(t,i)
hold on
grid on
xlim([0 5])
ylabel('\itI\rm,\itA\rm')
xlabel('\itt\rm,\its\rm')
legend('Данный ток','Calculation','Times New Roman')
nexttile

plot(out.y(:,1), out.y(:,3), 'r', 'LineWidth',1)
grid on 
hold on
ylabel('\itI\rm,\itA\rm')
xlabel('\itt\rm,\its\rm')
xlim([0 5])
legend('Полученный ток','Calculation','Times New Roman')
nexttile

plot(t,u)
grid on 
hold on
ylabel('\itU\rm,\itB\rm')
xlabel('\itt\rm,\its\rm')
xlim([0 5])
legend('Реакция на скачок','Calculation','Times New Roman')
