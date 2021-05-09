// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Token{
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowed;
    uint256 private _totalSupply;


    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    function name() public pure returns(string memory){
        return "AmbitCoin";
    }

    function symbol() public pure returns(string memory){
        return "AMC";
    }

    function decimals() public pure returns(uint8){
        return 18;
    }

    function totalSupply() public view returns(uint256){
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns(uint256){
        return _balances[owner];
    }

    function transfer(address to, uint256 value) public returns(bool){
        require(_balances[msg.sender] >= value);
        require(to != address(0));

        _balances[msg.sender] -= value;
        _balances[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns(bool) {
        require(_balances[from] >= value);
        require(_allowed[from][msg.sender] >= value);
        require(to != address(0));

        _balances[from] -= value;
        _balances[to] += value;
        _allowed[from][msg.sender] -= value;

        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns(bool){
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function allowance(address owner, address spender) public view returns(uint256){
        return _allowed[owner][spender];
    }
    
}