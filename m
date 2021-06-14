Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2453A5FF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 12:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhFNKYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 06:24:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43287 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbhFNKYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 06:24:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623666157; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tUjhteZTwtjUFaDAD6KHJwd6NW9O0JNn7peHuFifXiU=; b=fj65WhabHEgqAeL9ktfv4RvlpmzCVJq06xFwzIfgedTOnjeIsROvGpE/qIGn2txn+YGmhRMU
 kkdNdH2+DGfsYwtc8KhhqyzvANeC1TD61LyvN6v/6W6hjx8r220NkhmH1AasCuUlmTZVa4xj
 lGiejopdixytGqBCLbkJHM6dJM4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60c72de4e570c05619e7c6d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 10:22:28
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E05EAC4323A; Mon, 14 Jun 2021 10:22:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3364C43217;
        Mon, 14 Jun 2021 10:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3364C43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org, manivannan.sadhasivam@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V4 2/2] soc: qcom: aoss: Add debugfs entry
Date:   Mon, 14 Jun 2021 15:51:34 +0530
Message-Id: <1623666094-2924-3-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623666094-2924-1-git-send-email-deesin@codeaurora.org>
References: <1623666094-2924-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It can be useful to control the different power states of various
parts of hardware for device testing. Add a debugfs node for qmp so
messages can be sent to aoss for debugging and testing purposes.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index cd75d4d..438adc9 100644
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

