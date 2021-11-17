Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7219A454586
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 12:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbhKQLYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 06:24:15 -0500
Received: from foss.arm.com ([217.140.110.172]:55460 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232294AbhKQLYP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 06:24:15 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75401FB;
        Wed, 17 Nov 2021 03:21:16 -0800 (PST)
Received: from [192.168.178.2] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BED83F70D;
        Wed, 17 Nov 2021 03:21:15 -0800 (PST)
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate
 freq_factor
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <16542a14-9023-5164-62de-fe999d89a350@arm.com>
Date:   Wed, 17 Nov 2021 12:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16.11.21 20:05, Rafael J. Wysocki wrote:
> On Mon, Nov 15, 2021 at 9:10 PM Thara Gopinath
> <thara.gopinath@linaro.org> wrote:
>>
>> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
>> we don't consider boost frequencies while calculating cpu capacities, use
>> policy->max to populate the freq_factor during boot up.
> 
> I'm not sure about this.  schedutil uses cpuinfo.max_freq as the max frequency.

Same question here. There is this:

  capacity = (freq / freq_max) * arch_scale_cpu_capacity()

in cpufreq_set_cur_state() [drivers/thermal/cpufreq_cooling.c]

where freq_max is `cpufreq_cdev->policy->cpuinfo.max_freq`

And this is then used to calc the PELT thermal pressure.

> 
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>  drivers/base/arch_topology.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index 43407665918f..df818b439bc3 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -334,7 +334,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>>         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>>
>>         for_each_cpu(cpu, policy->related_cpus)
>> -               per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
>> +               per_cpu(freq_factor, cpu) = policy->max / 1000;
>>
>>         if (cpumask_empty(cpus_to_visit)) {
>>                 topology_normalize_cpu_scale();
>> --
>> 2.25.1
>>
