% Load img
monedes = imread("../in_img/Imatges_4/monedes.png");
monedes = rgb2gray(monedes);

% Pre-process
bw = imbinarize(monedes);
filled = imfill(bw, "holes");

% Process
stats = regionprops('table', filled,'Centroid','Area');

% Post-process
big_coins = stats.Area > 6900;
small_coins = and(stats.Area <= 6900, stats.Area > 1000);
big_coins_count = sum(big_coins(:) == 1);
small_coins_count = sum(small_coins(:) == 1);

% Save data
X = sprintf('Big coins: %i', big_coins_count);
disp(X);
X = sprintf('Small coins: %i', small_coins_count);
disp(X);
imwrite(bw, '../out_img/coins_binarized.png');
imwrite(filled, '../out_img/coins_binarized_filled.png');