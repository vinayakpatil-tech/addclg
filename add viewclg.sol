// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollegeRegistry {
    struct College {
        uint id;
        string name;
        string location;
        uint clgregno;
    }

    mapping(uint => College) public colleges; // Mapping of college ID to College struct
    uint public collegeCount; // Counter for college IDs

    // Event to notify when a new college is added
    event CollegeAdded(uint id, string name, string location, uint establishedYear);

    // Function to add a new college
    function addCollege(string memory _name, string memory _location, uint _clgregno) public {
        collegeCount++; // Increment the college ID
        colleges[collegeCount] = College(collegeCount, _name, _location, _clgregno);
        
        // Emit event
        emit CollegeAdded(collegeCount, _name, _location, _clgregno);
    }

    // Function to get details of a college by ID
    function getCollege(uint _id) public view returns (string memory, string memory, uint) {
        College memory college = colleges[_id];
        require(college.id != 0, "College does not exist");
        return (college.name, college.location, college.clgregno);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollegeRegistry {
    struct College {
        uint id;
        string name;
        string location;
        uint clgregno;
    }

    mapping(uint => College) public colleges; // Mapping of college ID to College struct
    uint public collegeCount; // Counter for college IDs

    // Event to notify when a new college is added
    event CollegeAdded(uint id, string name, string location, uint establishedYear);

    // Function to add a new college
    function addCollege(string memory _name, string memory _location, uint _clgregno) public {
        collegeCount++; // Increment the college ID
        colleges[collegeCount] = College(collegeCount, _name, _location, _clgregno);
        
        // Emit event
        emit CollegeAdded(collegeCount, _name, _location, _clgregno);
    }

    // Function to get details of a college by ID
    function getCollege(uint _id) public view returns (string memory, string memory, uint) {
        College memory college = colleges[_id];
        require(college.id != 0, "College does not exist");
        return (college.name, college.location, college.clgregno);
    }
}
