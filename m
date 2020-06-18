Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD0A1FF41A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 16:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbgFROBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 10:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgFROBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 10:01:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFCAC06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 07:01:35 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f185so5780755wmf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GQ+f5LbXM2QOOG5FZRp3+0+2d8wZVfWK4cGaP7r5yA0=;
        b=oCIlPuDc8vxHWqgx967sTH/fWdpmiL63dMFiWvJgPQM70IUfEK0V888OjaqdR90dG7
         6M36FWuGOkI5Vqi8YreVhXhwrzhu07ssKL2DxcwjUsCakMvawiaZDz9ddD//MP+3Lxpg
         s9cXx8HpURPmTJ6fTj3TzP0RTpG7UvAo15Nio5EmvfdEZEMBxi/RZ/SDsyn3g7XMkO4N
         ghZrxbqiJc7366VejlhFT6AvIVjSNC+K8AjQlB8cm/VshfRzO8GRLdSA3nolmGleeI3B
         X6PTlZ3MauLfNxBcwNNUE/Q3F+6+df/mOBqctSjQgAtdcSjwNwVA9Hu3SKpuk+6kHxi4
         //mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GQ+f5LbXM2QOOG5FZRp3+0+2d8wZVfWK4cGaP7r5yA0=;
        b=AEUJM0w+68yzGJWaNFdHR/GK7uJVSn0JBbIkHbel41q9KqJczfu6AQbXR9pb0xDyuk
         WccM+PGRXxgB3p5HximG+Et7aYvnZEFyMQZj9ASmY6e9kuL2xa3EqxatAMvhcO+pwBzG
         ZDvwsgSGO/WPC6b+ADHWl4lDGldSsWX0LauLa5i8frV0mRPfPf2R/ory3y9SSB8xQqiX
         tIHZ7ajvFTG75b0U7QKfGWriDGGqwnraO4O9k7MIXUQm4sDYNOYur2ErjOLnAoWMW1WF
         xtCl04mabiOI/CGx4OCYcbUuf2YLof+2jgMC65slXqR8vNxK3PDEUNamhlx144uLPqfY
         eQhQ==
X-Gm-Message-State: AOAM531xZ22NMUp6SITZBb2HR9aPmpso0uvdX97z6KXV/XfBkN5mUaRO
        8xq4GWDzVOYgaN3ngFHUVRM2cvT2ysk=
X-Google-Smtp-Source: ABdhPJzngyNt8xDALD7VDpQx/7QiX/IcDk78OhMSDsO3HvIXjLk8x05K1VGX/QMPPAqncRbDhO/0gA==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr4158621wmi.65.1592488894133;
        Thu, 18 Jun 2020 07:01:34 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id y132sm3931810wmb.11.2020.06.18.07.01.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 07:01:33 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] dt-bindings: nvmem: Add properties needed for
 blowing fuses
To:     Doug Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
 <254998b9-c45e-bd6b-bc9a-b5934c0fea8e@linaro.org>
 <CAD=FV=Vec5FVrDVkmUQTfa6bP+1d3yOtj_FsgVAFdHLLbZ8VDA@mail.gmail.com>
 <db6cc914-0520-5286-f852-473fc63bd6c7@linaro.org>
 <CAD=FV=UZAtJY42jwSZy+Z+O3AdZqDxnjY1zzOswqQRDY91uPpA@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0b0b52db-da8c-e958-d72e-797e319bbe9c@linaro.org>
