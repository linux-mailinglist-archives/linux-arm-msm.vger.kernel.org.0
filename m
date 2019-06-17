Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDDC48C12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 20:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfFQShe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 14:37:34 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46854 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfFQShd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 14:37:33 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so4434885pls.13;
        Mon, 17 Jun 2019 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CQof8F1xhz+F1ATPwPiy1QiO7IM8neuAEGxxMl2Ks3I=;
        b=N7SCY0+ii8ywOexLGjFWPsUZEEOH07JrYLRyl8BlrHMhazFuB3fBYseJLWgO10BdIb
         R5rJ1g/NUsmcY+BU8s7d6pp9eeyu6nxjhg5pG3safyTQSMzkzI4WPxjHchYwlehKxP1/
         Ym1adYlbQCFXvnpVTUm/gCgzZo/ekucMyn/3avpVv2EsQaRjdqHc53U0+vSTs02Yp+rN
         XIt9uSH8nS9UNgVZCetJlLl2kjIrER0oSMgFfZhvi/YKdQoIjtWgYyV4mwaC8IE9S+Hg
         DmEMlGf5zA6Xv9+QYep4UXR4fsbBmrxDCdhtvl41aCMZaLoHwMXBOZ1zJ3JAtMw2vZ1A
         K1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CQof8F1xhz+F1ATPwPiy1QiO7IM8neuAEGxxMl2Ks3I=;
        b=irqBta9TXuT9RTUNOF+1j9pz1cnw5md0kunV3hkR+QAhm++h6Fcwsp/X66a6i9CwZj
         DZmk/ygoVg/WMgs3QPT++5P2qNl0/tZ5IwzxTYmt64mIJmvjEaj4yQ3L9Q9WhPQUGFnV
         CZlFEBkSRwuGDx+UjRxrHXHkEozJ7SQIz7G1VngysPhvGSgWZ/ZcYzV6tkHzLfhJDsIh
         U5pWzD0WoQIkrhCxEk2OTBcTNI3CQjzUsRHEF0ST+9Qn+i9fE/jDQQ9UaX5KXVH2KhKW
         J7KsiZLihiwPmbeWjEsdlFkThCj5uBZecDEvnGyH53PjZ2Lf+/v/QsYR+HkRJzj9ko0U
         Ip8A==
X-Gm-Message-State: APjAAAXyA0ph28LLvC0hXUBI9WN5DJHc3ypAkZ0KavBn4uPLwTYUNI2W
        tfSTFn/Zc6wY1iHZV2O1jQM=
X-Google-Smtp-Source: APXvYqzMuqM00Zl2BNEGoD43HtrkPlEl1i1cpW+s4a3j4ZAkM12xIUhFYLXQ0yELF7J172COS8NgSQ==
X-Received: by 2002:a17:902:403:: with SMTP id 3mr107568509ple.66.1560796652839;
        Mon, 17 Jun 2019 11:37:32 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id v4sm15417273pff.45.2019.06.17.11.37.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 11:37:32 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 2/5] regulator: qcom_spmi: Add support for PM8005
