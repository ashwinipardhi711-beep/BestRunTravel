using {
    cuid,
    managed
} from '@sap/cds/common';

namespace com.internal.sap;

entity Incidents : cuid, managed {
    customer      : Association to Customers;
    title         : String @title: 'Title';
    urgency       : Association to Urgency default 'M';
    status        : Association to Status default 'N';
    conversations : Composition of many {
                        key ID        : UUID;
                            timestamp : type of managed:createdAt;
                            message   : String;
                            author    : type of managed:createdBy;

                    }

}

// entity Customers {
// ID: UUID;
// firstname: String;
// lastname: String;
// name: 
// email: Email;
// phone: PhoneNumber;
// creditCard:;
// address: Composition of many addresses;
// }
