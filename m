Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231483FA58D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 14:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhH1L57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 07:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbhH1L56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 07:57:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE0CC061756;
        Sat, 28 Aug 2021 04:57:07 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id eb14so4747038edb.8;
        Sat, 28 Aug 2021 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+GXkju/abzVRl0q/LL7DOjz/l3U9qDnyfrRuG564rrs=;
        b=KnTcO0b9G+8ssZQz6HXkFfJ4m4PohntFdPdWGrIdyLiMP613AAN5gvUbcYEta75V9Y
         qlIq1O3WHgVFGfrIyC7F7DCHCnLoOoE3l8B5p94WW1nRNVvmVnPe9L6ZgXBtkoDPyLeB
         eoEnMJmjiOHK6DJ0EFhtQaHqfxu307ykFIj+MiMjMNPvPqBUnxO4nMykeDCEi4SQLNo6
         IWRZ3py8O+GrALM64h9ySJ9+Xz/6IzyG+jyIHA27E4IUOt/0bp3vjOSoCuq1+O1xXqdU
         +VCDcjludN8Ui/4XJfxZ2DC+Bq7UfKPkj8KfcSvGyzAV38kwrnhaIOmwUwypAFUMMOVl
         sloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+GXkju/abzVRl0q/LL7DOjz/l3U9qDnyfrRuG564rrs=;
        b=sopzcvVL2/RH8bs2FMT2BkC/QTNHXwfWknwnRZjKeafnqzwy6gkZmbwTL+kdH+bj+9
         H8DhrMe+zFvskdZrhBeKX0ij8WTD9emkVpQRsQs3zTO49yQ9W4K3jZDResrEwclvf8rk
         kwWznHU3INzZZPpusmXLOLCcviPUOg4ERuifwFRxhhN45Yr8ADG+PKo2BfS7sddpmFkp
         +hW713Dh2JUvEAwr/5v6CVDGaTsFbb4wO0SdE1azeZO7txMaPlmw27DpqzAnLRXXRjlB
         28LYTZtXnN8xWNhFS+Pgv5zIk5U1IWhy/+xksdPCx69gDy+QJDF6twNOo6ImeAvggsxj
         SIdg==
X-Gm-Message-State: AOAM532P+KwnK/y6lCB3Qm/5aqCktoPf8tZUvOiFexf1dhgTFkjU0JKY
        G8wD2ChGNxrUa/+fXXTRD07S1/oVSVU=
X-Google-Smtp-Source: ABdhPJxa+WjXdiFFRSkpWVw6zn61kanbiREOWgGuCs01UGW9/MM3M+HCdd13TNri8hvhdvSFAa7XZw==
X-Received: by 2002:a50:f690:: with SMTP id d16mr14575996edn.369.1630151825221;
        Sat, 28 Aug 2021 04:57:05 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id p2sm2686137edi.82.2021.08.28.04.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 04:57:04 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [RFC PATCH 1/2] regulator: qcom_spmi: Add PM6125 regulators
Date:   Sat, 28 Aug 2021 14:56:53 +0300
Message-Id: <20210828115654.647548-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210828115654.647548-1-iskren.chernev@gmail.com>
References: <20210828115654.647548-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM6125 used on SM4250/6115 and possibly others contains 8 SMPAs and
24 LDOAs. The regulators are similar to ftsmps426 in terms of ops,
registers with a few small differences.

The inspiration for the magic constants was taken from [1]

[1]: https://source.codeaurora.org/quic/la/kernel/msm-5.4/commit/?h=kernel.lnx.5.4.r1-rel&id=d1220daeffaa440ffff0a8c47322eb0033bf54f5

