import "@stdlib/deploy";
message Add {
    amount: Int as uint32;
}
contract FirstContract with Deployable {
    // Empty init() function is present by default in all Tact contracts
    // since v1.3.0, so the following may be omitted:
    //
    // init() {}
    id: Int as uint32;
    counter: Int as uint32; // 2**32 == 4294967296

    init(id: Int) {
        self.id = id;
        self.counter = 0;
    }

    receive("increment"){
        self.counter = self.counter + 1;
    }

    receive(msg: Add){
        self.counter = self.counter + msg.amount;
    }

    get fun counter(): Int {
        return self.counter;
    }

    get fun id(): Int{
        return self.id;
    }
}
