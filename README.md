## Purpose

This repository has been created for the coursera Getting and Cleaning Data Course peer-graded assignment.

The purpose of the assignment is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


## Contents

This repository contains following files:

* `CodeBook.md` - Describes the variables, the data, and any transformations or work performed to clean up the data.

* `run_analysis.R` - An R script which performs inital preparation steps and then transforms the data to create the tidy data set specified in the assignment instructions:
  + Step 1 - Merges the training and the test sets to create one data set.
  + Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
  + Step 3 - Uses descriptive activity names to name the activities in the data set
  + Step 4 - Appropriately labels the data set with descriptive variable names. 
  + Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`TidyData.txt` - A text file containing a tidy data set with the average of each variable for each activity and each subject.


## Reading the tidy data set

The following commands can be used for reading the TidyData.txt into R and viewing it:

`TidyData <- read.table("https://raw.githubusercontent.com/DaveAzz/GettingAndCleaningDataCourseProject/main/TidyData.txt", header = TRUE)`
<br/>
`View(TidyData)`


## Software Version

The run_analysis.R script was created using the following software:

R version 4.2.2 (2022-10-31 ucrt)
<br/>
Platform: x86_64-w64-mingw32/x64 (64-bit)
<br/>
Running under: Windows 10 x64 (build 19044)


## Original data set

The assignment is based on data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the assignment can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Licence (original data set)

The following licence infomration is contained within the README.txt file of the original data set:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