The type, subtype and revision of each regulator:

	name s1, type 0x1c, sub 0xb, rev 2
	name s2, type 0x1c, sub 0xb, rev 2
	name s3, type 0x1c, sub 0xb, rev 2
	name s4, type 0x1c, sub 0xb, rev 2
	name s5, type 0x3, sub 0xa, rev 4
	name s6, type 0x3, sub 0xa, rev 4
	name s7, type 0x3, sub 0xa, rev 4
	name s8, type 0x1c, sub 0xb, rev 2
	name l1, type 0x4, sub 0x6b, rev 2
	name l2, type 0x4, sub 0x6a, rev 2
	name l3, type 0x4, sub 0x6b, rev 2
	name l4, type 0x4, sub 0x6a, rev 2
	name l5, type 0x4, sub 0x7a, rev 2
	name l6, type 0x4, sub 0x6c, rev 2
	name l7, type 0x4, sub 0x6b, rev 2
	name l8, type 0x4, sub 0x6a, rev 2
	name l9, type 0x4, sub 0x73, rev 2
	name l10, type 0x4, sub 0x71, rev 2
	name l11, type 0x4, sub 0x73, rev 2
	name l12, type 0x4, sub 0x72, rev 2
	name l13, type 0x4, sub 0x72, rev 2
	name l14, type 0x4, sub 0x73, rev 2
	name l15, type 0x4, sub 0x7b, rev 2
	name l16, type 0x4, sub 0x71, rev 2
	name l17, type 0x4, sub 0x6a, rev 2
	name l18, type 0x4, sub 0x6a, rev 2
	name l19, type 0x4, sub 0x7b, rev 2
	name l20, type 0x4, sub 0x7b, rev 2
	name l21, type 0x4, sub 0x7d, rev 2
	name l22, type 0x4, sub 0x7d, rev 2
	name l23, type 0x4, sub 0x7d, rev 2
	name l24, type 0x4, sub 0x7d, rev 2

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 160 +++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 41424a3366d0..d803e444238a 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -99,6 +99,9 @@ enum spmi_regulator_logical_type {
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
 	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426,
 	SPMI_REGULATOR_LOGICAL_TYPE_HFS430,
+	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS3,
+	SPMI_REGULATOR_LOGICAL_TYPE_LDO_510,
+	SPMI_REGULATOR_LOGICAL_TYPE_HFSMPS,
 };
 
 enum spmi_regulator_type {
@@ -164,6 +167,17 @@ enum spmi_regulator_subtype {
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL3	= 0x0f,
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL4	= 0x10,
 	SPMI_REGULATOR_SUBTYPE_HFS430		= 0x0a,
+	SPMI_REGULATOR_SUBTYPE_HFSMPS_510	= 0x0a,
+	SPMI_REGULATOR_SUBTYPE_FTSMPS_510	= 0x0b,
+	SPMI_REGULATOR_SUBTYPE_LV_P150_510	= 0x71,
+	SPMI_REGULATOR_SUBTYPE_LV_P300_510	= 0x72,
+	SPMI_REGULATOR_SUBTYPE_LV_P600_510	= 0x73,
+	SPMI_REGULATOR_SUBTYPE_N300_510		= 0x6a,
+	SPMI_REGULATOR_SUBTYPE_N600_510		= 0x6b,
+	SPMI_REGULATOR_SUBTYPE_N1200_510	= 0x6c,
+	SPMI_REGULATOR_SUBTYPE_MV_P50_510	= 0x7a,
+	SPMI_REGULATOR_SUBTYPE_MV_P150_510	= 0x7b,
+	SPMI_REGULATOR_SUBTYPE_MV_P600_510	= 0x7d,
 };
 
 enum spmi_common_regulator_registers {
@@ -191,6 +205,14 @@ enum spmi_ftsmps426_regulator_registers {
 	SPMI_FTSMPS426_REG_VOLTAGE_ULS_MSB	= 0x69,
 };
 
+/*
+ * Third common register layout
+ */
+enum spmi_ftsmps3_regulator_registers {
+	SPMI_FTSMPS3_REG_STEP_CTRL		= 0x3c,
+};
+
+
 enum spmi_vs_registers {
 	SPMI_VS_REG_OCP				= 0x4a,
 	SPMI_VS_REG_SOFT_START			= 0x4c,
@@ -258,6 +280,15 @@ enum spmi_common_control_register_index {
 
 #define SPMI_FTSMPS426_MODE_MASK		0x07
 
+/* Third common regulator mode register values */
+#define SPMI_FTSMPS3_MODE_BYPASS_MASK		2
+#define SPMI_FTSMPS3_MODE_RETENTION_MASK	3
+#define SPMI_FTSMPS3_MODE_LPM_MASK		4
+#define SPMI_FTSMPS3_MODE_AUTO_MASK		6
+#define SPMI_FTSMPS3_MODE_HPM_MASK		7
+
+#define SPMI_FTSMPS3_MODE_MASK			0x07
+
 /* Common regulator pull down control register layout */
 #define SPMI_COMMON_PULL_DOWN_ENABLE_MASK	0x80
 
@@ -303,6 +334,9 @@ enum spmi_common_control_register_index {
 #define SPMI_FTSMPS_STEP_MARGIN_NUM	4
 #define SPMI_FTSMPS_STEP_MARGIN_DEN	5
 
+/* slew_rate has units of uV/us. */
+#define SPMI_FTSMPS3_SLEW_RATE_38p4 38400
+
 #define SPMI_FTSMPS426_STEP_CTRL_DELAY_MASK	0x03
 #define SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT	0
 
@@ -544,6 +578,14 @@ static struct spmi_voltage_range hfs430_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 2040000, 2040000, 8000),
 };
 
+static struct spmi_voltage_range nldo_510_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 1304000, 1304000, 8000),
+};
+
+static struct spmi_voltage_range ftsmps510_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0, 300000, 300000, 1372000, 1372000, 4000),
+};
+
 static DEFINE_SPMI_SET_POINTS(pldo);
 static DEFINE_SPMI_SET_POINTS(nldo1);
 static DEFINE_SPMI_SET_POINTS(nldo2);
