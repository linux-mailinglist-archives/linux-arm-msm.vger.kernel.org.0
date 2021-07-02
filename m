Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF33D3B9D01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 09:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhGBHia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 03:38:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14157 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230131AbhGBHi0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 03:38:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625211355; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=g7LR8EdjUqh8oZirAnB19g1VLbJWOG/mJceTdUmfR90=; b=TGpeucQ8w/6mjbl1zcC++ztjlWP8cqKjE1Rr0O2OYNPJBMHjdVTcxFB/8kLvfFPimsRVdueR
 hL3egilh3uvAw7UsJelfZImUiBZglPnMLSgoXW/UBl6ml5ZyB4r1n3j/EiESA4wzYISa3GG4
 H65JNGc9olJMwPHKHjceTaqSOrA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60dec1bf2a2a9a9761dceb7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Jul 2021 07:35:27
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D911C4338A; Fri,  2 Jul 2021 07:35:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.50.56.198] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95774C433F1;
        Fri,  2 Jul 2021 07:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95774C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 3/6] clk: qcom: gdsc: enable optional power domain support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
 <YNyHDAHk6ad/XCGl@yoga>
 <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
 <YNylqGEi7Q3tFCgy@yoga>
 <CAA8EJppHQ-XhZWbsPX39wie48JXWvsNerWB9=Q0yxxs7987xxA@mail.gmail.com>
 <YN1DIwR66JKoFhEZ@yoga>
 <CAA8EJpr6qrVJY7DdcNagrpaTFW2FMxE-GE8nHyxmiFHCY0A+jA@mail.gmail.com>
 <YN4sRDqPpZMiNd1T@yoga>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <ea5d9cea-a501-b8d7-e0b7-79110b84c4e6@codeaurora.org>
