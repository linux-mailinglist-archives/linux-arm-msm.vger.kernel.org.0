Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44BE161BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 20:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgBQTnz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 14:43:55 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52775 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgBQTnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 14:43:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so507441wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2020 11:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MQN/uQOAgTxfQZT9bKJbi8MiiNV6j8hTfUj5PJ1weJ0=;
        b=TDHPDp6Qy9GVhleprEuXg8YbmQwbvavXGTPGo3wKAVYBEXvnHZlMGgZ/T1sbZpoEar
         aaMI6W7O8hul/Ds/2GfpnqjfowKSKIOPsaFVC2XIt8VvehaC63UoOzkzUwKtphMEEbJD
         CC56WZoMfv5rE691nqul8IHEhPBykJhShUC93ndMTFz2rAg4OCx2ggCx0mNUH8lOGVrA
         yu9CtX3BnX/WOYOX3H/6s6ddP7n/kuSZWSUo+qNxByHsUq3gaO965dzKFXIMxPg5Y8oN
         +JWIrVJyNjr6Oip6ZqoEc7A5JwyIKHqqH1YrQhSsMoheed88HX99B0FEY6643b1BaoRu
         TCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MQN/uQOAgTxfQZT9bKJbi8MiiNV6j8hTfUj5PJ1weJ0=;
        b=pPdUxv55Odi+/YrPisHEDv69XFg2A+bd6aavJnZzo4Z/d+AkaEe6nT/6zRqq3yq1WW
         7v3kdshqjdTmye/YNr5tcIAynLNqG9cDipGKmKbPGgYGDZFkMW1gDAG+p5OSim8v3eVg
         axT6Y0t7yFejuCFcm3ObMsCHYL3TLWS9pAMTqMnkTdp0lFJq5l4IX5AaFSphLYGAphrC
         b7U2UiB6RyMQmdackPoP6D55nHVaXMJe+xBtXKe0nnEQayj9m7lpdD2bl+hKbEKyOdA7
         XzpzbvCoJ445m2b4d8Bd6HiSGpApnU7+Gdcv+dRJsMUd681R+xXhzqmb4THsiqHyfCA2
         qZRQ==
X-Gm-Message-State: APjAAAUnYHTQ2rvEZwaEP9loTrQ0hHA4oIxZYfXm1pS4LLhH3a4tMCgT
        cmEhxgQaKmpkQPlXYajSmsA7mA==
X-Google-Smtp-Source: APXvYqzZesqSrj60noF/hfZAIPNAZOIwy+5Sz4etxosPd38aWA0SMBevC2CaLdyOdxmJpfEw52HuBw==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr518714wma.159.1581968633205;
        Mon, 17 Feb 2020 11:43:53 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v22sm561053wml.11.2020.02.17.11.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 11:43:52 -0800 (PST)
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
To:     "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <8a854c02-7435-46c6-5bd1-05273e5249e4@linaro.org>
Date:   Mon, 17 Feb 2020 19:44:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d09f8a1d-0544-838f-e6f8-1c47f58e4f1f@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/02/2020 16:07, Dwivedi, Avaneesh Kumar (avani) wrote:
> 
> On 2/4/2020 8:40 AM, Bryan O'Donoghue wrote:
>> On 03/02/2020 19:35, Bjorn Andersson wrote:
>>> On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:
>>
>> Hi Avaneesh.
> 
> Hello Bryan, Thank you very much for your review comments.
> 
> Will be replying to your comments and will be posting new patchset soon 
> as per review comments.
> 
>>
>>> Please aim for keeping the sort order in this file (ignore QCOM_APR
>>> which obviously is in the wrong place)
>>>
>>>> +       tristate "QTI Embedded USB Debugger (EUD)"
>>>> +       depends on ARCH_QCOM
>>
>> If we persist with the model of EXTCON you should "select EXTCON" here.

> I have asked this query with Bjorn Also against his review comments, 
> whether we need to persist with extcon or need to switch to usb role 
> switch framework, as we are notifying not only to usb controller but 
> also to pmic charger so in case we adopt usb role switch then how we 
> will notify to pmic charger to enable charging battery ? Also as i 
> mentioned there my dilema is it does not look very apt to model EUD hw 
> IP as c type connector, so please let me know your views.

I think there's a desire to model USB ports as connector child nodes of 
a USB controllers as opposed to the more generic extcon so, I think the 
effort should probably be made to model it up as typec.

1. Model as a typec connector
    You can use usb-role-switch based on the VBUS interrupt you get
    drivers/extcon/extcon-axp288.c::axp288_usb_role_work()
    as an exmple

2. Model the registers/gpios in the PMIC interface as regulators
    that your typec driver could then own.

    You wouldn't have to notify outside of your typec driver then
    you'd just be using the regulator API.

You can use regmap to divide up the registers between devices for that.

Can that work for you ?

>>>> +static int enable_eud(struct eud_chip *priv)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    /* write into CSR to enable EUD */
>>>> +    writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
>>>> +    /* Enable vbus, chgr & safe mode warning interrupts */
>>>> +    writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
>>>> +            priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
>>>> +
>>>> +    /* Ensure Register Writes Complete */
>>
>> So... You are writing a register in an on-chip PMIC. The PMIC is 
>> responsible for detecting USB ID and supplying VBUS as appropriate.
>>
>> You then get an interrupt to inform you of the state ?
> 
> I am writing to EUD control port so that when EUD is enable, EUD hw IP 
> can intercept VBUS and d+/d- signal and can reroute to PMIC or USB as 
> per host application command in debug mode.

Reading the dts that goes with this

+The EUD (Embedded USB Debugger) is a mini-USB hub implemented
+on chip to support the USB-based debug and trace capabilities.

Ah so, the EUD is a mux, that sits between the connector and the 
controller, routing UTMI signals to an internal USB hub, which in-turn 
has debug functions attached to the hub...

Can the Arm core see the hub ? I assume not ?

There are a few different modes - you should probably be clear on which 
mode it is you are supporting.

Normal mode: (Bypass)
Port | EUD | Controller

Normal + debug hub mode: (Debug)
Port | EUD | Controller + HUB -> debug functions

Debug hub mode: (Control Peripheral)
Port | EUD | HUB -> debug functions

its not clear to me from the documentation or the code which mode it is 
we are targeting to be supported here.

I think you should support Debug mode only here, so that the Arm core 
never has to deal with the situation where the USB connector "goes away".

If we were to support Control Peripheral where the local DWC3 controller 
has the signals routed away entirely, then I think we would need to look 
into modelling that in device tree - and using an overlay to show the 
DWC3 controller going away in Control Peripheral mode and coming back.

Also final thought since the EUD can operate in different modes, it 
really should be a string that gets passed in - with the string name 
aligning to the documentation "bypass", "debug" and so on, so that the 
mode we are switching to is obvious to anybody who has the spec and the 
driver.

---
bod
