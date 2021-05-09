<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Migrations {
  address public owner = msg.sender;
  uint public last_completed_migration;

  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
=======
pragma solidity >=0.4.21 <0.6.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

  modifier restricted() {
    if (msg.sender == owner) _;
>>>>>>> 2483008c830f6205c6b8d16207205335a3813032
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
<<<<<<< HEAD
=======

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
>>>>>>> 2483008c830f6205c6b8d16207205335a3813032
}
