#!/bin/bash

# Function to convert HHMM to minutes
time_to_minutes() {
    hour=${1:0:2}
    minute=${1:2:2}
    # Ensure base 10
    hour=$((10#$hour))
    minute=$((10#$minute))
    echo $((hour * 60 + minute))
}

# Read times
read -p "Enter clock-in time (HHMM): " clock_in_morning
read -p "Enter clock-out for lunch (HHMM): " clock_out_lunch
read -p "Enter clock-in after lunch (HHMM): " clock_in_after_lunch
read -p "Enter clock-out time at end of day (HHMM): " clock_out_end_of_day

# Convert times to minutes
morning_in_minutes=$(time_to_minutes $clock_in_morning)
lunch_out_minutes=$(time_to_minutes $clock_out_lunch)
lunch_in_minutes=$(time_to_minutes $clock_in_after_lunch)
end_of_day_minutes=$(time_to_minutes $clock_out_end_of_day)

# Calculate worked minutes before and after lunch
morning_minutes=$((lunch_out_minutes - morning_in_minutes))
afternoon_minutes=$((end_of_day_minutes - lunch_in_minutes))

# Total minutes worked
total_minutes=$((morning_minutes + afternoon_minutes))

# Convert minutes back to hours and minutes
hours_worked=$((total_minutes / 60))
minutes_worked=$((total_minutes % 60))

# Display total hours worked
echo "Total hours worked: $hours_worked hours and $minutes_worked minutes"
