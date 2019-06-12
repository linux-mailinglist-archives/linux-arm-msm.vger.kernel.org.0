Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF494234B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 13:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438179AbfFLLB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 07:01:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38544 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438197AbfFLLB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 07:01:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C997560721; Wed, 12 Jun 2019 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560337285;
        bh=ltqfI4RkOEUV7BgoL5B9tJXKToql82i45Sir7z66Kr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GsGcM1K5ZGRDPtuAUrvb2BQ/ZyZ2d1z4Vkfm+YW2nsq7+Y4gKyVhQ45R9rFHctbwN
         x4zfG0twIW2bmKD736zap1Rn1lJTIGWT+VnykTpz7uFkdY8Mf3/PW7SLr7AeQr+ain
         VII7fPOQptBebzKcdW7k+Mzqz2CC8IcOScEEXCC8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-288.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nishakumari@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9378060A97;
        Wed, 12 Jun 2019 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560337282;
        bh=ltqfI4RkOEUV7BgoL5B9tJXKToql82i45Sir7z66Kr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q1lh4C+h7nCIXvvYlbUgtm3L29/boMcrjStskoWFptp3NctVpyTbgPoUFICuwd0s7
         FfyfTMzi6RV7NZ6B4B+hU/jmvMRicWYG65ot9DsJiZd5I75pdYQzv3dYJqwwgi6PxS
         73Ebglke3OxEVo9YACbhW6tgm36DVYnUft3pz/fw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9378060A97
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=nishakumari@codeaurora.org
From:   Nisha Kumari <nishakumari@codeaurora.org>
To:     bjorn.andersson@linaro.org, broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org
Cc:     lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org,
        linux-kernel@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org, Nisha Kumari <nishakumari@codeaurora.org>
Subject: [PATCH 4/4] regulator: adding interrupt handling in labibb regulator
Date:   Wed, 12 Jun 2019 16:30:52 +0530
Message-Id: <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds short circuit interrupt handling and recovery.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
---
 drivers/regulator/qcom-labibb-regulator.c | 161 ++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 0c68883..04fc9512 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019, The Linux Foundation. All rights reserved.
 
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -16,22 +17,28 @@
 #define REG_LAB_ENABLE_CTL		0x46
 #define LAB_STATUS1_VREG_OK_BIT		BIT(7)
 #define LAB_ENABLE_CTL_EN		BIT(7)
+#define LAB_STATUS1_SC_DETECT_BIT	BIT(6)
 
 #define REG_IBB_STATUS1			0x08
 #define REG_IBB_ENABLE_CTL		0x46
 #define IBB_STATUS1_VREG_OK_BIT		BIT(7)
 #define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
 #define IBB_CONTROL_ENABLE		BIT(7)
+#define IBB_STATUS1_SC_DETECT_BIT	BIT(6)
 
 #define POWER_DELAY			8000
+#define POLLING_SCP_DONE_COUNT		2
+#define POLLING_SCP_DONE_INTERVAL_MS	5
 
 struct lab_regulator {
 	struct regulator_dev		*rdev;
+	int				lab_sc_irq;
 	int				vreg_enabled;
 };
 
 struct ibb_regulator {
 	struct regulator_dev		*rdev;
+	int				ibb_sc_irq;
 	int				vreg_enabled;
 };
 
@@ -288,6 +295,112 @@ static int qcom_ibb_regulator_is_enabled(struct regulator_dev *rdev)
 	.owner = THIS_MODULE,
 };
 
