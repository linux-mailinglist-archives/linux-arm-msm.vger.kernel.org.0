Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B56A1BDF5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 15:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgD2No0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:44:26 -0400
Received: from foss.arm.com ([217.140.110.172]:39488 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgD2No0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:44:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E6091045;
        Wed, 29 Apr 2020 06:44:25 -0700 (PDT)
Received: from [10.37.12.139] (unknown [10.37.12.139])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BBD33F68F;
        Wed, 29 Apr 2020 06:44:21 -0700 (PDT)
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
To:     saiprakash.ranjan@codeaurora.org, mike.leach@linaro.org
Cc:     mathieu.poirier@linaro.org, swboyd@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
 <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
Date:   Wed, 29 Apr 2020 14:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/29/2020 12:47 PM, Sai Prakash Ranjan wrote:
> On 2020-04-28 17:53, Sai Prakash Ranjan wrote:
>> On 2020-04-27 19:23, Suzuki K Poulose wrote:
>>> On 04/27/2020 10:45 AM, Mike Leach wrote:
>> [...]
>>>>>
>>>>> This is not sufficient. You must prevent another session trying to
>>>>> enable the other port of the replicator as this could silently fail
>>>>> the "on-going" session. Not ideal. Fail the attempt to enable a port
>>>>> if the other port is active. You could track this in software and
>>>>> fail early.
>>>>>
>>>>> Suzuki
>>>>
>>>> While I have no issue in principle with not enabling a path to a sink
>>>> that is not in use - indeed in some cases attaching to unused sinks
>>>> can cause back-pressure that slows throughput (cf TPIU) - I am
>>>> concerned that this modification is masking an underlying issue with
>>>> the platform in question.
>>>>
>>>> Should we decide to enable the diversion of different IDs to different
>>>> sinks or allow different sessions go to different sinks, then this has
>>>> potential to fail on the SC7180 SoC - and it will be difficult in
>>>> future to associate a problem with this discussion.
>>>
>>> Mike,
>>>
>>> I think thats a good point.
>>> Sai, please could we narrow down this to the real problem and may be
>>> work around it for the "device" ? Do we know which sink is causing the
>>> back pressure ? We could then push the "work around" to the replicator
>>> it is connected to.
>>>
>>> Suzuki
>>
>> Hi Suzuki, Mike,
>>
>> To add some more to the information provided earlier,
>> swao_replicator(6b06000) and etf are
>> in AOSS (Always-On-SubSystem) group. Also TPIU(connected to
>> qdss_replicator) and EUD(connected
>> to swao_replicator) sinks are unused.
>>
>> Please ignore the id filter values provided earlier.
>> Here are ID filter values after boot and before enabling replicator. 
>> As per
>> these idfilter values, we should not try to enable replicator if its 
>> already
>> enabled (in this case for swao_replicator) right?
>>
>> localhost ~ # cat
>> /sys/bus/amba/devices/6b06000.replicator/replicator1/mgmt/idfilter0
>> 0x0
>> localhost ~ # cat
>> /sys/bus/amba/devices/6b06000.replicator/replicator1/mgmt/idfilter1
>> 0x0
>>
>> localhost ~ # cat
>> /sys/bus/amba/devices/6046000.replicator/replicator0/mgmt/idfilter0
>> 0xff
>> localhost ~ # cat
>> /sys/bus/amba/devices/6046000.replicator/replicator0/mgmt/idfilter1
>> 0xff
>>
> 
> Looking more into replicator1(swao_replicator) values as 0x0 even after 
> replicator_reset()
> in replicator probe, I added dynamic_replicator_reset in 
> dynamic_replicator_enable()
> and am not seeing any hardlockup. Also I added some prints to check the 
> idfilter
> values before and after reset and found that its not set to 0xff even 
> after replicator_reset()
> in replicator probe, I don't see any other path setting it to 0x0.
> 
> After probe:
> 
> [    8.477669] func replicator_probe before reset replicator replicator1 
> REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
> [    8.489470] func replicator_probe after reset replicator replicator1 
> REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff

AFAICS, after the reset both of them are set to 0xff.

> [    8.502738] func replicator_probe before reset replicator replicator0 
> REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
> [    8.515214] func replicator_probe after reset replicator replicator0 
> REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff



> localhost ~ #
> localhost ~ #
> localhost ~ # echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> localhost ~ #
> localhost ~ # echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> [   58.490485] func dynamic_replicator_enable before reset replicator 
> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> [   58.503246] func dynamic_replicator_enable after reset replicator 
> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> [   58.520902] func dynamic_replicator_enable before reset replicator 
> replicator1 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0

You need to find what is resetting the IDFILTERs to 0 for replicator1.

> [   58.533500] func dynamic_replicator_enable after reset replicator 
> replicator1 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> localhost ~ #
> 
> Can we have a replicator_reset in dynamic_replicator_enable?
> 
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c 
> b/drivers/hwtracing/coresight/coresight-replicator.c
> index e7dc1c31d20d..794f8e4c049f 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -68,6 +68,8 @@ static int dynamic_replicator_enable(struct 
> replicator_drvdata *drvdata,
>          int rc = 0;
>          u32 reg;
> 
> +       dynamic_replicator_reset(drvdata);
> +

Again you are trying to mask an issue with this. Is the firmware
using the replicator for anything ? If so, this needs to be claimed
to prevent us from using it.

Suzuki
