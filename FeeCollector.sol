// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
        // using for define user

    }
    receive() payable external{
        balance +=msg.value;
    }
    // using to provide money transfer


    function withdraw(uint amount, address payable destAddr) public {
        // first code for how much second where you withdraw, public for everyone can call
        require(msg.sender == owner, "Only owner can withdraw"); // no one else can withdraw the money
        require(amount <= balance, "Insufficient funds"); // you cant withdraw negative numbers :D
         destAddr.transfer(amount);
         balance -= amount;
    }

}