@@ -564,6 +606,8 @@ static DEFINE_SPMI_SET_POINTS(nldo660);
 static DEFINE_SPMI_SET_POINTS(ht_lvpldo);
 static DEFINE_SPMI_SET_POINTS(ht_nldo);
 static DEFINE_SPMI_SET_POINTS(hfs430);
+static DEFINE_SPMI_SET_POINTS(nldo_510);
+static DEFINE_SPMI_SET_POINTS(ftsmps510);
 
 static inline int spmi_vreg_read(struct spmi_regulator *vreg, u16 addr, u8 *buf,
 				 int len)
@@ -1096,6 +1140,33 @@ spmi_regulator_ftsmps426_set_mode(struct regulator_dev *rdev, unsigned int mode)
 	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
 }
 
+static int
+spmi_regulator_ftsmps3_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
+	u8 mask = SPMI_FTSMPS3_MODE_MASK;
+	u8 val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = SPMI_FTSMPS3_MODE_HPM_MASK;
+		break;
+	case REGULATOR_MODE_FAST:
+		val = SPMI_FTSMPS3_MODE_AUTO_MASK;
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = vreg->logical_type ==
+				SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS3 ?
+			SPMI_FTSMPS3_MODE_RETENTION_MASK :
+			SPMI_FTSMPS3_MODE_LPM_MASK;
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
@@ -1453,13 +1524,26 @@ static const struct regulator_ops spmi_hfs430_ops = {
 	.get_mode		= spmi_regulator_ftsmps426_get_mode,
 };
 
+static const struct regulator_ops spmi_ftsmps3_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_voltage_sel	= spmi_regulator_ftsmps426_set_voltage,
+	.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel,
+	.get_voltage_sel	= spmi_regulator_ftsmps426_get_voltage,
+	.map_voltage		= spmi_regulator_single_map_voltage,
+	.list_voltage		= spmi_regulator_common_list_voltage,
+	.set_mode		= spmi_regulator_ftsmps3_set_mode,
+	.get_mode		= spmi_regulator_ftsmps426_get_mode,
+};
+
 /* Maximum possible digital major revision value */
 #define INF 0xFF
 
 static const struct spmi_regulator_mapping supported_regulators[] = {
 	/*           type subtype dig_min dig_max ltype ops setpoints hpm_min */
 	SPMI_VREG(BUCK,  GP_CTL,   0, INF, SMPS,   smps,   smps,   100000),
-	SPMI_VREG(BUCK,  HFS430,   0, INF, HFS430, hfs430, hfs430,  10000),
+	SPMI_VREG(BUCK,  HFS430,   0,   3, HFS430, hfs430, hfs430,  10000),
 	SPMI_VREG(LDO,   N300,     0, INF, LDO,    ldo,    nldo1,   10000),
 	SPMI_VREG(LDO,   N600,     0,   0, LDO,    ldo,    nldo2,   10000),
 	SPMI_VREG(LDO,   N1200,    0,   0, LDO,    ldo,    nldo2,   10000),
@@ -1535,6 +1619,17 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
 	SPMI_VREG(ULT_LDO, P300,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P150,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P50,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 5000),
+	SPMI_VREG(LDO, LV_P150_510, 0, INF, LDO_510, ftsmps3, ht_lvpldo, 10000),
+	SPMI_VREG(LDO, LV_P300_510, 0, INF, LDO_510, ftsmps3, ht_lvpldo, 10000),
+	SPMI_VREG(LDO, LV_P600_510, 0, INF, LDO_510, ftsmps3, ht_lvpldo, 10000),
+	SPMI_VREG(LDO, MV_P50_510,  0, INF, LDO_510, ftsmps3, pldo660, 10000),
+	SPMI_VREG(LDO, MV_P150_510, 0, INF, LDO_510, ftsmps3, pldo660, 10000),
+	SPMI_VREG(LDO, MV_P600_510, 0, INF, LDO_510, ftsmps3, pldo660, 10000),
+	SPMI_VREG(LDO, N300_510,    0, INF, LDO_510, ftsmps3, nldo_510, 10000),
+	SPMI_VREG(LDO, N600_510,    0, INF, LDO_510, ftsmps3, nldo_510, 10000),
+	SPMI_VREG(LDO, N1200_510,   0, INF, LDO_510, ftsmps3, nldo_510, 10000),
+	SPMI_VREG(BUCK, HFSMPS_510, 4, INF, HFSMPS,  ftsmps3, hfs430, 100000),
+	SPMI_VREG(FTS, FTSMPS_510,  0, INF, FTSMPS3, ftsmps3, ftsmps510, 100000),
 };
 
 static void spmi_calculate_num_voltages(struct spmi_voltage_set_points *points)
