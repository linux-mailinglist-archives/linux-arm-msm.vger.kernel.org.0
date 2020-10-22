Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F5F295D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896837AbgJVK6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 06:58:30 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:58056 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896836AbgJVK61 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 06:58:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603364306; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5ztPxVBV4facze8OMJ0iz/kwvlw+UjGzddfZ7fxt+RY=; b=Y0jZZ+Pa3RBbWLDhXXQ6X8oUX5aF2DAayQkycEJuH6iRNHCxdRrQBq6nYzyYtphxlezuzBcS
 sctfF2TRrbsm7OAVPL0QhYFHyaS+n8xgYw4n3QbR1+sP0pFpBLT4k2/5/I+GbsmonY9m1K/m
 EDLSi5WNXX7OIwCDqCsIl/Vj/dQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f9165d20764f13b00f094db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 10:58:26
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E4A2C43391; Thu, 22 Oct 2020 10:58:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6743C433FE;
        Thu, 22 Oct 2020 10:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6743C433FE
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
Subject: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in tmc_enable_etf_sink_perf()
Date:   Thu, 22 Oct 2020 16:27:52 +0530
Message-Id: <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
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
same thing with ETF and cache the PID to which the cs_buffer
belongs in tmc_alloc_etf_buffer() as done for ETR. This will
also remove the unnecessary function calls(task_pid_nr()) since
we are caching the PID. In addition to this, add a check to
validate event->owner which will prevent any possible NULL
pointer dereferences and check for kernel events.

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

Fixes: 880af782c6e8 ("coresight: tmc-etf: Add support for CPU-wide trace scenarios")
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-priv.h    | 2 ++
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 65a29293b6cb..f5f654ea2994 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -87,6 +87,7 @@ enum cs_mode {
  * struct cs_buffer - keep track of a recording session' specifics
  * @cur:	index of the current buffer
  * @nr_pages:	max number of pages granted to us
+ * @pid:	PID this cs_buffer belongs to
  * @offset:	offset within the current buffer
  * @data_size:	how much we collected in this run
  * @snapshot:	is this run in snapshot mode
@@ -95,6 +96,7 @@ enum cs_mode {
 struct cs_buffers {
 	unsigned int		cur;
 	unsigned int		nr_pages;
+	pid_t			pid;
 	unsigned long		offset;
 	local_t			data_size;
 	bool			snapshot;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 44402d413ebb..86ff0dda0444 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -227,6 +227,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = data;
+	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 	do {
@@ -243,7 +244,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 		}
 
 		/* Get a handle on the pid of the process to monitor */
-		pid = task_pid_nr(handle->event->owner);
+		pid = buf->pid;
 
 		if (drvdata->pid != -1 && drvdata->pid != pid) {
 			ret = -EBUSY;
@@ -391,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
 {
 	int node;
 	struct cs_buffers *buf;
+	struct task_struct *task = READ_ONCE(event->owner);
+
+	if (!task || is_kernel_event(event))
+		return NULL;
 
 	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
 
@@ -399,6 +404,7 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
+	buf->pid = task_pid_nr(task);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

