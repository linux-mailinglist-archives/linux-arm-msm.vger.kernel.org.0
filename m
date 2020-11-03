Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF0F2A465C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 14:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgKCN2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 08:28:40 -0500
Received: from z5.mailgun.us ([104.130.96.5]:60760 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729261AbgKCN2k (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 08:28:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604410119; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=K4iZAu2xf6QxnytkUeBgpFt/AIpNvbWWhVJYqgyCMSs=; b=XJ7jSZ95EYmHix1/kxFCVEncDu6ss57QyA77YDISteRiYmJ8ZrluuhQkQzgy9FWmWiq0VKkV
 mAASt28zyQe5mwM0rh18zMcq1qEEVeGGNr0Bh2rmk+vkcGXOtlwC0z3qn/+rkLieZiBstXWa
 gxSt01/xM50WqE2DxSaB9U6We0c=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fa15af723306fb6028ce0fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 13:28:23
 GMT
Sender: clew=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DA15C43450; Tue,  3 Nov 2020 03:19:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from swarchsd3-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clew)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17B2AC433B1;
        Tue,  3 Nov 2020 03:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17B2AC433B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=clew@codeaurora.org
From:   Chris Lew <clew@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org
Subject: [PATCH 1/2] soc: qcom: aoss: Expose send for generic usecase
Date:   Mon,  2 Nov 2020 19:19:00 -0800
Message-Id: <1604373541-12641-1-git-send-email-clew@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all upcoming usecases will have an interface to allow the aoss
driver to hook onto. Expose the send api and create a get function to
enable drivers to send their own messages to aoss.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c       | 28 +++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index ed2c687c16b3..8f052db1880a 100644
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
@@ -222,12 +224,15 @@ static bool qmp_message_empty(struct qmp *qmp)
  *
  * Return: 0 on success, negative errno on failure
  */
-static int qmp_send(struct qmp *qmp, const void *data, size_t len)
+int qmp_send(struct qmp *qmp, const void *data, size_t len)
 {
 	long time_left;
 	size_t tlen;
 	int ret;
 
+	if (!qmp || !data)
+		return -EINVAL;
+
 	if (WARN_ON(len + sizeof(u32) > qmp->size))
 		return -EINVAL;
 
@@ -261,6 +266,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(qmp_send);
 
 static int qmp_qdss_clk_prepare(struct clk_hw *hw)
 {
@@ -515,6 +521,26 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
 		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
 }
 
+/**
+ * qmp_get() - get a qmp handle from device tree node
+ * @np: of node of qmp device
+ *
+ * Return: handle to qmp device on success, ERR_PTR() on failure
+ */
+struct qmp_device *qmp_get(struct device_node *np)
+{
+	struct platform_device *pdev;
+	struct qmp *qmp;
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev)
+		return ERR_PTR(-EINVAL);
+
+	qmp = platform_get_drvdata(pdev);
+	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL_GPL(qmp_get);
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
new file mode 100644
index 000000000000..05fc0ed3a10d
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
+#include <linux/of.h>
+
+struct qmp;
+
+#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
+
+int qmp_send(struct qmp *qmp, const void *data, size_t len);
+struct qmp_device *qmp_get(struct device_node *np);
+
+#else
+
+int qmp_send(struct qmp *qmp, const void *data, size_t len)
+{
+	return -ENODEV;
+}
+
+struct qmp *qmp_get(struct device_node *np)
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

