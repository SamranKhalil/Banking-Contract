// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

contract MyContract {
    mapping(address => uint) private balances;


    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(address payable addr, uint amount) public payable {
        require(balances[addr] >= amount);
        (bool sent, bytes memory data) = addr.call{value: amount}("");
        require(sent, "Withdrawal failed");
        balances[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }

}