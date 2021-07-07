Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9713BE32F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 08:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhGGGea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 02:34:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41010 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhGGGe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 02:34:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625639510; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ORSL9Q/hfYBNgLWGbd3sA9EpU/yVvo+awtIkSaX2qWw=; b=rdAJHMrFmOEMEOh7qICBw0gPZizPsXXR8ceMXZT1P0LjluD8F/9jH2eb//OLjL2DjqFnRMS4
 nO/WA8fcLeuTyaJucafkn/9EbFmCMpYfzqon7f4zaDNQ4zMdo8QnLFHV3nxelPakxoLi7Zwr
 VQVGefAXr8mwLEmu7N1GYDnVHFo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60e54a50ad0600eedefdff56 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Jul 2021 06:31:44
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9262FC433F1; Wed,  7 Jul 2021 06:31:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.50.35.89] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B36BC433F1;
        Wed,  7 Jul 2021 06:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B36BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org>
 <cacd1a1f-01c8-b913-23e5-538a772cd118@codeaurora.org>
 <CAOCOHw4sufqC3=ixNud8Oz7vO0_ZcO8u5mqNQTKLZX4LGe9aow@mail.gmail.com>
 <c4440f5e-592c-b849-3ca7-57e812de2df5@codeaurora.org> <YOUyRrvdPLkbTqUp@yoga>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <534fca70-d277-4154-b932-a4d6ab3b0b66@codeaurora.org>
Date:   Wed, 7 Jul 2021 12:01:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOUyRrvdPLkbTqUp@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/7/2021 10:19 AM, Bjorn Andersson wrote:
> On Mon 05 Jul 00:40 CDT 2021, Rajendra Nayak wrote:
>> On 7/5/2021 10:36 AM, Bjorn Andersson wrote:
>>> On Sun, Jul 4, 2021 at 11:27 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>>>
>>>>
>>>>
>>>> On 7/3/2021 6:24 AM, Bjorn Andersson wrote:
>>>>> rpmhpd_aggregate_corner() takes a corner as parameter, but in
>>>>> rpmhpd_power_off() the code requests the level of the first corner
>>>>> instead.
>>>>>
>>>>> In all (known) current cases the first corner has level 0, so this
>>>>> change should be a nop, but in case that there's a power domain with a
>>>>> non-zero lowest level this makes sure that rpmhpd_power_off() actually
>>>>> requests the lowest level - which is the closest to "power off" we can
>>>>> get.
>>>>>
>>>>> While touching the code, also skip the unnecessary zero-initialization
>>>>> of "ret".
>>>>>
>>>>> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>> ---
>>>>>     drivers/soc/qcom/rpmhpd.c | 5 ++---
>>>>>     1 file changed, 2 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>>>>> index 2daa17ba54a3..fa209b479ab3 100644
>>>>> --- a/drivers/soc/qcom/rpmhpd.c
>>>>> +++ b/drivers/soc/qcom/rpmhpd.c
>>>>> @@ -403,12 +403,11 @@ static int rpmhpd_power_on(struct generic_pm_domain *domain)
>>>>>     static int rpmhpd_power_off(struct generic_pm_domain *domain)
>>>>>     {
>>>>>         struct rpmhpd *pd = domain_to_rpmhpd(domain);
>>>>> -     int ret = 0;
>>>>> +     int ret;
>>>>>
>>>>>         mutex_lock(&rpmhpd_lock);
>>>>>
>>>>> -     ret = rpmhpd_aggregate_corner(pd, pd->level[0]);
>>>>> -
>>>>> +     ret = rpmhpd_aggregate_corner(pd, 0);
>>>>
>>>> This won't work for cases where pd->level[0] != 0, rpmh would just ignore this and keep the
>>>> resource at whatever corner it was previously at.
>>>> (unless command DB tells you a 0 is 'valid' for a resource, sending a 0 is a nop)
>>>> The right thing to do is to send in whatever command DB tells you is the lowest level that's valid,
>>>> which is pd->level[0].
>>>>
>>>
>>> I'm afraid this doesn't make sense to me.
>>>
>>> In rpmh_power_on() if cmd-db tells us that we have [0, 64, ...] and we
>>> request 64 we rpmhpd_aggregate_corner(pd, 1); but in power off, if
>>> cmd-db would provide [64, ...] we would end up sending
>>> rpmhpd_aggregate_corner(pd, 64);
>>> So in power_on we request the corner (i.e. index in the array provided
>>> in cmd-db) and in power-off the same function takes the level?
>>
>> ah that's right, I did not read the commit log properly and got confused.
> 
> Thanks for confirming my understanding.
> 
>> Looks like this bug existed from the day this driver for merged :/, thanks
>> for catching it.
>> Does it make sense to also mark this fix for stable?
>>
> 
> I can certainly add a Cc: stable@ as I'm applying this.

sure, sounds good
  
> May I have your R-b?

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
> PS. Do you have any input on patch 2/2? That actually solves a practical
> problem we're seeing. Would it perhaps aid in your need for the new
> "assigned-opp-level" property?

We would perhaps still need the 'assigned-opp-level' or equivalent since
the default requirement of devices is not always the least level supported,
in some cases it might be slightly higher corner which would then need to
be set explicitly.

I was hoping on getting some more testing done with that patch especially for
any regression on the sc7180 and sc7280 devices, which I haven't got to yet.
Are you getting these patches ready for merge for the -rc cycle or for the
next merge window?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
