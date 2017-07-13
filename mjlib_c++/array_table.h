#pragma once

#include "table.h"
#include <set>

class ArrayTable : public Table {
private:
    unsigned char m_tbl[2<<27];

public:
    ArrayTable();
    virtual ~ArrayTable();

public:
    virtual void add(int key);

    virtual bool check(int key);

    virtual void dump(char* name);

    virtual void load(char* name);
};