Date:   Mon, 17 Jun 2019 11:37:29 -0700
Message-Id: <20190617183729.13553-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
References: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8005 is used on the msm8998 MTP.  The S1 regulator is VDD_GFX, ie
it needs to be on and controlled inorder to use the GPU.  Add support to
drive the PM8005 regulators so that we can bring up the GPU on msm8998.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 176 ++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 1b3383a24c9d..8d1ee72ddbe2 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -104,6 +104,7 @@ enum spmi_regulator_logical_type {
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LO_SMPS,
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_HO_SMPS,
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
+	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426,
 };
 
 enum spmi_regulator_type {
@@ -150,6 +151,7 @@ enum spmi_regulator_subtype {
 	SPMI_REGULATOR_SUBTYPE_5V_BOOST		= 0x01,
 	SPMI_REGULATOR_SUBTYPE_FTS_CTL		= 0x08,
 	SPMI_REGULATOR_SUBTYPE_FTS2p5_CTL	= 0x09,
+	SPMI_REGULATOR_SUBTYPE_FTS426_CTL	= 0x0a,
 	SPMI_REGULATOR_SUBTYPE_BB_2A		= 0x01,
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL1	= 0x0d,
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL2	= 0x0e,
@@ -170,6 +172,18 @@ enum spmi_common_regulator_registers {
 	SPMI_COMMON_REG_STEP_CTRL		= 0x61,
 };
 
+/*
+ * Second common register layout used by newer devices starting with ftsmps426
+ * Note that some of the registers from the first common layout remain
+ * unchanged and their definition is not duplicated.
+ */
+enum spmi_ftsmps426_regulator_registers {
+	SPMI_FTSMPS426_REG_VOLTAGE_LSB		= 0x40,
+	SPMI_FTSMPS426_REG_VOLTAGE_MSB		= 0x41,
+	SPMI_FTSMPS426_REG_VOLTAGE_ULS_LSB	= 0x68,
+	SPMI_FTSMPS426_REG_VOLTAGE_ULS_MSB	= 0x69,
+};
+
 enum spmi_vs_registers {
 	SPMI_VS_REG_OCP				= 0x4a,
 	SPMI_VS_REG_SOFT_START			= 0x4c,
@@ -229,6 +243,14 @@ enum spmi_common_control_register_index {
 #define SPMI_COMMON_MODE_FOLLOW_HW_EN0_MASK	0x01
 #define SPMI_COMMON_MODE_FOLLOW_ALL_MASK	0x1f
 
+#define SPMI_FTSMPS426_MODE_BYPASS_MASK		3
+#define SPMI_FTSMPS426_MODE_RETENTION_MASK	4
+#define SPMI_FTSMPS426_MODE_LPM_MASK		5
+#define SPMI_FTSMPS426_MODE_AUTO_MASK		6
+#define SPMI_FTSMPS426_MODE_HPM_MASK		7
+
+#define SPMI_FTSMPS426_MODE_MASK		0x07
+
 /* Common regulator pull down control register layout */
 #define SPMI_COMMON_PULL_DOWN_ENABLE_MASK	0x80
 
@@ -274,6 +296,23 @@ enum spmi_common_control_register_index {
 #define SPMI_FTSMPS_STEP_MARGIN_NUM	4
 #define SPMI_FTSMPS_STEP_MARGIN_DEN	5
 
+#define SPMI_FTSMPS426_STEP_CTRL_DELAY_MASK	0x03
+#define SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT	0
+
+/* Clock rate in kHz of the FTSMPS426 regulator reference clock. */
+#define SPMI_FTSMPS426_CLOCK_RATE		4800
+
+/* Minimum voltage stepper delay for each step. */
+#define SPMI_FTSMPS426_STEP_DELAY		2
+
+/*
+ * The ratio SPMI_FTSMPS426_STEP_MARGIN_NUM/SPMI_FTSMPS426_STEP_MARGIN_DEN is
+ * used to adjust the step rate in order to account for oscillator variance.
+ */
+#define SPMI_FTSMPS426_STEP_MARGIN_NUM	10
+#define SPMI_FTSMPS426_STEP_MARGIN_DEN	11
+
+
 /* VSET value to decide the range of ULT SMPS */
 #define ULT_SMPS_RANGE_SPLIT 0x60
 
@@ -447,6 +486,10 @@ static struct spmi_voltage_range ftsmps2p5_ranges[] = {
 	SPMI_VOLTAGE_RANGE(1,  160000, 1360000, 2200000, 2200000, 10000),
 };
 
+static struct spmi_voltage_range ftsmps426_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0,       0,  320000, 1352000, 1352000,  4000),
+};
+
 static struct spmi_voltage_range boost_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 4000000, 4000000, 5550000, 5550000, 50000),
 };
@@ -480,6 +523,7 @@ static DEFINE_SPMI_SET_POINTS(ln_ldo);
 static DEFINE_SPMI_SET_POINTS(smps);
 static DEFINE_SPMI_SET_POINTS(ftsmps);
 static DEFINE_SPMI_SET_POINTS(ftsmps2p5);
+static DEFINE_SPMI_SET_POINTS(ftsmps426);
 static DEFINE_SPMI_SET_POINTS(boost);
 static DEFINE_SPMI_SET_POINTS(boost_byp);
 static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
@@ -747,6 +791,23 @@ spmi_regulator_common_set_voltage(struct regulator_dev *rdev, unsigned selector)
 	return spmi_vreg_write(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, buf, 2);
 }
 
+static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
+					      unsigned selector);
+
+static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
+					      unsigned selector)
+{
+	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
+	u8 buf[2];
+	int mV;
+
+	mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
+
+	buf[0] = mV & 0xff;
+	buf[1] = mV >> 8;
+	return spmi_vreg_write(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
+}
+
 static int spmi_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 		unsigned int old_selector, unsigned int new_selector)
 {
@@ -778,6 +839,21 @@ static int spmi_regulator_common_get_voltage(struct regulator_dev *rdev)
 	return spmi_hw_selector_to_sw(vreg, voltage_sel, range);
 }
 
+static int spmi_regulator_ftsmps426_get_voltage(struct regulator_dev *rdev)
+{
+	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
+	const struct spmi_voltage_range *range;
+	u8 buf[2];
+	int uV;
+
+	spmi_vreg_read(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
+
+	uV = (((unsigned int)buf[1] << 8) | (unsigned int)buf[0]) * 1000;
+	range = vreg->set_points->range;
+
+	return (uV - range->set_point_min_uV) / range->step_uV;
+}
+
 static int spmi_regulator_single_map_voltage(struct regulator_dev *rdev,
 		int min_uV, int max_uV)
 {
@@ -923,6 +999,23 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
 	}
 }
 
