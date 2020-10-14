Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9241528DAA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 09:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgJNHul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 03:50:41 -0400
Received: from z5.mailgun.us ([104.130.96.5]:32810 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgJNHul (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 03:50:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602661840; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZDa3vOpmEZ8eDLlwS42JxZqhi1NArG+4awI4WGrgrN8=;
 b=cc2OJ5xZBdaxBv37XS6SNo+Wx3gdSswmGFOltdB1p8JimlIMJmudd61DJkOQXmjBaEybhd1/
 nZIfR3mYckEfkNqQ5+hLFxGa1L4U+4Upqu/5sdMOwzJpnriCrRpp7p81qmSrSStGXcX1qaIJ
 L82O69t9RTVUVmpKVoLovMAY11k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f86adaf4f8cc67c31830658 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 07:50:07
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 88BE7C433FF; Wed, 14 Oct 2020 07:50:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E0A6C433C9;
        Wed, 14 Oct 2020 07:50:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 14 Oct 2020 13:20:05 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, mike.leach@linaro.org,
        coresight@lists.linaro.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, denik@google.com,
        leo.yan@linaro.org, peterz@infradead.org
Subject: Re: [PATCH 1/2] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
In-Reply-To: <5bbb2d35-3e56-56d7-4722-bf34c5efa2fb@arm.com>
References: <cover.1602074787.git.saiprakash.ranjan@codeaurora.org>
 <d7a2dd53d88360b12e5a14933cb931198760dd63.1602074787.git.saiprakash.ranjan@codeaurora.org>
 <5bbb2d35-3e56-56d7-4722-bf34c5efa2fb@arm.com>
Message-ID: <7ef182f5ca9ff473c7a643ae3b7a7e75@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-10-13 22:05, Suzuki K Poulose wrote:
> On 10/07/2020 02:00 PM, Sai Prakash Ranjan wrote:
>> There was a report of NULL pointer dereference in ETF enable
>> path for perf CS mode with PID monitoring. It is almost 100%
>> reproducible when the process to monitor is something very
>> active such as chrome and with ETF as the sink and not ETR.
>> Currently in a bid to find the pid, the owner is dereferenced
>> via task_pid_nr() call in tmc_enable_etf_sink_perf() and with
>> owner being NULL, we get a NULL pointer dereference.
>> 
>> Looking at the ETR and other places in the kernel, ETF and the
>> ETB are the only places trying to dereference the task(owner)
>> in tmc_enable_etf_sink_perf() which is also called from the
>> sched_in path as in the call trace. Owner(task) is NULL even
>> in the case of ETR in tmc_enable_etr_sink_perf(), but since we
>> cache the PID in alloc_buffer() callback and it is done as part
>> of etm_setup_aux() when allocating buffer for ETR sink, we never
>> dereference this NULL pointer and we are safe. So lets do the
> 
> The patch is necessary to fix some of the issues. But I feel it is
> not complete. Why is it safe earlier and not later ? I believe we are
> simply reducing the chances of hitting the issue, by doing this earlier 
> than
> later.

I did stress it for a long time with this patch and did not face
any issues but I guess it doesn't hurt to have the check as you
suggested.

> I would say we better fix all instances to make sure that the
> event->owner is valid. (e.g, I can see that the for kernel events
> event->owner == -1 ?)
> 
> struct task_struct *tsk = READ_ONCE(event->owner);
> 
> if (!tsk || is_kernel_event(event))
>    /* skip ? */
> 

So to confirm my understanding, I will add the above checks on top
of this patch for ETR, ETB and ETF something like below?

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c 
b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 989d965f3d90..86ff0dda0444 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -392,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct 
coresight_device *csdev,
  {
         int node;
         struct cs_buffers *buf;
+       struct task_struct *task = READ_ONCE(event->owner);
+
+       if (!task || is_kernel_event(event))
+               return NULL;

         node = (event->cpu == -1) ? NUMA_NO_NODE : 
cpu_to_node(event->cpu);

@@ -400,7 +404,7 @@ static void *tmc_alloc_etf_buffer(struct 
coresight_device *csdev,
         if (!buf)
                 return NULL;

-       buf->pid = task_pid_nr(event->owner);
+       buf->pid = task_pid_nr(task);
         buf->snapshot = overwrite;
         buf->nr_pages = nr_pages;
         buf->data_pages = pages;


Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
