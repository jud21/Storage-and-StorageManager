//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
// 1) Declare an array of SimpleStorage contracts, called simpleStorageArray.
    SimpleStorage[] public simpleStorageArray;
// 2) Create a memory (temporary) variable called simpleStorage that will be a new instance of the SimpleStorage contract.
// 3) Add that new variable, the new contract instance, to the simpleStorageArray.
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

// To interact with a contract you need ADDRESS and ABI
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
// Trying to be able to store in each SS contract we make. Below is SimpleStorage type called simpleStorage = the
// address of the contract (in SSArray) of the index the user passes in.
          SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
// Below stores our new user designated number in the user designated contract.
          simpleStorage.store(_simpleStorageNumber);

          //Alternative: simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // 1)
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorage.retrieve();
        // 2)
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}