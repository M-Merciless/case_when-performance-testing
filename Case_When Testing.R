library(tidyverse)

#Generate sample data

sample_data <- data.frame(sample_1 = sample(0:100,1000, replace = TRUE)) 

#==============================================================
#==============================================================

#small data sample comparison with single replacement statement

time_start <-Sys.time()
sample_data %>% 
  mutate(case_when_test = case_when(sample_1 < 50 ~ "small",
                                    TRUE ~ "large"))
time_end <- Sys.time()

case_when_small_time <- time_end - time_start

case_when_small_time

#==============================================================

time_start <-Sys.time()
sample_data %>% 
  mutate(ifelse_test = ifelse(sample_1 < 50, "small", "large"))
time_end <- Sys.time()

ifelse_small_time <- time_end - time_start


ifelse_small_time

"ifelse is considerably slower, with a small dataset and small statement "
#==============================================================
#==============================================================

#large data sample comparison with single replacement statement


sample_data_large <- data.frame(sample_1 = sample(0:100,1000000, replace = TRUE)) 

#==============================================================
#==============================================================

time_start <-Sys.time()
sample_data_large %>% 
  mutate(case_when_test = case_when(sample_1 < 50 ~ "small",
                                    TRUE ~ "large"))
time_end <- Sys.time()

case_when_large_time <- time_end - time_start

case_when_large_time
#==============================================================

time_start <-Sys.time()
sample_data_large %>% 
  mutate(ifelse_test = ifelse(sample_1 < 50, "small", "large"))
time_end <- Sys.time()

ifelse_large_time <- time_end - time_start


ifelse_large_time

"ifelse is about 50% slower here, with a simple replacement statement and large dataset"
#==============================================================
#==============================================================

#Comparison with multiple replacement arguments


time_start <-Sys.time()
sample_data %>% 
  mutate(case_when_test = case_when(sample_1 < 20 ~ "very small",
                                    sample_1 < 40 ~ "small",
                                    sample_1 < 60 ~ "medium",
                                    sample_1 < 80 ~ "large",
                                    TRUE ~ "very large"))
time_end <- Sys.time()

case_when_complex_small_time <- time_end - time_start

case_when_complex_small_time

#==============================================================

time_start <-Sys.time()
sample_data %>% 
  mutate(ifelse_test = ifelse(sample_1 < 20, "very small",
                              ifelse(sample_1 < 40, "small",
                                     ifelse(sample_1 < 60, "medium",
                                            ifelse(sample_1 < 80, "large",
                                                   "very large")))))
time_end <- Sys.time()

ifelse_complex_small_time <- time_end - time_start


ifelse_complex_small_time

"Interestingly, ifelse is faster in this comparison. Out of all the tests here, this is the only occasion where ifelse performs better,
in a small dataset with a complex statement"
#==============================================================
#==============================================================


#Comparison with multiple replacement arguments


time_start <-Sys.time()
sample_data_large %>% 
  mutate(case_when_test = case_when(sample_1 < 20 ~ "very small",
                                    sample_1 < 40 ~ "small",
                                    sample_1 < 60 ~ "medium",
                                    sample_1 < 80 ~ "large",
                                    TRUE ~ "very large"))
time_end <- Sys.time()

case_when_complex_large_time <- time_end - time_start

case_when_complex_large_time

#==============================================================

time_start <-Sys.time()
sample_data_large %>% 
  mutate(ifelse_test = ifelse(sample_1 < 20, "very small",
                              ifelse(sample_1 < 40, "small",
                                     ifelse(sample_1 < 60, "medium",
                                            ifelse(sample_1 < 80, "large",
                                                   "very large")))))
time_end <- Sys.time()

ifelse_complex_large_time <- time_end - time_start


ifelse_complex_large_time

"Appears as though case_when starts to shine when large data is used with multiple replacement statements as 3 times faster here"
#==============================================================
#==============================================================






