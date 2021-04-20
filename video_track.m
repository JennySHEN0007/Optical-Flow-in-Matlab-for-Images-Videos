clear all
close all
vidReader = VideoReader('1-2.mp4','CurrentTime',1);
opticFlow = opticalFlowFarneback
h = figure;
movegui(h);
hViewPanel = uipanel(h,'Position',[0 0 1 1],'Title','Plot of Optical Flow Vectors');
hPlot = axes(hViewPanel);
px=[953 852 753 713 825];
py=[505 500 491 584 500];
px1=[];
py1=[];
while hasFrame(vidReader)
    frameRGB = readFrame(vidReader);
    frameGray = rgb2gray(frameRGB);  
    flow = estimateFlow(opticFlow,frameGray)
    for i = 1:length(px(:))
        px(i)=round(px(i)+flow.Vx(py(i),px(i)))
        py(i)=round(py(i)+flow.Vy(py(i),px(i)))
    end
    imshow(frameRGB)
    hold on
    plot(flow,'DecimationFactor',[5 5],'ScaleFactor',1,'Parent',hPlot);
    text(px,py,'o','color','r');
    hold off
    pause(10^-3)
end