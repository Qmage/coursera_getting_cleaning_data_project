Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
This Repository is created for course project required by:
Coursera's "Getting and Cleaning data" unit.

To read the tidy_dataset.txt in R
---------------------------------
df <- read.table("tidy_dataset.txt", header=TRUE)

Contents of this repository
--------------------------
1. This README.md file - explains how all of the scripts work and how they are connected
2. CodeBook.md - describes the variables, the data, and any transformations or work performed to clean up the data
3. run_analysis.R - the actual script file containing R code
4. tidy_dataset.txt - expected output from the script


Getting the data needed for this project
---------------------------------------
1. download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. unzip the file and copy the directory "UCI HAR Dataset" to your R working directory
3. You should be set to run "run_analysis.R" script


About the run_analysis.R script (how it works)
--------------------------------------------
1. The script will firstly read in the data from the respective files in "UCI HAR Datase" folder, creating various dataframes.
2. It will then proceed to merge the test and train dataset for subject, and rename the column to "subject"
3. Then, merge the test and train dataset for X, and rename the column using the data from features dataframe.
4. After that, subset the merged X dataset to only columns containing "mean" or "std"
5. Then, merge the test and train dataset for Y, and rename the column to "activity"
6. After that, replace the 1,2,3,4,5,6 values in Y with the actual activity names like "standing", "walking", using the activity labels dataframe.
7. Then, combine all 3 dataset of Subject, X and Y to a big dataset.
8. After that, change the "subject" and "activity" variables to be of Factor type
9. Then, create a dataframe containing the average of each subject's activity, then sort the dataframe.
10. Lastly, create a txt file from the average dataframe
