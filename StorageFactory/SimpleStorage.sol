//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    //uint declarations default to zero if nothing is set equal
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;  
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //3 options for next line...they all mean the same thing...

        //1)
        // People memory newPerson = People({name: _name, favoriteNumber: _favoriteNumber});
        // people.push(newPerson);

        //2)
        //People memory newPerson = People(_favoriteNumber, _name);
        //people.push(newPerson);

        //3... just first line)
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}