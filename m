Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927EB2331B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 14:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgG3MOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 08:14:32 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15938 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgG3MOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 08:14:31 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 30 Jul 2020 05:14:31 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 30 Jul 2020 05:14:29 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 30 Jul 2020 17:44:06 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 20D2D213B6; Thu, 30 Jul 2020 17:44:04 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v8 1/4] remoteproc: qcom: wcss: populate hardcoded param using driver data
Date:   Thu, 30 Jul 2020 17:44:01 +0530
Message-Id: <1596111244-28411-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
References: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Govind Singh <govinds@codeaurora.org>

Q6 based WiFi fw loading is supported across
different targets, ex: IPQ8074/QCS404. In order to
support different fw names/pas id etc, populate
hardcoded param using driver data.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 8846ef0..3ef5f82 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -71,6 +71,11 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
+struct wcss_data {
+	const char *firmware_name;
+	unsigned int crash_reason_smem;
+};
+
 struct q6v5_wcss {
 	struct device *dev;
 
@@ -93,6 +98,8 @@ struct q6v5_wcss {
 	void *mem_region;
 	size_t mem_size;
 
+	unsigned int crash_reason_smem;
+
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 };
@@ -438,7 +445,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static const struct rproc_ops q6v5_wcss_ops = {
+static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
 	.start = q6v5_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
@@ -538,12 +545,17 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 
 static int q6v5_wcss_probe(struct platform_device *pdev)
 {
+	const struct wcss_data *desc;
 	struct q6v5_wcss *wcss;
 	struct rproc *rproc;
 	int ret;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ops,
-			    "IPQ8074/q6_fw.mdt", sizeof(*wcss));
+	desc = device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ipq8074_ops,
+			    desc->firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -551,6 +563,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss = rproc->priv;
 	wcss->dev = &pdev->dev;
+	wcss->crash_reason_smem = desc->crash_reason_smem;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -564,7 +577,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, WCSS_CRASH_REASON, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem,
+			     NULL);
 	if (ret)
 		goto free_rproc;
 
@@ -595,8 +609,13 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct wcss_data wcss_ipq8074_res_init = {
+	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.crash_reason_smem = WCSS_CRASH_REASON,
+};
+
 static const struct of_device_id q6v5_wcss_of_match[] = {
-	{ .compatible = "qcom,ipq8074-wcss-pil" },
+	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
-- 
2.7.4

