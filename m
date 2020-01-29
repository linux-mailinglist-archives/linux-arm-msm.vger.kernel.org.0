Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F05714CBD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 14:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgA2Nwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 08:52:49 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:60060 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726240AbgA2Nwf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 08:52:35 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2020 19:22:26 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Jan 2020 19:22:09 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id C9C182583; Wed, 29 Jan 2020 19:22:07 +0530 (IST)
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
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v4 5/8] phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2 V2 PHY
Date:   Wed, 29 Jan 2020 19:21:56 +0530
Message-Id: <1580305919-30946-6-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added new structure for overriding tuning parameters in QUSB2 V2 PHY as the
override params are increased due to usage of generic QUSB2 V2 phy table.
Also added bias-ctrl-value,charge-ctrl-value and hsdisc-trim-value params.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 125 +++++++++++++++++++++++++---------
 1 file changed, 93 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 70c9da6..f45fda3 100644
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
@@ -277,6 +289,34 @@ static const char * const qusb2_phy_vreg_names[] = {
 
 #define QUSB2_NUM_VREGS		ARRAY_SIZE(qusb2_phy_vreg_names)
 
+/* struct override_param - structure holding qusb2 v2 phy overriding param
+ * set override true if the  device tree property exists and read and assign
+ * to value
+ */
+struct override_param {
+	bool override;
+	u8 value;
+};
+
+/*struct override_params - structure holding qusb2 v2 phy overriding params
+ * @imp_res_offset: rescode offset to be updated in IMP_CTRL1 register
+ * @hstx_trim: HSTX_TRIM to be updated in TUNE1 register
+ * @preemphasis: Amplitude Pre-Emphasis to be updated in TUNE1 register
+ * @preemphasis_width: half/full-width Pre-Emphasis updated via TUNE1
+ * @bias_ctrl: bias ctrl to be updated in BIAS_CONTROL_2 register
+ * @charge_ctrl: charge ctrl to be updated in CHG_CTRL2 register
+ * @hsdisc_trim: disconnect threshold to be updated in TUNE2 register
+ */
+struct override_params {
+	struct override_param imp_res_offset;
+	struct override_param hstx_trim;
+	struct override_param preemphasis;
+	struct override_param preemphasis_width;
+	struct override_param bias_ctrl;
+	struct override_param charge_ctrl;
+	struct override_param hsdisc_trim;
+};
+
 /**
  * struct qusb2_phy - structure holding qusb2 phy attributes
  *
@@ -292,20 +332,15 @@ static const char * const qusb2_phy_vreg_names[] = {
  * @tcsr: TCSR syscon register map
  * @cell: nvmem cell containing phy tuning value
  *
- * @override_imp_res_offset: PHY should use different rescode offset
- * @imp_res_offset_value: rescode offset to be updated in IMP_CTRL1 register
- * @override_hstx_trim: PHY should use different HSTX o/p current value
- * @hstx_trim_value: HSTX_TRIM value to be updated in TUNE1 register
- * @override_preemphasis: PHY should use different pre-amphasis amplitude
- * @preemphasis_level: Amplitude Pre-Emphasis to be updated in TUNE1 register
- * @override_preemphasis_width: PHY should use different pre-emphasis duration
- * @preemphasis_width: half/full-width Pre-Emphasis updated via TUNE1
+ * @overrides: pointer to structure for all overriding tuning params
  *
  * @cfg: phy config data
  * @has_se_clk_scheme: indicate if PHY has single-ended ref clock scheme
  * @phy_initialized: indicate if PHY has been initialized
  * @mode: current PHY mode
  */
+
+
 struct qusb2_phy {
 	struct phy *phy;
 	void __iomem *base;
@@ -319,14 +354,7 @@ struct qusb2_phy {
 	struct regmap *tcsr;
 	struct nvmem_cell *cell;
 
-	bool override_imp_res_offset;
-	u8 imp_res_offset_value;
-	bool override_hstx_trim;
-	u8 hstx_trim_value;
-	bool override_preemphasis;
-	u8 preemphasis_level;
-	bool override_preemphasis_width;
-	u8 preemphasis_width;
+	struct override_params overrides;
 
 	const struct qusb2_phy_cfg *cfg;
 	bool has_se_clk_scheme;
@@ -395,23 +423,33 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 {
 	const struct qusb2_phy_cfg *cfg = qphy->cfg;
 
-	if (qphy->override_imp_res_offset)
+	if (qphy->overrides.imp_res_offset.override)
 		qusb2_write_mask(qphy->base, QUSB2PHY_IMP_CTRL1,
-			     qphy->imp_res_offset_value << IMP_RES_OFFSET_SHIFT,
+		qphy->overrides.imp_res_offset.value << IMP_RES_OFFSET_SHIFT,
 			     IMP_RES_OFFSET_MASK);
 
-	if (qphy->override_hstx_trim)
+	if (qphy->overrides.bias_ctrl.override)
+		qusb2_write_mask(qphy->base, QUSB2PHY_PLL_BIAS_CONTROL_2,
+		qphy->overrides.bias_ctrl.value << BIAS_CTRL2_RES_OFFSET_SHIFT,
+			   BIAS_CTRL2_RES_OFFSET_MASK);
+
+	if (qphy->overrides.charge_ctrl.override)
+		qusb2_write_mask(qphy->base, QUSB2PHY_CHG_CTRL2,
+		qphy->overrides.charge_ctrl.value << CHG_CTRL2_OFFSET_SHIFT,
+			     CHG_CTRL2_OFFSET_MASK);
+
+	if (qphy->overrides.hstx_trim.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-				 qphy->hstx_trim_value << HSTX_TRIM_SHIFT,
+		qphy->overrides.hstx_trim.value << HSTX_TRIM_SHIFT,
 				 HSTX_TRIM_MASK);
 
-	if (qphy->override_preemphasis)
+	if (qphy->overrides.preemphasis.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-				qphy->preemphasis_level << PREEMPHASIS_EN_SHIFT,
+		qphy->overrides.preemphasis.value << PREEMPHASIS_EN_SHIFT,
 				PREEMPHASIS_EN_MASK);
 
-	if (qphy->override_preemphasis_width) {
-		if (qphy->preemphasis_width ==
+	if (qphy->overrides.preemphasis_width.override) {
+		if (qphy->overrides.preemphasis_width.value ==
 		    QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT)
 			qusb2_setbits(qphy->base,
 				      cfg->regs[QUSB2PHY_PORT_TUNE1],
@@ -421,6 +459,11 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 				      cfg->regs[QUSB2PHY_PORT_TUNE1],
 				      PREEMPH_WIDTH_HALF_BIT);
 	}
+
+	if (qphy->overrides.hsdisc_trim.override)
+		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
+		qphy->overrides.hsdisc_trim.value << HSDISC_TRIM_SHIFT,
+				 HSDISC_TRIM_MASK);
 }
 
 /*
@@ -864,26 +907,44 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 
 	if (!of_property_read_u32(dev->of_node, "qcom,imp-res-offset-value",
 				  &value)) {
-		qphy->imp_res_offset_value = (u8)value;
-		qphy->override_imp_res_offset = true;
+		qphy->overrides.imp_res_offset.value = (u8)value;
+		qphy->overrides.imp_res_offset.override = true;
+	}
+
+	if (!of_property_read_u32(dev->of_node, "qcom,bias-ctrl-value",
+				  &value)) {
+		qphy->overrides.bias_ctrl.value = (u8)value;
+		qphy->overrides.bias_ctrl.override = true;
+	}
+
+	if (!of_property_read_u32(dev->of_node, "qcom,charge-ctrl-value",
+				  &value)) {
+		qphy->overrides.charge_ctrl.value = (u8)value;
+		qphy->overrides.charge_ctrl.override = true;
 	}
 
 	if (!of_property_read_u32(dev->of_node, "qcom,hstx-trim-value",
 				  &value)) {
-		qphy->hstx_trim_value = (u8)value;
-		qphy->override_hstx_trim = true;
+		qphy->overrides.hstx_trim.value = (u8)value;
+		qphy->overrides.hstx_trim.override = true;
 	}
 
 	if (!of_property_read_u32(dev->of_node, "qcom,preemphasis-level",
 				     &value)) {
-		qphy->preemphasis_level = (u8)value;
-		qphy->override_preemphasis = true;
+		qphy->overrides.preemphasis.value = (u8)value;
+		qphy->overrides.preemphasis.override = true;
 	}
 
 	if (!of_property_read_u32(dev->of_node, "qcom,preemphasis-width",
 				     &value)) {
-		qphy->preemphasis_width = (u8)value;
-		qphy->override_preemphasis_width = true;
+		qphy->overrides.preemphasis_width.value = (u8)value;
+		qphy->overrides.preemphasis_width.override = true;
+	}
+
+	if (!of_property_read_u32(dev->of_node, "qcom,hsdisc-trim-value",
+				  &value)) {
+		qphy->overrides.hsdisc_trim.value = (u8)value;
+		qphy->overrides.hsdisc_trim.override = true;
 	}
 
 	pm_runtime_set_active(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

