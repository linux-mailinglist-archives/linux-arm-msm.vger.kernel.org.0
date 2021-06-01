Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCD23970C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 11:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhFAKAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 06:00:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11187 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhFAKAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 06:00:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622541532; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UstcePnYZJQhq8nQrYfmomu4XGN9dfgvLkzNQWoacy8=;
 b=AoUEz7Ekz5+0182hD0SxiNhJWCCYuzwnppf5hN02ZDEuwPBHx3GCE8kUUYp65TcediM8tw6t
 fnAeumvRq7mC1nREuWfFaLRjoweLY0s1WgHebcXKpzbyBRIioECO+wl1V8kXVTsz6PPWj0n4
 kO99DUHB7nqMIm2RU/sj5h/0TDc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60b604dcabfd22a3dc21c9ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Jun 2021 09:58:52
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 45512C4323A; Tue,  1 Jun 2021 09:58:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE27BC433D3;
        Tue,  1 Jun 2021 09:58:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Jun 2021 15:28:49 +0530
From:   sbhanu@codeaurora.org
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Doug Anderson <dianders@google.com>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
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
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <43fa4053-09e9-0d90-3b19-879ef94c9ec3@linaro.org>
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
 <43fa4053-09e9-0d90-3b19-879ef94c9ec3@linaro.org>
Message-ID: <008177ee2544b05d368b61fc8cae601b@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-30 02:14, Georgi Djakov wrote:
> On 28.04.21 18:13, Doug Anderson wrote:
>> Hi,
>> 
>> On Wed, Apr 28, 2021 at 3:47 AM <sbhanu@codeaurora.org> wrote:
>>> 
>>> On 2021-04-21 01:44, Doug Anderson wrote:
>>>> Hi,
>>>> 
>>>> On Tue, Apr 20, 2021 at 10:21 AM <sbhanu@codeaurora.org> wrote:
>>>>> 
>>>>> On 2021-04-15 01:55, Doug Anderson wrote:
>>>>>> Hi,
>>>>>> 
>>>>>> On Tue, Apr 13, 2021 at 3:59 AM <sbhanu@codeaurora.org> wrote:
>>>>>>> 
>>>>>>>>>>>> +                                       required-opps =
>>>>>>>>>>>> <&rpmhpd_opp_low_svs>;
>>>>>>>>>>>> +                                       opp-peak-kBps = 
>>>>>>>>>>>> <1200000
>>>>>>>>>>>> 76000>;
>>>>>>>>>>>> +                                       opp-avg-kBps = 
>>>>>>>>>>>> <1200000
>>>>>>>>>>>> 50000>;
>>>>>>>>>>> Why are the kBps numbers so vastly different than the ones on 
>>>>>>>>>>> sc7180
>>>>>>>>>>> for the same OPP point. That implies:
>>>>>>>>>>> 
>>>>>>>>>>> a) sc7180 is wrong.
>>>>>>>>>>> 
>>>>>>>>>>> b) This patch is wrong.
>>>>>>>>>>> 
>>>>>>>>>>> c) The numbers are essentially random and don't really 
>>>>>>>>>>> matter.
>>>>>>>>>>> 
>>>>>>>>>>> Can you identify which of a), b), or c) is correct, or 
>>>>>>>>>>> propose an
>>>>>>>>>>> alternate explanation of the difference?
>>>>>>>>>>> 
>>>>>>>>> 
>>>>>>>>> We calculated bus votes values for both sc7180 and sc7280 with 
>>>>>>>>> ICB
>>>>>>>>> tool,
>>>>>>>>> above mentioned values we got for sc7280.
>>>>>>>> 
>>>>>>>> I don't know what an ICB tool is. Please clarify.
>>>>>>>> 
>>>>>>>> Also: just because a tool spits out numbers that doesn't mean 
>>>>>>>> it's
>>>>>>>> correct. Presumably the tool could be wrong or incorrectly 
>>>>>>>> configured.
>>>>>>>> We need to understand why these numbers are different.
>>>>>>>> 
>>>>>>> we checked with ICB tool team on this they conformed as Rennell &
>>>>>>> Kodiak
>>>>>>> are different chipsets,
>>>>>>> we might see delta in ib/ab values due to delta in scaling 
>>>>>>> factors.
>>>>>> 
>>>>>> ...but these numbers are in kbps, aren't they? As I understand it
>>>>>> these aren't supposed to be random numbers spit out by a tool but 
>>>>>> are
>>>>>> supposed to be understandable by how much bandwidth an IP block 
>>>>>> (like
>>>>>> MMC) needs from the busses it's connected to. Since the MMC IP 
>>>>>> block
>>>>>> on sc7180 and sc7280 is roughly the same there shouldn't be a big
>>>>>> difference in numbers.
>>>>>> 
>>>>>> Something smells wrong.
>>>>>> 
>>>>>> Adding a few people who understand interconnects better than I do,
>>>>>> though.
>>>>>> 
>>>>> 
>>>>> ICB team has re-checked the Rennell ICB tool and they confirmed 
>>>>> that
>>>>> some configs were wrong in Rennell ICB tool and they corrected 
>>>>> it.With
>>>>> the new updated Rennell ICB tool below are the values :
>>>>> 
>>>>> 
>>>>> Rennell LC:(Sc7180)
>>>>> 
>>>>> opp-384000000 {
>>>>>                opp-hz = /bits/ 64 <384000000>;
>>>>>                required-opps = <&rpmhpd_opp_nom>;
>>>>>                opp-peak-kBps = <5400000 490000>;
>>>>>                opp-avg-kBps = <6600000 300000>;
>>>>> };
>>>>> 
>>>>> 
>>>>> And now, these values are near to Kodaik LC values:
>>>>> 
>>>>> Kodaik LC:(SC7280)
>>>>> 
>>>>> opp-384000000 {
>>>>>              opp-hz = /bits/ 64 <384000000>;
>>>>>              required-opps = <&rpmhpd_opp_nom>;
>>>>>              opp-peak-kBps = <5400000 399000>;
>>>>>              opp-avg-kBps = <6000000 300000>;
>>>>> };
>>>> 
>>>> This still isn't making sense to me.
>>>> 
>>>> * sc7180 and sc7280 are running at the same speed. I'm glad the
>>>> numbers are closer now, but I would have thought they'd be exactly 
>>>> the
>>>> same.
>>>> 
>>>> * Aren't these supposed to be sensible? This is eMMC that does max
>>>> transfer rates of 400 megabytes / second to the external device. You
>>>> have bandwidths listed here of 5,400,000 kBps = 5,400,000 kilobytes 
>>>> /
>>>> second = 5400 megabytes / second. I can imagine there being some
>>>> overhead where an internal bus might need to be faster but that 
>>>> seems
>>>> excessive. This is 13.5x!
>>>> 
>>> 
>>> These numbers are not related to SDCC bandwidth, these are the values
>>> needed for the NOC's to run in nominal voltage corners (internal to
>>> hardware) and
>>> thus it helps SDCC to run in nominal to get required through put
>>> (384MBps).So above calculation mentioned by you is not applicable 
>>> here.
>> 
>> OK. I guess if everyone else understands this and it's just me that
>> doesn't then I won't stand in the way. In general, though, the device
>> tree is supposed to be describing the hardware in a way that makes
>> sense on its own. It's not a place to just dump in magic numbers.
>> These numbers must be somehow related to the transfer rate of the SD
>> card since otherwise they wouldn't scale up with faster card clocks.
>> Given that these numbers are expressed in "kBps" (since you're storing
>> them in a property that has "kBps" in the name), I would expect that
>> these numbers are expressing some type of bandwidth. I still haven't
>> really understood why you have to scale some bandwidth at over 10x the
>> card clock speed.
>> 
>> Said another way: you're saying that you need these numbers because
>> they make a whole bunch of math work out. I'm saying that these aren't
>> just supposed to be magic numbers. They're supposed to make sense on
>> their own and you should be able to describe to me how you arrived at
>> these numbers in a way that I could do the math on my own. Saying "we
>> plugged this into some program and it spit out these numbers" isn't
>> good enough.
> 
> Agree.
> 

