Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF85295D0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 12:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896819AbgJVK6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 06:58:15 -0400
Received: from z5.mailgun.us ([104.130.96.5]:57721 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896817AbgJVK6O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 06:58:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603364293; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=mP+mZlEO6VkH4kSw2NcGwN/hbwL9FhPgo/5PKfqy1pI=; b=CfNxFHHFJV33AzqP6gMHmGBeyMx7Trs3NZWUbwp1jKINCNpP9l3sxhLimHlga2PylXmlBy3n
 H8XDMU0pvtup//vqppkjOPqv45aaj8yswdMkZKQY5l4rUQs1udDLfR5xVftdZPhYUe22inKl
 B3JTrhvNxnnNMSPrDJzbmKYpe/g=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f9165c557b88ccb5648219d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 10:58:13
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 47E28C433A0; Thu, 22 Oct 2020 10:58:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B233BC433F0;
        Thu, 22 Oct 2020 10:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B233BC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>
Cc:     coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 0/4] coresight: etf/etb10/etr: Fix NULL pointer dereference crashes
Date:   Thu, 22 Oct 2020 16:27:50 +0530
Message-Id: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There was a report of NULL pointer dereference in ETF enable
path for perf CS mode with PID monitoring. It is almost 100%
reproducible when the process to monitor is something very
active such as chrome and with ETF as the sink and not ETR.
Currently in a bid to find the pid, the owner is dereferenced
via task_pid_nr() call in tmc_enable_etf_sink_perf() and with
owner being NULL, we get a NULL pointer dereference.

Looking at the ETR and other places in the kernel, ETF and the
ETB are the only places trying to dereference the task(owner)
in tmc_enable_etf_sink_perf() which is also called from the
sched_in path as in the call trace. Owner(task) is NULL even
in the case of ETR in tmc_enable_etr_sink_perf(), but since we
cache the PID in alloc_buffer() callback and it is done as part
of etm_setup_aux() when allocating buffer for ETR sink, we never
dereference this NULL pointer and we are safe. So lets do the
same thing with ETF and ETB and cache the PID to which the
cs_buffer belongs in alloc_buffer() callback for ETF and ETB as
done for ETR. This will also remove the unnecessary function calls
(task_pid_nr()) in tmc_enable_etr_sink_perf() and etb_enable_perf().

In addition to this, add a check to validate event->owner before
dereferencing it in ETR, ETB and ETF to avoid any possible NULL
pointer dereference crashes in their corresponding alloc_buffer
callbacks and check for kernel events as well.

Easily reproducible running below:

 perf record -e cs_etm/@tmc_etf0/ -N -p <pid>

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000548
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

Sai Prakash Ranjan (4):
  perf/core: Export is_kernel_event()
  coresight: tmc-etf: Fix NULL ptr dereference in
    tmc_enable_etf_sink_perf()
  coresight: etb10: Fix possible NULL ptr dereference in
    etb_enable_perf()
  coresight: tmc-etr: Fix possible NULL ptr dereference in
    get_perf_etr_buf_cpu_wide()

 drivers/hwtracing/coresight/coresight-etb10.c   | 8 +++++++-
 drivers/hwtracing/coresight/coresight-priv.h    | 2 ++
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 8 +++++++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 6 +++++-
 include/linux/perf_event.h                      | 2 ++
 kernel/events/core.c                            | 3 ++-
 6 files changed, 25 insertions(+), 4 deletions(-)


base-commit: f4cb5e9daedf56671badc93ac7f364043aa33886
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

