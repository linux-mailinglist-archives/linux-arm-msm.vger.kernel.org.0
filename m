Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E01E3EA409
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 13:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235263AbhHLLwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 07:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhHLLwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 07:52:07 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29533C0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 04:51:42 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id h17so10097069ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rlpdpuyXj6YcNBgZUFrzgm9MUoy7FdsTwlVLZC96hnM=;
        b=e8lal5KGHnYw27Nzezea4mPqS8PsL8syAdJLEzc7WSQamFLN7O+qo/grxGSjgYJDH2
         43qh6N1fpxrYO92R0/tCL6V2jPa9PdLFphVpSKVji3ntNZKRznd467OTrpJQGmtyjINI
         KxRX223o+nHAkva7iO3g3el91+XJk+PCWWzODif/QK4BrX9fi0oUPgNfAP2iHdfC7KSc
         Jpei27UAMcx1/2l4PPTbuNjCBS7h8RsmIi6PdfV4VbGJNOBo5hUVjvZ/81lG5KIqWzLM
         Jt7P/uO1qkHUK0q948a9AUrFzONbqXm+zqxfRwRVBnv8L2PJk8Yh0178bYNfiaG8WVlX
         s7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rlpdpuyXj6YcNBgZUFrzgm9MUoy7FdsTwlVLZC96hnM=;
        b=irzOn+fevWVqtByHReDRI9iCxZT9rDor31x7yJFuHriXUHKxybevrzxatMgAl75c1h
         EPPYoxwbzo1PeUTvthGYYUR6kcWOKe1V6T1PqwvWE7eio43R8/hIzXIEKJE/HRDOynDW
         VLJGznYmUcFXoLSqGVenZ9o5I4a/wXEszvNgYkZQsnRaMB9cfmZC0TNfkQxx4wF/gG1P
         fqJjfKEMPmBZdHvxpFFhJZR9W7cUriqMeyVBkP+a8ncEQ5lziJk9h0dcqjtuVlYFU5TF
         UrpaPIAKrd+yYn8+mxoPlJuw7Z8BhOz8692TFn2CyhYxNvlxL/VRInurzvsluoSoeWI0
         HAHQ==
X-Gm-Message-State: AOAM5307x94sZwypzymV8GWN2iggKBiEjRJh1kfkn8gIgzmQXkI25ihb
        E+WcxrYciMwHjmSXs7DGjW4OKQ==
X-Google-Smtp-Source: ABdhPJzql9g5fBF4mq+NLEY566G+mWwLgg8dtZ4uSst93znXBx6EANp13aunHuiohly4Q6dSPuiZHQ==
X-Received: by 2002:a2e:bc19:: with SMTP id b25mr2634281ljf.374.1628769100450;
        Thu, 12 Aug 2021 04:51:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n18sm239038lft.267.2021.08.12.04.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 04:51:40 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
 <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk>
 <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
 <CAA8EJppSV--TBjnGxGhaTHeKWdpM6uz70bg7diU3_K7OHoka4g@mail.gmail.com>
 <20210714164710.GC2719790@robh.at.kernel.org>
 <CAPDyKFokvTFSpbnhhKeCmZzAjqvSpUiwz7QjjQNdcd3Sd3T0rQ@mail.gmail.com>
 <YRKjQJc0yiQXFqCD@builder.lan>
 <CAPDyKFo+O34rvP7gbsC+ktd-p5QB9QAsbb+QEkWbiVqszChZJA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a053aef6-5f15-7b7c-7991-a4e74fb714ed@linaro.org>
