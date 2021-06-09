Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83E83A123B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 13:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238719AbhFILVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 07:21:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64167 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238786AbhFILVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 07:21:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623237551; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=EYAb+2xfU2oSC3PbvisoSLelVjb4yTUYjIS7vlhCgj8=; b=USI7+ed/pUeXNHGi5kLOwajCO5ZTAvOs6q9tmTpuZgsqwZ0RlSoK6x7/NM3uVBjkjNPojsI8
 ZabawibwOJgwCsreejJ/JuTdsYBs5O8/ZnsDtuCACY7GmTIHRRtnFYEPnMLkls64ho7+65H5
 6xsFbukpeGDJBGwPO8skOvpHC/A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60c0a3ade570c0561992a2a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 11:19:09
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0609C4360C; Wed,  9 Jun 2021 11:19:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B7A2C4338A;
        Wed,  9 Jun 2021 11:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7B7A2C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        manivannan.sadhasivam@linaro.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 2/2] soc: qcom: aoss: Add debugfs entry
Date:   Wed,  9 Jun 2021 16:48:52 +0530
Message-Id: <1623237532-20829-3-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623237532-20829-1-git-send-email-sibis@codeaurora.org>
References: <1623237532-20829-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Deepak Kumar Singh <deesin@codeaurora.org>

It can be useful to control the different power states of various
parts of hardware for device testing. Add a debugfs node for qmp so
messages can be sent to aoss for debugging and testing purposes.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index e8f48760bac8..998ee7605eb2 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -4,6 +4,7 @@
  */
 #include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <linux/clk-provider.h>
+#include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
@@ -89,6 +90,9 @@ struct qmp {
 	struct clk_hw qdss_clk;
 	struct genpd_onecell_data pd_data;
 	struct qmp_cooling_device *cooling_devs;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *debugfs_file;
+#endif /* CONFIG_DEBUG_FS */
 };
 
 struct qmp_pd {
@@ -575,6 +579,32 @@ void qmp_put(struct qmp *qmp)
 }
 EXPORT_SYMBOL(qmp_put);
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static ssize_t aoss_dbg_write(struct file *file, const char __user *userstr,
+			      size_t len, loff_t *pos)
+{
+	struct qmp *qmp = file->private_data;
+	char buf[QMP_MSG_LEN] = {};
+	int ret;
+
+	if (!len || len >= QMP_MSG_LEN)
+		return len;
+
+	ret  = copy_from_user(buf, userstr, len);
+	if (ret)
+		return len;
+
+	ret = qmp_send(qmp, buf, QMP_MSG_LEN);
+
+	return ret ? ret : len;
+}
+
+static const struct file_operations aoss_dbg_fops = {
+	.open = simple_open,
+	.write = aoss_dbg_write,
+};
+#endif /* CONFIG_DEBUG_FS */
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -632,6 +662,11 @@ static int qmp_probe(struct platform_device *pdev)
 
 	atomic_set(&qmp->orphan, 0);
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	qmp->debugfs_file = debugfs_create_file("aoss_send_message", 0220, NULL,
+						qmp, &aoss_dbg_fops);
+#endif /* CONFIG_DEBUG_FS */
+
 	return 0;
 
 err_remove_qdss_clk:
@@ -649,6 +684,10 @@ static int qmp_remove(struct platform_device *pdev)
 {
 	struct qmp *qmp = platform_get_drvdata(pdev);
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	debugfs_remove(qmp->debugfs_file);
+#endif /* CONFIG_DEBUG_FS */
+
 	qmp_qdss_clk_remove(qmp);
 	qmp_pd_remove(qmp);
 	qmp_cooling_devices_remove(qmp);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

