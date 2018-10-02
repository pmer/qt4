/*
    This file is part of the WebKit open source project.
    This file has been generated by generate-bindings.pl. DO NOT MODIFY!

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public License
    along with this library; see the file COPYING.LIB.  If not, write to
    the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
    Boston, MA 02110-1301, USA.
*/

#include "config.h"

#if ENABLE(SVG) && ENABLE(SVG_FONTS)

#include "JSSVGGlyphElement.h"

#include "SVGGlyphElement.h"
#include <wtf/GetPtr.h>

using namespace JSC;

namespace WebCore {

ASSERT_CLASS_FITS_IN_CELL(JSSVGGlyphElement);

/* Hash table */
#if ENABLE(JIT)
#define THUNK_GENERATOR(generator) , generator
#else
#define THUNK_GENERATOR(generator)
#endif

static const HashTableValue JSSVGGlyphElementTableValues[2] =
{
    { "constructor", DontEnum | ReadOnly, (intptr_t)static_cast<PropertySlot::GetValueFunc>(jsSVGGlyphElementConstructor), (intptr_t)0 THUNK_GENERATOR(0) },
    { 0, 0, 0, 0 THUNK_GENERATOR(0) }
};

#undef THUNK_GENERATOR
static JSC_CONST_HASHTABLE HashTable JSSVGGlyphElementTable = { 2, 1, JSSVGGlyphElementTableValues, 0 };
/* Hash table for constructor */
#if ENABLE(JIT)
#define THUNK_GENERATOR(generator) , generator
#else
#define THUNK_GENERATOR(generator)
#endif

static const HashTableValue JSSVGGlyphElementConstructorTableValues[1] =
{
    { 0, 0, 0, 0 THUNK_GENERATOR(0) }
};

#undef THUNK_GENERATOR
static JSC_CONST_HASHTABLE HashTable JSSVGGlyphElementConstructorTable = { 1, 0, JSSVGGlyphElementConstructorTableValues, 0 };
class JSSVGGlyphElementConstructor : public DOMConstructorObject {
public:
    JSSVGGlyphElementConstructor(JSC::ExecState*, JSC::Structure*, JSDOMGlobalObject*);

    virtual bool getOwnPropertySlot(JSC::ExecState*, const JSC::Identifier&, JSC::PropertySlot&);
    virtual bool getOwnPropertyDescriptor(JSC::ExecState*, const JSC::Identifier&, JSC::PropertyDescriptor&);
    static const JSC::ClassInfo s_info;
    static JSC::Structure* createStructure(JSC::JSGlobalData& globalData, JSC::JSValue prototype)
    {
        return JSC::Structure::create(globalData, prototype, JSC::TypeInfo(JSC::ObjectType, StructureFlags), AnonymousSlotCount, &s_info);
    }
protected:
    static const unsigned StructureFlags = JSC::OverridesGetOwnPropertySlot | JSC::ImplementsHasInstance | DOMConstructorObject::StructureFlags;
};

const ClassInfo JSSVGGlyphElementConstructor::s_info = { "SVGGlyphElementConstructor", &DOMConstructorObject::s_info, &JSSVGGlyphElementConstructorTable, 0 };

JSSVGGlyphElementConstructor::JSSVGGlyphElementConstructor(ExecState* exec, Structure* structure, JSDOMGlobalObject* globalObject)
    : DOMConstructorObject(structure, globalObject)
{
    ASSERT(inherits(&s_info));
    putDirect(exec->globalData(), exec->propertyNames().prototype, JSSVGGlyphElementPrototype::self(exec, globalObject), DontDelete | ReadOnly);
}

bool JSSVGGlyphElementConstructor::getOwnPropertySlot(ExecState* exec, const Identifier& propertyName, PropertySlot& slot)
{
    return getStaticValueSlot<JSSVGGlyphElementConstructor, JSDOMWrapper>(exec, &JSSVGGlyphElementConstructorTable, this, propertyName, slot);
}

bool JSSVGGlyphElementConstructor::getOwnPropertyDescriptor(ExecState* exec, const Identifier& propertyName, PropertyDescriptor& descriptor)
{
    return getStaticValueDescriptor<JSSVGGlyphElementConstructor, JSDOMWrapper>(exec, &JSSVGGlyphElementConstructorTable, this, propertyName, descriptor);
}

/* Hash table for prototype */
#if ENABLE(JIT)
#define THUNK_GENERATOR(generator) , generator
#else
#define THUNK_GENERATOR(generator)
#endif

static const HashTableValue JSSVGGlyphElementPrototypeTableValues[1] =
{
    { 0, 0, 0, 0 THUNK_GENERATOR(0) }
};

#undef THUNK_GENERATOR
static JSC_CONST_HASHTABLE HashTable JSSVGGlyphElementPrototypeTable = { 1, 0, JSSVGGlyphElementPrototypeTableValues, 0 };
const ClassInfo JSSVGGlyphElementPrototype::s_info = { "SVGGlyphElementPrototype", &JSC::JSObjectWithGlobalObject::s_info, &JSSVGGlyphElementPrototypeTable, 0 };

JSObject* JSSVGGlyphElementPrototype::self(ExecState* exec, JSGlobalObject* globalObject)
{
    return getDOMPrototype<JSSVGGlyphElement>(exec, globalObject);
}

const ClassInfo JSSVGGlyphElement::s_info = { "SVGGlyphElement", &JSSVGElement::s_info, &JSSVGGlyphElementTable, 0 };

JSSVGGlyphElement::JSSVGGlyphElement(Structure* structure, JSDOMGlobalObject* globalObject, PassRefPtr<SVGGlyphElement> impl)
    : JSSVGElement(structure, globalObject, impl)
{
    ASSERT(inherits(&s_info));
}

JSObject* JSSVGGlyphElement::createPrototype(ExecState* exec, JSGlobalObject* globalObject)
{
    return new (exec) JSSVGGlyphElementPrototype(exec->globalData(), globalObject, JSSVGGlyphElementPrototype::createStructure(exec->globalData(), JSSVGElementPrototype::self(exec, globalObject)));
}

bool JSSVGGlyphElement::getOwnPropertySlot(ExecState* exec, const Identifier& propertyName, PropertySlot& slot)
{
    return getStaticValueSlot<JSSVGGlyphElement, Base>(exec, &JSSVGGlyphElementTable, this, propertyName, slot);
}

bool JSSVGGlyphElement::getOwnPropertyDescriptor(ExecState* exec, const Identifier& propertyName, PropertyDescriptor& descriptor)
{
    return getStaticValueDescriptor<JSSVGGlyphElement, Base>(exec, &JSSVGGlyphElementTable, this, propertyName, descriptor);
}

JSValue jsSVGGlyphElementConstructor(ExecState* exec, JSValue slotBase, const Identifier&)
{
    JSSVGGlyphElement* domObject = static_cast<JSSVGGlyphElement*>(asObject(slotBase));
    return JSSVGGlyphElement::getConstructor(exec, domObject->globalObject());
}

JSValue JSSVGGlyphElement::getConstructor(ExecState* exec, JSGlobalObject* globalObject)
{
    return getDOMConstructor<JSSVGGlyphElementConstructor>(exec, static_cast<JSDOMGlobalObject*>(globalObject));
}


}

#endif // ENABLE(SVG) && ENABLE(SVG_FONTS)
