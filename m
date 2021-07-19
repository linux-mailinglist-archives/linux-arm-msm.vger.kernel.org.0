Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939C33CD103
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jul 2021 11:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235475AbhGSI5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 04:57:13 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56941 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbhGSI5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 04:57:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626687473; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yuobTibszBLHrlScnwB6xsPnw6iCLrRiyIJpvjO0O4s=; b=q8SIJ7DlDAO0jxZk/9d5xV17vdAcWOut6GKH+NA2RmFj0UFNnswunvdJ3wzf999SIGMdKOmC
 uWZEtre47HqMxyn8PylrEDXMCK4xXj1DaVOfVPl0y3IpZS+OgpOPH0bmyk2MIyKfAuT++06K
 kDFMY7zcSbjVEYXBUTVE6kx8LHM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f547d438fa9bfe9c822c08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Jul 2021 09:37:24
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AD607C4338A; Mon, 19 Jul 2021 09:37:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.50.42.221] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CBE2C433D3;
        Mon, 19 Jul 2021 09:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CBE2C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 2/2] arm64: dts: sc7180: Add required-opps for i2c
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     ulf.hansson@linaro.org, viresh.kumar@linaro.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rojay@codeaurora.org, stephan@gerhold.net
References: <1626429658-18961-1-git-send-email-rnayak@codeaurora.org>
 <1626429658-18961-3-git-send-email-rnayak@codeaurora.org>
 <YPHpsO5LlQRQxj9y@yoga>
 <CAE-0n53CHD8c7C4ETWRgzmZmFSCcBw46wSs4pKbYMRjA_tD3yg@mail.gmail.com>
 <YPHxfHPC/faq/y+J@yoga>
 <CAE-0n50qx80cMFPJ1x9rc+EMR1L+j2CUMyDjWAbnE9mPHjf-TQ@mail.gmail.com>
 <YPIBK/NJgBNZVI8Y@yoga>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <12711a61-e16c-d2bc-6e04-ab94c7551abe@codeaurora.org>
Date:   Mon, 19 Jul 2021 15:07:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPIBK/NJgBNZVI8Y@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/17/2021 3:29 AM, Bjorn Andersson wrote:
> On Fri 16 Jul 16:49 CDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-07-16 13:52:12)
>>> On Fri 16 Jul 15:21 CDT 2021, Stephen Boyd wrote:
>>>
>>>> Quoting Bjorn Andersson (2021-07-16 13:18:56)
>>>>> On Fri 16 Jul 05:00 CDT 2021, Rajendra Nayak wrote:
>>>>>
>>>>>> qup-i2c devices on sc7180 are clocked with a fixed clock (19.2 MHz)
>>>>>> Though qup-i2c does not support DVFS, it still needs to vote for a
>>>>>> performance state on 'CX' to satisfy the 19.2 Mhz clock frequency
>>>>>> requirement.
>>>>>>
>>>>>
>>>>> Sounds good, but...
>>>>>
>>>>>> Use 'required-opps' to pass this information from
>>>>>> device tree, and also add the power-domains property to specify
>>>>>> the CX power-domain.
>>>>>>
>>>>>
>>>>> ..is the required-opps really needed with my rpmhpd patch in place?
>>>>>
>>>>
>>>> Yes? Because rpmhpd_opp_low_svs is not the lowest performance state for
>>>> CX.
>>>
>>> On e.g. sm8250 the first available non-zero corner presented in cmd-db
>>> is low_svs.

what rail is this? the mmcx? Perhaps it does not support RET.
cx usually supports both collapse state and RET.

>>
>> Indeed. On sc7180 it's not the first non-zero corner. I suppose
>> retention for CX isn't actually used when the SoC is awake so your
>> rpmhpd patch is putting in a vote for something that doesn't do anything
>> at runtime for CX? I imagine that rpmh only sets the aggregate corner to
>> retention when the whole SoC is suspended/sleeping, otherwise things
>> wouldn't go very well. Similarly, min_svs may be VDD minimization? If
>> so, those first two states are basically states that shouldn't be used
>> at runtime, almost like sleep states.
>>
> 
> But if that's the case, I don't think it's appropriate for the "enabled
> state" of the domain to use any of those corners.

I rechecked the downstream kernels where all this voting happens from within
the clock drivers, and I do see votes to min_svs for some clocks, but Stephen is
right that RET is not something that's voted on while in active state.

But always going with something just above the ret level while active will also
not work for all devices, for instance for i2c on 7180, it needs a cx vote of
low svs while the rail (cx) does support something lower than that which is min svs.
(why can't it just work with min svs?, I don't know, these values and recommendations
come in from the voltage plans published by HW teams for every SoC and we just end up
using them in SW, perhaps something to dig further and understand which I will try and
do but these are the values in voltage plans and downstream kernels which work for now)

> 
> As this means that anyone who needs any of the rpmhpd domains active
> also needs to specify required-opps, which wouldn't be needed for any
> other power domain provider.
> 
> And more importantly it means that a device sitting in a GDSC, which
> would be parented by a rpmhpd domain has no way to specify the GDSC and
> trickle the minimum-vote up to the rpmhpd domain. (And I know that we
> don't describe the parentship of the GDSCs today, but this patch
> tells me that it's around the corner - for more than MMCX)
> 
> Regards,
> Bjorn
> 
>>>
>>> And if this (which?) clock requires a higher corner than the lowest
>>> possible in order to tick at this "lowest" frequency, I'm certainly
>>> interested in some more details.
>>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
