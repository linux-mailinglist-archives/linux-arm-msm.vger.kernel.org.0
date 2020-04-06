Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA6219F062
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 08:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgDFGdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 02:33:33 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17475 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726475AbgDFGdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 02:33:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586154811; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LGe5TqB25qVmv+FxS0VMcDxpeiSccz6ZBNfojeuyIw0=; b=mCLY8BxGBrNLEycc7+lH9kLeD12UsBQoScvfI8YD86U9TOfJ9/MTZlTLvesvizMslVUvUNqR
 I6FPAltr5gsk73yg69obY08rlMhtR/XwQ0ibF19TdIo4JttpylCn1+cCxWlS0eLV4MF/9tJH
 RlbxCOYHV1ARuRxt7yH7eUXMMHk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8acd23.7fe521990068-smtp-out-n02;
 Mon, 06 Apr 2020 06:33:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF94AC44798; Mon,  6 Apr 2020 06:33:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A8A2C43636;
        Mon,  6 Apr 2020 06:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A8A2C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
Date:   Mon,  6 Apr 2020 12:02:19 +0530
Message-Id: <1586154741-8293-5-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to invoke rpmh flush() from CPU PM notification.
This is done when the last the cpu is entering power collapse and
controller is not busy.

Controllers that do have 'HW solver' mode do not need to register
for CPU PM notification. They may be in autonomous mode executing
low power mode and do not require rpmh_flush() to happen from CPU
PM notification.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/soc/qcom/rpmh-internal.h |  25 +++++---
 drivers/soc/qcom/rpmh-rsc.c      | 123 +++++++++++++++++++++++++++++++++++----
 drivers/soc/qcom/rpmh.c          |  26 +++------
 3 files changed, 137 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 6eec32b..e9a90cb 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -84,23 +84,32 @@ struct rpmh_ctrlr {
  * struct rsc_drv: the Direct Resource Voter (DRV) of the
  * Resource State Coordinator controller (RSC)
  *
- * @name:       controller identifier
- * @tcs_base:   start address of the TCS registers in this controller
- * @id:         instance id in the controller (Direct Resource Voter)
- * @num_tcs:    number of TCSes in this DRV
- * @tcs:        TCS groups
- * @tcs_in_use: s/w state of the TCS
- * @lock:       synchronize state of the controller
- * @client:     handle to the DRV's client.
+ * @name:               Controller identifier
+ * @tcs_base:           Start address of the TCS registers in this controller
+ * @id:                 Instance id in the controller (Direct Resource Voter)
+ * @num_tcs:            Number of TCSes in this DRV
+ * @rsc_pm:             CPU PM notifier for controller
+ *                      Used when solver mode is not present
+ * @cpus_entered_pm:    CPU mask for cpus in idle power collapse
+ *                      Used when solver mode is not present
+ * @tcs:                TCS groups
+ * @tcs_in_use:         S/W state of the TCS
+ * @lock:               Synchronize state of the controller
+ * @pm_lock:            Synchronize during PM notifications
+ *                      Used when solver mode is not present
+ * @client:             Handle to the DRV's client.
  */
 struct rsc_drv {
 	const char *name;
 	void __iomem *tcs_base;
 	int id;
 	int num_tcs;
+	struct notifier_block rsc_pm;
+	struct cpumask cpus_entered_pm;
 	struct tcs_group tcs[TCS_TYPE_NR];
 	DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
 	spinlock_t lock;
+	spinlock_t pm_lock;
 	struct rpmh_ctrlr client;
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index b718221..fbe1f3e 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) "%s " fmt, KBUILD_MODNAME
 
 #include <linux/atomic.h>
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -30,7 +31,12 @@
 #define RSC_DRV_TCS_OFFSET		672
 #define RSC_DRV_CMD_OFFSET		20
 
-/* DRV Configuration Information Register */
+/* DRV HW Solver Configuration Information Register */
+#define DRV_SOLVER_CONFIG		0x04
+#define DRV_HW_SOLVER_MASK		1
+#define DRV_HW_SOLVER_SHIFT		24
+
+/* DRV TCS Configuration Information Register */
 #define DRV_PRNT_CHLD_CONFIG		0x0C
 #define DRV_NUM_TCS_MASK		0x3F
 #define DRV_NUM_TCS_SHIFT		6
@@ -521,8 +527,86 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return tcs_ctrl_write(drv, msg);
 }
 
