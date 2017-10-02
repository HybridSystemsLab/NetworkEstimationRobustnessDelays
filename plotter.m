figure(1), clf

% Font size
FS = 10;

subplot(2,2,1)
plot(t,x(:,2:6))
grid on
h = gcf;
xlabel('')
ylabel('')
xlabel('Ordinary Time (t)','FontName','Times','FontSize',FS,'Interpreter','latex')
ylabel('State Estimation Error ($e$)','FontName','Times','FontSize',FS,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',FS)
set(h,'Units','inches','Position',[2 2 3.4 2])

subplot(2,2,2)
plot(t,x(:,7:11))
grid on
h = gcf;
xlabel('')
ylabel('')
xlabel('Ordinary Time (t)','FontName','Times','FontSize',FS,'Interpreter','latex')
ylabel('Memory State ($\mu$)','FontName','Times','FontSize',FS,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',FS)

subplot(2,2,3)
plot(t,x(:,1))
grid on
h = gcf;
xlabel('')
ylabel('')
xlabel('Ordinary Time (t)','FontName','Times','FontSize',FS,'Interpreter','latex')
ylabel('Sampling Timer ($\tau_{\rm s}$)','FontName','Times','FontSize',FS,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',FS)

subplot(2,2,4)
plot(t,x(:,12))
grid on
h = gcf;
xlabel('')
ylabel('')
xlabel('Ordinary Time (t)','FontName','Times','FontSize',FS,'Interpreter','latex')
ylabel('Delay Timer ($\tau$)','FontName','Times','FontSize',FS,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',FS)