Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB4E1604B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 17:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgBPQHq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 11:07:46 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:54026 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728386AbgBPQHn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 11:07:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581869262; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=N87NNl6dKJaidFch39XvQKX3vbtqKKMUGcaq4Q/mfPs=; b=urfuiCNZKfjZiXjhk8INxAAWMRwKg6X7nFGBEjb/FXjCrdvqOHDHDu1bHmQorhK4LTisHqWM
 qDI+A9R19vzE64abRC6MmWj4iCBpbCFdqhkgoj8l+7FqmsSU7ydz90iUwtszIDs1snrcfTTj
 cwfLwjmBk350dlspkF25B9RPFY4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4968c6.7efda7f32618-smtp-out-n03;
 Sun, 16 Feb 2020 16:07:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A53FEC4479C; Sun, 16 Feb 2020 16:07:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [103.140.231.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04E44C43383;
        Sun, 16 Feb 2020 16:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04E44C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
 <20200203193533.GL3948@builder>
 <5008a446-a90c-b68a-aaa4-3e7cd90418fa@linaro.org>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <d09f8a1d-0544-838f-e6f8-1c47f58e4f1f@codeaurora.org>
Date:   Sun, 16 Feb 2020 21:37:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5008a446-a90c-b68a-aaa4-3e7cd90418fa@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/4/2020 8:40 AM, Bryan O'Donoghue wrote:
> On 03/02/2020 19:35, Bjorn Andersson wrote:
>> On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:
>
> Hi Avaneesh.

Hello Bryan, Thank you very much for your review comments.

Will be replying to your comments and will be posting new patchset soon 
as per review comments.

>
>> Please aim for keeping the sort order in this file (ignore QCOM_APR
>> which obviously is in the wrong place)
>>
>>> +       tristate "QTI Embedded USB Debugger (EUD)"
>>> +       depends on ARCH_QCOM
>
> If we persist with the model of EXTCON you should "select EXTCON" here.
I have asked this query with Bjorn Also against his review comments, 
whether we need to persist with extcon or need to switch to usb role 
switch framework, as we are notifying not only to usb controller but 
also to pmic charger so in case we adopt usb role switch then how we 
will notify to pmic charger to enable charging battery ? Also as i 
mentioned there my dilema is it does not look very apt to model EUD hw 
IP as c type connector, so please let me know your views.
>
>>> +       help
>>> +         The Embedded USB Debugger (EUD) driver is a driver for the
>>> +         control peripheral which waits on events like USB 
>>> attach/detach
>>> +         and charger enable/disable. The control peripheral further 
>>> helps
>>> +         support the USB-based debug and trace capabilities.
>>> +         This module enables support for Qualcomm Technologies, Inc.
>>> +         Embedded USB Debugger (EUD).
>
> Suggest.
>
> This module enables support for Qualcomm Technologies, Inc.
> Embedded USB Debugger (EUD).
> The EUD is a control peripheral which reports VBUS attach/detach, 
> charger enable/disable and USB-based debug and trace capabilities.
OK.
>
>
>>> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>
> 2020
OK
>
>>> +
>>> +static int enable_eud(struct eud_chip *priv)
>>> +{
>>> +    int ret;
>>> +
>>> +    /* write into CSR to enable EUD */
>>> +    writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
>>> +    /* Enable vbus, chgr & safe mode warning interrupts */
>>> +    writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
>>> +            priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
>>> +
>>> +    /* Ensure Register Writes Complete */
>
> So... You are writing a register in an on-chip PMIC. The PMIC is 
> responsible for detecting USB ID and supplying VBUS as appropriate.
>
> You then get an interrupt to inform you of the state ?

I am writing to EUD control port so that when EUD is enable, EUD hw IP 
can intercept VBUS and d+/d- signal and can reroute to PMIC or USB as 
per host application command in debug mode.

so for example in debug mode VBUS signal although asserted on connecting 
phone with host PC, but EUD based on debug application command can 
notify USB to detach(which otherwise would have detected and attached)

>
>>> +static ssize_t enable_store(struct device *dev,
>>> +                struct device_attribute *attr,
>>> +                const char *buf, size_t count)
>>> +{
>>> +    struct eud_chip *chip = dev_get_drvdata(dev);
>>> +    int enable = 0;
>>
>> You shouldn't need to initialize this as you're checking the return
>> value of sscanf().
OK
>>
>>> +    int ret = 0;
>>> +
>>> +    if (sscanf(buf, "%du", &enable) != 1)
>>> +        return -EINVAL;
>>> +
>>> +    if (enable == EUD_ENABLE_CMD)
>>> +        ret = enable_eud(chip);
>>
>> If ret is !0 you should probably return that, rather than count...
OK
>>
>>> +    else if (enable == EUD_DISABLE_CMD)
>>> +        disable_eud(chip);
>>> +    if (!ret)
>>
>> ...and then you don't need this check, or initialize ret to 0 above.
>>
>>> +        chip->enable = enable;
>>
>> So if I write 42 to "enable" nothing will change in the hardware, but
>> chip->enable will be 42...
>>
>>> +    return count;
>>> +}
>
> I was just going to comment on usb_connector but, does the above code 
> need a synchronization primitive to serialize with the worker and 
> interrupt handler ?
Will evaluate and take corrective action if needed.
>
>>> +static int msm_eud_probe(struct platform_device *pdev)
>>> +{
>>> +    struct eud_chip *chip;
>>> +    struct resource *res;
>>> +    int ret;
>>> +
>>> +    chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>>> +    if (!chip)
>>> +        return -ENOMEM;
>>> +
>>> +    chip->dev = &pdev->dev;
>>> +    platform_set_drvdata(pdev, chip);
>>> +
>>> +    chip->extcon = devm_extcon_dev_allocate(&pdev->dev, 
>>> eud_extcon_cable);
>>
>> Aren't we moving away from extcon in favor of the usb role switching
>> thing?
>
> Yes.
>
> For the VBUS notification you could use
>
> usb-role-switch and model the USB connector as a child-node of the 
> dual-role controller.

I am not sure if EUD interface is true USB connector or should be 
modeled so, as EUD can trick usb controller about absence of VBUS/d+/d- 
signal. To illustrate, when in debug mode even if phone is connected 
with PC, EUD can notify USB controller to stop USB s/w stack, by 
notifying USB controller about usb detach event, even when d+\d- signals 
are valid. moreover in debug mode USB controller will always configure 
in device mode, so let me know if EUD qualifies to be modeled as child 
of controller node?


>
> See:
> https://patchwork.kernel.org/cover/11346247/
> https://patchwork.kernel.org/patch/11346295/
> https://patchwork.kernel.org/patch/11346263/
>
> Avaneesh do you have any kernel code that cares about the charger state ?

charger state is to be notified to charger driver to start charging 
battery so if i switch to usb role switch framework, how will i notify 
to pmic charger? so if i have to adopt usb role switch framework then 
also i will have to keep extcon framework, let me know your comment.

>
> What we are suggesting here is dropping extcon and using 
> role-switching but, if you have some other code that cares about 
> EXTCON_CHG_USB_SDP you'd have to do additional work.
>
> But, if I understood the implication of the code above where you write 
> to the PMIC and let it handle VBUS/CHARGER on/off and you are just 
> notified of the state change, you should be fine with usb-role-switching.
as i mentioned usb-role-switch will only cater need to notify to usb 
controller so please let me know your views.

>
> ---
> bod

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
