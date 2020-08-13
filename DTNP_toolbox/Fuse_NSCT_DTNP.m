function F = Fuse_NSCT_DTNP(A,B)
pfilt = '9-7';
dfilt = 'pkva';
nlevs = [1,2,3,3];
%%
yA=nsctdec(A,nlevs,dfilt,pfilt);
yB=nsctdec(B,nlevs,dfilt,pfilt);
n = length(yA);
ALow1= yA{1};
BLow1 =yB{1};
Fused{1}=Lowpass(ALow1,BLow1);
for l = 2:n
    for d = 1:length(yA{l})
        Ahigh = yA{l}{d};
        Bhigh = yB{l}{d};
        Fused{l}{d}=highpass_fuse(Ahigh,Bhigh);
    end
end
F=nsctrec(Fused, dfilt, pfilt);
figure;imshow(F);
F=F*255;
F(F<0)=0;
F(F>255)=255;
F=round(F);
end