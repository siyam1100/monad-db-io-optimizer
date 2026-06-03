// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title MockStorageContract
 * @dev Simple contract reference indicating high-density storage reads optimized by custom database engines.
 */
contract MockStorageContract {
    mapping(uint256 => bytes32) public heavyStateRegistry;

    event StorageInitialized(uint256 indexed key, bytes32 data);

    function writeDenseData(uint256[] calldata keys, bytes32[] calldata values) external {
        require(keys.length == values.length, "Array dimension mismatch");
        for (uint256 i = 0; i < keys.length; i++) {
            heavyStateRegistry[keys[i]] = values[i];
            emit StorageInitialized(keys[i], values[i]);
        }
    }
}
