Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E2E19E561
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2020 16:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgDDOM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Apr 2020 10:12:27 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19882 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726039AbgDDOM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Apr 2020 10:12:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586009547; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1mFW4GvYCJDueYcN+uUWXvjyL3gGkxOhuBmkTrdqcJA=; b=oi3zyLuQMrTvLuK/bMLbKXKMTvVm4x1p0WEbRcb/oOCaZMx9gJuOuBsQ/2T6YL8HhRTN9hIP
 XBXQh9SYxHWztceYpYiChiTavKuXfBWeG6BzuBII1lgnLh9NMXLtV02pfDCT3ybNLwVeMZV1
 XdSG3s/dZQXrPSnqnFWbfYij2eM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8895c7.7f0a3bf3c6f8-smtp-out-n05;
 Sat, 04 Apr 2020 14:12:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E60EC433BA; Sat,  4 Apr 2020 14:12:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.79.170.113] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85C34C433F2;
        Sat,  4 Apr 2020 14:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85C34C433F2
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
 <aa942701-d11b-dcf2-d28f-144582af0d2f@codeaurora.org>
 <a6cbc859-184e-2a0d-bd2b-0ad9653e5ee2@linaro.org>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <5db1a666-62ec-c850-6626-ad33d337b452@codeaurora.org>
Date:   Sat, 4 Apr 2020 19:42:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a6cbc859-184e-2a0d-bd2b-0ad9653e5ee2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/18/2020 8:18 PM, Bryan O'Donoghue wrote:
> On 18/02/2020 13:23, Dwivedi, Avaneesh Kumar (avani) wrote:
>>
>> On 2/18/2020 1:14 AM, Bryan O'Donoghue wrote:
>>> On 16/02/2020 16:07, Dwivedi, Avaneesh Kumar (avani) wrote:
>>>>
>>>> On 2/4/2020 8:40 AM, Bryan O'Donoghue wrote:
>>>>> On 03/02/2020 19:35, Bjorn Andersson wrote:
>>>>>> On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:
>>>>>
>>>>> Hi Avaneesh.
>>>>
>>>> Hello Bryan, Thank you very much for your review comments.
>>>>
>>>> Will be replying to your comments and will be posting new patchset 
>>>> soon as per review comments.
>>>>
>>>>>
>>>>>> Please aim for keeping the sort order in this file (ignore QCOM_APR
>>>>>> which obviously is in the wrong place)
>>>>>>
>>>>>>> +       tristate "QTI Embedded USB Debugger (EUD)"
>>>>>>> +       depends on ARCH_QCOM
>>>>>
>>>>> If we persist with the model of EXTCON you should "select EXTCON" 
>>>>> here.
>>>
>>>> I have asked this query with Bjorn Also against his review 
>>>> comments, whether we need to persist with extcon or need to switch 
>>>> to usb role switch framework, as we are notifying not only to usb 
>>>> controller but also to pmic charger so in case we adopt usb role 
>>>> switch then how we will notify to pmic charger to enable charging 
>>>> battery ? Also as i mentioned there my dilema is it does not look 
>>>> very apt to model EUD hw IP as c type connector, so please let me 
>>>> know your views.
>>>
>>> I think there's a desire to model USB ports as connector child nodes 
>>> of a USB controllers as opposed to the more generic extcon so, I 
>>> think the effort should probably be made to model it up as typec.
>> this comment is irrespective of your below comment (If we were to 
>> support Control Peripheral where the local DWC3 controller has the 
>> signals routed away entirely, then I think we would need to look into 
>> modelling that in device tree - and using an overlay to show the DWC3 
>> controller going away in Control Peripheral mode and coming back. )?
>
> Yes, I think irrespective we should model this as a connector not an 
> extcon and I think you could do think you could do that as a typec
>
> 1. Using role-switch
> 2. Use the regulator API to capture EUD related charger messages
>    and trigger changes in the PMIC as opposed to using extcon
>    to notify.
>
> I could be wrong about #2

HI Bryan,

Sorry for long pause on this thread, I went through USB role switch 
framework  and yes we can move to it for notification of VBUS event, but 
i am not able to find a good example in upstream, of how battery charger 
module can be notified about charger stop and charger start event if we 
don't use extcon interface for notification. I am not sure it would be 
simple regulator enable and disable call, i will discuss with PMIC guys 
on this and will come back.

