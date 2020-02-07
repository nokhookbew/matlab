img = imread('honeypot.jpg');
imgd = double(img);
figure(1);
imshow(img);

h = fspecial('average', 33);
avg = imfilter(imgd, h);

h_x = fspecial('sobel');

h_y = h_x';

f_img_x = imfilter(imgd, h_x);
figure(2);
imshow(f_img_x);

f_img_y = imfilter(imgd, h_y);
figure(3);
imshow(f_img_y);

[row, col, ~] = size(imgd);

new_img = ones(row, col);

% for i = 1 :row
%    for j = 1 :col
%        new_img(i,j) = sqrt((f_img_x(i, j).^2) + (f_img_y(i, j).^2));
%     end
% end
new_img = sqrt((f_img_x.^2) + (f_img_y.^2));

new_img_u = uint8(new_img);
figure(4);
imshow(new_img_u);

avg_u = uint8(avg);

avg_u = avg_u-new_img_u;
figure(5);
imshow(avg_u);



