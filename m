Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75AEE3FF5D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 23:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347537AbhIBVu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 17:50:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30418 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243323AbhIBVu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 17:50:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630619399; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ylk0Ou+4w2EHSmG7+AYspOW2j8fJqOqntk80Yg+jlC4=; b=axksHMYzIWHy/zB4LPDUjCmaVImuQphYYRWOeJA1PaejXRHvykjZ4wxOVuCfDfxBt6AqloHr
 isONvM8Azgx8wpnFESFQMIqoduqlkM+oy30iLWL/yfhbhivXyuFZdSAM80I/oujiCYiGrM3m
 GSQeQm6ETlu1Qb18FjejCAdcL1s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 613146f41567234b8c504188 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 21:49:40
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A634DC43618; Thu,  2 Sep 2021 21:49:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (cpe-76-176-73-171.san.res.rr.com [76.176.73.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F2285C4360D;
        Thu,  2 Sep 2021 21:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F2285C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
To:     Paul Davey <Paul.Davey@alliedtelesis.co.nz>,
        "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
        "bbhatt@codeaurora.org" <bbhatt@codeaurora.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
 <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
 <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
 <ce8082f8ecd6bea2961d8841ea6eb1c14b5a34dd.camel@alliedtelesis.co.nz>
 <2b1cbecf50a57a229e30d1bff060d0e241e2841a.camel@alliedtelesis.co.nz>
 <05e4ff6f-5118-6afb-a000-81d07e5b1078@quicinc.com>
 <79ff6d38e6ab2509a88e7ba860063790fbcbf1ec.camel@alliedtelesis.co.nz>
 <bbac581950a84aef245abff92660fd7c2b977d16.camel@alliedtelesis.co.nz>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <832109c4-9b38-4bc9-1b5c-aa43deae74d4@codeaurora.org>
Date:   Thu, 2 Sep 2021 14:49:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bbac581950a84aef245abff92660fd7c2b977d16.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Paul,

On 8/31/2021 10:17 PM, Paul Davey wrote:
> On Fri, 2021-08-27 at 16:51 +1200, Paul Davey wrote:
>> On Thu, 2021-08-26 at 09:54 -0600, Jeffrey Hugo wrote:
>>> On 8/23/2021 12:47 AM, Paul Davey wrote:
>>>> Hi Hemant, Jeffery
>>>>
>>>> I have some more information after some testing.
>>>>
>>>>>> Do you have a log which prints the TRE being processed?
>>>>>> Basically i
>>>>>> am
>>>>>> trying understand this : by the time you get double free
>>>>>> issue,
>>>>>> is
>>>>>> there
>>>>>> any pattern with respect to the TRE that is being processed.
>>>>>> For
>>>>>> example
>>>>>> when host processed the given TRE for the first time with
>>>>>> RP1,
>>>>>> stale
>>>>>> TRE
>>>>>> was posted by Event RP2 right after RP1
>>>>>>
>>>>>> ->RP1 [TRE1]
>>>>>> ->RP2 [TRE1]
>>>>>>
>>>>>> or occurrence of stale TRE event is random?
>>>>
>>>> [...]
>>>
>>
>> Secondly we saw the following pattern in completion events:
>>
>> mhi mhi0: (IP_HW0_MBIM-Up) Completion Event code: 2 length: 5e2 ptr:
>> 7c4004e0
>> mhi mhi0: (IP_HW0_MBIM-Up) Completion Event code: 2 length: 5e2 ptr:
>> 7c400520
>> mhi mhi0: (IP_HW0_MBIM-Up) Completion Event code: 2 length: 5e2 ptr:
>> 7c4004c0
>> mhi mhi0: (IP_HW0_MBIM-Up) Completion Event code: 2 length: 5e2 ptr:
>> 7c4004b0
>> mhi mhi0: (IP_HW0_MBIM-Up) Completion Event code: 2 length: 5e2 ptr:
>> 7c4004a0
>>
>> Here we can see that instead of a completion event for 7c4004d0 we
>> have
>> one for 7c400520 which is significantly ahead of the other point and
>> from the list of TREs I store in mhi_gen_tre I suspect that 7c400520
>> is
>> the next TRE to be used in the TRE ring at this time, as the other
>> information shows it would be the oldest entry in that list.  I am
>> not
>> sure what could have caused this but this is a different case to the
>> modem repeating the same TRE in a completion event.
>>
> 
> 
> I have considered the code further, and while I have seen cases of
> identical TRE completion events occurring, I do not think these result
> in the double free case because if the event is actually the same as
> the last one then the new dev_rp which parse_xfer_event will attempt to
> advance the local_rp to will already be equal to the local_rp and the
> whole loop will be skipped in the first place.  The troublesome
> behaviour comes from the case I describe above where a jump to a
> "future" TRE's completion event seems to occur followed by a
> continuation of the order, this results in the tre_ring rp being
> advanced to that future TRE and then the next completion event
> following the previous ordered pattern would be before that rp location
> and the loop will run through the entire tre_ring to reach the new rp
> location.
> 
> 
> I do have another question though, the driver code seems to in some
> cases take the mhi_chan->lock when updating the doorbell register, but
> not when queueing new transfers.  What is the actual purpose of this
> lock and why does it seem so inconsistently used?  Is there any chance
> that some of my problems may be the result of queueing new transfers
> racing somehow with completion event processing?
Are you pointing to MHI_EV_CC_OOB and MHI_EV_CC_DB_MODE completion code 
? To prove that race condition you disable burst mode as an experiment

In pci_generic.c
#define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring)

- .doorbell = MHI_DB_BRST_ENABLE
+ .doorbell = MHI_DB_BRST_DISABLE

I agree that locking is an issue in that case as we are taking 
read/write channel lock in parse_xfer_event and using only pm_lock in 
queue API.

Thanks,
Hemant
> 
> Thanks,
> Paul
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