>
>>> Can that work for you ?
>> Did not comprehend this comment fully. if possible can you give some 
>> example.
>
> My understanding is we are generally being encouraged to model ports 
> as connectors instead of extcon. I think it is possible to model your 
> port driver as a typec connector using USB role-switching and the 
> regulator API i.e. I don't think you really need extcon here.
>
>>> Ah so, the EUD is a mux, that sits between the connector and the 
>>> controller, routing UTMI signals to an internal USB hub, which 
>>> in-turn has debug functions attached to the hub...
>> Yes that is correct understanding.
>>>
>>> Can the Arm core see the hub ? I assume not ?
>> Not sure what is it mean by "Can the Arm core see the hub"?
>
> In Debug mode will a DWC3 controller in host mode enumerate the 
> internal hub ? If so, is that a supported use-case ?
In debug mode DWC3 controller will only enumerate in device mode.
>
>>> There are a few different modes - you should probably be clear on 
>>> which mode it is you are supporting.
>>>
>>> Normal mode: (Bypass)
>>> Port | EUD | Controller
>>>
>>> Normal + debug hub mode: (Debug)
>>> Port | EUD | Controller + HUB -> debug functions
>>>
>>> Debug hub mode: (Control Peripheral)
>>> Port | EUD | HUB -> debug functions
>>>
>>> its not clear to me from the documentation or the code which mode it 
>>> is we are targeting to be supported here.
>> Its debug mode which we are supporting in driver.
>>>
>>> I think you should support Debug mode only here, so that the Arm 
>>> core never has to deal with the situation where the USB connector 
>>> "goes away".
>> Can you please help what you mean by "so that the Arm core never has 
>> to deal with the situation where the USB connector "goes away""
>
> So my thinking is
>
> - DWC3 in host mode
>   For argument sake, lets say an external self-powered hub is connected
>   and a number of USB devices are enumerated
> - EUD switches to Control Peripheral mode
>
> In this case what would happen ?
I am not getting clarity about this from spec document, what i 
understand is in this case PHY signal to USB controller will get 
stop(UTMI switch will block signal from USB PHY to USB controller), so 
before to switching to control peripheral mode EUD should send detach 
event to USB controller so that it can enter low power mode, let me know 
if it is grossly wrong understanding. In any case we are not supporting 
control peripheral mode in present state of driver.
>
>>>
>>> If we were to support Control Peripheral where the local DWC3 
>>> controller has the signals routed away entirely, then I think we 
>>> would need to look into modelling that in device tree - and using an 
>>> overlay to show the DWC3 controller going away in Control Peripheral 
>>> mode and coming back.
>> debug mode is set run time via user, i will check how we can model 
>> such scenario where device tree corresponding to a h/w module is only 
>> valid in some scenario at run time. if possible please elaborate bit 
>> more on your suggestion
>
> If Debug mode is all you are trying to do support then I don't think 
> you really need to model that in DT.
>
> However if intend to support Control Peripheral mode which as I 
> understand it, switches the UTMI signals away from a DWC3 controller 
> in Host mode, then I think you would need to use a DT overlay to 
> switch off the controller, before switching.
>
> That's why I'm asking you about Control Peripheral mode - do you want 
> to support it - and if so, then what happens to DWC3 in host mode when 
> the UTMI signals go away ?
>
> I think you've said you only want to support Debug mode, which makes 
> more sense to me.
>
> Is Debug mode only valid when the DWC3 controller is in 
> peripheral/device mode and if so, should we be checking/enforcing that 
> somewhere - DT or EUD-driver code ?

Yes in debug mode DWC3 controller should always be in device mode, and i 
believe this we can insure when we inform USB controller about attach 
event after starting in debug mode, using role-switch framework isnt it? 
may be i am not getting your statement, how device mode enumeration can 
be enforced using DT ?

>
>>> Also final thought since the EUD can operate in different modes, it 
>>> really should be a string that gets passed in - with the string name 
>>> aligning to the documentation "bypass", "debug" and so on, so that 
>>> the mode we are switching to is obvious to anybody who has the spec 
>>> and the driver.
>>
>> you mean we should document that this driver works in debug mode 
>> only? not clear on where one should pass "debug" and "bypass" string?
>
> You have a routine to switch to debug mode that takes a parameter from 
> user-space right ?
>
> Bjorn mentioned you could write 42. My question/suggestion is why 
> isn't the value written a string which corresponds to the supported 
> modes from the EUD spec ?
> "bypass" as default "debug" the mode you want to add, at a later time 
> you could optionally add in "control-periperhal" mode.
>
> Makes a little more sense to me than writing just 0, 1 or 42 :) into 
> your store routine.
OK.
>
> ---
> bod

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
