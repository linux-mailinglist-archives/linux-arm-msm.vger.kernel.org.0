Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9411F0647
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2020 12:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgFFK7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Jun 2020 06:59:49 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:42528 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728726AbgFFK7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Jun 2020 06:59:37 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Jun 2020 03:59:37 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 06 Jun 2020 03:59:34 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 0C061217DA; Sat,  6 Jun 2020 16:29:32 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/3] mailbox: qcom: Add ipq6018 apcs compatible
Date:   Sat,  6 Jun 2020 16:29:31 +0530
Message-Id: <1591441171-20341-4-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591441171-20341-1-git-send-email-sivaprak@codeaurora.org>
References: <1591441171-20341-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm ipq6018 has apcs block, add compatible for the same.
Also, the apcs provides a clock controller functionality similar
to msm8916 but the clock driver is different.

Create a child platform device based on the apcs compatible for the
clock controller functionality.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
[V2]
 * created a new structur for driver data.
 * re-arranged compatible strings in sorted order
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 61 +++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index eeebafd..cec34f0 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -24,6 +24,35 @@ struct qcom_apcs_ipc {
 	struct platform_device *clk;
 };
 
+struct qcom_apcs_ipc_data {
+	int offset;
+	char *clk_name;
+};
+
+static const struct qcom_apcs_ipc_data ipq6018_apcs_data = {
+	.offset = 8, .clk_name = "qcom,apss-ipq6018-clk"
+};
+
+static const struct qcom_apcs_ipc_data ipq8074_apcs_data = {
+	.offset = 8, .clk_name = NULL
+};
+
+static const struct qcom_apcs_ipc_data msm8916_apcs_data = {
+	.offset = 8, .clk_name = "qcom-apcs-msm8916-clk"
+};
+
+static const struct qcom_apcs_ipc_data msm8996_apcs_data = {
+	.offset = 16, .clk_name = NULL
+};
+
+static const struct qcom_apcs_ipc_data msm8998_apcs_data = {
+	.offset = 8, .clk_name = NULL
+};
+
+static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
+	.offset = 12, .clk_name = NULL
+};
+
 static const struct regmap_config apcs_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -48,17 +77,12 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
 static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
 	struct qcom_apcs_ipc *apcs;
+	const struct qcom_apcs_ipc_data *apcs_data;
 	struct regmap *regmap;
 	struct resource *res;
-	unsigned long offset;
 	void __iomem *base;
 	unsigned long i;
 	int ret;
-	const struct of_device_id apcs_clk_match_table[] = {
-		{ .compatible = "qcom,msm8916-apcs-kpss-global", },
-		{ .compatible = "qcom,qcs404-apcs-apps-global", },
-		{}
-	};
 
 	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
 	if (!apcs)
@@ -73,10 +97,10 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
+	apcs_data = of_device_get_match_data(&pdev->dev);
 
 	apcs->regmap = regmap;
-	apcs->offset = offset;
+	apcs->offset = apcs_data->offset;
 
 	/* Initialize channel identifiers */
 	for (i = 0; i < ARRAY_SIZE(apcs->mbox_chans); i++)
@@ -93,9 +117,9 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (of_match_device(apcs_clk_match_table, &pdev->dev)) {
+	if (apcs_data->clk_name) {
 		apcs->clk = platform_device_register_data(&pdev->dev,
-							  "qcom-apcs-msm8916-clk",
+							  apcs_data->clk_name,
 							  PLATFORM_DEVID_NONE,
 							  NULL, 0);
 		if (IS_ERR(apcs->clk))
@@ -119,14 +143,15 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 
 /* .data is the offset of the ipc register within the global block */
 static const struct of_device_id qcom_apcs_ipc_of_match[] = {
-	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },
-	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
-	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = (void *)8 },
-	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = (void *)8 },
-	{ .compatible = "qcom,sc7180-apss-shared", .data = (void *)12 },
-	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
-	{ .compatible = "qcom,sm8150-apss-shared", .data = (void *)12 },
-	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = (void *)8 },
+	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
+	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
+	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
+	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
+	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
+	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
+	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
2.7.4

