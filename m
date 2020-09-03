Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEB025BA29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 07:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgICFfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 01:35:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26496 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbgICFfw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 01:35:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599111350; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=QxLbEY4fPM95K18HKZ88A52NMY5/8p3x1bABMOpDSXY=; b=roK2ytz6o1fHZ3KZeN8RPocqGlhXG56E8X461hWLa9NQqIy8HOqvEjAemyWCjwwJOY0i4RoP
 M9qv6fdS+yt2J4RQ8vvjAMe9HzXX/QWnpzDFVr1VM5xdIQSc+KE3hhPZ01/7hokRIOZOz2gC
 cSO7DjqR5aTZ5KdGAz4PhdspKHk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f507f94be06707b345a92d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 05:31:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF05CC4339C; Thu,  3 Sep 2020 05:30:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.16] (unknown [61.3.23.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D24E1C433C6;
        Thu,  3 Sep 2020 05:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D24E1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for CPU
 thermal zones
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
 <20200901170745.GA3419728@google.com>
 <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
 <8ad0589e-102d-7523-899f-0ebe85b7d2b8@codeaurora.org>
 <CAD=FV=XKUEQP3gyE8E2UOE12qKYwzgMp0eNeYjCp0DxPDACSMQ@mail.gmail.com>
 <6693eed6-9a6b-48c8-e56e-acdde9cf9ffe@codeaurora.org>
Message-ID: <f77d9b24-dbca-cea0-2ef8-3c5cf0c2f2dd@codeaurora.org>
Date:   Thu, 3 Sep 2020 11:00:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6693eed6-9a6b-48c8-e56e-acdde9cf9ffe@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/3/2020 10:14 AM, Rajendra Nayak wrote:
> 
> On 9/2/2020 9:02 PM, Doug Anderson wrote:
>> Hi,
>>
>> On Tue, Sep 1, 2020 at 10:36 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>>
>>>
>>>> * In terms of the numbers here, I believe that you're claiming that we
>>>> can dissipate 768 mW * 6 + 1202 mW * 2 = ~7 Watts of power.  My memory
>>>> of how much power we could dissipate in previous laptops I worked on
>>>> is a little fuzzy, but that doesn't seem insane for a passively-cooled
>>>> laptop.  However, I think someone could conceivably put this chip in a
>>>> smaller form factor.  In such a case, it seems like we'd want these
>>>> things to sum up to ~2000 (if it would ever make sense for someone to
>>>> put this chip in a phone) or ~4000 (if it would ever make sense for
>>>> someone to put this chip in a small tablet).  It seems possible that,
>>>> to achieve this, we might have to tweak the
>>>> "dynamic-power-coefficient".
>>>
>>> DPC values are calculated (at a SoC) by actually measuring max power at various
>>> frequency/voltage combinations by running things like dhrystone.
>>> How would the max power a SoC can generate depend on form factors?
>>> How much it can dissipate sure is, but then I am not super familiar how
>>> thermal frameworks end up using DPC for calculating power dissipated,
>>> I am guessing they don't.
>>>
>>>> I don't know how much thought was put
>>>> into those numbers, but the fact that the little cores have a super
>>>> round 100 for their dynamic-power-coefficient makes me feel like they
>>>> might have been more schwags than anything.  Rajendra maybe knows?
>>>
>>> FWIK, the values are always scaled and normalized to 100 for silver and
>>> then used to derive the relative DPC number for gold. If you see the DPC
>>> for silver cores even on sdm845 is a 100.
>>> Again these are not estimations but based on actual power measurements.
>>
>> The scaling to 100 doesn't seem to match how the thermal framework is
>> using them.  Take a look at of_cpufreq_cooling_register().  It takes
>> the "dynamic-power-coefficient" and passes it as "capacitance" into
>> __cpufreq_cooling_register().  That's eventually used to compute
>> power, which is documented in the code to be in mW.
>>
>> power = (u64)capacitance * freq_mhz * voltage_mv * voltage_mv;
>> do_div(power, 1000000000);
>>
>> /* power is stored in mW */
>> freq_table[i].power = power;
>>
>> That's used together with "sustainable-power", which is the attribute
>> that Matthias is trying to set.  That value is documented to be in mW
>> as well.
>>
>> ...so if the silver cores are always scaled to 100 regardless of how
>> much power they actually draw then it'll be impossible to actually
>> think about "sustainable-power" as a mW value.  Presumably we either
>> need to accept that fact (and ideally document it) or we need to
>> change the values for silver / gold cores (we could still keep the
>> relative values the same and just scale them).
> 
> That sounds reasonable (still keep the relative values and scale them)
> I'll get back on what those scaled numbers would look like, and try to
> get some sense of why this scaling to 100 was done (like you said
> I don't see any documentation on this), but I see atleast a few other non-qcom
> SoCs doing this too in mainline (like rockchip/rk3399)

On second thoughts, why wouldn't a relative 'sustainable-power' value work?
On every device, one would need to do the exercise that Matthias did to come
up with the OPP at which we can sustain max CPU/GPU loads anyway.
I mean even if we do change the DPC values to match actual power, Matthias would
still observe that we can sustain at the very same OPP and not any different.
Its just that the mW values that are passed to kernel are relative and not
absolute. My worry is that perhaps no SoC vendor wants to put these absolute numbers
out.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
