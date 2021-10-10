// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Todo {

  TodoItem[] public TodoList;

  struct TodoItem { 
    string description;
    uint8 state;
  }

  function stringToItemState(string memory _state) pure public returns(uint8) {
    if (keccak256(abi.encodePacked(_state)) == keccak256("INCOMPLETE")) {
      return 0;
    }
    if (keccak256(abi.encodePacked(_state)) == keccak256("COMPLETE")) {
      return 1;
    }
  }

  function stateItemToString(uint8 _state) pure public returns(string memory) {
    if (_state == 0) {
      return "INCOMPLETE";
    }
    if (_state == 1) {
      return "COMPLETE";
    }
  }

  function createItem(string memory _description) public {
    TodoItem memory item = TodoItem(_description, 0);
    TodoList.push(item);
  }

  function getListLength() external view returns(uint256) {
    return TodoList.length;
  }

}
