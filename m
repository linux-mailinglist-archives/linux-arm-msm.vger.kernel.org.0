Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395CB2F95CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 23:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730277AbhAQWJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 17:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730272AbhAQWJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 17:09:32 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58F9C061757;
        Sun, 17 Jan 2021 14:08:36 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 277881F542;
        Sun, 17 Jan 2021 23:08:35 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v3 3/7] regulator: qcom-labibb: Implement pull-down, softstart, active discharge
Date:   Sun, 17 Jan 2021 23:08:26 +0100
Message-Id: <20210117220830.150948-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
References: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Soft start is required to avoid inrush current during LAB ramp-up and
IBB ramp-down, protecting connected hardware to which we supply voltage.

Since soft start is configurable on both LAB and IBB regulators, it
was necessary to add two DT properties, respectively "qcom,soft-start-us"
to control LAB ramp-up and "qcom,discharge-resistor-kohms" to control
the discharge resistor for IBB ramp-down, which obviously brought the
need of implementing a of_parse callback for both regulators.

Finally, also implement pull-down mode in order to avoid unpredictable
behavior when the regulators are disabled (random voltage spikes etc).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/regulator/qcom-labibb-regulator.c | 94 +++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 0643713d6aad..4d68b69b5a52 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -29,12 +29,23 @@
 #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
 #define LABIBB_CONTROL_ENABLE		BIT(7)
 
+#define REG_LABIBB_PD_CTL		0x47
+ #define LAB_PD_CTL_MASK		GENMASK(1, 0)
+ #define IBB_PD_CTL_MASK		(BIT(0) | BIT(7))
+ #define LAB_PD_CTL_STRONG_PULL		BIT(0)
+ #define IBB_PD_CTL_HALF_STRENGTH	BIT(0)
+ #define IBB_PD_CTL_EN			BIT(7)
+
 #define REG_LABIBB_CURRENT_LIMIT	0x4b
  #define LAB_CURRENT_LIMIT_MASK		GENMASK(2, 0)
  #define IBB_CURRENT_LIMIT_MASK		GENMASK(4, 0)
  #define LAB_CURRENT_LIMIT_OVERRIDE_EN	BIT(3)
  #define LABIBB_CURRENT_LIMIT_EN	BIT(7)
 
+#define REG_IBB_PWRUP_PWRDN_CTL_1	0x58
+ #define IBB_CTL_1_DISCHARGE_EN		BIT(2)
+
+#define REG_LABIBB_SOFT_START_CTL	0x5f
 #define REG_LABIBB_SEC_ACCESS		0xd0
  #define LABIBB_SEC_UNLOCK_CODE		0xa5
 
@@ -60,6 +71,8 @@ struct labibb_regulator {
 	struct labibb_current_limits	uA_limits;
 	u16				base;
 	u8				type;
+	u8				dischg_sel;
+	u8				soft_start_sel;
 };
 
 struct labibb_regulator_data {
@@ -120,6 +133,70 @@ static int qcom_labibb_get_current_limit(struct regulator_dev *rdev)
 	return (cur_step * lim->uA_step) + lim->uA_min;
 }
 