Peak bandwidth is an instantaneous bandwidth used as a floor vote to 
take care
of latency (in this case for DDR). It is a mechanism to vote for floor
frequency to counter latency as opposed to an actual bandwidth 
requirement.

So a client could say I need the clock to run @200 MHz and simply take 
the
bus width times the frequency as the required peak bandwidth vote
(peak bandwidth vote = 200 * bus_width ) and vote for it.

So, we are passing peak bandwidth votes for DDR and CNOC for nom 
frequencies
from device tree.

SDCC clocks are running at Nom. frequenices, which are power driven by 
the cx rail.
The same cx rail will also power driven to DDR clocks too.
So, DDR clocks can also scale upto to Nom. frequenices without any extra 
power drawing
by the cx rail. This will helps to get optimal performance.

So, on doing the math with DDR Nom. frequency (1.3GHz) and also 
considering the Gerogi points
[If some links between nodes consist of multiple channels,
or there is anything specific to the topology or the hardware platform
(scaling factors, buswidth, etc), this should be handled in the
interconnect provider driver.] we will get values close to 5400000KBps.

same applies to CNOC config path Nom. frequency (403MHz), we will get 
values close to 1600000KBps.

math used :
peak bandwidth  = minimum DDR * effective width;  //4bytes for DDR for 
SC7280.
average bandwidth = is the actual throughput requirement.

By considering the above points, the new b/w values looks as below.


opp-384000000 {
                                 opp-hz = /bits/ 64 <384000000>;
                                 required-opps = <&rpmhpd_opp_nom>;
                                 opp-peak-kBps = <5400000 1600000>;
                                 opp-avg-kBps = <390000 0>;
                 };


similarly for 100Mhz


opp-100000000 {
                                 opp-hz = /bits/ 64 <100000000>;
                                 required-opps = <&rpmhpd_opp_low_svs>;
                                 opp-peak-kBps = <1800000 400000>;
                                 opp-avg-kBps = <100000 0>;
                 };


>>>> * I can't see how it can make sense that "average" values are higher
>>>> than "peak" values.
>>> 
>>> 
>>> Here actual peak = peak number * 2
>>> actual average = average number
>>> 
>>> and this multiplication is taken care by ICC driver, so technically
>>> actual peak is still high than average.
>> 
>> Sorry, but that is really counter-intuitive. Georgi: is that how this
>> is normally expected to work?
> 
> Average bandwidth being higher than peak does not make sense to me.
> The numbers in DT should reflect the real bandwidth that is being
> requested. If some links between nodes consist of multiple channels,
> or there is anything specific to the topology or the hardware platform
> (scaling factors, buswidth, etc), this should be handled in the
> interconnect provider driver. The goal is to use bandwidth values and
> not magic numbers.
> 
> Thanks,
> Georgi

Sure, we will update this Average bandwidth vote values.
