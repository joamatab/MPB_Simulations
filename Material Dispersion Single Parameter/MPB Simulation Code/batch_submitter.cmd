#!/bin/bash
# array job using 1 nodes and 1 processor,
# and runs for 5 minutes max per task.
#SBATCH -J array_example
#SBATCH --output=wg_%A_%a.out
#SBATCH -N 1   # node count
#SBATCH --ntasks-per-node=1
#SBATCH -t 03:00:00
#SBATCH --array=0-118

TUPLES=("13.0249","5.7402","1.1111" 
"12.9143","5.7392","1.1038" 
"12.8304","5.7382","1.0965" 
"12.7623","5.7373","1.0893" 
"12.7046","5.7363","1.0823" 
"12.6541","5.7354","1.0753" 
"12.6089","5.7345","1.0684" 
"12.5677","5.7336","1.0616" 
"12.5297","5.7328","1.0549" 
"12.4943","5.7319","1.0482" 
"12.4611","5.7311","1.0417" 
"12.4297","5.7303","1.0352" 
"12.3999","5.7295","1.0288" 
"12.3715","5.7287","1.0225" 
"12.3443","5.7279","1.0163" 
"12.3183","5.7271","1.0101" 
"12.2932","5.7264","1.004" 
"12.269","5.7257","0.998" 
"12.2457","5.725","0.99206" 
"12.2232","5.7243","0.98619" 
"12.2014","5.7236","0.98039" 
"12.1803","5.7229","0.97466" 
"12.1598","5.7222","0.96899" 
"12.1399","5.7216","0.96339" 
"12.1205","5.7209","0.95785" 
"12.1017","5.7203","0.95238" 
"12.0834","5.7197","0.94697" 
"12.0656","5.7191","0.94162" 
"12.0483","5.7185","0.93633" 
"12.0313","5.7179","0.9311" 
"12.0148","5.7173","0.92593" 
"11.9987","5.7167","0.92081" 
"11.983","5.7162","0.91575" 
"11.9677","5.7156","0.91075" 
"11.9527","5.7151","0.9058" 
"11.938","5.7145","0.9009" 
"11.9237","5.714","0.89606" 
"11.9097","5.7135","0.89127" 
"11.896","5.713","0.88652" 
"11.8826","5.7125","0.88183" 
"11.8695","5.712","0.87719" 
"11.8566","5.7115","0.8726" 
"11.8441","5.711","0.86806" 
"11.8318","5.7106","0.86356" 
"11.8197","5.7101","0.85911" 
"11.8079","5.7096","0.8547" 
"11.7963","5.7092","0.85034" 
"11.785","5.7088","0.84602" 
"11.7738","5.7083","0.84175" 
"11.7629","5.7079","0.83752" 
"11.7522","5.7075","0.83333" 
"11.7417","5.7071","0.82919" 
"11.7314","5.7067","0.82508" 
"11.7213","5.7063","0.82102" 
"11.7114","5.7059","0.81699" 
"11.7016","5.7055","0.81301" 
"11.692","5.7051","0.80906" 
"11.6827","5.7047","0.80515" 
"11.6734","5.7043","0.80128" 
"11.6644","5.704","0.79745" 
"11.6555","5.7036","0.79365" 
"11.6467","5.7032","0.78989" 
"11.6381","5.7029","0.78616" 
"11.6297","5.7026","0.78247" 
"11.6214","5.7022","0.77882" 
"11.6132","5.7019","0.77519" 
"11.6052","5.7015","0.7716" 
"11.5973","5.7012","0.76805" 
"11.5895","5.7009","0.76453" 
"11.5819","5.7006","0.76104" 
"11.5744","5.7003","0.75758" 
"11.567","5.6999","0.75415" 
"11.5598","5.6996","0.75075" 
"11.5526","5.6993","0.74738" 
"11.5456","5.699","0.74405" 
"11.5387","5.6987","0.74074" 
"11.5318","5.6985","0.73746" 
"11.5251","5.6982","0.73421" 
"11.5185","5.6979","0.73099" 
"11.512","5.6976","0.7278" 
"11.5056","5.6973","0.72464" 
"11.4993","5.6971","0.7215" 
"11.4931","5.6968","0.71839" 
"11.487","5.6965","0.71531" 
"11.481","5.6963","0.71225" 
"11.475","5.696","0.70922" 
"11.4692","5.6958","0.70621" 
"11.4634","5.6955","0.70323" 
"11.4577","5.6953","0.70028" 
"11.4521","5.695","0.69735" 
"11.4466","5.6948","0.69444" 
"11.4412","5.6945","0.69156" 
"11.4358","5.6943","0.68871" 
"11.4305","5.6941","0.68587" 
"11.4253","5.6938","0.68306" 
"11.4202","5.6936","0.68027" 
"11.4151","5.6934","0.67751" 
"11.4101","5.6932","0.67476" 
"11.4052","5.693","0.67204" 
"11.4003","5.6927","0.66934" 
"11.3956","5.6925","0.66667" 
"11.3908","5.6923","0.66401" 
"11.3862","5.6921","0.66138" 
"11.3816","5.6919","0.65876" 
"11.377","5.6917","0.65617" 
"11.3725","5.6915","0.65359" 
"11.3681","5.6913","0.65104" 
"11.3638","5.6911","0.64851" 
"11.3595","5.6909","0.64599" 
"11.3552","5.6907","0.6435" 
"11.351","5.6905","0.64103" 
"11.3469","5.6903","0.63857" 
"11.3428","5.6902","0.63613" 
"11.3388","5.69","0.63371" 
"11.3348","5.6898","0.63131" 
"11.3308","5.6896","0.62893" 
"11.327","5.6894","0.62657" 
"11.3231","5.6893","0.62422" 
"11.3193","5.6891","0.62189")

IFS="," read epshi epslo omega <<< "${TUPLES[$SLURM_ARRAY_TASK_ID]}"
echo "${epshi} ${epslo} ${omega}"

cd /scratch/gpfs/aa22/mpb/3dwavguide/diamond/2020-05-20/small_ar/0.1to1/h-632
mkdir $omega

cp wg3d_vg.ctl $omega

cd $omega

#w_mismatch Calculations, telecom
mpb h=0.632 w=0.063 eps_hi=$epshi eps_sub=$epslo omega=$omega kguess=2.5 kmin=0 kmax=5 wg3d_vg.ctl >& wg_vg-$omega.out
grep velocity wg_vg-$omega.out > velocity-$omega.dat
grep freqs wg_vg-$omega.out > freqs-$omega.dat


rm *.h5
rm *.png