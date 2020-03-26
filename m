Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029DA19459D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 18:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgCZRig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 13:38:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:53316 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727354AbgCZRif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 13:38:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585244313; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PaQbQy6KgkNxQ25vmxZ4/JQ1w9QHWkE9gY1zONJDNiY=; b=q1auj+cfQCbUpfp3pRd13kdMB74mQc3sbKXr+sjdpXaTIfV4zYgimzRiix2iBgpo/VOZ0WpU
 02i/u3hnHs3JwIvcgqzv5qgSCh/xYqKyTkP8QxKXvePzh7xDAiwrZW6CTs9uanxHU3SNDTzz
 6gJ1aTJemftnBb4NjVyFDVPOHjs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7ce899.7f0c8728d960-smtp-out-n02;
 Thu, 26 Mar 2020 17:38:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F3B6C44798; Thu, 26 Mar 2020 17:38:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 335A9C44792;
        Thu, 26 Mar 2020 17:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 335A9C44792
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v14 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
Date:   Thu, 26 Mar 2020 23:07:48 +0530
Message-Id: <1585244270-637-5-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to invoke rpmh flush() from cpu pm notification.
This is done when last cpu is entering power collapse and
controller is not busy.

Controller that do have 'HW solver' mode do not need to register
for cpu pm notification. They may be in autonomous mode executing
low power mode do not require rpmh_flush() to happen from CPU PM
notification.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-internal.h |  8 ++++
 drivers/soc/qcom/rpmh-rsc.c      | 99 +++++++++++++++++++++++++++++++++++++---
 drivers/soc/qcom/rpmh.c          | 15 ++----
 3 files changed, 103 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 6eec32b..33ee50b 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -85,22 +85,30 @@ struct rpmh_ctrlr {
  * Resource State Coordinator controller (RSC)
  *
  * @name:       controller identifier
+ * @base:       start address of the RSC's DRV registers
  * @tcs_base:   start address of the TCS registers in this controller
  * @id:         instance id in the controller (Direct Resource Voter)
  * @num_tcs:    number of TCSes in this DRV
+ * @rsc_pm:     CPU PM notifier for controller
+ * @cpus_in_pc: CPU mask for cpus in idle power collapse
  * @tcs:        TCS groups
  * @tcs_in_use: s/w state of the TCS
  * @lock:       synchronize state of the controller
+ * @pm_lock:    synchronize during PM notifications
  * @client:     handle to the DRV's client.
  */
 struct rsc_drv {
 	const char *name;
+	void __iomem *base;
 	void __iomem *tcs_base;
 	int id;
 	int num_tcs;
+	struct notifier_block rsc_pm;
+	struct cpumask cpus_in_pc;
 	struct tcs_group tcs[TCS_TYPE_NR];
 	DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
 	spinlock_t lock;
+	spinlock_t pm_lock;
 	struct rpmh_ctrlr client;
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index e278fc1..ee052cc 100644
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
@@ -521,6 +527,71 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return tcs_ctrl_write(drv, msg);
 }
 
+/**
+ * rpmh_rsc_ctrlr_is_busy: Check if any of the AMCs are busy.
+ *
+ * @drv: The controller
+ *
+ * Returns True if the TCSes are engaged in handling requests, False otherwise.
+ */
+static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
+{
+	int m;
+	struct tcs_group *tcs = get_tcs_of_type(drv, ACTIVE_TCS);
+
+	/**
+	 * If we made an active request on a RSC that does not have a
+	 * dedicated TCS for active state use, then re-purposed wake TCSes
+	 * should be checked for not busy
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
+	unsigned long flags;
+	int ret = NOTIFY_OK;
+
+	spin_lock_irqsave(&drv->pm_lock, flags);
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpumask_set_cpu(raw_smp_processor_id(), &drv->cpus_in_pc);
+
+		if (!cpumask_equal(&drv->cpus_in_pc, cpu_online_mask))
+			goto exit;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		cpumask_clear_cpu(raw_smp_processor_id(), &drv->cpus_in_pc);
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
+
+exit:
+	spin_unlock_irqrestore(&drv->pm_lock, flags);
+	return ret;
+}
+
 static int rpmh_probe_tcs_config(struct platform_device *pdev,
 				 struct rsc_drv *drv)
 {
@@ -533,21 +604,20 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
 	int i, ret, n, st = 0;
 	struct tcs_group *tcs;
 	struct resource *res;
-	void __iomem *base;
 	char drv_id[10] = {0};
 
 	snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, drv_id);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	drv->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(drv->base))
+		return PTR_ERR(drv->base);
 
 	ret = of_property_read_u32(dn, "qcom,tcs-offset", &offset);
 	if (ret)
 		return ret;
-	drv->tcs_base = base + offset;
+	drv->tcs_base = drv->base + offset;
 
-	config = readl_relaxed(base + DRV_PRNT_CHLD_CONFIG);
+	config = readl_relaxed(drv->base + DRV_PRNT_CHLD_CONFIG);
 
 	max_tcs = config;
 	max_tcs &= DRV_NUM_TCS_MASK << (DRV_NUM_TCS_SHIFT * drv->id);
@@ -621,6 +691,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	struct device_node *dn = pdev->dev.of_node;
 	struct rsc_drv *drv;
 	int ret, irq;
+	u32 solver_config;
 
 	/*
 	 * Even though RPMh doesn't directly use cmd-db, all of its children
@@ -663,6 +734,20 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * CPU PM notification are not required for controllers that support
+	 * 'HW solver' mode where they can be in autonomous mode executing low
+	 * power mode to power down.
+	 */
+	solver_config = readl_relaxed(drv->base + DRV_SOLVER_CONFIG);
+	solver_config &= DRV_HW_SOLVER_MASK << DRV_HW_SOLVER_SHIFT;
+	solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
+	if (!solver_config) {
+		drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
+		cpu_pm_register_notifier(&drv->rsc_pm);
+		spin_lock_init(&drv->pm_lock);
+	}
+
 	/* Enable the active TCS to send requests immediately */
 	write_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, drv->tcs[ACTIVE_TCS].mask);
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 5147d82..565b6e4 100644
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
@@ -437,12 +434,10 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
  *
  * @ctrlr: controller making request to flush cached data
  *
- * Return: -EBUSY if the controller is busy, probably waiting on a response
- * to a RPMH request sent earlier.
+ * Return: 0 on success, error number otherwise.
  *
- * This function is always called from the sleep code from the last CPU
- * that is powering down the entire system. Since no other RPMH API would be
- * executing at this time, it is safe to run lockless.
+ * This function can either be called from sleep code on the last CPU
+ * (thus no spinlock needed) or with the ctrlr->cache_lock already held.
  */
 int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 {
@@ -466,10 +461,6 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
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