+static unsigned int spmi_regulator_ftsmps426_get_mode(struct regulator_dev *rdev)
+{
+	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
+	u8 reg;
+
+	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
+
+	switch (reg) {
+	case SPMI_FTSMPS426_MODE_HPM_MASK:
+		return REGULATOR_MODE_NORMAL;
+	case SPMI_FTSMPS426_MODE_AUTO_MASK:
+		return REGULATOR_MODE_FAST;
+	default:
+		return REGULATOR_MODE_IDLE;
+	}
+}
+
 static int
 spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
@@ -945,6 +1038,30 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
 	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
 }
 
+static int
+spmi_regulator_ftsmps426_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
+	u8 mask = SPMI_FTSMPS426_MODE_MASK;
+	u8 val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = SPMI_FTSMPS426_MODE_HPM_MASK;
+		break;
+	case REGULATOR_MODE_FAST:
+		val = SPMI_FTSMPS426_MODE_AUTO_MASK;
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = SPMI_FTSMPS426_MODE_LPM_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
+}
+
 static int
 spmi_regulator_common_set_load(struct regulator_dev *rdev, int load_uA)
 {
@@ -1274,6 +1391,21 @@ static struct regulator_ops spmi_ult_ldo_ops = {
 	.set_soft_start		= spmi_regulator_common_set_soft_start,
 };
 
+static struct regulator_ops spmi_ftsmps426_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_voltage_sel	= spmi_regulator_ftsmps426_set_voltage,
+	.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel,
+	.get_voltage_sel	= spmi_regulator_ftsmps426_get_voltage,
+	.map_voltage		= spmi_regulator_single_map_voltage,
+	.list_voltage		= spmi_regulator_common_list_voltage,
+	.set_mode		= spmi_regulator_ftsmps426_set_mode,
+	.get_mode		= spmi_regulator_ftsmps426_get_mode,
+	.set_load		= spmi_regulator_common_set_load,
+	.set_pull_down		= spmi_regulator_common_set_pull_down,
+};
+
 /* Maximum possible digital major revision value */
 #define INF 0xFF
 
@@ -1309,6 +1441,7 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
 	SPMI_VREG(BOOST, 5V_BOOST, 0, INF, BOOST,  boost,  boost,       0),
 	SPMI_VREG(FTS,   FTS_CTL,  0, INF, FTSMPS, ftsmps, ftsmps, 100000),
 	SPMI_VREG(FTS, FTS2p5_CTL, 0, INF, FTSMPS, ftsmps, ftsmps2p5, 100000),
+	SPMI_VREG(FTS, FTS426_CTL, 0, INF, FTSMPS426, ftsmps426, ftsmps426, 100000),
 	SPMI_VREG(BOOST_BYP, BB_2A, 0, INF, BOOST_BYP, boost, boost_byp, 0),
 	SPMI_VREG(ULT_BUCK, ULT_HF_CTL1, 0, INF, ULT_LO_SMPS, ult_lo_smps,
 						ult_lo_smps,   100000),
@@ -1446,6 +1579,34 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
 	return ret;
 }
 
+static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
+{
+	int ret;
+	u8 reg = 0;
+	int delay, slew_rate;
+	const struct spmi_voltage_range *range = &vreg->set_points->range[0];
+
+	ret = spmi_vreg_read(vreg, SPMI_COMMON_REG_STEP_CTRL, &reg, 1);
+	if (ret) {
+		dev_err(vreg->dev, "spmi read failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	delay = reg & SPMI_FTSMPS426_STEP_CTRL_DELAY_MASK;
+	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
+
+	/* slew_rate has units of uV/us */
+	slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
+	slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
+	slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
+	slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
+
+	/* Ensure that the slew rate is greater than 0 */
+	vreg->slew_rate = max(slew_rate, 1);
+
+	return ret;
+}
+
 static int spmi_regulator_init_registers(struct spmi_regulator *vreg,
 				const struct spmi_regulator_init_data *data)
 {
@@ -1585,6 +1746,12 @@ static int spmi_regulator_of_parse(struct device_node *node,
 		ret = spmi_regulator_init_slew_rate(vreg);
 		if (ret)
 			return ret;
+		break;
+	case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426:
+		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg);
+		if (ret)
+			return ret;
+		break;
 	default:
 		break;
 	}
@@ -1741,7 +1908,16 @@ static const struct spmi_regulator_data pmi8994_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pm8005_regulators[] = {
+	{ "s1", 0x1400, "vdd_s1", },
+	{ "s2", 0x1700, "vdd_s2", },
+	{ "s3", 0x1a00, "vdd_s3", },
+	{ "s4", 0x1d00, "vdd_s4", },
+	{ }
+};
+
 static const struct of_device_id qcom_spmi_regulator_match[] = {
+	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
 	{ .compatible = "qcom,pm8916-regulators", .data = &pm8916_regulators },
 	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
-- 
2.17.1