+/**
+ * rpmh_rsc_ctrlr_is_busy() - Check if any of the AMCs are busy.
+ *
+ * @drv: The controller
+ *
+ * Checks if any of the AMCs are busy in handling ACTIVE sets.
+ * This is called from the last cpu powering down before flushing
+ * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
+ * power collapse, so deny from the last cpu's pm notification.
+ *
+ * Return:
+ * * False		- AMCs are idle
+ * * True		- AMCs are busy
+ */
+static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
+{
+	int m;
+	struct tcs_group *tcs = get_tcs_of_type(drv, ACTIVE_TCS);
+
+	/*
+	 * If we made an active request on a RSC that does not have a
+	 * dedicated TCS for active state use, then re-purposed wake TCSes
+	 * should be checked for not busy.
+	 *
+	 * Since this is called from the last cpu, need not take drv or tcs
+	 * lock before checking tcs_is_free().
+	 */
+	if (!tcs->num_tcs)
+		tcs = get_tcs_of_type(drv, WAKE_TCS);
+
+	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
+		if (!tcs_is_free(drv, m))
+			return true;
+	}
+
+	return false;
+}
+
+static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
+				    unsigned long action, void *v)
+{
+	struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
+	int ret = NOTIFY_OK;
+
+	spin_lock(&drv->pm_lock);
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpumask_set_cpu(raw_smp_processor_id(),
+				&drv->cpus_entered_pm);
+
+		if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask))
+			goto exit;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		cpumask_clear_cpu(raw_smp_processor_id(),
+				  &drv->cpus_entered_pm);
+		goto exit;
+	}
+
+	ret = rpmh_rsc_ctrlr_is_busy(drv);
+	if (ret) {
+		ret = NOTIFY_BAD;
+		goto exit;
+	}
+
+	ret = rpmh_flush(&drv->client);
+	if (ret)
+		ret = NOTIFY_BAD;
+	else
+		ret = NOTIFY_OK;
+
+exit:
+	spin_unlock(&drv->pm_lock);
+	return ret;
+}
+
 static int rpmh_probe_tcs_config(struct platform_device *pdev,
-				 struct rsc_drv *drv)
+				 struct rsc_drv *drv, void __iomem *base)
 {
 	struct tcs_type_config {
 		u32 type;
@@ -532,15 +616,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
 	u32 config, max_tcs, ncpt, offset;
 	int i, ret, n, st = 0;
 	struct tcs_group *tcs;
-	struct resource *res;
-	void __iomem *base;
-	char drv_id[10] = {0};
-
-	snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, drv_id);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
 
 	ret = of_property_read_u32(dn, "qcom,tcs-offset", &offset);
 	if (ret)
@@ -620,7 +695,11 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
 	struct rsc_drv *drv;
+	struct resource *res;
+	char drv_id[10] = {0};
 	int ret, irq;
+	u32 solver_config;
+	void __iomem *base;
 
 	/*
 	 * Even though RPMh doesn't directly use cmd-db, all of its children
@@ -646,7 +725,13 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (!drv->name)
 		drv->name = dev_name(&pdev->dev);
 
-	ret = rpmh_probe_tcs_config(pdev, drv);
+	snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, drv_id);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ret = rpmh_probe_tcs_config(pdev, drv, base);
 	if (ret)
 		return ret;
 
@@ -663,6 +748,20 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * CPU PM notification are not required for controllers that support
+	 * 'HW solver' mode where they can be in autonomous mode executing low
+	 * power mode to power down.
+	 */
+	solver_config = readl_relaxed(base + DRV_SOLVER_CONFIG);
+	solver_config &= DRV_HW_SOLVER_MASK << DRV_HW_SOLVER_SHIFT;
+	solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
+	if (!solver_config) {
+		drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
+		spin_lock_init(&drv->pm_lock);
+		cpu_pm_register_notifier(&drv->rsc_pm);
+	}
+
 	/* Enable the active TCS to send requests immediately */
 	write_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, drv->tcs[ACTIVE_TCS].mask);
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index a75f3df..88f8801 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -297,12 +297,10 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
 {
 	struct batch_cache_req *req;
 	const struct rpmh_request *rpm_msg;
-	unsigned long flags;
 	int ret = 0;
 	int i;
 
 	/* Send Sleep/Wake requests to the controller, expect no response */
-	spin_lock_irqsave(&ctrlr->cache_lock, flags);
 	list_for_each_entry(req, &ctrlr->batch_cache, list) {
 		for (i = 0; i < req->count; i++) {
 			rpm_msg = req->rpm_msgs + i;
@@ -312,7 +310,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
 				break;
 		}
 	}
-	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 
 	return ret;
 }
@@ -433,16 +430,17 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
 }
 
 /**
- * rpmh_flush: Flushes the buffered active and sleep sets to TCS
+ * rpmh_flush() - Flushes the buffered sleep and wake sets to TCSes
  *
- * @ctrlr: controller making request to flush cached data
+ * @ctrlr: Controller making request to flush cached data
  *
- * Return: -EBUSY if the controller is busy, probably waiting on a response
- * to a RPMH request sent earlier.
+ * This function is called from sleep code on the last CPU
+ * (thus no spinlock needed).
  *
- * This function is always called from the sleep code from the last CPU
- * that is powering down the entire system. Since no other RPMH API would be
- * executing at this time, it is safe to run lockless.
+ * Return:
+ * * 0          - Success
+ * * -EAGAIN    - Retry again
+ * * Error code - Otherwise
  */
 int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 {
@@ -455,9 +453,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 	}
 
 	/* Invalidate the TCSes first to avoid stale data */
-	do {
-		ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
-	} while (ret == -EAGAIN);
+	ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
 	if (ret)
 		return ret;
 
@@ -466,10 +462,6 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 	if (ret)
 		return ret;
 
-	/*
-	 * Nobody else should be calling this function other than system PM,
-	 * hence we can run without locks.
-	 */
 	list_for_each_entry(p, &ctrlr->cache, list) {
 		if (!is_req_valid(p)) {
 			pr_debug("%s: skipping RPMH req: a:%#x s:%#x w:%#x",
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
