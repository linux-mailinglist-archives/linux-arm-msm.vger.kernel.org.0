Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C27827ACFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 13:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgI1Lhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 07:37:33 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:51241 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbgI1Lhd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 07:37:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601293052; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oBL3zjdoQKbI5iunkmrCy1l5QeBCHIZ2wF9I7tpKlC4=; b=YmtwZHns4HHo/1HtxiEXfZfvRb9zuQi27H7c0Tjw1+skYZ8WLXHdSGlwEO6/SLpXEepxctk8
 tzRXpKm1glSuXh1bkhKzFJ49oK1MC9HkordylO+RcwihnvnTZdwkQ+2DNHs8fLvrMeNEenEy
 fqqY2licahacKbFAuDXPU/0iWeo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f71cafca965393f18d330eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 11:37:32
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7ABDDC433F1; Mon, 28 Sep 2020 11:37:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BA89C433C8;
        Mon, 28 Sep 2020 11:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8BA89C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, peterz@infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [RFC PATCHv2 1/2] coresight: tmc-etf: Fix NULL pointer dereference in tmc_enable_etf_sink_perf()
Date:   Mon, 28 Sep 2020 17:07:08 +0530
Message-Id: <751bd7d9fc65cdd3f1d118814193e9d925e2f56f.1601292571.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1601292571.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1601292571.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There was a report of NULL pointer dereference in ETF enable
path for perf CS mode with PID. It is almost 100% reproducible
when the process to monitor is something very active such as
chrome and only with ETF as the sink. Currently in a bid to
find the pid, the owner is dereferenced via task_pid_nr() call
in tmc_enable_etf_sink_perf(). With owner being NULL, we get a
NULL pointer dereference, so check the owner before dereferencing
it to prevent the system crash.

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

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

I am not sure of this incomplete solution hence the RFC. This issue was also
reported when this code was first added [1] but somehow it didn't get much
notice at the time. So the NULL pointer is propagated from as far as
flexible_sched_in() (might even be earlier than this) in events core and
deferenced in ETF code where it crashes. So I am not sure if its a problem
with the core code or the etf driver. Plus it is not reproducible with all
the processes, just something which is quite active ones such as chrome.
This is with 5.4 kernel with all the coresight patches backported, I did
go through events/core code from latest kernel to see if we are missing
any fixes related to this but I couldn't find any so I believe this problem
should also exist on latest kernel as well.

[1] https://lists.linaro.org/pipermail/coresight/2019-March/002278.html 

---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 44402d413ebb..32f141d943ca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -242,6 +242,9 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 			break;
 		}
 
+		if (!handle->event->owner)
+			break;
+
 		/* Get a handle on the pid of the process to monitor */
 		pid = task_pid_nr(handle->event->owner);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

