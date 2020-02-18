Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0613162710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 14:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgBRNXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 08:23:18 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:31741 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726399AbgBRNXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 08:23:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582032197; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BLTlwEgPb1ufuuq6RMa4UTkP2svU0gzl7AF6fzPW9Wc=; b=eZZv3Hmw1TiuPs9qpXPGjVIjNBuccc7ZXIdDyifbIt9JekuCDahtfVBVq0hX/2Po7Tj11fCM
 8SFqqmo1bgRc52sxZLDAPN1IwpiG6x16JScY+aYL6cN/E8dhDTZ1/yye6mg4EEx/KcrMrZwW
 QeNCds4a+FNfeD9sOB9KmVhNyik=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4be53f.7fc39fd93180-smtp-out-n03;
 Tue, 18 Feb 2020 13:23:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 03F6AC447A0; Tue, 18 Feb 2020 13:23:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.79.138] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70023C4479F;
        Tue, 18 Feb 2020 13:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70023C4479F
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
 <d09f8a1d-0544-838f-e6f8-1c47f58e4f1f@codeaurora.org>
 <8a854c02-7435-46c6-5bd1-05273e5249e4@linaro.org>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <aa942701-d11b-dcf2-d28f-144582af0d2f@codeaurora.org>
Date:   Tue, 18 Feb 2020 18:53:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8a854c02-7435-46c6-5bd1-05273e5249e4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/18/2020 1:14 AM, Bryan O'Donoghue wrote:
> On 16/02/2020 16:07, Dwivedi, Avaneesh Kumar (avani) wrote:
>>
>> On 2/4/2020 8:40 AM, Bryan O'Donoghue wrote:
>>> On 03/02/2020 19:35, Bjorn Andersson wrote:
>>>> On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:
>>>
>>> Hi Avaneesh.
>>
>> Hello Bryan, Thank you very much for your review comments.
>>
>> Will be replying to your comments and will be posting new patchset 
>> soon as per review comments.
>>
>>>
>>>> Please aim for keeping the sort order in this file (ignore QCOM_APR
>>>> which obviously is in the wrong place)
>>>>
>>>>> +       tristate "QTI Embedded USB Debugger (EUD)"
>>>>> +       depends on ARCH_QCOM
>>>
>>> If we persist with the model of EXTCON you should "select EXTCON" here.
>
>> I have asked this query with Bjorn Also against his review comments, 
>> whether we need to persist with extcon or need to switch to usb role 
>> switch framework, as we are notifying not only to usb controller but 
>> also to pmic charger so in case we adopt usb role switch then how we 
>> will notify to pmic charger to enable charging battery ? Also as i 
>> mentioned there my dilema is it does not look very apt to model EUD 
>> hw IP as c type connector, so please let me know your views.
>
> I think there's a desire to model USB ports as connector child nodes 
> of a USB controllers as opposed to the more generic extcon so, I think 
> the effort should probably be made to model it up as typec.
this comment is irrespective of your below comment (If we were to 
support Control Peripheral where the local DWC3 controller has the 
signals routed away entirely, then I think we would need to look into 
modelling that in device tree - and using an overlay to show the DWC3 
controller going away in Control Peripheral mode and coming back. )?
>
> 1. Model as a typec connector
>    You can use usb-role-switch based on the VBUS interrupt you get
>    drivers/extcon/extcon-axp288.c::axp288_usb_role_work()
>    as an exmple
Will look into this example, but seems this driver uses both extcon and 
usb-role-switch for notification.
>
> 2. Model the registers/gpios in the PMIC interface as regulators
>    that your typec driver could then own.
>
>    You wouldn't have to notify outside of your typec driver then
>    you'd just be using the regulator API.
>
> You can use regmap to divide up the registers between devices for that.
>
> Can that work for you ?
Did not comprehend this comment fully. if possible can you give some 
example.
>
>>>>> +static int enable_eud(struct eud_chip *priv)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    /* write into CSR to enable EUD */
>>>>> +    writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
>>>>> +    /* Enable vbus, chgr & safe mode warning interrupts */
>>>>> +    writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
>>>>> +            priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
>>>>> +
>>>>> +    /* Ensure Register Writes Complete */
>>>
>>> So... You are writing a register in an on-chip PMIC. The PMIC is 
>>> responsible for detecting USB ID and supplying VBUS as appropriate.
>>>
>>> You then get an interrupt to inform you of the state ?
>>
>> I am writing to EUD control port so that when EUD is enable, EUD hw 
>> IP can intercept VBUS and d+/d- signal and can reroute to PMIC or USB 
>> as per host application command in debug mode.
>
> Reading the dts that goes with this
>
> +The EUD (Embedded USB Debugger) is a mini-USB hub implemented
> +on chip to support the USB-based debug and trace capabilities.
>
> Ah so, the EUD is a mux, that sits between the connector and the 
> controller, routing UTMI signals to an internal USB hub, which in-turn 
> has debug functions attached to the hub...
Yes that is correct understanding.
>
> Can the Arm core see the hub ? I assume not ?
Not sure what is it mean by "Can the Arm core see the hub"?
>
> There are a few different modes - you should probably be clear on 
> which mode it is you are supporting.
>
> Normal mode: (Bypass)
> Port | EUD | Controller
>
> Normal + debug hub mode: (Debug)
> Port | EUD | Controller + HUB -> debug functions
>
> Debug hub mode: (Control Peripheral)
> Port | EUD | HUB -> debug functions
>
> its not clear to me from the documentation or the code which mode it 
> is we are targeting to be supported here.
Its debug mode which we are supporting in driver.
>
> I think you should support Debug mode only here, so that the Arm core 
> never has to deal with the situation where the USB connector "goes away".
Can you please help what you mean by "so that the Arm core never has to 
deal with the situation where the USB connector "goes away""
>
> If we were to support Control Peripheral where the local DWC3 
> controller has the signals routed away entirely, then I think we would 
> need to look into modelling that in device tree - and using an overlay 
> to show the DWC3 controller going away in Control Peripheral mode and 
> coming back.
debug mode is set run time via user, i will check how we can model such 
scenario where device tree corresponding to a h/w module is only valid 
in some scenario at run time. if possible please elaborate bit more on 
your suggestion
>
> Also final thought since the EUD can operate in different modes, it 
> really should be a string that gets passed in - with the string name 
> aligning to the documentation "bypass", "debug" and so on, so that the 
> mode we are switching to is obvious to anybody who has the spec and 
> the driver.

you mean we should document that this driver works in debug mode only? 
not clear on where one should pass "debug" and "bypass" string?

I will also be discussing modelling EUD as typec connector with USB 
folks and will come back soon with clarity on this. Thanks for your 
valuable comments and suggestions.

>
> ---
> bod

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
