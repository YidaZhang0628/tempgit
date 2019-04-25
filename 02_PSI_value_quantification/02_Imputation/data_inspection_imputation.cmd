#!/bin/sh

###
# tells the cluster to run the job from the current working directory
#$ -cwd

# tells the cluster what info to inform the user through email
#$ -m beas

# tells the cluster the user's email
#$ -M yidazhan@mail

# tells the cluster to use 1024MB of memory, and 1 hours of run time
#$ -l h_data=8G,h_rt=4:00:00
###

# this is most important part, it tells the machine that I want to use R
source /u/local/Modules/default/init/modules.sh
module load R/3.2.3

splicetype=$1
counttype=$2

# run the R code
code_folder="/u/nobackup/yxing/PROJECT/yidazhan/research/rotation_project/GTEx_brain_project_V7/analysis/4.2_data_inspection_imputation"
Rscript $code_folder/4.2_data_inspection_imputation.R $splicetype $counttype



#example: 
#qsub -V -N SE_JCEC data_inspection_imputation.cmd SE JCEC
#qsub -V -N MXE_JCEC data_inspection_imputation.cmd MXE JCEC
#qsub -V -N RI_JCEC data_inspection_imputation.cmd RI JCEC
#qsub -V -N A5SS_JCEC data_inspection_imputation.cmd A5SS JCEC
#qsub -V -N A3SS_JCEC data_inspection_imputation.cmd A3SS JCEC

#qsub -V -N SE_JC data_inspection_imputation.cmd SE JC
#qsub -V -N MXE_JC data_inspection_imputation.cmd MXE JC
#qsub -V -N RI_JC data_inspection_imputation.cmd RI JC
#qsub -V -N A5SS_JC data_inspection_imputation.cmd A5SS JC
#qsub -V -N A3SS_JC data_inspection_imputation.cmd A3SS JC