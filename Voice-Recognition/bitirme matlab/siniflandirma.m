clear ALL;
clc;close ALL;

sn=40;
MFCC_block=zeros(13,sn);
MFCC2_var=zeros(13,8);
MFCC2_ort=zeros(13,8);

MFCC_var=zeros(13,1);
MFCC_ort=zeros(13,1);

N = 1024;
x=hamming(N);
Threshold=-200;
n=1;
m=0;
saniye=1;

cam=zeros(26,40);

for k=1:40
   
[ses,fs1]=audioread(strcat('cam',num2str(k),'.wav'));

ses=ses(:,1);
Ts1=1/fs1;
mfccParams = feature_mfccs_init(N, fs1);   % MFC ilklendirme

for i=1:N/2:length(ses)-N
    
    frameFFT=abs(fft(x.*ses(i:i+N-1)));
    MFCCs = feature_mfccs(frameFFT(1:512), mfccParams);   % MFC katsayýlarýnýn hesabý 
    %MFCC_block(:,n)=MFCCs
    %n=n+1;
    
    if(n<sn+1)
        MFCC_block(:,n)=MFCCs;
        
        n=n+1;
    else
       
        
        for z=1:sn-9
            if( sum(MFCC_block(1,z:z+9)) >= Threshold )
                 for j=1:13
                    MFCC2_ort(j,saniye)= mean(MFCC_block(j,:));
                    MFCC2_var(j,saniye)= var(MFCC_block(j,:));
                end
                break
            end        
        end
        
        saniye=saniye+1;    
         n=1;
        
        MFCC_block(:,n)=MFCCs;
        n=n+1;
    end     
end


for j=1:13
   MFCC_ort(j,1)= mean(MFCC2_ort(j,1:saniye-1));
   MFCC_var(j,1)= var(MFCC2_var(j,1:saniye-1));
end

cam(1:13,k)=MFCC2_ort(:,1);
cam(14:26,k)=MFCC2_var(:,1);
saniye=1;
end

karton=zeros(26,44);

for k=1:44
   
[ses,fs2]=audioread(strcat('karton',num2str(k),'.wav'));

ses=ses(:,1);
Ts=1/fs2;
mfccParams = feature_mfccs_init(N, fs2);   % MFC ilklendirme

for i=1:N/2:length(ses)-N
    
    frameFFT=abs(fft(x.*ses(i:i+N-1)));
    MFCCs = feature_mfccs(frameFFT(1:512), mfccParams);   % MFC katsayýlarýnýn hesabý 
    %MFCC_block(:,n)=MFCCs
    %n=n+1;
    
    if(n<sn+1)
        MFCC_block(:,n)=MFCCs;
        
        n=n+1;
    else
       
        
        for z=1:sn-9
            if( sum(MFCC_block(1,z:z+9)) >= Threshold )
                 for j=1:13
                    MFCC2_ort(j,saniye)= mean(MFCC_block(j,:));
                    MFCC2_var(j,saniye)= var(MFCC_block(j,:));
                end
                break
            end        
        end
        
        saniye=saniye+1;    
         n=1;
        
        MFCC_block(:,n)=MFCCs;
        n=n+1;
    end     
end


for j=1:13
   MFCC_ort(j,1)= mean(MFCC2_ort(j,1:saniye-1));
   MFCC_var(j,1)= var(MFCC2_var(j,1:saniye-1));
end

karton(1:13,k)=MFCC2_ort(:,1);
karton(14:26,k)=MFCC2_var(:,1);
saniye=1;
end

metal=zeros(26,34);

for k=1:34
   
[ses,fs]=audioread(strcat('metal',num2str(k),'.wav'));

ses=ses(:,1);
Ts=1/fs;
mfccParams = feature_mfccs_init(N, fs);   % MFC ilklendirme

