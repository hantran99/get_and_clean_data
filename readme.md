

Getting and Cleaning Data: Course Project


Introduction
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. 
What follows first are my notes on the original data.

About the project data:
One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone. 
Refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  for full details of experiment
and measurements taken. 

What is required for this course project:
Create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


About the script and the tidy dataset
I created a script called run_analysis.R which will do the following:
1. Download the zipped file containing the Samsung  from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
2. Unzip the files/datasets
3. Read the files/datasets into R. Descriptions of each dataset that are read into R follows:

- 'features.txt': List of all features - basically contains the variable names of all measurements taken - useful to be able to filter final datset to just
the mean and standard deviation of each measurement.
- 'activity_labels.txt': Links the class labels with their activity name. Used by script to give descriptive activity names to the activities in the dataset.
- 'train/X_train.txt': Training set - contains measurements fot the training group
- 'train/y_train.txt': Training labels - contains activity labels for the training group
- 'train/subject_train.txt': Each row identifies the training subject who performed the activity. 
- 'test/X_test.txt': Test set - contains measurements fot the test group
- 'test/y_test.txt': Test labels - contains activity labels for the training group
- 'test/subject_test.txt': Each row identifies the test subject who performed the activity. 

4. Simplify variable names in features datset by removing unwanted characters like '/' and '()'
5. Merge the test and training sets together. 
6. Reduce features dataset to just the mean and standard deviation related columns and use this to filter the combined test/training dataset to just that.
7. Add meaningful column headers to the dataset - making use of vaiables on reduced features dataset and standardising them to be all lowercase.
8. Replace activity labels with descriptive labels - using activity_labels dataset.
9. Creates a second, independent tidy data set (based on thee dataset created by steps 5-8) with the average of each variable for each activity and 
each subject.
10. Remove columns from this dataset where taking an average/mean does not make sensd
11. Write the tidydata dataset as a comma delimited text file called tidydata.txt.



About the Code Book
The CodeBook.md file explains the resulting data and variables in this final dataset: tidydata.txt.

