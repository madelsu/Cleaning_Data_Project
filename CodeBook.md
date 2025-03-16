# Code Book

This document describes the dataset, variables, and transformations applied to prepare the tidy dataset in the run_analysis.R script.

## Data

The dataset is from the UCI Machine Learning Repository. According to the UCI Machine Learning Repository: "Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist".

## Data Processing Steps

1.  Merging the training and test datasets
2.  Extracting only mean and standard deviation measurements
3.  Descriptive activity names: Activity IDs were replaced with descriptive labels, like for example walking or laying.
4.  Labeling the dataset with the descriptive variable names.
5.  Second tidy dataset: the average of each variable for each activity and subject.

## Variables

subject: The identifier for the subject (1-30). activity: The activity performed (WALKING, SITTING). tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z: Mean values of body acceleration. tBodyAcc-std()-X, tBodyAcc-std()-Y, tBodyAcc-std()-Z: Standard deviation values of body acceleration signals.

## Output File

tidy_dataset.txt: A tidy dataset containing the average of each variable for each subject and activity.
