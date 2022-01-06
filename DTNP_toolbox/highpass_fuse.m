function [cp,map]=highpass_fuse(matrixA,matrixB)
%%
DTNP_A=DTNP(INSML(abs(matrixA)),110);
DTNP_B=DTNP(INSML(abs(matrixB)),110);
map=(DTNP_A>=DTNP_B);
cp=map.*matrixA+~map.*matrixB;
end