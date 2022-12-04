clc;
clear;
close all;
readerobj = VideoReader('C:\Users\Sai Chetana\Downloads\Test.avi');
numFrames = readerobj.NumFrames
close all;
numFramesWritten = 0;
for t = 1 : numFrames
currFrame = read(readerobj, t);    %reading individual frames
opBaseFileName = sprintf('%3.3d.png', t);
opFullFileName = fullfile('C:\Users\Sai Chetana\Documents\MATLAB\input', opBaseFileName);
imwrite(currFrame, opFullFileName, 'png');   %saving as 'png' file
%progIndication = sprintf('Wrote frame %4d of %d.', t, numFrames);
%disp(progIndication);
numFramesWritten = numFramesWritten + 1;
end       %end of 'for' loop
progIndication = sprintf('Wrote %d frames to folder "%s"',numFramesWritten, 'C:\Users\Sai Chetana\Documents\MATLAB\input');
disp(progIndication);
frame = read(readerobj,1);
figure;imshow(frame);
P=numFrames;
flag =0;
if flag==0
    for ii = 1:P 
    A=imsubtract(readerobj.read(ii),frame);
    A = rgb2gray(A);  
    [m,n,z]=size(A);
        for i=1:1:m
             for j=1:1:n
        
                temp = A(i,j);
                if temp==241
                    flag=1;
                     x = i;
                     y = j;
                %to show the output image
                figure;
                imshow(A);
                title(ii);
                end
            end
         end
    end
end
 disp(x)
 disp(y)

 axis on
 hold on;
 % Plot cross at row 100, column 50
plot(y,x, '*r', 'MarkerSize', 30, 'LineWidth', 2);