+static int qcom_labibb_set_soft_start(struct regulator_dev *rdev)
+{
+	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
+	u32 val = 0;
+
+	if (vreg->type == QCOM_IBB_TYPE)
+		val = vreg->dischg_sel;
+	else
+		val = vreg->soft_start_sel;
+
+	return regmap_write(rdev->regmap, rdev->desc->soft_start_reg, val);
+}
+
+static int qcom_labibb_get_table_sel(const int *table, int sz, u32 value)
+{
+	int i;
+
+	for (i = 0; i < sz; i++)
+		if (table[i] == value)
+			return i;
+	return -EINVAL;
+}
+
+/* IBB discharge resistor values in KOhms */
+static const int dischg_resistor_values[] = { 300, 64, 32, 16 };
+
+/* Soft start time in microseconds */
+static const int soft_start_values[] = { 200, 400, 600, 800 };
+
+static int qcom_labibb_of_parse_cb(struct device_node *np,
+				   const struct regulator_desc *desc,
+				   struct regulator_config *config)
+{
+	struct labibb_regulator *vreg = config->driver_data;
+	u32 dischg_kohms, soft_start_time;
+	int ret;
+
+	ret = of_property_read_u32(np, "qcom,discharge-resistor-kohms",
+				       &dischg_kohms);
+	if (ret)
+		dischg_kohms = 300;
+
+	ret = qcom_labibb_get_table_sel(dischg_resistor_values,
+					ARRAY_SIZE(dischg_resistor_values),
+					dischg_kohms);
+	if (ret < 0)
+		return ret;
+	vreg->dischg_sel = (u8)ret;
+
+	ret = of_property_read_u32(np, "qcom,soft-start-us",
+				   &soft_start_time);
+	if (ret)
+		soft_start_time = 200;
+
+	ret = qcom_labibb_get_table_sel(soft_start_values,
+					ARRAY_SIZE(soft_start_values),
+					soft_start_time);
+	if (ret < 0)
+		return ret;
+	vreg->soft_start_sel = (u8)ret;
+
+	return 0;
+}
+
 static const struct regulator_ops qcom_labibb_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -128,8 +205,11 @@ static const struct regulator_ops qcom_labibb_ops = {
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
+	.set_active_discharge	= regulator_set_active_discharge_regmap,
+	.set_pull_down		= regulator_set_pull_down_regmap,
 	.set_current_limit	= qcom_labibb_set_current_limit,
 	.get_current_limit	= qcom_labibb_get_current_limit,
+	.set_soft_start		= qcom_labibb_set_soft_start,
 };
 
 static const struct regulator_desc pmi8998_lab_desc = {
@@ -138,6 +218,10 @@ static const struct regulator_desc pmi8998_lab_desc = {
 	.enable_val		= LABIBB_CONTROL_ENABLE,
 	.enable_time		= LAB_ENABLE_TIME,
 	.poll_enabled_time	= LABIBB_POLL_ENABLED_TIME,
+	.soft_start_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_SOFT_START_CTL),
+	.pull_down_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_PD_CTL),
+	.pull_down_mask		= LAB_PD_CTL_MASK,
+	.pull_down_val_on	= LAB_PD_CTL_STRONG_PULL,
 	.vsel_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
 	.vsel_mask		= LAB_VOLTAGE_SET_MASK,
 	.apply_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
@@ -152,6 +236,7 @@ static const struct regulator_desc pmi8998_lab_desc = {
 	.uV_step		= 100000,
 	.n_voltages		= 16,
 	.ops			= &qcom_labibb_ops,
+	.of_parse_cb		= qcom_labibb_of_parse_cb,
 };
 
 static const struct regulator_desc pmi8998_ibb_desc = {
@@ -160,6 +245,14 @@ static const struct regulator_desc pmi8998_ibb_desc = {
 	.enable_val		= LABIBB_CONTROL_ENABLE,
 	.enable_time		= IBB_ENABLE_TIME,
 	.poll_enabled_time	= LABIBB_POLL_ENABLED_TIME,
+	.soft_start_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_SOFT_START_CTL),
+	.active_discharge_off	= 0,
+	.active_discharge_on	= IBB_CTL_1_DISCHARGE_EN,
+	.active_discharge_mask	= IBB_CTL_1_DISCHARGE_EN,
+	.active_discharge_reg	= (PMI8998_IBB_REG_BASE + REG_IBB_PWRUP_PWRDN_CTL_1),
+	.pull_down_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_PD_CTL),
+	.pull_down_mask		= IBB_PD_CTL_MASK,
+	.pull_down_val_on	= IBB_PD_CTL_HALF_STRENGTH | IBB_PD_CTL_EN,
 	.vsel_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
 	.vsel_mask		= IBB_VOLTAGE_SET_MASK,
 	.apply_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
@@ -174,6 +267,7 @@ static const struct regulator_desc pmi8998_ibb_desc = {
 	.uV_step		= 100000,
 	.n_voltages		= 64,
 	.ops			= &qcom_labibb_ops,
+	.of_parse_cb		= qcom_labibb_of_parse_cb,
 };
 
 static const struct labibb_regulator_data pmi8998_labibb_data[] = {
-- 
2.29.2

