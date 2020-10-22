Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE962959C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 10:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509183AbgJVICd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 04:02:33 -0400
Received: from z5.mailgun.us ([104.130.96.5]:10469 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2509182AbgJVICd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 04:02:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603353752; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xE/wNkQvD+z2zJqtzsBmXwB80uN6i6lSw07emzccLIc=;
 b=LG0T2IzMTKTJ3xJAhGjl0Y1XMt1eAPfQPo5YCAhLwenn4FJPqmGKEvfOCfK1kVZPOY88HFGR
 tiigTyW5HwuwQRbGDTvt2/WYmvtooTNIkBzI9WR3LiQbGLxfUOAvOT1iSa1mDN0WnOgdBNxQ
 CJxfNggTy5oqGBFev2e1oe4s7NQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f913c974f8cc67c318d8fa6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 08:02:31
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2C2CC43387; Thu, 22 Oct 2020 08:02:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF572C433CB;
        Thu, 22 Oct 2020 08:02:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 22 Oct 2020 13:32:29 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki Poulose <suzuki.poulose@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        mike.leach@linaro.org, coresight@lists.linaro.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        denik@google.com, leo.yan@linaro.org, peterz@infradead.org
Subject: Re: [PATCH 1/2] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
In-Reply-To: <fdee606e-a045-e252-0823-14bdbef779c0@arm.com>
References: <cover.1602074787.git.saiprakash.ranjan@codeaurora.org>
 <d7a2dd53d88360b12e5a14933cb931198760dd63.1602074787.git.saiprakash.ranjan@codeaurora.org>
 <5bbb2d35-3e56-56d7-4722-bf34c5efa2fb@arm.com>
 <9fa4fcc25dac17b343d151a9d089b48c@codeaurora.org>
 <707b7860-0daa-d3e3-1f0f-17e1b05feae2@arm.com>
 <5ad6acdc69c1c2e1e17f5c701a09b7e1@codeaurora.org>
 <8affc09d4045812e2f5a065695b375de@codeaurora.org>
 <0ee3566e50143bac5b662b2edf551b89@codeaurora.org>
 <fdee606e-a045-e252-0823-14bdbef779c0@arm.com>
Message-ID: <6db16b0547122ab8a53d56bdfbfb391e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-21 15:38, Suzuki Poulose wrote:
> On 10/21/20 8:29 AM, Sai Prakash Ranjan wrote:
>> On 2020-10-20 21:40, Sai Prakash Ranjan wrote:
>>> On 2020-10-14 21:29, Sai Prakash Ranjan wrote:
>>>> On 2020-10-14 18:46, Suzuki K Poulose wrote:
>>>>> On 10/14/2020 10:36 AM, Sai Prakash Ranjan wrote:
>>>>>> On 2020-10-13 22:05, Suzuki K Poulose wrote:
>>>>>>> On 10/07/2020 02:00 PM, Sai Prakash Ranjan wrote:
>>>>>>>> There was a report of NULL pointer dereference in ETF enable
>>>>>>>> path for perf CS mode with PID monitoring. It is almost 100%
>>>>>>>> reproducible when the process to monitor is something very
>>>>>>>> active such as chrome and with ETF as the sink and not ETR.
>>>>>>>> Currently in a bid to find the pid, the owner is dereferenced
>>>>>>>> via task_pid_nr() call in tmc_enable_etf_sink_perf() and with
>>>>>>>> owner being NULL, we get a NULL pointer dereference.
>>>>>>>> 
>>>>>>>> Looking at the ETR and other places in the kernel, ETF and the
>>>>>>>> ETB are the only places trying to dereference the task(owner)
>>>>>>>> in tmc_enable_etf_sink_perf() which is also called from the
>>>>>>>> sched_in path as in the call trace. Owner(task) is NULL even
>>>>>>>> in the case of ETR in tmc_enable_etr_sink_perf(), but since we
>>>>>>>> cache the PID in alloc_buffer() callback and it is done as part
>>>>>>>> of etm_setup_aux() when allocating buffer for ETR sink, we never
>>>>>>>> dereference this NULL pointer and we are safe. So lets do the
>>>>>>> 
>>>>>>> The patch is necessary to fix some of the issues. But I feel it 
>>>>>>> is
>>>>>>> not complete. Why is it safe earlier and not later ? I believe we 
>>>>>>> are
>>>>>>> simply reducing the chances of hitting the issue, by doing this 
>>>>>>> earlier than
>>>>>>> later. I would say we better fix all instances to make sure that 
>>>>>>> the
>>>>>>> event->owner is valid. (e.g, I can see that the for kernel events
>>>>>>> event->owner == -1 ?)
>>>>>>> 
>>>>>>> struct task_struct *tsk = READ_ONCE(event->owner);
>>>>>>> 
>>>>>>> if (!tsk || is_kernel_event(event))
>>>>>>>    /* skip ? */
>>>>>>> 
>>>>>> 
>>>>>> Looking at it some more, is_kernel_event() is not exposed
>>>>>> outside events core and probably for good reason. Why do
>>>>>> we need to check for this and not just tsk?
>>>>> 
>>>>> Because the event->owner could be :
>>>>> 
>>>>>  = NULL
>>>>>  = -1UL  // kernel event
>>>>>  = valid.
>>>>> 
>>>> 
>>>> Yes I understood that part, but here we were trying to
>>>> fix the NULL pointer dereference right and hence the
>>>> question as to why we need to check for kernel events?
>>>> I am no expert in perf but I don't see anywhere in the
>>>> kernel checking for is_kernel_event(), so I am a bit
>>>> skeptical if exporting that is actually right or not.
>>>> 
>>> 
>>> I have stress tested with the original patch many times
>>> now, i.e., without a check for event->owner and is_kernel_event()
>>> and didn't observe any crash. Plus on ETR where this was already
>>> done, no crashes were reported till date and with ETF, the issue
>>> was quickly reproducible, so I am fairly confident that this
>>> doesn't just delay the original issue but actually fixes
>>> it. I will run an overnight test again to confirm this.
>>> 
>> 
>> I ran the overnight test which collected aroung 4G data(see below),
>> with the following small change to see if the two cases
>> (event->owner=NULL and is_kernel_event()) are triggered
>> with suggested changes and it didn't trigger at all.
>> Do we still need those additional checks?
>> 
> 
> Yes. Please see perf_event_create_kernel_event(), which is
> an exported function allowing any kernel code (including modules)
> to use the PMU (just like the userspace perf tool would do).
> Just because your use case doesn't trigger this (because
> you don't run something that can trigger this) doesn't mean
> this can't be triggered.
> 

Thanks for that pointer, I will add them in the next version.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
