Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9176936F13C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 22:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhD2UpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 16:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbhD2Uo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 16:44:59 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B09C06138B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 13:44:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h4so59194927wrt.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3FNuWJ2V7SfgCjlrVjDv7aIGD8kBMXXDl/W+oAPOJA4=;
        b=OyuX2tpPaz5ft1BDTP29/+tNris6Wwgw6buwhXO2lpHIHsmHQrt+xYV6hrSSXWwEwt
         MEHp5FBTaoENvty+71TT+qFnYfT3NmOTdjmIbH2PRpLpEbfIbBBo+Xn8YAFfmb+igWwW
         1IywC4XZKP5NTRCLaOh8fcrfK0vv+qF5ETNFaNVzJZuUeuhB/PYW47MpPcUFYSvGLYhR
         fOlIXdF6MKVyiicC+UQ5LaDARmluCcoEnOTv+tICqdj+pZb5thqlZ4/nroF08/I7Q4oW
         qiPRC8P7mlyyHHKPEl2PCEf2RPE/4HgrHSFP+gqL+hTZWYr5CnCFo+w7uGZFxfBcc9Fp
         xTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3FNuWJ2V7SfgCjlrVjDv7aIGD8kBMXXDl/W+oAPOJA4=;
        b=PrzTfH8ssxf97jyxkGzfDT0ks4Xw/qCphVFL++WCZCbieUH9x+jewpnZ3b72P1D/fM
         dGPFnbd1KR7vHtdweps+xZ8absnngi5Oq+CytR4kUyRwdIhmP4JkGczl7y513D1jIN9/
         yHqA5EApFlG3nSUlnb3hnIsGy2SQYyJL51zAudiu95z5E8CzJ4GQIa7TJ3i7jPx7ZXeu
         KBBDfhZV6Kbt5N1BTN9W2XhVKJWmFQNpLS7W/qh5K1rM30+9X0SK7kuORqAE/Y8ZePYg
         zo3FcLQgeklQbqRBinKo2M2NsBRNcA8+O2bzq78u4zM6+PHBIWY821a2BfNnKrMcLcz5
         es3Q==
X-Gm-Message-State: AOAM530BY8pU2eD1Zr8e7nH3wByioOWjbINS85e32q60vEwKK4uWzt48
        auPa4xxYnXJNeFd77Z6w198raw==
X-Google-Smtp-Source: ABdhPJwM/TzhB6JI4B+qHqyCFekjx9ZQ8GTcztQCOnd//DnP+WtU7WxVfF2pWrUkNS+XUGJcgSuFzg==
X-Received: by 2002:adf:d223:: with SMTP id k3mr1807817wrh.99.1619729049177;
        Thu, 29 Apr 2021 13:44:09 -0700 (PDT)
Received: from macbook.lan ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id o13sm6187484wrf.91.2021.04.29.13.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 13:44:08 -0700 (PDT)
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
To:     Doug Anderson <dianders@google.com>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
 <CAD=FV=WLZCSd6D5VFyD+1KBp5n1qyszER2EVaEMwYjQfPSSDnA@mail.gmail.com>
 <b77f207b-2d90-3c8b-857f-625bd3867ed1@codeaurora.org>
 <6fdf704c4716f5873d413229ca8adc57@codeaurora.org>
 <CAD=FV=Wa4fT5wZgd0==8kLy_tzTLgdZ-HwdfOEAM9pMeMjjFyg@mail.gmail.com>
 <8126e130e5c0ea1e7ea867414f0510c0@codeaurora.org>
 <CAD=FV=XavWbf_b7-=JT6V5_RNA8CjdK4oRu7H719AaPDJ5tsqQ@mail.gmail.com>
 <32096a375966e1fcc149016df012c445@codeaurora.org>
 <CAD=FV=U0zEDi1Xn3OmVFA3h3maVWS_o2FXOW9qDEzTf1Moja=A@mail.gmail.com>
 <7c6805abf9c1f590bc4d66d625152f22@codeaurora.org>
 <CAD=FV=W8z2VgbP6mepVNXJ8ZO_Enb+ftwG1HQhq8HtEyG1ppOA@mail.gmail.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <43fa4053-09e9-0d90-3b19-879ef94c9ec3@linaro.org>
