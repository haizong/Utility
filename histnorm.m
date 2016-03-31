function [bincount, relativefreq] = histnorm (y, numIntervals, name, variable_name)

% numIntervals = 20;  name is the file name/title;  
% variable_name is the input
 
% Calculating the desired interval width, and creating the desired data range:

intervalWidth = (round(max(y)) - round(min(y)))/numIntervals +1 ;
binrange = round(min(y)) : intervalWidth : round(max(y));

% Next, use the HISTC function to find the frequency of each data range "x" 
% in the given data set "y". This function returns the histogram count for a data set and range.

bincount = histc(y,binrange);

% Calculate the relative frequency of each data range by dividing the frequency 
% by the total number of data points:

relativefreq = bincount/length(y) * 100;

% Finally plot the relative frequency versus the data ranges as a bar chart. 
% On this chart, the bars will be adjoining, and the tick marks on the x-axis 
% will label the extent of each bar's data range.

figure ()
bar(binrange, relativefreq, 'histc')
xlim([min(binrange)-intervalWidth max(binrange)+intervalWidth])
set(gca, 'xtick', binrange)
ylabel ('Relative Frequency', 'FontSize', 12, 'FontName', 'Arial'); 
xlabel (variable_name, 'FontSize', 12, 'FontName', 'Arial'); 
t = title (['Normalized histgram of ' ,name]);
set (t, 'FontSize', 14, 'FontName', 'Arial'); 
% Note that the BAR function centers the bars it creates on the supplied x-data. 
% So this data has been translated by half an interval so the extents of the bar 
% width fall on the limits of the data ranges.

print_save_figure( gcf, ['NormHistgram_', name ], 'Angle_analysis' ); 