library(dplyr)

#read in the feature file
features <- read.table(file.path(getwd(),"features.txt"), col.names = c("no", "features"))
activity <- read.table("activity_labels.txt", col.names = c("label", "activity"))


#reading in test data
subject_test <- read.table(file.path(getwd(),"test/subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(getwd(),"test/X_test.txt"), col.names = features$features)
y_test <- read.table(file.path(getwd(),"test/Y_test.txt"), col.names = "label")
y_test_label <- left_join(y_test, activity, by = "label")

tidy_test <- cbind(subject_test, y_test_label, x_test)
tidy_test <- select(tidy_test, -label)

#reading in train
subject_train <- read.table(file.path(getwd(),"train/subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(getwd(),"train/X_train.txt"), col.names = features$features)
y_train <- read.table(file.path(getwd(),"train/Y_train.txt"), col.names = "label")
y_train_label <- left_join(y_train, activity, by = "label")

tidy_train <- cbind(subject_train, y_train_label, x_train)
tidy_train <- select(tidy_train, -label)

# combine test and train
tidy_set <- rbind(tidy_test, tidy_train)

# Extract mean and standard deviation
tidy_mean_std <- select(tidy_set, contains("mean"), contains("std"))

# Averaging all variable by each subject each activity
tidy_mean_std$subject <- as.factor(tidy_set$subject)
tidy_mean_std$activity <- as.factor(tidy_set$activity)

tidy_avg <- tidy_mean_std %>%
  group_by(subject, activity) %>%
  summarise(across(everything(),mean))