+static void labibb_sc_err_recovery_work(void *_labibb)
+{
+	int ret;
+	struct qcom_labibb *labibb = (struct qcom_labibb *)_labibb;
+
+	labibb->ibb_vreg.vreg_enabled = 0;
+	labibb->lab_vreg.vreg_enabled = 0;
+
+	ret = qcom_ibb_regulator_enable(labibb->lab_vreg.rdev);
+	if (ret < 0) {
+		dev_err(labibb->dev,
+			"Interrupt recovery not possible as IBB enable failed");
+		return;
+	}
+
+	ret = qcom_lab_regulator_enable(labibb->ibb_vreg.rdev);
+	if (ret < 0) {
+		dev_err(labibb->dev,
+			"Interrupt recovery not possible as LAB enable failed");
+		ret = qcom_ibb_regulator_disable(labibb->lab_vreg.rdev);
+		if (ret < 0)
+			dev_err(labibb->dev, "IBB disable failed");
+		return;
+	}
+	dev_info(labibb->dev, "Interrupt recovery done");
+}
+
+static irqreturn_t labibb_sc_err_handler(int irq, void *_labibb)
+{
+	int ret, count;
+	u16 reg;
+	u8 sc_err_mask, val;
+	char *str;
+	struct qcom_labibb *labibb = (struct qcom_labibb *)_labibb;
+	bool in_sc_err, lab_en, ibb_en, scp_done = false;
+
+	if (irq == labibb->lab_vreg.lab_sc_irq) {
+		reg = labibb->lab_base + REG_LAB_STATUS1;
+		sc_err_mask = LAB_STATUS1_SC_DETECT_BIT;
+		str = "LAB";
+	} else if (irq == labibb->ibb_vreg.ibb_sc_irq) {
+		reg = labibb->ibb_base + REG_IBB_STATUS1;
+		sc_err_mask = IBB_STATUS1_SC_DETECT_BIT;
+		str = "IBB";
+	} else {
+		return IRQ_HANDLED;
+	}
+
+	ret = qcom_labibb_read(labibb, reg, &val, 1);
+	if (ret < 0) {
+		dev_err(labibb->dev, "Read failed, ret=%d\n", ret);
+		return IRQ_HANDLED;
+	}
+	dev_dbg(labibb->dev, "%s SC error triggered! %s_STATUS1 = %d\n",
+		str, str, val);
+
+	in_sc_err = !!(val & sc_err_mask);
+
+	/*
+	 * The SC(short circuit) fault would trigger PBS(Portable Batch
+	 * System) to disable regulators for protection. This would
+	 * cause the SC_DETECT status being cleared so that it's not
+	 * able to get the SC fault status.
+	 * Check if LAB/IBB regulators are enabled in the driver but
+	 * disabled in hardware, this means a SC fault had happened
+	 * and SCP handling is completed by PBS.
+	 */
+	if (!in_sc_err) {
+		count = POLLING_SCP_DONE_COUNT;
+		do {
+			reg = labibb->lab_base + REG_LAB_ENABLE_CTL;
+			ret = qcom_labibb_read(labibb, reg, &val, 1);
+			if (ret < 0) {
+				dev_err(labibb->dev,
+					"Read failed, ret=%d\n", ret);
+				return IRQ_HANDLED;
+			}
+			lab_en = !!(val & LAB_ENABLE_CTL_EN);
+
+			reg = labibb->ibb_base + REG_IBB_ENABLE_CTL;
+			ret = qcom_labibb_read(labibb, reg, &val, 1);
+			if (ret < 0) {
+				dev_err(labibb->dev,
+					"Read failed, ret=%d\n", ret);
+				return IRQ_HANDLED;
+			}
+			ibb_en = !!(val & IBB_CONTROL_ENABLE);
+			if (lab_en || ibb_en)
+				msleep(POLLING_SCP_DONE_INTERVAL_MS);
+			else
+				break;
+		} while ((lab_en || ibb_en) && count--);
+
+		if (labibb->lab_vreg.vreg_enabled &&
+		    labibb->ibb_vreg.vreg_enabled && !lab_en && !ibb_en) {
+			dev_dbg(labibb->dev, "LAB/IBB has been disabled by SCP\n");
+			scp_done = true;
+		}
+	}
+
+	if (in_sc_err || scp_done)
+		labibb_sc_err_recovery_work(labibb);
+
+	return IRQ_HANDLED;
+}
+
 static int register_lab_regulator(struct qcom_labibb *labibb,
 				  struct device_node *of_node)
 {
@@ -295,6 +408,20 @@ static int register_lab_regulator(struct qcom_labibb *labibb,
 	struct regulator_init_data *init_data;
 	struct regulator_config cfg = {};
 
+	(labibb->lab_vreg.lab_sc_irq > 0) {
+		ret = devm_request_threaded_irq(labibb->dev,
+						labibb->lab_vreg.lab_sc_irq,
+						NULL, labibb_sc_err_handler,
+						IRQF_ONESHOT |
+						IRQF_TRIGGER_RISING,
+						"lab-sc-err", labibb);
+		if (ret) {
+			dev_err(labibb->dev, "Failed to register 'lab-sc-err' irq ret=%d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	cfg.dev = labibb->dev;
 	cfg.driver_data = labibb;
 	cfg.of_node = of_node;
@@ -326,6 +453,20 @@ static int register_ibb_regulator(struct qcom_labibb *labibb,
 	struct regulator_init_data *init_data;
 	struct regulator_config cfg = {};
 
+	if (labibb->ibb_vreg.ibb_sc_irq > 0) {
+		ret = devm_request_threaded_irq(labibb->dev,
+						labibb->ibb_vreg.ibb_sc_irq,
+						NULL, labibb_sc_err_handler,
+						IRQF_ONESHOT |
+						IRQF_TRIGGER_RISING,
+						"ibb-sc-err", labibb);
+		if (ret) {
+			dev_err(labibb->dev, "Failed to register 'ibb-sc-err' irq ret=%d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	cfg.dev = labibb->dev;
 	cfg.driver_data = labibb;
 	cfg.of_node = of_node;
@@ -390,6 +531,16 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 		switch (type) {
 		case QCOM_LAB_TYPE:
 			labibb->lab_base = base;
+
+			labibb->lab_vreg.lab_sc_irq = -EINVAL;
+			ret = of_irq_get_byname(child, "lab-sc-err");
+			if (ret < 0)
+				dev_dbg(labibb->dev,
+					"Unable to get lab-sc-err, ret = %d\n",
+					ret);
+			else
+				labibb->lab_vreg.lab_sc_irq = ret;
+
 			ret = register_lab_regulator(labibb, child);
 			if (ret < 0) {
 				dev_err(labibb->dev,
@@ -400,6 +551,16 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 
 		case QCOM_IBB_TYPE:
 			labibb->ibb_base = base;
+
+			labibb->ibb_vreg.ibb_sc_irq = -EINVAL;
+			ret = of_irq_get_byname(child, "ibb-sc-err");
+			if (ret < 0)
+				dev_dbg(labibb->dev,
+					"Unable to get ibb-sc-err, ret = %d\n",
+					ret);
+			else
+				labibb->ibb_vreg.ibb_sc_irq = ret;
+
 			ret = register_ibb_regulator(labibb, child);
 			if (ret < 0) {
 				dev_err(labibb->dev,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

