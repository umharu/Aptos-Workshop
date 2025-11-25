module first_module::message { //modulo llamado mensaje 
    use std::string;           // libreria string 
    use std::signer;            // libreria signer 

struct MessageHolder has key , store , drop { //struc + abilities 
    message : string::String,// string que viene del modulo string 
}

public entry fun set_message(account: &signer, message: string::String) acquires MessageHolder{
    let account_addr = signer::address_of(account);
    if (exists<MessageHolder>(account_addr)) {
        move_from<MessageHolder>(account_addr);
    };
    move_to(account, MessageHolder{ message });
}

public fun get_message(account_addr: address): string::String acquires MessageHolder {
    assert!(exists<MessageHolder>(account_addr), 0);
    let message_holder= borrow_global<MessageHolder>(account_addr);
    message_holder.message
}
}