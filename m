Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6008345C9E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 17:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237227AbhKXQ0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:26:05 -0500
Received: from foss.arm.com ([217.140.110.172]:40688 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241485AbhKXQ0F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:26:05 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DEF91FB;
        Wed, 24 Nov 2021 08:22:55 -0800 (PST)
Received: from [10.57.29.198] (unknown [10.57.29.198])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F9A13F66F;
        Wed, 24 Nov 2021 08:22:53 -0800 (PST)
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate
 freq_factor
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     Thara Gopinath <thara.gopinath@linaro.org>, rafael@kernel.org
Cc:     sudeep.holla@arm.com, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <bce694fc-432c-846b-bd96-592368d12e20@arm.com>
Message-ID: <37941182-4f0f-0d3c-1831-83ca9765feb6@arm.com>
Date:   Wed, 24 Nov 2021 16:22:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bce694fc-432c-846b-bd96-592368d12e20@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/17/21 10:12 AM, Lukasz Luba wrote:
> 
> 
> On 11/15/21 8:10 PM, Thara Gopinath wrote:
>> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  
>> Since
>> we don't consider boost frequencies while calculating cpu capacities, use
>> policy->max to populate the freq_factor during boot up.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>   drivers/base/arch_topology.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index 43407665918f..df818b439bc3 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -334,7 +334,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>>       cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>>       for_each_cpu(cpu, policy->related_cpus)
>> -        per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
>> +        per_cpu(freq_factor, cpu) = policy->max / 1000;
>>       if (cpumask_empty(cpus_to_visit)) {
>>           topology_normalize_cpu_scale();
>>
> 
> LGTM
> 
> Reviewed-by: Lukasz Luba <lukasz.luba@armc.com>

Rafael, Thara, please ignore for a while this review.
We are going to do full investigation of this boost frequency,
capacity, schedutil util-to-freq mapping with cpuinfo.max_freq.
The code pointed by Rafael in that sched_util function
already has issue [1]. We have to figure out the consistent
solution for all platforms.

Regards,
Lukasz

[1] 
https://elixir.bootlin.com/linux/v5.16-rc2/source/kernel/sched/cpufreq_schedutil.c#L152
