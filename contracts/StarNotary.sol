pragma solidity >=0.4.24;
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";


contract StarNotary is ERC721 {
    struct Star {
        string name;
    }
    string public constant name = "Bills First Token";
    string public constant symbol = "BFT";
    mapping(uint256 => Star) public tokenIdToStarInfo;
    mapping(uint256 => uint256) public starsForSale;

    function createStar(string memory _name, uint256 _tokenId) public { 
        Star memory newStar = Star(_name);
        tokenIdToStarInfo[_tokenId] = newStar; 
        _mint(msg.sender, _tokenId);
    }
    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "You can't sale the Star you don't owned");
        starsForSale[_tokenId] = _price;
    }
    function _make_payable(address x) internal pure returns (address payable) {
        return address(uint160(x));
    }

    function buyStar(uint256 _tokenId) public  payable {
        require(starsForSale[_tokenId] > 0, "The Star should be up for sale");
        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);
        require(msg.value > starCost, "You need to have enough Ether");
        _transferFrom(ownerAddress, msg.sender, _tokenId); 
        address payable ownerAddressPayable = _make_payable(ownerAddress); 
        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            msg.sender.transfer(msg.value - starCost);
        }
    }
    // Implement Task 1 lookUptokenIdToStarInfo
    function lookUptokenIdToStarInfo(uint _tokenId) public view returns (string memory) {
        return tokenIdToStarInfo[_tokenId].name;
    }
    
    // Implement Task 1 Exchange Stars function
    function exchangeStars(uint256 _tokenId1, uint256 _tokenId2) public {
        //1. Passing to star tokenId you will need to check if the owner of _tokenId1 or _tokenId2 is the sender
        require(ownerOf(_tokenId1) == msg.sender || ownerOf(_tokenId2) == msg.sender, "Require owner of Star1 or Star2" );
        //2. You don't have to check for the price of the token (star)
        address ownerTokenId1 = ownerOf(_tokenId1);
        //3. Get the owner of the two tokens (ownerOf(_tokenId1), ownerOf(_tokenId1)
        address ownerTokenId2 = ownerOf(_tokenId2);
        //4. Use _transferFrom function to exchange the tokens.
        _transferFrom(ownerTokenId1, ownerTokenId2, _tokenId1);
        _transferFrom(ownerTokenId2, ownerTokenId1, _tokenId2);
    }

    function transferStar(address _to1, uint256 _tokenId) public {
        //1. Check if the sender is the ownerOf(_tokenId)
        require(ownerOf(_tokenId) == msg.sender, "You can't transfer a star you don't own.");
        //2. Use the transferFrom(from, to, tokenId); function to transfer the Star
        _transferFrom(msg.sender, _to1, _tokenId);
    }

}