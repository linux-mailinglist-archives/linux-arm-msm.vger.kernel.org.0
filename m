Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3374417DC7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 10:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgCIJbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 05:31:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16559 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726469AbgCIJbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 05:31:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583746298; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=n4S2i2F8OaJ048Ck/AGaUxWW0oAZQwtUE3ehxK1VfJY=; b=htUoyRXK7DAxbeMTLVZetJS8bTHG/VYOavO63QEhyxfTTSd9NmyUe/zpbN4S1EgzKABFhvX0
 p8MDbWmCIhf8tEjFg+hCByNgj0VyBxiu8eMnwz2KnbE2bVadCB485GCNL1rXhnCCeBVAobNT
 QorZpO9A5e8RgD7gNprxy0k93GM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e660cf8.7f54c93f8ae8-smtp-out-n01;
 Mon, 09 Mar 2020 09:31:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A52FEC44791; Mon,  9 Mar 2020 09:31:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5024C4478C;
        Mon,  9 Mar 2020 09:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5024C4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v13 4/5] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
Date:   Mon,  9 Mar 2020 15:00:35 +0530
Message-Id: <1583746236-13325-5-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to invoke rpmh flush() from within cache_lock when the data in
cache is dirty.

Introduce two new APIs for this. Clients can use rpmh_start_transaction()
before any rpmh transaction once done invoke rpmh_end_transaction() which
internally invokes rpmh_flush() if the caches has become dirty.

Add support to control this with flush_dirty flag.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
---
 drivers/soc/qcom/rpmh-internal.h |  4 +++
 drivers/soc/qcom/rpmh-rsc.c      |  6 +++-
 drivers/soc/qcom/rpmh.c          | 64 ++++++++++++++++++++++++++++++++--------
 include/soc/qcom/rpmh.h          | 10 +++++++
 4 files changed, 71 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 6eec32b..d36be3d 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -70,13 +70,17 @@ struct rpmh_request {
  *
  * @cache: the list of cached requests
  * @cache_lock: synchronize access to the cache data
+ * @active_clients: count of rpmh transaction in progress
  * @dirty: was the cache updated since flush
+ * @flush_dirty: if the dirty cache need immediate flush
  * @batch_cache: Cache sleep and wake requests sent as batch
  */
 struct rpmh_ctrlr {
 	struct list_head cache;
 	spinlock_t cache_lock;
+	u32 active_clients;
 	bool dirty;
+	bool flush_dirty;
 	struct list_head batch_cache;
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index e278fc1..b6391e1 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -61,6 +61,8 @@
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
+#define FLUSH_DIRTY			1
+
 static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
 {
 	return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
@@ -670,13 +672,15 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&drv->client.cache);
 	INIT_LIST_HEAD(&drv->client.batch_cache);
 
+	drv->client.flush_dirty = device_get_match_data(&pdev->dev);
+
 	dev_set_drvdata(&pdev->dev, drv);
 
 	return devm_of_platform_populate(&pdev->dev);
 }
 
 static const struct of_device_id rpmh_drv_match[] = {
-	{ .compatible = "qcom,rpmh-rsc", },
+	{ .compatible = "qcom,rpmh-rsc", .data = (void *)FLUSH_DIRTY },
 	{ }
 };
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 5bed8f4..9d40209 100644
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
@@ -433,16 +430,63 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
 }
 
 /**
+ * rpmh_start_transaction: Indicates start of rpmh transactions, this
+ * must be ended by invoking rpmh_end_transaction().
+ *
+ * @dev: the device making the request
+ */
+void rpmh_start_transaction(const struct device *dev)
+{
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
+	unsigned long flags;
+
+	if (!ctrlr->flush_dirty)
+		return;
+
+	spin_lock_irqsave(&ctrlr->cache_lock, flags);
+	ctrlr->active_clients++;
+	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
+}
+EXPORT_SYMBOL(rpmh_start_transaction);
+
+/**
+ * rpmh_end_transaction: Indicates end of rpmh transactions. All dirty data
+ * in cache can be flushed immediately when ctrlr->flush_dirty is set
+ *
+ * @dev: the device making the request
+ *
+ * Return: 0 on success, error number otherwise.
+ */
+int rpmh_end_transaction(const struct device *dev)
+{
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ctrlr->flush_dirty)
+		return ret;
+
+	spin_lock_irqsave(&ctrlr->cache_lock, flags);
+
+	ctrlr->active_clients--;
+	if (ctrlr->dirty && !ctrlr->active_clients)
+		ret = rpmh_flush(ctrlr);
+
+	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(rpmh_end_transaction);
+
+/**
  * rpmh_flush: Flushes the buffered active and sleep sets to TCS
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
@@ -464,10 +508,6 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 	if (ret)
 		return ret;
 
-	/*
-	 * Nobody else should be calling this function other than system PM,
-	 * hence we can run without locks.
-	 */
 	list_for_each_entry(p, &ctrlr->cache, list) {
 		if (!is_req_valid(p)) {
 			pr_debug("%s: skipping RPMH req: a:%#x s:%#x w:%#x",
diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
index f9ec353..85e1ab2 100644
--- a/include/soc/qcom/rpmh.h
+++ b/include/soc/qcom/rpmh.h
@@ -22,6 +22,10 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 
 int rpmh_invalidate(const struct device *dev);
 
+void rpmh_start_transaction(const struct device *dev);
+
+int rpmh_end_transaction(const struct device *dev);
+
 #else
 
 static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
@@ -41,6 +45,12 @@ static inline int rpmh_write_batch(const struct device *dev,
 static inline int rpmh_invalidate(const struct device *dev)
 { return -ENODEV; }
 
+void rpmh_start_transaction(const struct device *dev)
+{ return -ENODEV; }
+
+int rpmh_end_transaction(const struct device *dev)
+{ return -ENODEV; }
+
 #endif /* CONFIG_QCOM_RPMH */
 
 #endif /* __SOC_QCOM_RPMH_H__ */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
