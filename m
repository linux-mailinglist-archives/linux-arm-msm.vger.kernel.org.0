Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E571C17DCC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 10:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgCIJyH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 05:54:07 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55522 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726379AbgCIJyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 05:54:06 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Mar 2020 15:24:02 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Mar 2020 15:23:44 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 114082418; Mon,  9 Mar 2020 15:23:44 +0530 (IST)
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
Subject: [PATCH v5 5/9] phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2 V2 PHY
Date:   Mon,  9 Mar 2020 15:23:05 +0530
Message-Id: <1583747589-17267-6-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added new structure for overriding tuning parameters in QUSB2 V2 PHY as the
override params are increased due to usage of generic QUSB2 V2 phy table.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 75 ++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 70c9da6..44841c9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -277,6 +277,28 @@ static const char * const qusb2_phy_vreg_names[] = {
 
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
+ */
+struct override_params {
+	struct override_param imp_res_offset;
+	struct override_param hstx_trim;
+	struct override_param preemphasis;
+	struct override_param preemphasis_width;
+};
+
 /**
  * struct qusb2_phy - structure holding qusb2 phy attributes
  *
@@ -292,14 +314,7 @@ static const char * const qusb2_phy_vreg_names[] = {
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
@@ -319,14 +334,7 @@ struct qusb2_phy {
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
@@ -394,24 +402,25 @@ void qcom_qusb2_phy_configure(void __iomem *base,
 static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 {
 	const struct qusb2_phy_cfg *cfg = qphy->cfg;
+	struct override_params *or = &qphy->overrides;
 
-	if (qphy->override_imp_res_offset)
+	if (or->imp_res_offset.override)
 		qusb2_write_mask(qphy->base, QUSB2PHY_IMP_CTRL1,
-			     qphy->imp_res_offset_value << IMP_RES_OFFSET_SHIFT,
+		or->imp_res_offset.value << IMP_RES_OFFSET_SHIFT,
 			     IMP_RES_OFFSET_MASK);
 
-	if (qphy->override_hstx_trim)
+	if (or->hstx_trim.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-				 qphy->hstx_trim_value << HSTX_TRIM_SHIFT,
+		or->hstx_trim.value << HSTX_TRIM_SHIFT,
 				 HSTX_TRIM_MASK);
 
-	if (qphy->override_preemphasis)
+	if (or->preemphasis.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-				qphy->preemphasis_level << PREEMPHASIS_EN_SHIFT,
+		or->preemphasis.value << PREEMPHASIS_EN_SHIFT,
 				PREEMPHASIS_EN_MASK);
 
-	if (qphy->override_preemphasis_width) {
-		if (qphy->preemphasis_width ==
+	if (or->preemphasis_width.override) {
+		if (or->preemphasis_width.value ==
 		    QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT)
 			qusb2_setbits(qphy->base,
 				      cfg->regs[QUSB2PHY_PORT_TUNE1],
@@ -796,10 +805,12 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 	int ret, i;
 	int num;
 	u32 value;
+	struct override_params *or;
 
 	qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
 	if (!qphy)
 		return -ENOMEM;
+	or = &qphy->overrides;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	qphy->base = devm_ioremap_resource(dev, res);
@@ -864,26 +875,26 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 
 	if (!of_property_read_u32(dev->of_node, "qcom,imp-res-offset-value",
 				  &value)) {
-		qphy->imp_res_offset_value = (u8)value;
-		qphy->override_imp_res_offset = true;
+		or->imp_res_offset.value = (u8)value;
+		or->imp_res_offset.override = true;
 	}
 
 	if (!of_property_read_u32(dev->of_node, "qcom,hstx-trim-value",
 				  &value)) {
-		qphy->hstx_trim_value = (u8)value;
-		qphy->override_hstx_trim = true;
+		or->hstx_trim.value = (u8)value;
+		or->hstx_trim.override = true;
 	}
 
 	if (!of_property_read_u32(dev->of_node, "qcom,preemphasis-level",
 				     &value)) {
-		qphy->preemphasis_level = (u8)value;
-		qphy->override_preemphasis = true;
+		or->preemphasis.value = (u8)value;
+		or->preemphasis.override = true;
 	}
 
 	if (!of_property_read_u32(dev->of_node, "qcom,preemphasis-width",
 				     &value)) {
-		qphy->preemphasis_width = (u8)value;
-		qphy->override_preemphasis_width = true;
+		or->preemphasis_width.value = (u8)value;
+		or->preemphasis_width.override = true;
 	}
 
 	pm_runtime_set_active(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

