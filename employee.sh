#!/bin/bash

#for displayed the menu 
display_menu() {
    echo "********************************************************"
    echo "1. Add a new employee"
    echo "2. Search for an employee"
    echo "3. List all employees"
    echo "4. Edit an employee"
    echo "5. Delete an employee"
    echo "6. Quit"
}

#for adding the new employee in txt file
add_employee() {
    echo "Enter employee details:"
    echo -n "Name: "
    read name
    echo -n "Email: "
    read email
    echo -n "Age: "
    read age
    echo -n "Gender: "
    read gender
    echo -n "Department: "
    read department
    echo -n "Designation: "
    read designation
    echo "$name, $email, $age, $gender, $department, $designation" >> employees.txt # adds above infomation by creating new employee.txt file
    echo "Employee added successfully!"
}

search_employee() {
    echo -n "Enter the name of the employee: "
    read search_term
    
    if [[ -z $(grep -i "$search_term" employees.txt) ]]; then #Search for the given name as a Search Term if it matches on employee.txt
    #-z returns true if it doesnot find the particular string  and returns false if it finds
        echo "Employee not found!"
    else
        grep -i "$search_term" employees.txt
    fi
}

list_employees() {
    if [[ ! -f employees.txt ]]; then
        echo "No employees found!"
    else
        echo "Name, Email,   Age,   Gender,   Department,   Designation"
        cat employees.txt #is employees.txt is not empty it show the content of the file
    fi
}

edit_employee() {
    echo -n "Enter the name of the employee to edit: "
    read search_term
    if [[ -z $(grep -i "$search_term" employees.txt) ]]; then
        echo "Employee not found!"
    else
        echo "Enter updated details:"
        echo -n "Name: "
        read name
        echo -n "Email: "
        read email
        echo -n "Age: "
        read age
        echo -n "Gender: "
        read gender
        echo -n "Department: "
        read department
        echo -n "Designation: "
        read designation
        sed -i "/$search_term/c\ $name, $email, $age, $gender, $department, $designation" employees.txt
        #sed helps to update the particular dataset in employees.txt
        echo "Employee updated successfully!"
    fi
}

delete_employee() {
    echo -n "Enter the name of the employee to delete: "
    read search_term
    if [[ -z $(grep -i "$search_term" employees.txt) ]]; then
        echo "Employee not found!"
    else
        sed -i "/$search_term/d" employees.txt # deletes particular dataset in employee.txt 
        echo "Employee deleted successfully!"
    fi
}

while true; do
    display_menu
    echo -n "Enter your choice: "
    read choice
# for menu driven choices 
    case $choice in
        1) add_employee;;
        2) search_employee;;
        3) list_employees;;
        4) edit_employee;;
        5) delete_employee;;
        6) break;;
        *) echo "Invalid choice! Try again.";;
    esac
done

echo "Goodbye!"