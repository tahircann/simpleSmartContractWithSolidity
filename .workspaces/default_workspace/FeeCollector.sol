// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract FeeCollector{

    address public owner;
    uint256  public balance;


    constructor() {

        owner= msg.sender; //value to be retrieved only at first and not changed.
        


    }

    receive()payable external {
        balance += msg.value;


    }
    function withdraw (uint amount, address payable destAddr)public{
         require(msg.sender==owner,"Only owner can access...");
        require(balance>=amount,"Only owner can access...");  //if the account does not have that much balance.
        destAddr.transfer(amount);
        balance -= amount;
       


    }



}