Date:   Thu, 18 Jun 2020 15:01:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UZAtJY42jwSZy+Z+O3AdZqDxnjY1zzOswqQRDY91uPpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/06/2020 14:48, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jun 18, 2020 at 3:10 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> +Adding SBoyd.
>>
>> On 17/06/2020 18:22, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Jun 17, 2020 at 8:19 AM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 17/06/2020 15:51, Douglas Anderson wrote:
>>>>> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
>>>>>
>>>>> On some systems it's possible to actually blow the fuses in the qfprom
>>>>> from the kernel.  Add properties to support that.
>>>>>
>>>>> NOTE: Whether this is possible depends on the BIOS settings and
>>>>> whether the kernel has permissions here, so not all boards will be
>>>>> able to blow fuses in the kernel.
>>>>>
>>>>> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>> ---
>>>>>
>>>>> Changes in v3:
>>>>> - Add an extra reg range (at 0x6000 offset for SoCs checked)
>>>>> - Define two options for reg: 1 item or 4 items.
>>>>> - No reg-names.
>>>>> - Add "clocks" and "clock-names" to list of properties.
>>>>> - Clock is now "sec", not "secclk".
>>>>> - Add "vcc-supply" to list of properties.
>>>>> - Fixed up example.
>>>>>
>>>>>     .../bindings/nvmem/qcom,qfprom.yaml           | 45 ++++++++++++++++++-
>>>>>     1 file changed, 43 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>>>> index 5efa5e7c4d81..b195212c6193 100644
>>>>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>>>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>>>> @@ -17,8 +17,27 @@ properties:
>>>>>         const: qcom,qfprom
>>>>>
>>>>>       reg:
>>>>> -    items:
>>>>> -      - description: The corrected region.
>>>>> +    # If the QFPROM is read-only OS image then only the corrected region
>>>>> +    # needs to be provided.  If the QFPROM is writable then all 4 regions
>>>>> +    # must be provided.
>>>>> +    oneOf:
>>>>> +      - items:
>>>>> +          - description: The corrected region.
>>>>> +      - items:
>>>>> +          - description: The corrected region.
>>>>> +          - description: The raw region.
>>>>> +          - description: The config region.
>>>>> +          - description: The security control region.
>>>>> +
>>>>> +  # Clock must be provided if QFPROM is writable from the OS image.
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>
>>>>
>>>>> +  clock-names:
>>>>> +    const: sec
>>>>
>>>> Do we need clock-names for just one clock here?
>>>
>>> I think technically you can get by without, but convention is that
>>> clock-names are always provided for clocks.  It's talked about in the
>>> same link I sent that talked about reg-names:
>>>
>>> https://lore.kernel.org/r/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/
>>>
>>
>> TBH, This is total confusion!!!
>>
>> when to use "*-names" Device tree bindings is totally depended on Linux
>> Subsystem interfaces!
>>
>> And what is the starting point to draw this line?
> 
> Definitely confusing and mostly because the dts stuff grew organically
> for a while there.  It does feel like Rob is pretty clear on the
> current state of things and the policy in the link I provided, though.
> 
> 
>>> Specifically, Rob said:
>>>
>>>> That probably is because the clock binding has had clock-names from
>>>> the start (it may have been the first one). That was probably partly
>>>> due to the clock API also was mainly by name already if we want to
>>>> admit Linux influence on bindings
>>>
>>> Basically the standard way for getting clocks in Linux is
>>> clk_get(name).  With just one clock you can call clk_get(NULL) and I
>>> believe that works, but when you add the 2nd clock then you have to
>>> switch APIs to one of the less-commonly-used variants.
>>
>> In previous NON-DT life clk_get api name argument comes from the clk
>> names that clk provider registered the clocks with.
>>
>> If I remember this correctly, the name that is refereed here for
>> clk_get() is old clkdev api based on clk_lookups and is not the same as
>> clk-names that we have in Device tree. Atleast in this case!
>>
>> clk-names has two objectives in DT:
>> 1> To find the index of the clock in the clocks DT property.
>>
>> 2> If actual clk name is specified then if "1" fails then name could
>> potentially fallback to use old clkdev based clk_lookups.
>>
>> In this specific case we have "sec" as clock-names which is totally used
>> for indexing into clocks property and it can not be used for (2) as
>> there is no clk named "sec" registered by any of the clk providers.
>>
>> So this does not justify the reasoning why "clock-names" should be used
>> while "reg-names" should not be used!. Both of them are going to be
>> finally used for indexing into there respective properties.
> 
> Right, you just have to accept the fact that logic doesn't come into
> play here.  For clocks, always use "clk-names" but also always use a
> consistent order (which is now more enforced by the schema checker).
> For "reg" almost never use "reg-names".
> 

On the other note:

clock-names are not mandatory according to 
Documentation/devicetree/bindings/clock/clock-bindings.txt

For this particular case where clock-names = "sec" is totally used for 
indexing and nothing else!


> 
>> This also brings in greater confusion for both existing and while adding
>> bindings with "*-names" for new interfaces.
>>
>> Rob, can you please provide some clarity and direction on when to
>> use/not-use *-names properties!
> 
> If I had to guess Rob will say that we shouldn't add more places where
> the convention is to have "-names".

Confusion is not just about new bindings, but with the existing ones! :-)


--srini
> 
> 
> I will put posting v4 of this patch on pause until this is resolved to
> avoid fragmenting the discussion.
> 
> 
> -Doug
> 
