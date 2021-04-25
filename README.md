# Samsung-Exercise
Coursera Getting and Cleaning Data Course Project

Code
====

The code performs the following steps.
1) sets pathnames to upload data files.
2) reads data and label files into R.
3) creates test dataset and assigns header labels for descriptive variable names for test and train datasets.
4) assigns descriptive names for each activity type for test and train datasets.
5) merges test and train datasets to create one dataset.
6) extracts measurement for mean and standard deviation for each measurement.
7) creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Files
=====

The UCI HAR Dataset includes the following files. Inertial Signals datasets are omitted for ease of handling.

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The github file also includes the following files.

- 'Code_Book.txt': explains data sources and variables.

- 'run.Analysis.R': code that reads-in data and creates merged dataset and segmented averages by subject and activity.

- 'run_Analysis_avg_file.txt': .txt output of run.Analysis.R code.