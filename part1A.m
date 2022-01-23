image = imread('flowers.jpg');

grayscale_image = rgb2gray(image);

[height, width] = size(grayscale_image);
  
fourirer_transform_applied = fft2(double(grayscale_image));



u = 0:(height-1);
v = 0:(width-1);
X = find(u > height/2);
u(X) = u(X) - height;
Y = find(v > width/2);
v(Y) = v(Y) - width;

n = 12; 
D0 = 80; 

% magnitude of fourier
%imshow(log(abs(fftshift(fourirer_transform_applied))),[]);

[V, U] = meshgrid(v, u);
  
% Euclidean Distance
D = sqrt(U.^2 + V.^2);
  
% Filtering mask
H = 1./(1 + (D./D0).^(2*n));



% Convolution of Fourier Transform Applied Image and the mask
G = H.*fourirer_transform_applied;
imshow(ifftshift(H),[]);

  
% Inverse Fourier Transform 
output_image = real(ifft2(double(G))); 

%imshow(output_image, [ ]);