@@ -1682,6 +1777,27 @@ static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg,
 	return ret;
 }
 
+static int spmi_regulator_init_slew_rate_ftsmps3(struct spmi_regulator *vreg)
+{
+	int ret;
+	u8 reg = 0;
+	int delay;
+
+	ret = spmi_vreg_read(vreg, SPMI_FTSMPS3_REG_STEP_CTRL, &reg, 1);
+	if (ret) {
+		dev_err(vreg->dev, "spmi read failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	delay = reg & SPMI_FTSMPS426_STEP_CTRL_DELAY_MASK;
+	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
+
+
+	vreg->slew_rate = SPMI_FTSMPS3_SLEW_RATE_38p4 >> delay;
+
+	return ret;
+}
+
 static int spmi_regulator_init_registers(struct spmi_regulator *vreg,
 				const struct spmi_regulator_init_data *data)
 {
@@ -1832,6 +1948,11 @@ static int spmi_regulator_of_parse(struct device_node *node,
 		if (ret)
 			return ret;
 		break;
+	case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS3:
+		ret = spmi_regulator_init_slew_rate_ftsmps3(vreg);
+		if (ret)
+			return ret;
+		break;
 	default:
 		break;
 	}
@@ -1858,6 +1979,41 @@ static int spmi_regulator_of_parse(struct device_node *node,
 	return 0;
 }
 
+static const struct spmi_regulator_data pm6125_regulators[] = {
+	{ "s1", 0x1400, "vdd_s1" },
+	{ "s2", 0x1700, "vdd_s2" },
+	{ "s3", 0x1a00, "vdd_s3" },
+	{ "s4", 0x1d00, "vdd_s4" },
+	{ "s5", 0x2000, "vdd_s5" },
+	{ "s6", 0x2300, "vdd_s6" },
+	{ "s7", 0x2600, "vdd_s7" },
+	{ "s8", 0x2900, "vdd_s8" },
+	{ "l1", 0x4000, "vdd_l1" },
+	{ "l2", 0x4100, "vdd_l2" },
+	{ "l3", 0x4200, "vdd_l3" },
+	{ "l4", 0x4300, "vdd_l4" },
+	{ "l5", 0x4400, "vdd_l5" },
+	{ "l6", 0x4500, "vdd_l6" },
+	{ "l7", 0x4600, "vdd_l7" },
+	{ "l8", 0x4700, "vdd_l8" },
+	{ "l9", 0x4800, "vdd_l9" },
+	{ "l10", 0x4900, "vdd_l10" },
+	{ "l11", 0x4a00, "vdd_l11" },
+	{ "l12", 0x4b00, "vdd_l12" },
+	{ "l13", 0x4c00, "vdd_l13" },
+	{ "l14", 0x4d00, "vdd_l14" },
+	{ "l15", 0x4e00, "vdd_l15" },
+	{ "l16", 0x4f00, "vdd_l16" },
+	{ "l17", 0x5000, "vdd_l17" },
+	{ "l18", 0x5100, "vdd_l18" },
+	{ "l19", 0x5200, "vdd_l19" },
+	{ "l20", 0x5300, "vdd_l20" },
+	{ "l21", 0x5400, "vdd_l21" },
+	{ "l22", 0x5500, "vdd_l22" },
+	{ "l23", 0x5600, "vdd_l23" },
+	{ "l24", 0x5700, "vdd_l24" },
+};
+
 static const struct spmi_regulator_data pm8941_regulators[] = {
 	{ "s1", 0x1400, "vdd_s1", },
 	{ "s2", 0x1700, "vdd_s2", },
@@ -2072,7 +2228,6 @@ static const struct spmi_regulator_data pm660l_regulators[] = {
 	{ }
 };
 
-
 static const struct spmi_regulator_data pm8004_regulators[] = {
 	{ "s2", 0x1700, "vdd_s2", },
 	{ "s5", 0x2000, "vdd_s5", },
@@ -2093,6 +2248,7 @@ static const struct spmi_regulator_data pms405_regulators[] = {
 };
 
 static const struct of_device_id qcom_spmi_regulator_match[] = {
+	{ .compatible = "qcom,pm6125-regulators", .data = &pm6125_regulators },
 	{ .compatible = "qcom,pm8004-regulators", .data = &pm8004_regulators },
 	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
-- 
2.33.0

