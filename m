Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39B0295EFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 14:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898968AbgJVMtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 08:49:55 -0400
Received: from z5.mailgun.us ([104.130.96.5]:47032 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2898947AbgJVMty (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 08:49:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603370994; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RCK7B2J1TXHqhKnVahkoy/BJVO0J46HHa0PpEK+JktM=;
 b=NRkfpHlgUX1HKbrA/8S3zYnM/HkOK5pgvTLGt+KtYzjdP97MEh3IgvYtpdcEAzO1P86JN5ZB
 OP6DD0eY5kH4yLvdvTQg0wU6/waGeAOAWXZxhIPTeDlVqqacYFe3fl2OFO+6ihbzuk27VzZg
 jM1zlxzNZx6lJLtwDXZZE44ciuE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f917fe206d81bc48d5bec06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 12:49:38
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8870C433C9; Thu, 22 Oct 2020 12:49:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFD4CC43387;
        Thu, 22 Oct 2020 12:49:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 22 Oct 2020 18:19:37 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
In-Reply-To: <20201022113214.GD2611@hirez.programming.kicks-ass.net>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
Message-ID: <a6eadc723ae52396a655c61b9f8d4eef@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-22 17:02, Peter Zijlstra wrote:
> On Thu, Oct 22, 2020 at 04:27:52PM +0530, Sai Prakash Ranjan wrote:
> 
>> Looking at the ETR and other places in the kernel, ETF and the
>> ETB are the only places trying to dereference the task(owner)
>> in tmc_enable_etf_sink_perf() which is also called from the
>> sched_in path as in the call trace.
> 
>> @@ -391,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct 
>> coresight_device *csdev,
>>  {
>>  	int node;
>>  	struct cs_buffers *buf;
>> +	struct task_struct *task = READ_ONCE(event->owner);
>> +
>> +	if (!task || is_kernel_event(event))
>> +		return NULL;
> 
> 
> This is *wrong*... why do you care about who owns the events?
> 

The original issue was the owner being NULL and causing
a NULL pointer dereference. I did ask some time back
if it is valid for the owner to be NULL [1] and should
probably be handled in events core?

[1] 
https://lore.kernel.org/lkml/c0e1f99a0a2480dfc8d788bb424d3f08@codeaurora.org/

Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000548
Mem abort info:
   ESR = 0x96000006
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
Data abort info:
   ISV = 0, ISS = 0x00000006
   CM = 0, WnR = 0
<snip>...
Call trace:
  tmc_enable_etf_sink+0xe4/0x280
  coresight_enable_path+0x168/0x1fc
  etm_event_start+0x8c/0xf8
  etm_event_add+0x38/0x54
  event_sched_in+0x194/0x2ac
  group_sched_in+0x54/0x12c
  flexible_sched_in+0xd8/0x120
  visit_groups_merge+0x100/0x16c
  ctx_flexible_sched_in+0x50/0x74
  ctx_sched_in+0xa4/0xa8
  perf_event_sched_in+0x60/0x6c
  perf_event_context_sched_in+0x98/0xe0
  __perf_event_task_sched_in+0x5c/0xd8
  finish_task_switch+0x184/0x1cc
  schedule_tail+0x20/0xec
  ret_from_fork+0x4/0x18


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