Date:   Fri, 2 Jul 2021 13:05:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN4sRDqPpZMiNd1T@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/2/2021 2:27 AM, Bjorn Andersson wrote:
> On Thu 01 Jul 15:12 CDT 2021, Dmitry Baryshkov wrote:
> 
>> On Thu, 1 Jul 2021 at 07:23, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>>>
>>> On Wed 30 Jun 15:29 CDT 2021, Dmitry Baryshkov wrote:
>>>
>>>> On Wed, 30 Jun 2021 at 20:11, Bjorn Andersson
>>>> <bjorn.andersson@linaro.org> wrote:
>>>>>
>>>>> On Wed 30 Jun 10:47 CDT 2021, Dmitry Baryshkov wrote:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, 30 Jun 2021 at 18:00, Bjorn Andersson
>>>>>> <bjorn.andersson@linaro.org> wrote:
>>>>>>>
>>>>>>> On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:
>>>>>>>
>>>>>>>> On sm8250 dispcc and videocc registers are powered up by the MMCX power
>>>>>>>> domain. Currently we used a regulator to enable this domain on demand,
>>>>>>>> however this has some consequences, as genpd code is not reentrant.
>>>>>>>>
>>>>>>>> Teach Qualcomm clock controller code about setting up power domains and
>>>>>>>> using them for gdsc control.
>>>>>>>>
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>
>>>>>>> There's a proposal to add a generic binding for statically assigning a
>>>>>>> performance states here:
>>>>>>>
>>>>>>> https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/
>>>>
>>>> I checked this thread. It looks like Rajendra will also switch to the
>>>> "required-opps" property. So if that series goes in first, we can drop
>>>> the call to set_performance_state. If this one goes in first, we can
>>>> drop the set_performance_state call after getting Rajendra's work in.
>>>>
>>>>>>>
>>>>>>>
>>>>>>> But that said, do you really need this?
>>>>>>>
>>>>>>> The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
>>>>>>> SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
>>>>>>> to 460MHz in &mdss.
>>>>>>>
>>>>>>> But then in &mdss_mdp you do the same using an opp-table based on the
>>>>>>> actual MDP_CLK, which per its power-domains will scale MMCX accordingly.
>>>>>>
>>>>>> MDSS and DSI would bump up MMCX performance state requirements on
>>>>>> their own, depending on the frequency being selected.
>>>>>>
>>>>>
>>>>> Right, but as I copied things from the sm8250.dtsi to come up with
>>>>> sm8150/sc8180x.dtsi I concluded that as soon as the assigned-clockrate
>>>>> in &mdss kicks in I need the performance state to be at NOM.
>>>>>
>>>>> So keeping the assigned-clockrate in &mdss means that MMCX will never go
>>>>> below NOM.
>>>>
>>>> No, because once MDP is fully running, it will lower the clock frequency:
>>>>
>>>> # grep mdp_clk /sys/kernel/debug/clk/clk_summary
>>>>            disp_cc_mdss_mdp_clk_src       1        1        0
>>>> 150000000          0     0  50000         ?
>>>>               disp_cc_mdss_mdp_clk       2        2        0
>>>> 150000000          0     0  50000         Y
>>>>
>>>
>>> But won't that just lower the performance state requested by the
>>> &mdss_mdp, while the &mdss still votes for NOM - with the outcome being
>>> that we maintain NOM even if the clock goes down?
>>
>> &mdss doesn't vote on performance state. At least it does not on
>> msm/msm-next which I have at hand right now.
>> &mdss toggles mdss_gdsc, but does not assign any performance state.
>>
> 
> Right, but per the upstream implementation, enabling MDSS_GDSC could in
> itself fail, because unless something else has driven up the performance
> state the enable that trickles up won't actually turn on the supply.
> 
>> On the other hand &mdss_mdp and &dsi0 clearly vote on mmcx's performance state.
>>
> 
> Right, but it does so as part of its clock scaling, so this makes
> perfect sense to me.
> 
>>>
>>>>>
>>>>>>> So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
>>>>>>> MMCX and then use opp-tables associated with the devices that scales the
>>>>>>> clock and thereby actually carries the "required-opps".
>>>>>>
>>>>>> Actually no. I set the performance state in the qcom_cc_map, so that
>>>>>> further register access is possible. Initially I was doing this in the
>>>>>> qcom_cc_really_probe() and it was already too late.
>>>>>> Just to remind: this patchset is not about MDSS_GDSC being parented by
>>>>>> MMCX, it is about dispcc/videocc registers being gated with MMCX.
>>>>>>
>>>>>
>>>>> So you're saying that just enabling MMCX isn't enough to touch the
>>>>> dispcc/videocc registers? If that's the case it seems like MMCX's
>>>>> definition of "on" needs to be adjusted - because just specifying MMCX
>>>>> as the power-domain for dispcc/videocc and enabling pm_runtime should
>>>>> ensure that MMCX is enabled when the clock registers are accessed (I
>>>>> don't see anything like that for the GDSC part though).
>>>>
>>>> No, it is not enough. If I comment out the set_performance_state call,
>>>> the board reboots.
>>>>
>>>> However I can set the opps as low as RET and register access will work.
>>>> I'll run more experiments and if everything works as expected, I can
>>>> use retention or min_svs level in the next iteration.
>>>> Just note that downstream specifies low_svs as minimum voltage level
>>>> for MMCX regulator.
>>>>
>>>
>>> It doesn't make sense to me that a lone power_on on the power-domain
>>> wouldn't give us enough juice to poke the registers.
>>>
>>> But digging into the rpmhpd implementation answers the question, simply
>>> invoking rpmhpd_power_on() is a nop, unless
>>> rpmhpd_set_performance_state() has previously been called, because
>>> pd->corner is 0. So this explains why enable isn't sufficient.
>>>
>>> Compare this with the rpmpd implementation that will send an
>>> enable request to the RPM in this case.

Right, in case of RPMh, there was no separate 'enable' request which
could be sent, there was just a 'corner' request.

I don't completely recall, but the reason to not send a 'default corner'
on enable was perhaps to keep the enable and set_performance orthogonal.

However, given we then decided to send the lowest possible corner
in disable, it perhaps makes sense to send a 'lowest non-zero corner' on enable
as well.

>>
>> Do you think that we should change that to:
>>
>> rpmhpd_aggregate_corner(pd, max(pd->corner, 1)) ?
>>
>> Or
>>
>> rpmhpd_aggregate_corner(pd, max(pd->corner, pd->levels[1])) ?
>>
> 
> In rpmhpd_power_on() and rpmhpd_set_performance_state() we pass the
> index of the entry in pd->levels[] that we want, but in
> rpmhpd_power_off() we pass the value of pd->levels[0].
> 
> So I would suggest dropping the if (pd->corner) and doing:
> 
>    rpmhpd_aggregate_corner(pd, max(pd->corner, 1));

So the index value represents the hlvl (0-15) that eventually gets sent to
rpmh, the pd->levels are the sparse vlvl values that come from the command
DB mappings.

What seems sane is to sent the lowest non-zero vlvl. That in most cases
would be at index 1, but for some which do not support complete off,
it could be at index 0.

> 
> And it seems both rb3 and rb5 still boots with this change (but I need
> to do some more testing to know for sure).
> 
>>>
>>>>> I thought our problem you had was that you need to set a
>>>>> performance_state in order to clock up some of the clocks - e.g.
>>>>> MDP_CLK.
>>>>
>>>> No, even register access needs proper perf state.
>>>>
>>>
>>> Per above finding you're right, enabling a rpmhpd power-domain doesn't
>>> do anything. And I don't find this intuitive or even in line with the
>>> expectations of the api...
>>>
>>>
>>>
>>> A quick test booting rb3 and rb5 seems to indicate that it's possible to
>>> initialize pd->corner to 1 (to ensure that enable at least gives us the
>>> lowest level).
>>>
>>> set_performance_state(0) will however then result in voting for "off",
>>> rather than the lowest enabled level.
>>
>> Well, set_performance_state(0) means that "the device wouldn't
>> participate anymore to find the target performance state of the
>> genpd".
> 
> I agree.
> 
>> Strictly speaking it does not specify whether it is ok to turn
>> it off or not. (like the regulator with the voltage set to 0V).
>> But I'd also like to hear a comment from Stephen here.
>>
> 
> Looking at other power-domains (e.g. gdsc and rpmpd) enabling the
> power-domain means it is no longer off and if you need some specific
> performance state you have to vote for that.
> 
> So I'm also interested in hearing if there's any reasoning behind how
> this was written.
> 
> Regards,
> Bjorn
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
