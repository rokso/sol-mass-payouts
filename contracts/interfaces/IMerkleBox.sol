
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

interface IMerkleBox {
    event NewMerkle(address indexed sender, address indexed erc20,
    		    uint256 amount, bytes32 indexed merkleRoot,
		    bool withdrawable);
    event MerkleClaim(address indexed sender, address indexed erc20,
    		      uint256 amount);
    event MerkleFundUpdate(address indexed sender, bytes32 indexed merkleRoot,
    			   uint256 amount, bool withdraw);

    function addFunds(bytes32 merkleRoot, uint256 amount) external;
    function withdrawFunds(bytes32 merkleRoot, uint256 amount) external;
    function addClaims(address erc20, uint256 amount, bytes32 merkleRoot,
                       bool withdrawable) external;
    function claimable(bytes32 merkleRoot, uint256 amount, bytes32[] memory proof) external view returns (bool);
    function claim(bytes32 merkleRoot, uint256 amount, bytes32[] memory proof) external;

}

