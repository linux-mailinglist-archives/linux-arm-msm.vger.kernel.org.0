Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4F036E92B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 12:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240626AbhD2Kwp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 06:52:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34065 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240635AbhD2Kwl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 06:52:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619693515; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4Niv9L6e+htiO3tIEVBGRisqYUe+6VpEhDcRPB18inY=; b=vUg/Mx53HsOlI1+I9L7DdP5L83wUk74cqrslt7EnoTvZxDq6yH1Vcoe0ML4NfsRmTNhetPwE
 sRRzczFU74DuwXw6yNgrgjX6TiM79b9fs11nn4BsRCo1yF7GWiY5yzaTgVyrMntkS+TevhsO
 Z0RvqWaHeUeVcPRLS9dEWBGQT8c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 608a8fcbe0e9c9a6b61de712 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 10:51:55
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 01184C4479C; Thu, 29 Apr 2021 10:51:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 626BDC43460;
        Thu, 29 Apr 2021 10:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 626BDC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, bjorn.andersson@linaro.org,
        sboyd@kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 4/5] reset: qcom: Add PDC Global reset signals for WPSS
Date:   Thu, 29 Apr 2021 16:21:04 +0530
Message-Id: <1619693465-5724-5-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
References: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PDC Global reset signals for Wireless Processor Subsystem (WPSS)
on SC7280 SoCs.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v3:
 * member placement and style changes [Philipp] 

 drivers/reset/reset-qcom-pdc.c | 62 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
index ab74bccd4a5b..f22bb49a4ac8 100644
--- a/drivers/reset/reset-qcom-pdc.c
+++ b/drivers/reset/reset-qcom-pdc.c
@@ -11,18 +11,26 @@
 
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 
-#define RPMH_PDC_SYNC_RESET	0x100
+#define RPMH_SDM845_PDC_SYNC_RESET	0x100
+#define RPMH_SC7280_PDC_SYNC_RESET	0x1000
 
 struct qcom_pdc_reset_map {
 	u8 bit;
 };
 
+struct qcom_pdc_reset_desc {
+	const struct qcom_pdc_reset_map *resets;
+	size_t num_resets;
+	unsigned int offset;
+};
+
 struct qcom_pdc_reset_data {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	const struct qcom_pdc_reset_desc *desc;
 };
 
-static const struct regmap_config sdm845_pdc_regmap_config = {
+static const struct regmap_config pdc_regmap_config = {
 	.name		= "pdc-reset",
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -44,6 +52,33 @@ static const struct qcom_pdc_reset_map sdm845_pdc_resets[] = {
 	[PDC_MODEM_SYNC_RESET] = {9},
 };
 
+static const struct qcom_pdc_reset_desc sdm845_pdc_reset_desc = {
+	.resets = sdm845_pdc_resets,
+	.num_resets = ARRAY_SIZE(sdm845_pdc_resets),
+	.offset = RPMH_SDM845_PDC_SYNC_RESET,
+};
+
+static const struct qcom_pdc_reset_map sc7280_pdc_resets[] = {
+	[PDC_APPS_SYNC_RESET] = {0},
+	[PDC_SP_SYNC_RESET] = {1},
+	[PDC_AUDIO_SYNC_RESET] = {2},
+	[PDC_SENSORS_SYNC_RESET] = {3},
+	[PDC_AOP_SYNC_RESET] = {4},
+	[PDC_DEBUG_SYNC_RESET] = {5},
+	[PDC_GPU_SYNC_RESET] = {6},
+	[PDC_DISPLAY_SYNC_RESET] = {7},
+	[PDC_COMPUTE_SYNC_RESET] = {8},
+	[PDC_MODEM_SYNC_RESET] = {9},
+	[PDC_WLAN_RF_SYNC_RESET] = {10},
+	[PDC_WPSS_SYNC_RESET] = {11},
+};
+
+static const struct qcom_pdc_reset_desc sc7280_pdc_reset_desc = {
+	.resets = sc7280_pdc_resets,
+	.num_resets = ARRAY_SIZE(sc7280_pdc_resets),
+	.offset = RPMH_SC7280_PDC_SYNC_RESET,
+};
+
 static inline struct qcom_pdc_reset_data *to_qcom_pdc_reset_data(
 				struct reset_controller_dev *rcdev)
 {
@@ -54,19 +89,18 @@ static int qcom_pdc_control_assert(struct reset_controller_dev *rcdev,
 					unsigned long idx)
 {
 	struct qcom_pdc_reset_data *data = to_qcom_pdc_reset_data(rcdev);
+	u32 mask = BIT(data->desc->resets[idx].bit);
 
-	return regmap_update_bits(data->regmap, RPMH_PDC_SYNC_RESET,
-				  BIT(sdm845_pdc_resets[idx].bit),
-				  BIT(sdm845_pdc_resets[idx].bit));
+	return regmap_update_bits(data->regmap, data->desc->offset, mask, mask);
 }
 
 static int qcom_pdc_control_deassert(struct reset_controller_dev *rcdev,
 					unsigned long idx)
 {
 	struct qcom_pdc_reset_data *data = to_qcom_pdc_reset_data(rcdev);
+	u32 mask = BIT(data->desc->resets[idx].bit);
 
-	return regmap_update_bits(data->regmap, RPMH_PDC_SYNC_RESET,
-				  BIT(sdm845_pdc_resets[idx].bit), 0);
+	return regmap_update_bits(data->regmap, data->desc->offset, mask, 0);
 }
 
 static const struct reset_control_ops qcom_pdc_reset_ops = {
@@ -76,22 +110,27 @@ static const struct reset_control_ops qcom_pdc_reset_ops = {
 
 static int qcom_pdc_reset_probe(struct platform_device *pdev)
 {
+	const struct qcom_pdc_reset_desc *desc;
 	struct qcom_pdc_reset_data *data;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	struct resource *res;
 
+	desc = device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->desc = desc;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->regmap = devm_regmap_init_mmio(dev, base,
-					     &sdm845_pdc_regmap_config);
+	data->regmap = devm_regmap_init_mmio(dev, base, &pdc_regmap_config);
 	if (IS_ERR(data->regmap)) {
 		dev_err(dev, "Unable to initialize regmap\n");
 		return PTR_ERR(data->regmap);
@@ -99,14 +138,15 @@ static int qcom_pdc_reset_probe(struct platform_device *pdev)
 
 	data->rcdev.owner = THIS_MODULE;
 	data->rcdev.ops = &qcom_pdc_reset_ops;
-	data->rcdev.nr_resets = ARRAY_SIZE(sdm845_pdc_resets);
+	data->rcdev.nr_resets = desc->num_resets;
 	data->rcdev.of_node = dev->of_node;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
 static const struct of_device_id qcom_pdc_reset_of_match[] = {
-	{ .compatible = "qcom,sdm845-pdc-global" },
+	{ .compatible = "qcom,sc7280-pdc-global", .data = &sc7280_pdc_reset_desc },
+	{ .compatible = "qcom,sdm845-pdc-global", .data = &sdm845_pdc_reset_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_pdc_reset_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

