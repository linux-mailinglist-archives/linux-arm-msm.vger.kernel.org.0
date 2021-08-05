Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709193E13A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 13:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbhHELN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 07:13:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38267 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240826AbhHELNz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 07:13:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628162022; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gZ7RBQz6Oogfyn/whoke8s7D/sGm4cDS6+YpFJsCizY=; b=XjeJue5mZdGHUPritwBMvQI3G00a9O9n1hftv3bE7WnvshYt7ijmoWvy9B8AjLCb++j8VhGy
 yrkCLEDS2G2XonMS6c5c54sauH3OVsTRqfPQEeORP7phApaHoKe92O3p24R400ogx50AER96
 1uzQCVc573x7GoOqpa7cgFNeYNg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 610bc7de3341038a23268cac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Aug 2021 11:13:34
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C9F4C4323A; Thu,  5 Aug 2021 11:13:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A8809C433D3;
        Thu,  5 Aug 2021 11:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8809C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V5 1/2] soc: qcom: aoss: Expose send for generic usecase
Date:   Thu,  5 Aug 2021 16:42:53 +0530
Message-Id: <1628161974-7182-2-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628161974-7182-1-git-send-email-deesin@codeaurora.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all upcoming usecases will have an interface to allow the aoss
driver to hook onto. Expose the send api and create a get function to
enable drivers to send their own messages to aoss.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c       | 46 +++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h | 38 +++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 934fcc4..b84cb31 100644
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
@@ -223,11 +225,14 @@ static bool qmp_message_empty(struct qmp *qmp)
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
 	if (WARN_ON(len + sizeof(u32) > qmp->size))
 		return -EINVAL;
 
@@ -261,6 +266,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 
 	return ret;
 }
+EXPORT_SYMBOL(qmp_send);
 
 static int qmp_qdss_clk_prepare(struct clk_hw *hw)
 {
@@ -515,6 +521,43 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
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
+	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-EINVAL);
+
+	qmp = platform_get_drvdata(pdev);
+
+	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL(qmp_get);
+
+void qmp_put(struct qmp *qmp)
+{
+	if (!IS_ERR_OR_NULL(qmp))
+		put_device(qmp->dev);
+}
+EXPORT_SYMBOL(qmp_put);
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -610,6 +653,7 @@ static struct platform_driver qmp_driver = {
 	.driver = {
 		.name		= "qcom_aoss_qmp",
 		.of_match_table	= qmp_dt_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = qmp_probe,
 	.remove	= qmp_remove,
diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
new file mode 100644
index 0000000..3c2a82e
--- /dev/null
+++ b/include/linux/soc/qcom/qcom_aoss.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
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
+void qmp_put(struct qmp *qmp);
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
+static inline void qmp_put(struct qmp *qmp)
+{
+}
+
+#endif
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

