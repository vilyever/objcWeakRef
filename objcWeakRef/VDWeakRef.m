//
//  VDWeakRef.m
//  objcWeakRef
//
//  Created by Deng on 16/6/28.
//  Copyright © Deng. All rights reserved.
//

#import "VDWeakRef.h"
#import <objc/runtime.h>


@interface VDWeakRef ()

@property (nonatomic, weak, readwrite) id weakObject;

@end


@implementation VDWeakRef

#pragma mark Constructor
+ (instancetype)refWithObject:(id)object {
    VDWeakRef *ref = [self alloc];
    ref.weakObject = object;
    return ref;
}

- (instancetype)initWithObject:(id)object {
    self.weakObject = object;
    
    return self;
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (void)forwardInvocation:(NSInvocation *)invocation {
    invocation.target = self.weakObject;
    [invocation invoke];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.weakObject methodSignatureForSelector:sel];
}

- (NSString *)description {
    return [self.weakObject description];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.weakObject respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
    return [self.weakObject isEqual:object];
}


#pragma mark Delegates


#pragma mark Protected Method


#pragma mark Private Method

@end


@implementation NSObject (VDWeakRef)

#pragma mark Public Method
- (VDWeakRef *)vd_weakRef {
    return [VDWeakRef refWithObject:self];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method
- (BOOL)vd_isEqual:(id)object {
    id realSelf = [self class]  == [VDWeakRef class] ? ((VDWeakRef *)self).weakObject : self;
    id realObject =  [object class]  == [VDWeakRef class] ? ((VDWeakRef *)object).weakObject : object;
    
    BOOL result = [realSelf vd_isEqual:realObject];
    return result;
}

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(isEqual:) ), class_getInstanceMethod(self, @selector(vd_isEqual:) ) );
}

@end
