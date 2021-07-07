Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7265D3BECB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 18:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhGGRB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 13:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhGGRB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 13:01:29 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755A8C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 09:58:47 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p1so5516285lfr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zoUO7eAuNknTm44uKEkARyjaj036gjlBlWwYCrLOnCc=;
        b=vyhKJbV63g91lCVS1iYAKZQYD+753NHiMCozu3thfqgZ05AaUHS9UYq/QHp+onjVIj
         6aiwPDOVk8KWrQkJje88lkxhbsPiOMqUBYZKAIt8fseyk6+9GJv8eFpZKGc8h+rcFPAw
         ZOeCd2eh5al6WRLEn5N4Em65OEuq55Qhv/NP5lawh1VWGo01khL08PSNu7/iDVd6oemi
         w00o7hX6AHWor6KyrK1TtepTZ9zgNoKDg8hpZJA0IbnfUvGa0FHazmBBNrVTfNaa6u5D
         p29tjt7OEuboEeUmJLD0aG+h8FwE/NQ0ldQgxA4niGv+eCGiKnHo8rmw5C+ZWvSQtpCr
         LI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zoUO7eAuNknTm44uKEkARyjaj036gjlBlWwYCrLOnCc=;
        b=YsIQ7b03p+9QW5597jNMYtBVxyrezbxIxpVSX8MdRrdeBlfWGyClLF5Unqmc9Y+jNb
         NpTyzUrtUvDexmN6s7wqbC5UrLS3IQcXQ+V/qwhKng2pwi+qCDsmpVtL4rZSXLaCIfyF
         AYZMndA1bDvIFPK7XYJiuur3rmujyD818hnc58ftDa3dGPq0JWmuhsXpd7gPAODlawf+
         3nyStC32llciQd88zZXi5+kC6ntuNQPN71hpcWk+ovKLAZJ1UGlwqX+wsgHrNCAlaU63
         1n+bOje4x2yrCUZdp0L1pNzj5dnKg6nFhJmgRXKc6s1engJoNQX3UKe9nRqQWR+p29/b
         EebQ==
X-Gm-Message-State: AOAM5337fyKv+yfxF2ndGE+M6/LMJCNmVtCHA0C/j3k9pANQ9V9nP2Jk
        wT8+Ymt6nWuIOYqfyZbkU6NQvA==
X-Google-Smtp-Source: ABdhPJy3VvAVrZVPQrLwGCwzbFGeEg5PbEu3Ebt0mmjibnHOGSvVB7eyEtG/aiQ8c23krFIlsBn41g==
X-Received: by 2002:a19:505a:: with SMTP id z26mr18795696lfj.470.1625677124305;
        Wed, 07 Jul 2021 09:58:44 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp15sm1501780lfb.141.2021.07.07.09.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 09:58:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org>
 <cacd1a1f-01c8-b913-23e5-538a772cd118@codeaurora.org>
 <CAOCOHw4sufqC3=ixNud8Oz7vO0_ZcO8u5mqNQTKLZX4LGe9aow@mail.gmail.com>
 <c4440f5e-592c-b849-3ca7-57e812de2df5@codeaurora.org> <YOUyRrvdPLkbTqUp@yoga>
 <534fca70-d277-4154-b932-a4d6ab3b0b66@codeaurora.org>
 <YOXM6l0oRhpMKr+9@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d0022d1a-d45a-838e-222c-15a828051f7f@linaro.org>
