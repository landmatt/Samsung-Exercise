## sets pathnames to upload data files.

path_to_test_data <- file.path("UCI HAR Dataset", "test", "X_test.txt")
path_to_test_subject <- file.path("UCI HAR Dataset", "test", "subject_test.txt")
path_to_test_labels <- file.path("UCI HAR Dataset", "test", "y_test.txt")
path_to_train_data <- file.path("UCI HAR Dataset", "train", "X_train.txt")
path_to_train_subject <- file.path("UCI HAR Dataset", "train", "subject_train.txt")
path_to_train_labels <- file.path("UCI HAR Dataset", "train", "y_train.txt")
path_to_features <- file.path("UCI HAR Dataset", "features.txt")

## reads data and label files into R.

test_data <- read.delim(path_to_test_data, sep="", header=FALSE)
test_subjects <- read.delim(path_to_test_subject, header=FALSE)
test_labels <- read.delim(path_to_test_labels, header=FALSE)
train_data <- read.delim(path_to_train_data, sep="", header=FALSE)
train_subjects <- read.delim(path_to_train_subject, header=FALSE)
train_labels <- read.delim(path_to_train_labels, header=FALSE)
features <- read.delim(path_to_features, header=FALSE)
features_2 <- t(features)

## creates test dataset
## and assigns header labels for descriptive variable names.

test_data_2 <- rbind(features_2, test_data)
names(test_data_2) <- test_data_2[1,]
test_data_3 <- test_data_2[-c(1),]
test_data_4 <- cbind(test_subjects, test_labels, test_data_3)

colnames(test_data_4)[1] <- "subject"
colnames(test_data_4)[2] <- "activity"

## assigns descriptive names for each activity type.

test_data_4$activity <- factor(test_data_4$activity, 
                              levels=c(1,2,3,4,5,6), 
                              labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## same process repeated for train dataset

train_data_2 <- rbind(features_2, train_data)
names(train_data_2) <- train_data_2[1,]
train_data_3 <- train_data_2[-c(1),]
train_data_4 <- cbind(train_subjects, train_labels, train_data_3)

colnames(train_data_4)[1] <- "subject"
colnames(train_data_4)[2] <- "activity"

train_data_4$activity <- factor(train_data_4$activity, 
                               levels=c(1,2,3,4,5,6), 
                               labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## merges test and train datasets to create one dataset.

merged_data <- rbind(test_data_4, train_data_4)

## extracts measurement for mean and standard deviation for each measurement.

rule <- grep("mean\\(\\)|std\\(\\)", names(merged_data), value=TRUE)
subset_merged_data <- merged_data[rule]
subset_merged_data <- subset_merged_data %>% mutate(across(, ~as.numeric(.)))
new_set <- subset(merged_data, select=subject:activity)
new_set_final <- cbind(new_set, subset_merged_data)

## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject.

avg <- new_set_final %>%                                      
      group_by(subject,activity) %>%                         
      summarise_at(vars(3:66),            
      list(name = mean)) 


