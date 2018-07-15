clear all;
clc;

load('C:\Users\ender\Desktop\bitirme matlab\data.mat')
%data = (data-min(min(data)))/(max(max(data))-min(min(data)));
% 1-40:cam, 41-84:karton, 85-118:metal, 119-168: plastik 
labels = zeros(168,1);
labels(1:40)=1;     % cam sınıfı 1, diğerleri 0 olarak etiketleniyor
labels(41:84)=0;    %2
labels(85:118)=0;   %3
labels(119:168)=0;  %4

X = data;   % veri
y = labels; % etiketler
SVMModel = fitcsvm(X,y);  %Svm Eğitimi

%% testing phase
for i=1:size(data,1)
    buffer = 0;
   for j=1:size(SVMModel.SupportVectors,1)
       buffer = buffer + sum(sum(data(i,:).*SVMModel.SupportVectors(j,:))...
       *SVMModel.Alpha(j)*SVMModel.SupportVectorLabels(j));
   end    
   class(i) = buffer + SVMModel.Bias;   % veri test edildiginde elde edilen skorlar
   class_label(i) = class(i) > 0;
end

