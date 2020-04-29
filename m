Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2CB1BDFD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 16:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgD2N77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:59:59 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:32817 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726948AbgD2N76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:59:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588168797; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dy1iDvMw3gJYPoh1J9Wwrp627qECY08lDEDYIsBE0wA=;
 b=GussX9xc25mumnlLuAQdGWfqfn3g67m261krvt6+CVWv5zqpGIRXTkarZ3+FYFao5MRtSkVN
 lT1uqzjoCaz3wFYrwzHPO8CWESSPjKnleftaRUFQ2DJktdQahGWNQWi8cuIeoIsOHMOLDuTM
 8+pX02vsBLcMeayTkzegZ75pFcI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea98853.7fa9b45a52d0-smtp-out-n02;
 Wed, 29 Apr 2020 13:59:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE6A8C43637; Wed, 29 Apr 2020 13:59:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE7C6C433D2;
        Wed, 29 Apr 2020 13:59:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 29 Apr 2020 19:29:45 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        swboyd@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
In-Reply-To: <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
 <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org>
 <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
Message-ID: <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-29 19:19, Suzuki K Poulose wrote:
> On 04/29/2020 12:47 PM, Sai Prakash Ranjan wrote:
>> On 2020-04-28 17:53, Sai Prakash Ranjan wrote:
>>> On 2020-04-27 19:23, Suzuki K Poulose wrote:
>>>> On 04/27/2020 10:45 AM, Mike Leach wrote:
>>> [...]
>>>>>> 
>>>>>> This is not sufficient. You must prevent another session trying to
>>>>>> enable the other port of the replicator as this could silently 
>>>>>> fail
>>>>>> the "on-going" session. Not ideal. Fail the attempt to enable a 
>>>>>> port
>>>>>> if the other port is active. You could track this in software and
>>>>>> fail early.
>>>>>> 
>>>>>> Suzuki
>>>>> 
>>>>> While I have no issue in principle with not enabling a path to a 
>>>>> sink
>>>>> that is not in use - indeed in some cases attaching to unused sinks
>>>>> can cause back-pressure that slows throughput (cf TPIU) - I am
>>>>> concerned that this modification is masking an underlying issue 
>>>>> with
>>>>> the platform in question.
>>>>> 
>>>>> Should we decide to enable the diversion of different IDs to 
>>>>> different
>>>>> sinks or allow different sessions go to different sinks, then this 
>>>>> has
>>>>> potential to fail on the SC7180 SoC - and it will be difficult in
>>>>> future to associate a problem with this discussion.
>>>> 
>>>> Mike,
>>>> 
>>>> I think thats a good point.
>>>> Sai, please could we narrow down this to the real problem and may be
>>>> work around it for the "device" ? Do we know which sink is causing 
>>>> the
>>>> back pressure ? We could then push the "work around" to the 
>>>> replicator
>>>> it is connected to.
>>>> 
>>>> Suzuki
>>> 
>>> Hi Suzuki, Mike,
>>> 
>>> To add some more to the information provided earlier,
>>> swao_replicator(6b06000) and etf are
>>> in AOSS (Always-On-SubSystem) group. Also TPIU(connected to
>>> qdss_replicator) and EUD(connected
>>> to swao_replicator) sinks are unused.
>>> 
>>> Please ignore the id filter values provided earlier.
>>> Here are ID filter values after boot and before enabling replicator. 
>>> As per
>>> these idfilter values, we should not try to enable replicator if its 
>>> already
>>> enabled (in this case for swao_replicator) right?
>>> 
>>> localhost ~ # cat
>>> /sys/bus/amba/devices/6b06000.replicator/replicator1/mgmt/idfilter0
>>> 0x0
>>> localhost ~ # cat
>>> /sys/bus/amba/devices/6b06000.replicator/replicator1/mgmt/idfilter1
>>> 0x0
>>> 
>>> localhost ~ # cat
>>> /sys/bus/amba/devices/6046000.replicator/replicator0/mgmt/idfilter0
>>> 0xff
>>> localhost ~ # cat
>>> /sys/bus/amba/devices/6046000.replicator/replicator0/mgmt/idfilter1
>>> 0xff
>>> 
>> 
>> Looking more into replicator1(swao_replicator) values as 0x0 even 
>> after replicator_reset()
>> in replicator probe, I added dynamic_replicator_reset in 
>> dynamic_replicator_enable()
>> and am not seeing any hardlockup. Also I added some prints to check 
>> the idfilter
>> values before and after reset and found that its not set to 0xff even 
>> after replicator_reset()
>> in replicator probe, I don't see any other path setting it to 0x0.
>> 
>> After probe:
>> 
>> [    8.477669] func replicator_probe before reset replicator 
>> replicator1 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
>> [    8.489470] func replicator_probe after reset replicator 
>> replicator1 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> 
> AFAICS, after the reset both of them are set to 0xff.

Yes I see this too as we call replicator_reset() in probe. What I wanted 
to highlight was the below part where it is set to 0x0 before enabling 
dynamic replicator.

> 
>> [    8.502738] func replicator_probe before reset replicator 
>> replicator0 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
>> [    8.515214] func replicator_probe after reset replicator 
>> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> 
> 
> 
>> localhost ~ #
>> localhost ~ #
>> localhost ~ # echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> localhost ~ #
>> localhost ~ # echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>> [   58.490485] func dynamic_replicator_enable before reset replicator 
>> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>> [   58.503246] func dynamic_replicator_enable after reset replicator 
>> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>> [   58.520902] func dynamic_replicator_enable before reset replicator 
>> replicator1 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
> 
> You need to find what is resetting the IDFILTERs to 0 for replicator1.
> 

That is right.

>> [   58.533500] func dynamic_replicator_enable after reset replicator 
>> replicator1 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>> localhost ~ #
>> 
>> Can we have a replicator_reset in dynamic_replicator_enable?
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c 
>> b/drivers/hwtracing/coresight/coresight-replicator.c
>> index e7dc1c31d20d..794f8e4c049f 100644
>> --- a/drivers/hwtracing/coresight/coresight-replicator.c
>> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
>> @@ -68,6 +68,8 @@ static int dynamic_replicator_enable(struct 
>> replicator_drvdata *drvdata,
>>          int rc = 0;
>>          u32 reg;
>> 
>> +       dynamic_replicator_reset(drvdata);
>> +
> 
> Again you are trying to mask an issue with this. Is the firmware
> using the replicator for anything ? If so, this needs to be claimed
> to prevent us from using it.
> 

I was trying to narrow down further as you suggested. There are other 
ETMs like AOP ETM which use this replicator, will need to check with the 
firmware team for details.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
