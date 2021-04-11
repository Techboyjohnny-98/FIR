    %设计三个滤波器，分别是20～200Hz、200～2kHz、2k～20KHz的带通滤波器
    %对带通滤波器的上下限频率进行归一化处理。
w1_L = 20*2*pi/45000;       
w1_H = 200*2*pi/45000;
w2_L = 1000*2*pi/45000;     
w2_H = 2000*2*pi/45000;
w3_L = 3000*2*pi/45000;
w3_H = 20000*2*pi/45000;   
N = 31;                     % 布莱克曼窗函数长度 滤波器阶数
wf1 = [w1_L/pi w1_H/pi];
wf2 = [w2_L/pi,w2_H/pi];
wf3 = [w3_L/pi,w3_H/pi];
window = blackman(N + 1);   %布莱克曼窗
b1 = fir1(N,wf1,window);
b2 = fir1(N,wf2,window);
b3 = fir1(N,wf3,window);
[H1,W1] = freqz(b1);        %计算数字滤波器的频率特性
[H2,W2] = freqz(b2);
[H3,W3] = freqz(b3);
figure(1);
subplot(3,1,1);plot(W1*45000/2/pi,20*log10(abs(H1)));grid on;   %画出频率特性图
xlabel('Hz');ylabel('幅度(dB)');title('低音滤波器的幅度特性')
subplot(3,1,2);plot(W2*45000/2/pi,20*log10(abs(H2)));grid on;
xlabel('Hz');ylabel('幅度(dB)');title('中音滤波器的幅度特性')
subplot(3,1,3);plot(W3*45000/2/pi,20*log10(abs(H3)));grid on;
xlabel('Hz');ylabel('幅度(dB)');title('高音滤波器的幅度特性')

    %将滤波器用在输入信号上
amp1 = 1;   %低音增益
amp2 = 0;   %中音增益
amp3 = 0;   %高音增益
f1 = 100;f2 = 1800; f3 = 10000; %输入波形由三个频率分别为100，1800，10000Hz的正弦波组成
Fs = 45000;     %采样频率45000Hz    
dt = 1/Fs; n = 0:3000;   t = n*dt;
fIN = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
fOUT = amp1 * filter(b1,1,fIN) + amp2 * filter(b2,1,fIN) + amp3 * filter(b3,1,fIN); %%输出波形
figure(2);
subplot(2,1,1);plot(t,fIN);
xlabel('t');ylabel('幅度');title('输入信号')
subplot(2,1,2);plot(t,fOUT);
xlabel('t');ylabel('幅度');title('输出信号')


    %对滤波后的波形进行fft
L = 3000;
fOUT_fft = fft(fOUT);
P2_OUt = abs(fOUT_fft/L);
P1_OUT = P2_OUt(1:L/2+1);
P1_OUT(2:end-1) = 2*P1_OUT(2:end-1);
f = Fs*(0:(L/2))/L;
fIN_fft = fft(fIN);
P2_IN = abs(fIN_fft/L);
P1_IN = P2_IN(1:L/2+1);
P1_IN(2:end-1) = 2*P1_IN(2:end-1);
figure(3);
subplot(2,1,1);plot(f,P1_IN);
xlabel('频率（Hz）');ylabel('幅度');title('输入信号的频谱图')
subplot(2,1,2);plot(f,P1_OUT);
xlabel('频率（Hz）');ylabel('幅度');title('输出信号的频谱图')