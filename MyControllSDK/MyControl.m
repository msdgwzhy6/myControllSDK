//
//  MyControl.m
//  SnsDemo
//
//  Created by gq on 14-8-15.
//  Copyright (c) 2014年 gq. All rights reserved.
//

#define iOS7  [[UIDevice currentDevice]systemVersion].floatValue>=7.0 && [[UIDevice currentDevice]systemVersion].floatValue < 8.0


#import "MyControl.h"


@implementation MyControl
//设置iOS的版本适配
+(float)isIOS7{
    if (iOS7) {
        return  64;
    }else{
        return 44;
    }
}

+(UIView*)createViewWithFrame:(CGRect)frame
{
//创建View
    UIView*view=[[UIView alloc]initWithFrame:frame];
    return view;

}
+(UIImageView*)createImageViewFrame:(CGRect)frame imageName:(NSString*)imageName{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    //如果imageName传递是空，虽然不会崩溃，但是打印信息会显示很多GUI错误，所以要判断imageName是否为nil
    if (imageName) {
        imageView.image=[UIImage imageNamed:imageName];
 
    }
    imageView.userInteractionEnabled=YES;
    return imageView;
}
+(UIButton*)createButtonFrame:(CGRect)frame Title:(NSString*)title BgImageName:(NSString*)bgImageName ImageName:(NSString*)imageName Method:(SEL)sel target:(id)target
{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        
    }
    if (bgImageName) {
        [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    //添加方法
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    //记住，这里无论手动还是自动都不需要释放！，因为button本身是使用类方法进行创建
    return button;
}
+(UILabel*)createLabelFrame:(CGRect)frame font:(float)font Text:(NSString*)text{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    //设置折行方式，注意设置折行方式以后就无法使用sizeToFit，如果使用，需要设置回默认
    label.lineBreakMode=NSLineBreakByCharWrapping;
    //设置限制行数 0为不限制行数
    label.numberOfLines=0;
    //设置字号
    label.font=[UIFont systemFontOfSize:font];
    //设置文字
    label.text=text;
    return label;
}
+(UITextField*)createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                           leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName
{
    UITextField*textField=[[UITextField alloc]initWithFrame:frame];
    textField.placeholder=placeholder;
    //左边图像
    textField.leftViewMode=UITextFieldViewModeAlways;
    textField.leftView=leftView;
    //右边图像
    textField.rightViewMode=UITextFieldViewModeAlways;
    textField.rightView=rightView;
    if (bgImageName) {
        [textField setBackground:[UIImage imageNamed:bgImageName]];
    }
    return textField;
}

//适配器模式，在原有方法上进行扩展出一个方法，适用于版本迭代更新，其中增加一些方法属性，由于原有方法需要适配旧版本，所以在基础上，进行扩展
+(UITextField*)createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                           leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName font:(float)font{
//通过原有方法进行创建，然后再进行相对的补充
    UITextField*textField=[MyControl createTextFieldFrame:frame Placeholder:placeholder leftView:leftView rightView:rightView BgImageName:bgImageName];
    textField.font=[UIFont systemFontOfSize:font];
    return textField;
}


/****************************************************************************/
#pragma mark 创建View
+(UIView *)ls_createViewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor
{
    //创建View
    UIView*view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor = bgColor;
    return view;
}
#pragma mark 创建ImageView
+(UIImageView *)ls_createImageViewFrame:(CGRect)frame imageName:(NSString*)imageName{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    //如果imageName传递是空，虽然不会崩溃，但是打印信息会显示很多GUI错误，所以要判断imageName是否为nil
    if (imageName) {
        imageView.image=[UIImage imageNamed:imageName];
        
    }
    imageView.userInteractionEnabled=YES;
    return imageView;
}

#pragma mark 创建label
+(UILabel*)ls_createLabelFrame:(CGRect)frame font:(float)font Text:(NSString*)text textColor:(UIColor *)color bgColor:(UIColor*)bgColor textAlignment:(NSTextAlignment )alignment{
    
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    //设置折行方式，注意设置折行方式以后就无法使用sizeToFit，如果使用，需要设置回默认
    label.lineBreakMode=NSLineBreakByCharWrapping;
    //设置限制行数 0为不限制行数
    label.numberOfLines=0;
    //设置字号
    label.font=[UIFont systemFontOfSize:font];
    //设置文字
    label.text=text;
    label.textColor = color;
    label.backgroundColor = bgColor;
    [label setTextAlignment:alignment];
    return label;
}

#pragma mark 创建textField
+(UITextField*)ls_createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                              leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName font:(float)font{
    UITextField*textField=[[UITextField alloc]initWithFrame:frame];
    textField.placeholder=placeholder;
    //左边图像
    textField.leftViewMode=UITextFieldViewModeAlways;
    textField.leftView=leftView;
    //右边图像
    textField.rightViewMode=UITextFieldViewModeAlways;
    textField.rightView=rightView;
    if (bgImageName) {
        [textField setBackground:[UIImage imageNamed:bgImageName]];
    }
    return textField;
}


#pragma mark 创建button
+(UIButton*)ls_createButtonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor titleFont:(NSInteger) font titleEdge:(UIEdgeInsets )titleEdge imageName:(NSString*)imageName bgImageName:(NSString*)bgImageName  bgColor:(UIColor *)bgColor Method:(SEL)sel target:(id)target{

    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = [UIFont systemFontOfSize:font];
    }
    [button setTitleEdgeInsets: titleEdge];
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }

    if (bgImageName) {
        [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    
    if (bgColor) {
        button.backgroundColor = bgColor;
    }
    //添加方法
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    //记住，这里无论手动还是自动都不需要释放！，因为button本身是使用类方法进行创建
    return button;
}

@end
