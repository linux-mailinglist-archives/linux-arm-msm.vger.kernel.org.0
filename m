Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF0A27E688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 12:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgI3KZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 06:25:00 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:44202 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728235AbgI3KZA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 06:25:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601461499; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8kp18v6HuIXRC2ri0p2ZUzJlvj22ggsUu9ZY0e6lPc8=;
 b=rZxdKfMypDYtMC4jJdHPatXHe68PhfP4XWiJ8LVF6XCup5Drgx//PnirzFaXIX79+XpWKmjZ
 NnNU6Hx3uynWAOuRpNbT6LKrpMSs8pYZJDqQN1HErdZO8sYkwvd0/IpaSocu264KBoLb3Csl
 z5dI2IejUrumY4TuEJj1pUk6LJA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f745cf3cc21f6157a0fbfaa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 10:24:51
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD06EC433CB; Wed, 30 Sep 2020 10:24:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C22ACC433C8;
        Wed, 30 Sep 2020 10:24:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 Sep 2020 15:54:48 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, peterz@infradead.org
Cc:     alexander.shishkin@linux.intel.com, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>, leo.yan@linaro.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCHv2 1/2] coresight: tmc-etf: Fix NULL pointer
 dereference in tmc_enable_etf_sink_perf()
In-Reply-To: <751bd7d9fc65cdd3f1d118814193e9d925e2f56f.1601292571.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1601292571.git.saiprakash.ranjan@codeaurora.org>
 <751bd7d9fc65cdd3f1d118814193e9d925e2f56f.1601292571.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <c0e1f99a0a2480dfc8d788bb424d3f08@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-28 17:07, Sai Prakash Ranjan wrote:
> There was a report of NULL pointer dereference in ETF enable
> path for perf CS mode with PID. It is almost 100% reproducible
> when the process to monitor is something very active such as
> chrome and only with ETF as the sink. Currently in a bid to
> find the pid, the owner is dereferenced via task_pid_nr() call
> in tmc_enable_etf_sink_perf(). With owner being NULL, we get a
> NULL pointer dereference, so check the owner before dereferencing
> it to prevent the system crash.
> 
>  perf record -e cs_etm/@tmc_etf0/ -N -p <pid>
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000548
> Mem abort info:
>   ESR = 0x96000006
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
> Data abort info:
>   ISV = 0, ISS = 0x00000006
>   CM = 0, WnR = 0
> 
> Call trace:
>  tmc_enable_etf_sink+0xe4/0x280
>  coresight_enable_path+0x168/0x1fc
>  etm_event_start+0x8c/0xf8
>  etm_event_add+0x38/0x54
>  event_sched_in+0x194/0x2ac
>  group_sched_in+0x54/0x12c
>  flexible_sched_in+0xd8/0x120
>  visit_groups_merge+0x100/0x16c
>  ctx_flexible_sched_in+0x50/0x74
>  ctx_sched_in+0xa4/0xa8
>  perf_event_sched_in+0x60/0x6c
>  perf_event_context_sched_in+0x98/0xe0
>  __perf_event_task_sched_in+0x5c/0xd8
>  finish_task_switch+0x184/0x1cc
>  schedule_tail+0x20/0xec
>  ret_from_fork+0x4/0x18
> 

+Peter,

I could reproduce this (without my band-aid patch 100%) even on the 
latest
coresight-next tip which is on 5.9-rc5 with my debian installed on
SDM845 based board.

Hi Peter, sorry to bother you. We observe that the NULL pointer is
propagated from events core code(in the call trace below), is it even
valid for the owner(task) to be NULL?

Reproduction is as simple as below:

perf record -e cs_etm/@tmc_etf0/ -N -p 1

[   16.411231] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000468
[   16.420080] Mem abort info:
[   16.422903]   ESR = 0x96000004
[   16.425988]   EC = 0x25: DABT (current EL), IL = 32 bits
[   16.431345]   SET = 0, FnV = 0
[   16.434429]   EA = 0, S1PTW = 0
[   16.437602] Data abort info:
[   16.440506]   ISV = 0, ISS = 0x00000004
[   16.444377]   CM = 0, WnR = 0
[   16.447372] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001f078c000
[   16.453858] [0000000000000468] pgd=0000000000000000, 
p4d=0000000000000000
[   16.460704] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   16.466323] Modules linked in:
[   16.469409] CPU: 5 PID: 2795 Comm: systemd Not tainted 
5.9.0-rc5-g1aeb4770c2f1-dirty #6
[   16.484046] pstate: 80400085 (Nzcv daIf +PAN -UAO BTYPE=--)
[   16.489668] pc : tmc_enable_etf_sink+0x74/0x2e8
[   16.494237] lr : tmc_enable_etf_sink+0x50/0x2e8
[   16.498807] sp : ffff800010c73b20
[   16.502149] x29: ffff800010c73b20 x28: ffff0001712b0008
[   16.507510] x27: ffff00017c76b308 x26: ffffa1e8a227dc80
[   16.512860] x25: 0000000000000002 x24: ffff00017c766768
[   16.518217] x23: 0000000000000080 x22: ffff000171c192e0
[   16.523575] x21: ffff000173868000 x20: ffff000171c19280
[   16.528934] x19: 0000000000000002 x18: ffffffffffffffff
[   16.534293] x17: 0000000000000000 x16: 0000000000000000
[   16.539652] x15: ffffa1e8a1ec9948 x14: ffff800090c738a7
[   16.545011] x13: ffff800010c738b5 x12: 0000000000000028
[   16.550369] x11: ffffa1e8a1eea000 x10: 0000000000000000
[   16.555728] x9 : 0000000000000000 x8 : 00000aeb00000aeb
[   16.561088] x7 : 003000000000000c x6 : 0000000000000001
[   16.566447] x5 : 0000000000000002 x4 : 0000000000000001
[   16.571805] x3 : 0000000000000000 x2 : 0000000000000001
[   16.577163] x1 : 0000000000000000 x0 : 00000000ffffffff
[   16.582523] Call trace:
[   16.584998]  tmc_enable_etf_sink+0x74/0x2e8
[   16.589219]  coresight_enable_path+0xd8/0x208
[   16.593608]  etm_event_start+0xe8/0x128
[   16.597481]  etm_event_add+0x44/0x60
[   16.601094]  event_sched_in.isra.139+0xd0/0x218
[   16.605664]  merge_sched_in+0x148/0x370
[   16.609536]  visit_groups_merge.constprop.147+0x124/0x490
[   16.614973]  ctx_sched_in+0xc4/0x168
[   16.618575]  perf_event_sched_in+0x6c/0xa8
[   16.622706]  __perf_event_task_sched_in+0x1a0/0x1b0
[   16.627623]  finish_task_switch+0x19c/0x248
[   16.631843]  schedule_tail+0x20/0x120
[   16.635535]  ret_from_fork+0x4/0x1c
[   16.639060] Code: 54000f20 f9400301 b9406680 f9414821 (b9446839)
[   16.645215] ---[ end trace bf238834e81d5892 ]---
[   16.649877] Kernel panic - not syncing: Fatal exception


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