Date:   Wed, 7 Jul 2021 19:58:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOXM6l0oRhpMKr+9@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2021 18:48, Bjorn Andersson wrote:
> On Wed 07 Jul 01:31 CDT 2021, Rajendra Nayak wrote:
> 
>>
>>
>> On 7/7/2021 10:19 AM, Bjorn Andersson wrote:
>>> On Mon 05 Jul 00:40 CDT 2021, Rajendra Nayak wrote:
>>>> On 7/5/2021 10:36 AM, Bjorn Andersson wrote:
>>>>> On Sun, Jul 4, 2021 at 11:27 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 7/3/2021 6:24 AM, Bjorn Andersson wrote:
>>>>>>> rpmhpd_aggregate_corner() takes a corner as parameter, but in
>>>>>>> rpmhpd_power_off() the code requests the level of the first corner
>>>>>>> instead.
>>>>>>>
>>>>>>> In all (known) current cases the first corner has level 0, so this
>>>>>>> change should be a nop, but in case that there's a power domain with a
>>>>>>> non-zero lowest level this makes sure that rpmhpd_power_off() actually
>>>>>>> requests the lowest level - which is the closest to "power off" we can
>>>>>>> get.
>>>>>>>
>>>>>>> While touching the code, also skip the unnecessary zero-initialization
>>>>>>> of "ret".
>>>>>>>
>>>>>>> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/soc/qcom/rpmhpd.c | 5 ++---
>>>>>>>      1 file changed, 2 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>>>>>>> index 2daa17ba54a3..fa209b479ab3 100644
>>>>>>> --- a/drivers/soc/qcom/rpmhpd.c
>>>>>>> +++ b/drivers/soc/qcom/rpmhpd.c
>>>>>>> @@ -403,12 +403,11 @@ static int rpmhpd_power_on(struct generic_pm_domain *domain)
>>>>>>>      static int rpmhpd_power_off(struct generic_pm_domain *domain)
>>>>>>>      {
>>>>>>>          struct rpmhpd *pd = domain_to_rpmhpd(domain);
>>>>>>> -     int ret = 0;
>>>>>>> +     int ret;
>>>>>>>
>>>>>>>          mutex_lock(&rpmhpd_lock);
>>>>>>>
>>>>>>> -     ret = rpmhpd_aggregate_corner(pd, pd->level[0]);
>>>>>>> -
>>>>>>> +     ret = rpmhpd_aggregate_corner(pd, 0);
>>>>>>
>>>>>> This won't work for cases where pd->level[0] != 0, rpmh would just ignore this and keep the
>>>>>> resource at whatever corner it was previously at.
>>>>>> (unless command DB tells you a 0 is 'valid' for a resource, sending a 0 is a nop)
>>>>>> The right thing to do is to send in whatever command DB tells you is the lowest level that's valid,
>>>>>> which is pd->level[0].
>>>>>>
>>>>>
>>>>> I'm afraid this doesn't make sense to me.
>>>>>
>>>>> In rpmh_power_on() if cmd-db tells us that we have [0, 64, ...] and we
>>>>> request 64 we rpmhpd_aggregate_corner(pd, 1); but in power off, if
>>>>> cmd-db would provide [64, ...] we would end up sending
>>>>> rpmhpd_aggregate_corner(pd, 64);
>>>>> So in power_on we request the corner (i.e. index in the array provided
>>>>> in cmd-db) and in power-off the same function takes the level?
>>>>
>>>> ah that's right, I did not read the commit log properly and got confused.
>>>
>>> Thanks for confirming my understanding.
>>>
>>>> Looks like this bug existed from the day this driver for merged :/, thanks
>>>> for catching it.
>>>> Does it make sense to also mark this fix for stable?
>>>>
>>>
>>> I can certainly add a Cc: stable@ as I'm applying this.
>>
>> sure, sounds good
>>> May I have your R-b?
>>
>> Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>
>>
> 
> Thank you.
> 
>>>
>>> PS. Do you have any input on patch 2/2? That actually solves a practical
>>> problem we're seeing. Would it perhaps aid in your need for the new
>>> "assigned-opp-level" property?
>>
>> We would perhaps still need the 'assigned-opp-level' or equivalent since
>> the default requirement of devices is not always the least level supported,
>> in some cases it might be slightly higher corner which would then need to
>> be set explicitly.
>>
> 
> Right, for situations where we use assign-clock-rates to drive up the
> clock rate this mechanism might be needed in order to keep things
> stable.
> 
> But I presume as soon as you have some sort of dynamic nature to that
> you'll be back to an opp-table and the means we already have.
> 
>> I was hoping on getting some more testing done with that patch especially for
>> any regression on the sc7180 and sc7280 devices, which I haven't got to yet.
>> Are you getting these patches ready for merge for the -rc cycle or for the
>> next merge window?
>>
> 
> That would be much appreciated, I've not done extensive testing myself,
> mostly just booted a few different boards.
> 
> But I would like to see us correct the MDSS_GDSC->MMCX setup in time for
> v5.15, in particular since we have a few new users of the mmcx
> power-domain-regulator arriving in this cycle.

I will rebase my patches on top of this patch series and submit soon.


-- 
With best wishes
Dmitry
