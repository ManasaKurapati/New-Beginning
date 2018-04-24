pragma solidity ^0.4.11;

contract voting {
    
    mapping (bytes32 => uint8) public votesReceived;
    bytes32[] public candidateList;
    
    function voting(bytes32[] candidateNames) {
        candidateList = candidateNames;
    }
    
    function totalVotesFor(bytes32 candidate) view public returns(uint8) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }
    
    function validCandidate(bytes32 candidate) view public returns(bool) {
        for (uint i=0;i<candidateList.length;i++) {
            if (candidateList[i]==candidate)  {
                return true;
            }
            return false;
        }      
    }
    
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }
}
