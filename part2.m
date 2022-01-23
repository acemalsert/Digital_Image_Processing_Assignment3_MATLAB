f = imread('skull.png');
F = fftshift(fft2(double(f)));
S = log(abs(F));
imwrite( S/max(S(:)), 'skull_mask.png');
%pause;
M = imread('skull_mask_modified.png');
M = M(:,:,1); 
M = double((M>0)); 
G = M .* F;
g = real( ifft2( ifftshift(G) ) );
figure, imshow(g,[]);