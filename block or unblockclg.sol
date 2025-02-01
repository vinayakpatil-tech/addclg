// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollegeManagement {
    address private admin;
    
    // Struct for College
    struct College {
        string name;
        bool isBlocked;
        address collegeAddress;
    }
    
    // Mapping to store colleges by address
    mapping(address => College) public colleges;
    
    // Mapping to store students by college
    mapping(address => address[]) public collegeStudents;
    
    // Event for block/unblock actions
    event CollegeStatusChanged(address indexed college, bool isBlocked);

    // Modifier to restrict access to the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }
    
    // Modifier to check if a college is not blocked
    modifier notBlocked(address collegeAddress) {
        require(!colleges[collegeAddress].isBlocked, "This college is blocked");
        _;
    }

    constructor() {
        admin = msg.sender; // Setting the contract deployer as admin
    }

    // Function to add a new college
    function addCollege(address _collegeAddress, string memory _name) public onlyAdmin {
        require(colleges[_collegeAddress].collegeAddress == address(0), "College already exists");
        colleges[_collegeAddress] = College(_name, false, _collegeAddress);
    }
    
    // Function to block a college from adding students
    function blockCollege(address _collegeAddress) public onlyAdmin {
        require(colleges[_collegeAddress].collegeAddress != address(0), "College does not exist");
        colleges[_collegeAddress].isBlocked = true;
        emit CollegeStatusChanged(_collegeAddress, true);
    }

    // Function to unblock a college
    function unblockCollege(address _collegeAddress) public onlyAdmin {
        require(colleges[_collegeAddress].collegeAddress != address(0), "College does not exist");
        colleges[_collegeAddress].isBlocked = false;
        emit CollegeStatusChanged(_collegeAddress, false);
    }

    // Function to add a student to a college (only if the college is not blocked)
    function addStudent(address _collegeAddress, address _studentAddress) public notBlocked(_collegeAddress) {
        collegeStudents[_collegeAddress].push(_studentAddress);
    }

    // Function to get the list of students in a particular college
    function getStudents(address _collegeAddress) public view returns (address[] memory) {
        return collegeStudents[_collegeAddress];
    }
}