Date:   Thu, 29 Apr 2021 23:44:06 +0300
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W8z2VgbP6mepVNXJ8ZO_Enb+ftwG1HQhq8HtEyG1ppOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28.04.21 18:13, Doug Anderson wrote:
> Hi,
> 
> On Wed, Apr 28, 2021 at 3:47 AM <sbhanu@codeaurora.org> wrote:
>>
>> On 2021-04-21 01:44, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Tue, Apr 20, 2021 at 10:21 AM <sbhanu@codeaurora.org> wrote:
>>>>
>>>> On 2021-04-15 01:55, Doug Anderson wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Apr 13, 2021 at 3:59 AM <sbhanu@codeaurora.org> wrote:
>>>>>>
>>>>>>>>>>> +                                       required-opps =
>>>>>>>>>>> <&rpmhpd_opp_low_svs>;
>>>>>>>>>>> +                                       opp-peak-kBps = <1200000
>>>>>>>>>>> 76000>;
>>>>>>>>>>> +                                       opp-avg-kBps = <1200000
>>>>>>>>>>> 50000>;
>>>>>>>>>> Why are the kBps numbers so vastly different than the ones on sc7180
>>>>>>>>>> for the same OPP point. That implies:
>>>>>>>>>>
>>>>>>>>>> a) sc7180 is wrong.
>>>>>>>>>>
>>>>>>>>>> b) This patch is wrong.
>>>>>>>>>>
>>>>>>>>>> c) The numbers are essentially random and don't really matter.
>>>>>>>>>>
>>>>>>>>>> Can you identify which of a), b), or c) is correct, or propose an
>>>>>>>>>> alternate explanation of the difference?
>>>>>>>>>>
>>>>>>>>
>>>>>>>> We calculated bus votes values for both sc7180 and sc7280 with ICB
>>>>>>>> tool,
>>>>>>>> above mentioned values we got for sc7280.
>>>>>>>
>>>>>>> I don't know what an ICB tool is. Please clarify.
>>>>>>>
>>>>>>> Also: just because a tool spits out numbers that doesn't mean it's
>>>>>>> correct. Presumably the tool could be wrong or incorrectly configured.
>>>>>>> We need to understand why these numbers are different.
>>>>>>>
>>>>>> we checked with ICB tool team on this they conformed as Rennell &
>>>>>> Kodiak
>>>>>> are different chipsets,
>>>>>> we might see delta in ib/ab values due to delta in scaling factors.
>>>>>
>>>>> ...but these numbers are in kbps, aren't they? As I understand it
>>>>> these aren't supposed to be random numbers spit out by a tool but are
>>>>> supposed to be understandable by how much bandwidth an IP block (like
>>>>> MMC) needs from the busses it's connected to. Since the MMC IP block
>>>>> on sc7180 and sc7280 is roughly the same there shouldn't be a big
>>>>> difference in numbers.
>>>>>
>>>>> Something smells wrong.
>>>>>
>>>>> Adding a few people who understand interconnects better than I do,
>>>>> though.
>>>>>
>>>>
>>>> ICB team has re-checked the Rennell ICB tool and they confirmed that
>>>> some configs were wrong in Rennell ICB tool and they corrected it.With
>>>> the new updated Rennell ICB tool below are the values :
>>>>
>>>>
>>>> Rennell LC:(Sc7180)
>>>>
>>>> opp-384000000 {
>>>>                opp-hz = /bits/ 64 <384000000>;
>>>>                required-opps = <&rpmhpd_opp_nom>;
>>>>                opp-peak-kBps = <5400000 490000>;
>>>>                opp-avg-kBps = <6600000 300000>;
>>>> };
>>>>
>>>>
>>>> And now, these values are near to Kodaik LC values:
>>>>
>>>> Kodaik LC:(SC7280)
>>>>
>>>> opp-384000000 {
>>>>              opp-hz = /bits/ 64 <384000000>;
>>>>              required-opps = <&rpmhpd_opp_nom>;
>>>>              opp-peak-kBps = <5400000 399000>;
>>>>              opp-avg-kBps = <6000000 300000>;
>>>> };
>>>
>>> This still isn't making sense to me.
>>>
>>> * sc7180 and sc7280 are running at the same speed. I'm glad the
>>> numbers are closer now, but I would have thought they'd be exactly the
>>> same.
>>>
>>> * Aren't these supposed to be sensible? This is eMMC that does max
>>> transfer rates of 400 megabytes / second to the external device. You
>>> have bandwidths listed here of 5,400,000 kBps = 5,400,000 kilobytes /
>>> second = 5400 megabytes / second. I can imagine there being some
>>> overhead where an internal bus might need to be faster but that seems
>>> excessive. This is 13.5x!
>>>
>>
>> These numbers are not related to SDCC bandwidth, these are the values
>> needed for the NOC's to run in nominal voltage corners (internal to
>> hardware) and
>> thus it helps SDCC to run in nominal to get required through put
>> (384MBps).So above calculation mentioned by you is not applicable here.
> 
> OK. I guess if everyone else understands this and it's just me that
> doesn't then I won't stand in the way. In general, though, the device
> tree is supposed to be describing the hardware in a way that makes
> sense on its own. It's not a place to just dump in magic numbers.
> These numbers must be somehow related to the transfer rate of the SD
> card since otherwise they wouldn't scale up with faster card clocks.
> Given that these numbers are expressed in "kBps" (since you're storing
> them in a property that has "kBps" in the name), I would expect that
> these numbers are expressing some type of bandwidth. I still haven't
> really understood why you have to scale some bandwidth at over 10x the
> card clock speed.
> 
> Said another way: you're saying that you need these numbers because
> they make a whole bunch of math work out. I'm saying that these aren't
> just supposed to be magic numbers. They're supposed to make sense on
> their own and you should be able to describe to me how you arrived at
> these numbers in a way that I could do the math on my own. Saying "we
> plugged this into some program and it spit out these numbers" isn't
> good enough.

Agree.

>>> * I can't see how it can make sense that "average" values are higher
>>> than "peak" values.
>>
>>
>> Here actual peak = peak number * 2
>> actual average = average number
>>
>> and this multiplication is taken care by ICC driver, so technically
>> actual peak is still high than average.
> 
> Sorry, but that is really counter-intuitive. Georgi: is that how this
> is normally expected to work?

Average bandwidth being higher than peak does not make sense to me.
The numbers in DT should reflect the real bandwidth that is being
requested. If some links between nodes consist of multiple channels,
or there is anything specific to the topology or the hardware platform
(scaling factors, buswidth, etc), this should be handled in the
interconnect provider driver. The goal is to use bandwidth values and
not magic numbers.

Thanks,
Georgi
