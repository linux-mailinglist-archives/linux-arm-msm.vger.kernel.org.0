Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09FB3BF4EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 07:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhGHFGp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 01:06:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29504 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229644AbhGHFGn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 01:06:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625720642; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Bmtb2+dcXVz0RPexDRJ8WNuL5FB2CDC6OCQ8750mwHo=; b=BQFeRr56lGmHdQwRiljyMl/wivsJQl8ab4KcrbizZBWLu08AbbgnNrBaum+QUOp2umpZOdBd
 4SIdhuFMzpxKa1mQHs0zUCxxSBI8nDAJrSo25GXfGnopeMd5KPs2wouEU0A2ivtW/iwWyQOr
 u90XrGxOQbVBh8cdfDa55G4ErCk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60e68740ec0b18a7452eff85 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 05:04:00
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4B7F6C433D3; Thu,  8 Jul 2021 05:03:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.50.35.89] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 464CFC433D3;
        Thu,  8 Jul 2021 05:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 464CFC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org>
 <CAE-0n50EvG4qV0n+Ag+dvFxKKasnUzwH=MA+f-jsgDdBqaqziQ@mail.gmail.com>
 <YOaAqAqldq3Hyiva@yoga>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <8da6e99f-ae80-b9a5-4fe9-6cc467ea65d0@codeaurora.org>
Date:   Thu, 8 Jul 2021 10:33:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOaAqAqldq3Hyiva@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/8/2021 10:05 AM, Bjorn Andersson wrote:
> On Wed 07 Jul 19:21 CDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-07-02 17:54:15)
>>> rpmhpd_aggregate_corner() takes a corner as parameter, but in
>>> rpmhpd_power_off() the code requests the level of the first corner
>>> instead.
>>>
>>> In all (known) current cases the first corner has level 0, so this
>>> change should be a nop, but in case that there's a power domain with a
>>> non-zero lowest level this makes sure that rpmhpd_power_off() actually
>>> requests the lowest level - which is the closest to "power off" we can
>>> get.
>>>
>>> While touching the code, also skip the unnecessary zero-initialization
>>> of "ret".
>>>
>>> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>
>> I think this is why qcom folks talk about "virtual corner" and "physical
>> corner" because there's the one in command DB and the one in hardware.
> 
> I think the driver uses "level" and "corner" to denote the two different
> number spaces, so I think we're good...now that we after this patch
> don't pass a "level" as "corner" during power_off ;)
> 
>> Maybe we should change rpmhpd_aggregate_corner() to call the argument
>> 'vcorner'?
> 
> So "virtual corner" is "corner" and "physical corner" is level? I.e. 256
> is a "physical corner"?

I haven't heard of anything called a 'physical corner'. These were always
referred to as virtual corners, on older platforms it was just one contiguous
number space, on newer ones we added another higher level sparse number space
just for more fun :)
Command DB refers to these as hlvl and vlvl, I haven;t yet figured out what their
full forms are :/

> 
> Or did you get the suggestion backwards?
> 
>> Unfortunately we can't really build a type system here to
>> make this problem easy to catch with a mismatched type, unless there's
>> some sort of typedef trick we can play?
>>
> 
> s/i/corner/ in rpmhpd_set_performance_state() would further enforce the
> naming scheme used and reduce the risk for future confusion.
> 
> But we did just squash the final bug... ;)
> 
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Thanks,
> Bjorn
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
