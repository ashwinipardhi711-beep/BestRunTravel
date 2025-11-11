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
                            timestamp : type of managed : createdAt;
                            message   : String;
                            author    : type of managed : createdBy;

                    }

}

entity Customers {
    ID           : UUID;
    firstname    : String;
    lastname     : String;
    name         : String = trim(firstname || '' || lastname);
    email        : Email;
    phone        : PhoneNumber;
    incidents    : Association to many Incidents on incidents.customer=$self;
    creditCardNo : String(16) @assert.format: '^[1-9]\d{15}$';
    addresses      : Composition of many Addresses on addresses.customer=$self;
}

entity Addresses{
    customer: Association to Customers;
}
