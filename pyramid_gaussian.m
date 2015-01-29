clear all;
close all;

%%# Read an image
I = imread('zebra.jpg');

I = rgb2gray(I);

%# Create the gaussian filter with hsize = [5 5] and sigma = 2
G = fspecial('gaussian',[5 5], 2);

size = 512;

figure(1);
imshow(I, []);

for i = 1 : 6
    I = imfilter(I,G,'same');
    
    size = size/2;
    
    ig = zeros(size, size);
    for j = 1 : size
        for k = 1 : size
            ig(j, k) = I(2*j, 2*k);
        end
    end
      
    figure(i+1);
    imshow(ig, []);
    
    I = ig;
end