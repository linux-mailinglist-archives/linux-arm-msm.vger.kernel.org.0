Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D760B359417
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 06:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhDIElC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 00:41:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50088 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhDIElC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 00:41:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617943250; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=A1vsAxu3+wkKHhFrg6MrL+OiArxJRWv5wKcpRpnCvBs=; b=wsxcKU0JrAvTszP0krCnUiPwLRdPanKtZz25UbNQDKoeGCmQzp9EtqGI8Dtn8ZzbDDuugp9B
 gPcWHtVa0xYV6UbZ+WgbqT6924wiH+I0yxp062EWORwuTH/TCrnsLc5QwrNj+2X9fTp382GM
 FDixCOqdpqa2hPDr8I82E3Vqg1s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 606fdace2cc44d3aea05d522 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 04:40:46
 GMT
Sender: deesin=qti.qualcomm.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1536CC43465; Fri,  9 Apr 2021 04:40:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36431C433C6;
        Fri,  9 Apr 2021 04:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36431C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@qti.qualcomm.com
From:   Deepak Kumar Singh <deesin@qti.qualcomm.com>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V2 1/2] soc: qcom: aoss: Expose send for generic usecase
Date:   Fri,  9 Apr 2021 10:09:47 +0530
Message-Id: <1617943188-23278-2-git-send-email-deesin@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617943188-23278-1-git-send-email-deesin@qti.qualcomm.com>
References: <1617943188-23278-1-git-send-email-deesin@qti.qualcomm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Deepak Kumar Singh <deesin@codeaurora.org>

Not all upcoming usecases will have an interface to allow the aoss
driver to hook onto. Expose the send api and create a get function to
enable drivers to send their own messages to aoss.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c       | 50 +++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h | 33 +++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 53acb94..0e397a7 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -8,10 +8,12 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/thermal.h>
 #include <linux/slab.h>
+#include <linux/soc/qcom/qcom_aoss.h>
 
 #define QMP_DESC_MAGIC			0x0
 #define QMP_DESC_VERSION		0x4
@@ -61,6 +63,7 @@ struct qmp_cooling_device {
  * @mbox_chan: mailbox channel used to ring the doorbell on transmit
  * @offset: offset within @msgram where messages should be written
  * @size: maximum size of the messages to be transmitted
+ * @orphan: tarcks whether qmp handle is valid
  * @event: wait_queue for synchronization with the IRQ
  * @tx_lock: provides synchronization between multiple callers of qmp_send()
  * @qdss_clk: QDSS clock hw struct
@@ -76,6 +79,7 @@ struct qmp {
 
 	size_t offset;
 	size_t size;
+	atomic_t  orphan;
 
 	wait_queue_head_t event;
 
@@ -223,11 +227,17 @@ static bool qmp_message_empty(struct qmp *qmp)
  *
  * Return: 0 on success, negative errno on failure
  */
-static int qmp_send(struct qmp *qmp, const void *data, size_t len)
+int qmp_send(struct qmp *qmp, const void *data, size_t len)
 {
 	long time_left;
 	int ret;
 
+	if (WARN_ON(IS_ERR_OR_NULL(qmp) || !data))
+		return -EINVAL;
+
+	if (atomic_read(&qmp->orphan))
+		return -EINVAL;
+
 	if (WARN_ON(len + sizeof(u32) > qmp->size))
 		return -EINVAL;
 
@@ -261,6 +271,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 
 	return ret;
 }
+EXPORT_SYMBOL(qmp_send);
 
 static int qmp_qdss_clk_prepare(struct clk_hw *hw)
 {
@@ -515,6 +526,40 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
 		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
 }
 
+/**
+ * qmp_get() - get a qmp handle from a device
+ * @dev: client device pointer
+ *
+ * Return: handle to qmp device on success, ERR_PTR() on failure
+ */
+struct qmp *qmp_get(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct qmp *qmp;
+
+	if (!dev || !dev->of_node)
+		return ERR_PTR(-EINVAL);
+
+	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev)
+		return ERR_PTR(-EINVAL);
+
+	qmp = platform_get_drvdata(pdev);
+	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL(qmp_get);
+
+void qmp_put(struct platform_device *pdev)
+{
+	platform_device_put(pdev);
+}
+EXPORT_SYMBOL(qmp_put);
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -569,6 +614,8 @@ static int qmp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qmp);
 
+	atomic_set(&qmp->orphan, 0);
+
 	return 0;
 
 err_remove_qdss_clk:
@@ -590,6 +637,7 @@ static int qmp_remove(struct platform_device *pdev)
 	qmp_cooling_devices_remove(qmp);
 
 	qmp_close(qmp);
+	atomic_set(&qmp->orphan, 1);
 	mbox_free_channel(qmp->mbox_chan);
 
 	return 0;
diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
new file mode 100644
index 0000000..27d00f7
--- /dev/null
+++ b/include/linux/soc/qcom/qcom_aoss.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_AOSS_H__
+#define __QCOM_AOSS_H__
+
+#include <linux/err.h>
+#include <linux/device.h>
+
+struct qmp;
+
+#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
+
+int qmp_send(struct qmp *qmp, const void *data, size_t len);
+struct qmp *qmp_get(struct device *dev);
+
+#else
+
+static inline int qmp_send(struct qmp *qmp, const void *data, size_t len)
+{
+	return -ENODEV;
+}
+
+static inline struct qmp *qmp_get(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+#endif
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

