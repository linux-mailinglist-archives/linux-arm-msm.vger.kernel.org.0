Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D445294B0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 12:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409560AbgJUKI2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 06:08:28 -0400
Received: from foss.arm.com ([217.140.110.172]:32932 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409559AbgJUKI2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 06:08:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 135E31FB;
        Wed, 21 Oct 2020 03:08:27 -0700 (PDT)
Received: from [10.57.55.120] (unknown [10.57.55.120])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97033F66E;
        Wed, 21 Oct 2020 03:08:24 -0700 (PDT)
Subject: Re: [PATCH 1/2] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     mike.leach@linaro.org, coresight@lists.linaro.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        denik@google.com, leo.yan@linaro.org, peterz@infradead.org
References: <cover.1602074787.git.saiprakash.ranjan@codeaurora.org>
 <d7a2dd53d88360b12e5a14933cb931198760dd63.1602074787.git.saiprakash.ranjan@codeaurora.org>
 <5bbb2d35-3e56-56d7-4722-bf34c5efa2fb@arm.com>
 <9fa4fcc25dac17b343d151a9d089b48c@codeaurora.org>
 <707b7860-0daa-d3e3-1f0f-17e1b05feae2@arm.com>
 <5ad6acdc69c1c2e1e17f5c701a09b7e1@codeaurora.org>
 <8affc09d4045812e2f5a065695b375de@codeaurora.org>
 <0ee3566e50143bac5b662b2edf551b89@codeaurora.org>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <fdee606e-a045-e252-0823-14bdbef779c0@arm.com>
Date:   Wed, 21 Oct 2020 11:08:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <0ee3566e50143bac5b662b2edf551b89@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/21/20 8:29 AM, Sai Prakash Ranjan wrote:
> On 2020-10-20 21:40, Sai Prakash Ranjan wrote:
>> On 2020-10-14 21:29, Sai Prakash Ranjan wrote:
>>> On 2020-10-14 18:46, Suzuki K Poulose wrote:
>>>> On 10/14/2020 10:36 AM, Sai Prakash Ranjan wrote:
>>>>> On 2020-10-13 22:05, Suzuki K Poulose wrote:
>>>>>> On 10/07/2020 02:00 PM, Sai Prakash Ranjan wrote:
>>>>>>> There was a report of NULL pointer dereference in ETF enable
>>>>>>> path for perf CS mode with PID monitoring. It is almost 100%
>>>>>>> reproducible when the process to monitor is something very
>>>>>>> active such as chrome and with ETF as the sink and not ETR.
>>>>>>> Currently in a bid to find the pid, the owner is dereferenced
>>>>>>> via task_pid_nr() call in tmc_enable_etf_sink_perf() and with
>>>>>>> owner being NULL, we get a NULL pointer dereference.
>>>>>>>
>>>>>>> Looking at the ETR and other places in the kernel, ETF and the
>>>>>>> ETB are the only places trying to dereference the task(owner)
>>>>>>> in tmc_enable_etf_sink_perf() which is also called from the
>>>>>>> sched_in path as in the call trace. Owner(task) is NULL even
>>>>>>> in the case of ETR in tmc_enable_etr_sink_perf(), but since we
>>>>>>> cache the PID in alloc_buffer() callback and it is done as part
>>>>>>> of etm_setup_aux() when allocating buffer for ETR sink, we never
>>>>>>> dereference this NULL pointer and we are safe. So lets do the
>>>>>>
>>>>>> The patch is necessary to fix some of the issues. But I feel it is
>>>>>> not complete. Why is it safe earlier and not later ? I believe we are
>>>>>> simply reducing the chances of hitting the issue, by doing this 
>>>>>> earlier than
>>>>>> later. I would say we better fix all instances to make sure that the
>>>>>> event->owner is valid. (e.g, I can see that the for kernel events
>>>>>> event->owner == -1 ?)
>>>>>>
>>>>>> struct task_struct *tsk = READ_ONCE(event->owner);
>>>>>>
>>>>>> if (!tsk || is_kernel_event(event))
>>>>>>    /* skip ? */
>>>>>>
>>>>>
>>>>> Looking at it some more, is_kernel_event() is not exposed
>>>>> outside events core and probably for good reason. Why do
>>>>> we need to check for this and not just tsk?
>>>>
>>>> Because the event->owner could be :
>>>>
>>>>  = NULL
>>>>  = -1UL  // kernel event
>>>>  = valid.
>>>>
>>>
>>> Yes I understood that part, but here we were trying to
>>> fix the NULL pointer dereference right and hence the
>>> question as to why we need to check for kernel events?
>>> I am no expert in perf but I don't see anywhere in the
>>> kernel checking for is_kernel_event(), so I am a bit
>>> skeptical if exporting that is actually right or not.
>>>
>>
>> I have stress tested with the original patch many times
>> now, i.e., without a check for event->owner and is_kernel_event()
>> and didn't observe any crash. Plus on ETR where this was already
>> done, no crashes were reported till date and with ETF, the issue
>> was quickly reproducible, so I am fairly confident that this
>> doesn't just delay the original issue but actually fixes
>> it. I will run an overnight test again to confirm this.
>>
> 
> I ran the overnight test which collected aroung 4G data(see below),
> with the following small change to see if the two cases
> (event->owner=NULL and is_kernel_event()) are triggered
> with suggested changes and it didn't trigger at all.
> Do we still need those additional checks?
> 

Yes. Please see perf_event_create_kernel_event(), which is
an exported function allowing any kernel code (including modules)
to use the PMU (just like the userspace perf tool would do).
Just because your use case doesn't trigger this (because
you don't run something that can trigger this) doesn't mean
this can't be triggered.

Cheers
Suzuki


> [ perf record: Captured and wrote 4677.989 MB perf.data ]
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c 
> b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index 989d965f3d90..123c446ce585 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -13,6 +13,13 @@
>   #include "coresight-tmc.h"
>   #include "coresight-etm-perf.h"
> 
> +#define TASK_TOMBSTONE ((void *)-1L)
> +
> +static bool is_kernel_event2(struct perf_event *event)
> +{
> +       return READ_ONCE(event->owner) == TASK_TOMBSTONE;
> +}
> +
>   static int tmc_set_etf_buffer(struct coresight_device *csdev,
>                                struct perf_output_handle *handle);
> 
> @@ -392,6 +399,15 @@ static void *tmc_alloc_etf_buffer(struct 
> coresight_device *csdev,
>   {
>          int node;
>          struct cs_buffers *buf;
> +       struct task_struct *task = READ_ONCE(event->owner);
> +
> +       if (!task) {
> +               pr_info("**sai in task=NULL**\n");
> +               return NULL;
> +       }
> +
> +       if (is_kernel_event2(event))
> +               pr_info("**sai in is_kernel_event**\n");
> 
>          node = (event->cpu == -1) ? NUMA_NO_NODE : 
> cpu_to_node(event->cpu);
> 
> 
> Thanks,
> Sai
> 

