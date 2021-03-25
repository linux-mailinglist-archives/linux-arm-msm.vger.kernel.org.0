Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5822B3488A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 06:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhCYFqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 01:46:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34430 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhCYFp7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 01:45:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616651159; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=XAdG2pe22wdwAROVJ7SA4Os2DkiE2XGKKAT0Ug3Dp8w=; b=ET2jkC6lDC2ra4PVXDanaQWu5KsrhpSq6++PSZ11VApgfPsZXmj2y6JM8N/jGdp/139aB0SZ
 7l+daobo6Wm9JKhqn7F4OW9Xy59+g57jiuUAXsOYg9JcYNGtXzFO1Rvj6y6NlkdPunWdZVHG
 p6tUVuAkkmLHgelGzzllQnO6OJM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 605c238c1de5dd7b99272a08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 05:45:48
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25479C433ED; Thu, 25 Mar 2021 05:45:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46CD9C43463;
        Thu, 25 Mar 2021 05:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46CD9C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>
Subject: [PATCH 2/2] nvmem: qfprom: Add support for fuse blowing on sc7280
Date:   Thu, 25 Mar 2021 11:14:16 +0530
Message-Id: <1616651056-11844-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
References: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Handle the differences across LDO voltage needed for blowing fuses,
and the blow timer value, identified using a minor version of 15
on sc7280.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
---
Applies on top of https://lore.kernel.org/patchwork/patch/1376175/

 drivers/nvmem/qfprom.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 100d69d..d6d3f24 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -45,11 +45,13 @@ MODULE_PARM_DESC(read_raw_data, "Read raw instead of corrected data");
  * @qfprom_blow_timer_value: The timer value of qfprom when doing efuse blow.
  * @qfprom_blow_set_freq:    The frequency required to set when we start the
  *                           fuse blowing.
+ * @qfprom_blow_uV:          LDO voltage to be set when doing efuse blow
  */
 struct qfprom_soc_data {
 	u32 accel_value;
 	u32 qfprom_blow_timer_value;
 	u32 qfprom_blow_set_freq;
+	int qfprom_blow_uV;
 };
 
 /**
@@ -111,6 +113,15 @@ static const struct qfprom_soc_compatible_data sc7180_qfprom = {
 	.nkeepout = ARRAY_SIZE(sc7180_qfprom_keepout)
 };
 
+static const struct nvmem_keepout sc7280_qfprom_keepout[] = {
+	{.start = 0x128, .end = 0x148},
+	{.start = 0x238, .end = 0x248}
+};
+
+static const struct qfprom_soc_compatible_data sc7280_qfprom = {
+	.keepout = sc7280_qfprom_keepout,
+	.nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
+};
 /**
  * qfprom_disable_fuse_blowing() - Undo enabling of fuse blowing.
  * @priv: Our driver data.
@@ -168,6 +179,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 				      struct qfprom_touched_values *old)
 {
 	int ret;
+	int qfprom_blow_uV = priv->soc_data->qfprom_blow_uV;
 
 	ret = clk_prepare_enable(priv->secclk);
 	if (ret) {
@@ -187,9 +199,9 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 	 * a rail shared do don't specify a max--regulator constraints
 	 * will handle.
 	 */
-	ret = regulator_set_voltage(priv->vcc, 1800000, INT_MAX);
+	ret = regulator_set_voltage(priv->vcc, qfprom_blow_uV, INT_MAX);
 	if (ret) {
-		dev_err(priv->dev, "Failed to set 1.8 voltage\n");
+		dev_err(priv->dev, "Failed to set %duV\n", qfprom_blow_uV);
 		goto err_clk_rate_set;
 	}
 
@@ -311,6 +323,14 @@ static const struct qfprom_soc_data qfprom_7_8_data = {
 	.accel_value = 0xD10,
 	.qfprom_blow_timer_value = 25,
 	.qfprom_blow_set_freq = 4800000,
+	.qfprom_blow_uV = 1800000,
+};
+
+static const struct qfprom_soc_data qfprom_7_15_data = {
+	.accel_value = 0xD08,
+	.qfprom_blow_timer_value = 24,
+	.qfprom_blow_set_freq = 4800000,
+	.qfprom_blow_uV = 1900000,
 };
 
 static int qfprom_probe(struct platform_device *pdev)
@@ -379,6 +399,8 @@ static int qfprom_probe(struct platform_device *pdev)
 
 		if (major_version == 7 && minor_version == 8)
 			priv->soc_data = &qfprom_7_8_data;
+		if (major_version == 7 && minor_version == 15)
+			priv->soc_data = &qfprom_7_15_data;
 
 		priv->vcc = devm_regulator_get(&pdev->dev, "vcc");
 		if (IS_ERR(priv->vcc))
@@ -405,6 +427,7 @@ static int qfprom_probe(struct platform_device *pdev)
 static const struct of_device_id qfprom_of_match[] = {
 	{ .compatible = "qcom,qfprom",},
 	{ .compatible = "qcom,sc7180-qfprom", .data = &sc7180_qfprom},
+	{ .compatible = "qcom,sc7280-qfprom", .data = &sc7280_qfprom},
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, qfprom_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

