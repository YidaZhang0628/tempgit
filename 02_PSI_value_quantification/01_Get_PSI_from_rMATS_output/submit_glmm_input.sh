#!/bin/sh

###
# tells the cluster to run the job from the current working directory
#$ -cwd

# tells the cluster what info to inform the user through email
#$ -m beas

# tells the cluster the user's email
#$ -M yidazhan@mail

# tells the cluster to use 1024MB of memory, and 1 hours of run time
#$ -l h_data=28G,h_rt=12:00:00

#$ -e ./
#$ -o ./
###


#example: 
#qsub -V -N SE_JCEC submit_glmm_input.sh SE JCEC
#qsub -V -N MXE_JCEC submit_glmm_input.sh MXE JCEC
#qsub -V -N RI_JCEC submit_glmm_input.sh RI JCEC
#qsub -V -N A5SS_JCEC submit_glmm_input.sh A5SS JCEC
#qsub -V -N A3SS_JCEC submit_glmm_input.sh A3SS JCEC

#qsub -V -N SE_JC submit_glmm_input.sh SE JC
#qsub -V -N MXE_JC submit_glmm_input.sh MXE JC
#qsub -V -N RI_JC submit_glmm_input.sh RI JC
#qsub -V -N A5SS_JC submit_glmm_input.sh A5SS JC
#qsub -V -N A3SS_JC submit_glmm_input.sh A3SS JC

splicetype=$1
counttype=$2

# this is most important part, it tells the machine that I want to use R
source /u/local/Modules/default/init/modules.sh
module load R

# run the R code
code_folder="/u/nobackup/yxing/PROJECT/yidazhan/research/rotation_project/GTEx_brain_project_V7/analysis/1_get_matrix_from_rMATS"
Rscript $code_folder/0_glmm_input.R $splicetype $counttype
