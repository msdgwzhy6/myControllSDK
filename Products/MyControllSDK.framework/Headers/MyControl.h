//
//  MyControl.h
//  dongfangshijiao
//
//  Created by gq on 14-8-15.
//  Copyright (c) 2014年 gq. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MyControl : NSObject
+(float)isIOS7;


#pragma mark 创建View
+(UIView *)createViewWithFrame:(CGRect)frame;
#pragma mark 创建ImageView
+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString*)imageName;
#pragma mark 创建button
+(UIButton*)createButtonFrame:(CGRect)frame Title:(NSString*)title BgImageName:(NSString*)bgImageName ImageName:(NSString*)imageName Method:(SEL)sel target:(id)target;
#pragma mark 创建label
+(UILabel*)createLabelFrame:(CGRect)frame font:(float)font Text:(NSString*)text;

#pragma mark 创建textField
+(UITextField*)createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                           leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName font:(float)font;





/*******************************对之前的基本UI控件进行扩充********************************/

#pragma mark 创建View
+(UIView *)ls_createViewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor;
#pragma mark 创建ImageView
+(UIImageView *)ls_createImageViewFrame:(CGRect)frame imageName:(NSString*)imageName;
#pragma mark 创建label
+(UILabel*)ls_createLabelFrame:(CGRect)frame font:(float)font Text:(NSString*)text textColor:(UIColor *)color bgColor:(UIColor*)bgColor textAlignment:(NSTextAlignment )alignment;
#pragma mark 创建textField
+(UITextField*)ls_createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                           leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName font:(float)font;
#pragma mark 创建button
+(UIButton*)ls_createButtonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor titleFont:(NSInteger) font titleEdge:(UIEdgeInsets )titleEdge imageName:(NSString*)imageName bgImageName:(NSString*)bgImageName  bgColor:(UIColor *)bgColor Method:(SEL)sel target:(id)target;
@end
