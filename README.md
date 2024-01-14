# Assignment 3 : Token Swap Smart Contract

1. **Build:**

   ```bash
   forge build
   ```

2. **Test:**

   ```bash
   forge test
   ```

## Contract Overview

The `TokenSwap` contract allows two parties to exchange ERC-20 tokens in a secure and straightforward manner. Each party specifies the token they offer (`token1` and `token2`), the amount they want to exchange (`amount1` and `amount2`), and the address that will receive the tokens from the other party (`owner1` and `owner2`). The swapping process is executed through the `swap` function.

## Variables

- **`token1`**: Instance of the ERC-20 token to be exchanged by the first party.
- **`owner1`**: Address of the first party, who initiates the swap for `token1`.
- **`amount1`**: Amount of `token1` to be exchanged by the first party.
- **`token2`**: Instance of the ERC-20 token to be exchanged by the second party.
- **`owner2`**: Address of the second party, who initiates the swap for `token2`.
- **`amount2`**: Amount of `token2` to be exchanged by the second party.

## Constructor

The constructor initializes the contract with the specified token addresses, owners, and exchange amounts.

## Functions

### `swap()`

- **Description**: Executes the token swap.
- **Modifiers**: Requires that the caller is either `owner1` or `owner2`.
- **Error Handling**: Ensures that only authorized parties can initiate the swap. Calls the internal function `_safeTransferFrom` to transfer tokens securely.

### `_safeTransferFrom()`

- **Description**: Safely transfers ERC-20 tokens from one address to another.
- **Parameters**:
  - `token`: ERC-20 token instance.
  - `sender`: Address from which tokens are transferred.
  - `recipient`: Address receiving the tokens.
  - `amount`: Amount of tokens to be transferred.
- **Error Handling**: Requires a successful token transfer; otherwise, it throws an error indicating that the transfer failed.

