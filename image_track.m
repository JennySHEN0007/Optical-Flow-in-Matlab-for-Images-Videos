I1=imread('frame10.png');
I2=imread('frame11.png');
I3 = im2double(rgb2gray(imread('frame10.png')));
I4 = im2double(rgb2gray(imread('frame11.png')));
px=[126 135 160 160];
py=[136 110 140 110];
px1=[];
py1=[];
opticFlow = opticalFlowHS;
flow = estimateFlow(opticFlow,I3);
flow = estimateFlow(opticFlow,I4);
for i = 1:length(px(:))
    px1(i)=px(i)+flow.Vx(py(i),px(i));
    py1(i)=py(i)+flow.Vy(py(i),px(i));
end
px1
py1
flow.Vx(px(3))
flow.Vy(py(3))
figure();
imshow(I2);
text(px1,py1,'o','color','r')
figure();
imshow(I1);
text(px,py,'o','color','r')
hold on
plot(flow,'DecimationFactor',[5 5],'ScaleFactor',60);
hold off
pause(10^-3)