Date:   Thu, 12 Aug 2021 14:51:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo+O34rvP7gbsC+ktd-p5QB9QAsbb+QEkWbiVqszChZJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/08/2021 12:48, Ulf Hansson wrote:
> On Tue, 10 Aug 2021 at 18:03, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>>
>> On Tue 10 Aug 06:55 CDT 2021, Ulf Hansson wrote:
>>
>>> On Wed, 14 Jul 2021 at 18:47, Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Thu, Jul 08, 2021 at 02:37:44PM +0300, Dmitry Baryshkov wrote:
>>>>> Hi,
>>>>>
>>>>> On Thu, 8 Jul 2021 at 13:10, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>>>>>>
>>>>>> - Peter (the email was bouncing)
>>>>>
>>>>> + Peter's kernel.org address
>>>>>
>>>>>>
>>>>>> On Tue, 6 Jul 2021 at 13:55, Mark Brown <broonie@kernel.org> wrote:
>>>>>>>
>>>>>>> On Tue, Jul 06, 2021 at 09:54:03AM +0200, Ulf Hansson wrote:
>>>>>>>> On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov
>>>>>>>
>>>>>>>>> Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
>>>>>>>>> being controlled through the UART and WiFi being present on PCIe
>>>>>>>>> bus. Both blocks share common power sources. Add device driver handling
>>>>>>>>> power sequencing of QCA6390/1.
>>>>>>>
>>>>>>>> Power sequencing of discoverable buses have been discussed several
>>>>>>>> times before at LKML. The last attempt [1] I am aware of, was in 2017
>>>>>>>> from Peter Chen. I don't think there is a common solution, yet.
>>>>>>>
>>>>>>> This feels a bit different to the power sequencing problem - it's not
>>>>>>> exposing the individual inputs to the device but rather is a block that
>>>>>>> manages everything but needs a bit of a kick to get things going (I'd
>>>>>>> guess that with ACPI it'd be triggered via AML).  It's in the same space
>>>>>>> but it's not quite the same issue I think, something that can handle
>>>>>>> control of the individual resources might still struggle with this.
>>>>>>
>>>>>> Well, to me it looks very similar to those resouses we could manage
>>>>>> with the mmc pwrseq, for SDIO. It's also typically the same kind of
>>>>>> combo-chips that moved from supporting SDIO to PCIe, for improved
>>>>>> performance I guess. More importantly, the same constraint to
>>>>>> pre-power on the device is needed to allow it to be discovered/probed.
>>>>>
>>>>> In our case we'd definitely use pwrseq for PCIe bus and we can also
>>>>> benefit from using pwrseq for serdev and for platform busses also (for
>>>>> the same story of WiFi+BT chips).
>>>>>
>>>>> I can take a look at rewriting pwrseq code to also handle the PCIe
>>>>> bus. Rewriting it to be a generic lib seems like an easy task,
>>>>> plugging it into PCIe code would be more fun.
>>>>>
>>>>> Platform and serdev... Definitely even more fun.
>>>>
>>>> I don't want to see pwrseq (the binding) expanded to other buses. If
>>>> that was the answer, we wouldn't be having this discussion. It was a
>>>> mistake for MMC IMO.
>>>
>>> Let's make sure we get your point correctly. I think we have discussed
>>> this in the past, but let's refresh our memories.
>>>
>>> If I recall correctly, you are against the mmc pwrseq DT bindings
>>> because we are using a separate pwrseq OF node, that we point to via a
>>> "mmc-pwrseq" property that contains a phandle from the mmc controller
>>> device node. Is that correct?
>>>
>>> If we would have encoded the power sequence specific properties, from
>>> within a child node for the mmc controller node, that would have been
>>> okay for you, right?
>>>
>>
>> In Dmitry's case, we have an external chip with that needs to be powered
>> on per a specific sequence, at which point the WiFi driver on PCIe and
>> BT driver on serdev will be able to communicate with the device.
> 
> Thanks for sharing more details.
> 
> So, not only do we have a discoverable device that needs to be powered
> on in a device specific way before probing, but in fact we have two
> consumers of that "combo chip", one (PCIe) for Wifi and one (serdev)
> for Bluetooth.
> 
>>
>> The extended case of this is where we have an SDX55 modem soldered onto
>> the pcb next to the SoC, in which case the power sequencing is even more
>> complex and additionally there are incoming gpios used to detect things
>> such as the firmware of the modem has crashed and Linux needs to toggle
>> power and rescan the PCIe bus.
> 
> That sounds very similar to what we manage for the SDIO bus already.
> 
> We have a mmc pwrseq node to describe what resources that are needed
> to power on/off the external chip. The driver for the functional
> device (Wifi chip for example) may then call SDIO APIs provided by the
> mmc core to power on/off the device, in case some kind of reset would
> be needed.
> 
> Additionally, we have a child node below the mmc controller node,
> allowing us to describe device specific things for the SDIO functional
> device, like an out-of-band IRQ line for example.
> 
> Overall, this seems to work fine, even if the DT bindings may be questionable.
> 
>>
>> In both of these cases it seems quite reasonable to represent that
>> external chip (and it's power needs) as a separate DT node. But we need
>> a way to link the functional devices to that thing.
> 
> Don't get me wrong, I am not suggesting we should re-use the
> mmc-pwrseq DT bindings - but just trying to share our experience
> around them.
> 
> In the cases you describe, it certainly sounds like we need some kind
> of minimal description in DT for these functional external devices.
> For GPIO pins, for example.
> 
> How to describe this in DT is one thing, let's see if Rob can help to
> point us in some direction of what could make sense.
> 
> When it comes to implementing a library/interface to manage these
> functional devices, I guess we just have to continue to explore
> various options. Perhaps just start simple with another subsystem,
> like PCIe and see where this brings us.

Thank you for your opinion and suggestions. In fact I'm probably going 
to start working on non-discoverable busses first (by chaning support 
for few other BT+WiFi Qualcomm chips), later shifting the attention to 
the PCIe part. While this may seem like a longer path, I'd like to 
narrow pwrseq subsystem first, before going into PCIe details.


-- 
With best wishes
Dmitry
