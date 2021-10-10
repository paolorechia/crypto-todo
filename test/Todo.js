const Todo = artifacts.require("Todo");
contract("Todo", (accounts) => {
    let [alice, bob] = accounts;

    it("Pure function should work", async () => { 
        const contract = await Todo.new();
        const result = await contract.stringToItemState("INCOMPLETE", {from: alice});
        console.log(result);
        assert.equal(result, 0);
    })

    it("Create item should work", async () => { 
        const contract = await Todo.new();
        const result = await contract.createItem("Woohoo!", {from: alice});
        console.log(result);
    })

})