for i=1:N/2:length(ses)-N
    
    frameFFT=abs(fft(x.*ses(i:i+N-1)));
    MFCCs = feature_mfccs(frameFFT(1:512), mfccParams);   % MFC katsayýlarýnýn hesabý 
    %MFCC_block(:,n)=MFCCs
    %n=n+1;
    
    if(n<sn+1)
        MFCC_block(:,n)=MFCCs;
        
        n=n+1;
    else
       
        
        for z=1:sn-9
            if( sum(MFCC_block(1,z:z+9)) >= Threshold )
                 for j=1:13
                    MFCC2_ort(j,saniye)= mean(MFCC_block(j,:));
                    MFCC2_var(j,saniye)= var(MFCC_block(j,:));
                end
                break
            end        
        end
        
        saniye=saniye+1;    
         n=1;
        
        MFCC_block(:,n)=MFCCs;
        n=n+1;
    end     
end


for j=1:13
   MFCC_ort(j,1)= mean(MFCC2_ort(j,1:saniye-1));
   MFCC_var(j,1)= var(MFCC2_var(j,1:saniye-1));
end

metal(1:13,k)=MFCC2_ort(:,1);
metal(14:26,k)=MFCC2_var(:,1);
saniye=1;
end

plastik=zeros(26,50);

for k=1:50
   
[ses,fs]=audioread(strcat('plastik',num2str(k),'.wav'));

ses=ses(:,1);
Ts=1/fs;
mfccParams = feature_mfccs_init(N, fs);   % MFC ilklendirme

for i=1:N/2:length(ses)-N
    
    frameFFT=abs(fft(x.*ses(i:i+N-1)));
    MFCCs = feature_mfccs(frameFFT(1:512), mfccParams);   % MFC katsayýlarýnýn hesabý 
    %MFCC_block(:,n)=MFCCs
    %n=n+1;
    
    if(n<sn+1)
        MFCC_block(:,n)=MFCCs;
        
        n=n+1;
    else
       
        
        for z=1:sn-9
            if( sum(MFCC_block(1,z:z+9)) >= Threshold )
                 for j=1:13
                    MFCC2_ort(j,saniye)= mean(MFCC_block(j,:));
                    MFCC2_var(j,saniye)= var(MFCC_block(j,:));
                end
                break
            end        
        end
        
        saniye=saniye+1;    
         n=1;
        
        MFCC_block(:,n)=MFCCs;
        n=n+1;
    end     
end


for j=1:13
   MFCC_ort(j,1)= mean(MFCC2_ort(j,1:saniye-1));
   MFCC_var(j,1)= var(MFCC2_var(j,1:saniye-1));
end

plastik(1:13,k)=MFCC2_ort(:,1);
plastik(14:26,k)=MFCC2_var(:,1);
saniye=1;
end


var_ort_degerleri=zeros(26,length(cam)+length(karton)+length(metal)+length(plastik));

var_ort_degerleri(:,1:length(cam))=cam(:,1:length(cam));
var_ort_degerleri(:,length(cam)+1:length(cam)+length(karton))=karton(:,1:length(karton));
var_ort_degerleri(:,length(cam)+length(karton)+1:length(cam)+length(karton)+length(metal))=metal(:,1:length(metal));
var_ort_degerleri(:,length(cam)+length(karton)+length(metal)+1:length(cam)+length(karton)+length(metal)+length(plastik))=plastik(:,1:length(plastik));


data = var_ort_degerleri.';

fileId=fopen('data.txt','w');

for i=1:168
    for j=1:26
        fprintf(fileId,'%0.4f, ',data(i,j));
    end
    fprintf(fileId,'\n');
end

class=zeros(168,1);
class(1:40,1)=1;
class(41:84,1)=2;
class(85:118,1)=3;
class(119:168,1)=4;

%%%%%%%%%%%%%%%%% sýnýflandýrma %%%%%%%%%%%%%%%%%
for numclass=1:4
B=[numclass,5];   
groups = ismember(class,B);         
k=10;             % %10 eðitim oraný  

cvFolds = crossvalind('KFold', groups, k);   
cp = classperf(groups);                      

for i = 1:k                                     
    testIdx = (cvFolds == i);                
    trainIdx = ~testIdx;                         
    G1vAll=(class(trainIdx)==numclass);   
    svmModel = fitcsvm(data(trainIdx,:), G1vAll);
    pred = predict(svmModel, data(testIdx,:));
    cp = classperf(cp, pred, testIdx);
end
   cp.CorrectRate
end

