Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC5D817DCC7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 10:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgCIJyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 05:54:05 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:36868 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725942AbgCIJyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 05:54:05 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Mar 2020 15:24:02 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Mar 2020 15:23:45 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id BE4F5230B; Mon,  9 Mar 2020 15:23:44 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v5 6/9] phy: qcom-qusb2: Add new overriding tuning parameters in QUSB2 V2 PHY
Date:   Mon,  9 Mar 2020 15:23:06 +0530
Message-Id: <1583747589-17267-7-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added support for overriding bias-ctrl-value,charge-ctrl-value and
hsdisc-trim-value params for QUSB2 V2 PHY

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 44841c9..3708d43 100644
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
@@ -291,12 +303,18 @@ struct override_param {
  * @hstx_trim: HSTX_TRIM to be updated in TUNE1 register
  * @preemphasis: Amplitude Pre-Emphasis to be updated in TUNE1 register
  * @preemphasis_width: half/full-width Pre-Emphasis updated via TUNE1
+ * @bias_ctrl: bias ctrl to be updated in BIAS_CONTROL_2 register
+ * @charge_ctrl: charge ctrl to be updated in CHG_CTRL2 register
+ * @hsdisc_trim: disconnect threshold to be updated in TUNE2 register
  */
 struct override_params {
 	struct override_param imp_res_offset;
 	struct override_param hstx_trim;
 	struct override_param preemphasis;
 	struct override_param preemphasis_width;
+	struct override_param bias_ctrl;
+	struct override_param charge_ctrl;
+	struct override_param hsdisc_trim;
 };
 
 /**
@@ -409,6 +427,16 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 		or->imp_res_offset.value << IMP_RES_OFFSET_SHIFT,
 			     IMP_RES_OFFSET_MASK);
 
+	if (or->bias_ctrl.override)
+		qusb2_write_mask(qphy->base, QUSB2PHY_PLL_BIAS_CONTROL_2,
+		or->bias_ctrl.value << BIAS_CTRL2_RES_OFFSET_SHIFT,
+			   BIAS_CTRL2_RES_OFFSET_MASK);
+
+	if (or->charge_ctrl.override)
+		qusb2_write_mask(qphy->base, QUSB2PHY_CHG_CTRL2,
+		or->charge_ctrl.value << CHG_CTRL2_OFFSET_SHIFT,
+			     CHG_CTRL2_OFFSET_MASK);
+
 	if (or->hstx_trim.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
 		or->hstx_trim.value << HSTX_TRIM_SHIFT,
@@ -430,6 +458,11 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 				      cfg->regs[QUSB2PHY_PORT_TUNE1],
 				      PREEMPH_WIDTH_HALF_BIT);
 	}
+
+	if (or->hsdisc_trim.override)
+		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
+		or->hsdisc_trim.value << HSDISC_TRIM_SHIFT,
+				 HSDISC_TRIM_MASK);
 }
 
 /*
@@ -879,6 +912,18 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		or->imp_res_offset.override = true;
 	}
 
+	if (!of_property_read_u32(dev->of_node, "qcom,bias-ctrl-value",
+				  &value)) {
+		or->bias_ctrl.value = (u8)value;
+		or->bias_ctrl.override = true;
+	}
+
+	if (!of_property_read_u32(dev->of_node, "qcom,charge-ctrl-value",
+				  &value)) {
+		or->charge_ctrl.value = (u8)value;
+		or->charge_ctrl.override = true;
+	}
+
 	if (!of_property_read_u32(dev->of_node, "qcom,hstx-trim-value",
 				  &value)) {
 		or->hstx_trim.value = (u8)value;
@@ -897,6 +942,12 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		or->preemphasis_width.override = true;
 	}
 
+	if (!of_property_read_u32(dev->of_node, "qcom,hsdisc-trim-value",
+				  &value)) {
+		or->hsdisc_trim.value = (u8)value;
+		or->hsdisc_trim.override = true;
+	}
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	/*
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

