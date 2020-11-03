Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60822A4651
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 14:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgKCN21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 08:28:27 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:14742 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729217AbgKCN2Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 08:28:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604410104; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=NlUD522q1UZNeJibuUElRVCfmzqNBBfP4N2mc7yBIMU=; b=KX+l3mmJYISHkHhz3MYqZqp4m20gQz3KKHIOEkuyUs3etdPYgrFMfr4yMig02RLqNouVt//v
 Cq+DtXgADluPWRTq1PptaHmomSpg8gPRoDniSy3AbbUs3dRifptK8KPS49Fn9lITVNoX7JgD
 ryD2SwFtL78KgtKl/tP4u/E9HQQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fa15af723306fb6028ce10e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 13:28:23
 GMT
Sender: clew=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7947BC43452; Tue,  3 Nov 2020 03:19:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from swarchsd3-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clew)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7381C433B1;
        Tue,  3 Nov 2020 03:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7381C433B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=clew@codeaurora.org
From:   Chris Lew <clew@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org
Subject: [PATCH 2/2] soc: qcom: aoss: Add debugfs send entry
Date:   Mon,  2 Nov 2020 19:19:01 -0800
Message-Id: <1604373541-12641-2-git-send-email-clew@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604373541-12641-1-git-send-email-clew@codeaurora.org>
References: <1604373541-12641-1-git-send-email-clew@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It can be useful to control the different power states of various
parts of hardware for device testing. Add a debugfs node to send
messages through qmp to aoss for debugging and testing purposes.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 8f052db1880a..2fd755d2a92d 100644
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
@@ -85,6 +86,8 @@ struct qmp {
 	struct clk_hw qdss_clk;
 	struct genpd_onecell_data pd_data;
 	struct qmp_cooling_device *cooling_devs;
+
+	struct dentry *debugfs_fp;
 };
 
 struct qmp_pd {
@@ -541,6 +544,34 @@ struct qmp_device *qmp_get(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(qmp_get);
 
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
+	if (ret) {
+		dev_err(qmp->dev, "copy from user failed, ret:%d\n", ret);
+		return len;
+	}
+
+	ret = qmp_send(qmp, buf, QMP_MSG_LEN);
+	if (ret)
+		dev_err(qmp->dev, "debug send failed, ret:%d\n", ret);
+
+	return len;
+}
+
+static const struct file_operations aoss_dbg_fops = {
+	.open = simple_open,
+	.write = aoss_dbg_write,
+};
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -595,6 +626,9 @@ static int qmp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qmp);
 
+	qmp->debugfs_fp = debugfs_create_file("aoss_send_message", 0220, NULL,
+					      qmp, &aoss_dbg_fops);
+
 	return 0;
 
 err_remove_qdss_clk:
@@ -611,6 +645,8 @@ static int qmp_remove(struct platform_device *pdev)
 {
 	struct qmp *qmp = platform_get_drvdata(pdev);
 
+	debugfs_remove(qmp->debugfs_fp);
+
 	qmp_qdss_clk_remove(qmp);
 	qmp_pd_remove(qmp);
 	qmp_cooling_devices_remove(qmp);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

