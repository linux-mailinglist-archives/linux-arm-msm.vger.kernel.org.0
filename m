Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87154136CF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 13:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgAJMUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 07:20:07 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:5304 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728072AbgAJMUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 07:20:06 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Jan 2020 17:49:06 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2020 17:48:58 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id C1ECF22B4; Fri, 10 Jan 2020 17:48:57 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 4/5] phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2 V2 PHY
Date:   Fri, 10 Jan 2020 17:48:18 +0530
Message-Id: <1578658699-30458-5-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for overriding tuning parameters in QUSB2 V2 PHY
bias-ctrl-value,charge-ctrl-value and hsdisc-trim-value.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index db4ae26..d8bed13 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -66,6 +66,14 @@
 #define IMP_RES_OFFSET_MASK			GENMASK(5, 0)
 #define IMP_RES_OFFSET_SHIFT			0x0
 
+/* QUSB2PHY_PLL_BIAS_CONTROL_2 register bits */
+#define BIAS_CTRL2_RES_OFFSET_MASK		GENMASK(5, 0)
+#define BIAS_CTRL2_RES_OFFSET_SHIFT		0x0
+
+/* QUSB2PHY_CHG_CONTROL_2 register bits */
+#define CHG_CTRL2_OFFSET_MASK			GENMASK(5, 4)
+#define CHG_CTRL2_OFFSET_SHIFT			0x4
+
 /* QUSB2PHY_PORT_TUNE1 register bits */
 #define HSTX_TRIM_MASK				GENMASK(7, 4)
 #define HSTX_TRIM_SHIFT				0x4
@@ -73,6 +81,10 @@
 #define PREEMPHASIS_EN_MASK			GENMASK(1, 0)
 #define PREEMPHASIS_EN_SHIFT			0x0
 
+/* QUSB2PHY_PORT_TUNE2 register bits */
+#define HSDISC_TRIM_MASK			GENMASK(1, 0)
+#define HSDISC_TRIM_SHIFT			0x0
+
 #define QUSB2PHY_PLL_ANALOG_CONTROLS_TWO	0x04
 #define QUSB2PHY_PLL_CLOCK_INVERTERS		0x18c
 #define QUSB2PHY_PLL_CMODE			0x2c
@@ -327,6 +339,12 @@ struct qusb2_phy {
 	u8 preemphasis_level;
 	bool override_preemphasis_width;
 	u8 preemphasis_width;
+	bool override_bias_ctrl;
+	u8 bias_ctrl_value;
+	bool override_charge_ctrl;
+	u8 charge_ctrl_value;
+	bool override_hsdisc_trim;
+	u8 hsdisc_trim_value;
 
 	const struct qusb2_phy_cfg *cfg;
 	bool has_se_clk_scheme;
@@ -400,6 +418,16 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 			     qphy->imp_res_offset_value << IMP_RES_OFFSET_SHIFT,
 			     IMP_RES_OFFSET_MASK);
 
+	if (qphy->override_bias_ctrl)
+		qusb2_write_mask(qphy->base, QUSB2PHY_PLL_BIAS_CONTROL_2,
+			   qphy->bias_ctrl_value << BIAS_CTRL2_RES_OFFSET_SHIFT,
+			   BIAS_CTRL2_RES_OFFSET_MASK);
+
+	if (qphy->override_charge_ctrl)
+		qusb2_write_mask(qphy->base, QUSB2PHY_CHG_CTRL2,
+			     qphy->charge_ctrl_value << CHG_CTRL2_OFFSET_SHIFT,
+			     CHG_CTRL2_OFFSET_MASK);
+
 	if (qphy->override_hstx_trim)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
 				 qphy->hstx_trim_value << HSTX_TRIM_SHIFT,
@@ -421,6 +449,11 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 				      cfg->regs[QUSB2PHY_PORT_TUNE1],
 				      PREEMPH_WIDTH_HALF_BIT);
 	}
+
+	if (qphy->override_hsdisc_trim)
+		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
+				 qphy->hsdisc_trim_value << HSDISC_TRIM_SHIFT,
+				 HSDISC_TRIM_MASK);
 }
 
 /*
@@ -874,6 +907,18 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		qphy->override_imp_res_offset = true;
 	}
 
+	if (!of_property_read_u32(dev->of_node, "qcom,bias-ctrl-value",
+				  &value)) {
+		qphy->bias_ctrl_value = (u8)value;
+		qphy->override_bias_ctrl = true;
+	}
+
+	if (!of_property_read_u32(dev->of_node, "qcom,charge-ctrl-value",
+				  &value)) {
+		qphy->charge_ctrl_value = (u8)value;
+		qphy->override_charge_ctrl = true;
+	}
+
 	if (!of_property_read_u32(dev->of_node, "qcom,hstx-trim-value",
 				  &value)) {
 		qphy->hstx_trim_value = (u8)value;
@@ -892,6 +937,12 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		qphy->override_preemphasis_width = true;
 	}
 
+	if (!of_property_read_u32(dev->of_node, "qcom,hsdisc-trim-value",
+				  &value)) {
+		qphy->hsdisc_trim_value = (u8)value;
+		qphy->override_hsdisc_trim = true;
+	}
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	/*
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

