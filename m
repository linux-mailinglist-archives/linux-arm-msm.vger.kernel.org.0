Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE085295D10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 12:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896847AbgJVK6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 06:58:36 -0400
Received: from z5.mailgun.us ([104.130.96.5]:41941 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896826AbgJVK6d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 06:58:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603364312; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PokbucJp42uifsTw4R9V/FJUxMajlU8DaNmXfSbY0sk=; b=budEWbUvObnpuJSbMlWXj4UmIEL6HNZIexXoheRaR6rkNYwpmbbsMwU+ijftVx3zljghODO1
 UvDYNBBZepjYAmWBMSWiamxf84aX2agJ6B+i4m0P0xmSiuJuEa6geOV74S0vfpp3ZeyK6URI
 apFSNa417uLJorZvuKY2s7Bdke0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f9165d883370fa1c1007f30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 10:58:32
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56E86C43391; Thu, 22 Oct 2020 10:58:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9EC6FC43387;
        Thu, 22 Oct 2020 10:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9EC6FC43387
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
Subject: [PATCHv2 3/4] coresight: etb10: Fix possible NULL ptr dereference in etb_enable_perf()
Date:   Thu, 22 Oct 2020 16:27:53 +0530
Message-Id: <8c649ac9c3119edb1fff218c972909a48cdda122.1603363729.git.saiprakash.ranjan@codeaurora.org>
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
active such as chrome and with ETF as the sink.

But code path shows that ETB has a similar path as ETF, so
there could be possible NULL pointer dereference crash in
ETB as well. Currently in a bid to find the pid, the owner
is dereferenced via task_pid_nr() call in etb_enable_perf()
and with owner being NULL, we can get a NULL pointer
dereference, so have a similar change as ETF where we cache
PID in alloc_buffer() callback which is called as the part of
etm_setup_aux(). This will reduce the task_pid_nr() function
call overheads as well. In addition to this, add a check to
validate event->owner before dereferencing it to fix any
possible NULL pointer dereference crashes and check for
kernel events.

Fixes: 75d7dbd38824 ("coresight: etb10: Add support for CPU-wide trace scenarios")
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 248cc82c838e..9d2f1ab0e29e 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -176,6 +176,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = data;
+	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
@@ -186,7 +187,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 	}
 
 	/* Get a handle on the pid of the process to monitor */
-	pid = task_pid_nr(handle->event->owner);
+	pid = buf->pid;
 
 	if (drvdata->pid != -1 && drvdata->pid != pid) {
 		ret = -EBUSY;
@@ -376,6 +377,10 @@ static void *etb_alloc_buffer(struct coresight_device *csdev,
 {
 	int node;
 	struct cs_buffers *buf;
+	struct task_struct *task = READ_ONCE(event->owner);
+
+	if (!task || is_kernel_event(event))
+		return NULL;
 
 	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
 
@@ -383,6 +388,7 @@ static void *etb_alloc_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
+	buf->pid = task_pid_nr(task);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

