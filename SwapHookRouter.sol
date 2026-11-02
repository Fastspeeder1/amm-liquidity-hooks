// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SwapHookRouter {
    uint256 public dynamicFeeBps = 30;
    uint256 public hookInvocations;

    event AfterSwapHookTriggered(address indexed caller, uint256 feeApplied, uint256 count);

    function triggerAfterSwapHook(uint256 _newFeeBps) external {
        require(_newFeeBps <= 500, "Fee exceeds limit");
        dynamicFeeBps = _newFeeBps;
        hookInvocations += 1;
        emit AfterSwapHookTriggered(msg.sender, _newFeeBps, hookInvocations);
    }
}
