Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A8343807
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732614AbfFMPCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:02:42 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34890 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732505AbfFMOYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 10:24:31 -0400
Received: by mail-pl1-f195.google.com with SMTP id p1so8236617plo.2;
        Thu, 13 Jun 2019 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2ro+lP/FA6+DcoZSPcQtKQmHJBN8Sm7FF/ObqevYH60=;
        b=mT5cBduf2Y9zKciRpK4HeLYYh7pXXSHVf56ym+ddjM8VODbocfUXhhxXvTuPNo3KzJ
         agiaBQNFyDzqPd6QUNPm3QuzQdifXUY8Vs6RNREy2cDOjXosYEr44QdMNOHFACg9Q/ET
         82UPTBpPQTwKdPpIrlqqlMKFqv/EV5LYkTNPp8Iwfla2UrPxnYrWhRurAUexVJjfPADq
         ku3ISYggIYJ/fvlOmesBI5YI284E8s43ngvFT2G3VQNKpVMOCajMzqiubVi85gHMICT4
         MQ6N0K5Zg8DJuV2UGBzWYKlWTtPlpzmSPyo45feCmXWBmIlBmwjp6p4mOWFpGJk1Yetv
         GYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2ro+lP/FA6+DcoZSPcQtKQmHJBN8Sm7FF/ObqevYH60=;
        b=WtXbd65oRYdqQwoz+U1dqAoBrI7V4BtFwa47RGHAGSrsSk2aEl59AwUHOievnV0+LY
         tCfRBx60WUDlvpJHTNQ3uaM+XSBdBMHG2q0d+bMrR6vaFXg82Ud//zNUc9UA2vfla2cI
         IEWeo4x0yop47bwrWPX1qfYA7ECat24oayEkAZgTRxHWCns8hq50ydilpnCwNcgapn2N
         XL8/O4NpDt1GijwLQOwcvwRvrKCldHJkNw1AEFaBKKLmquocU4E8HhgCEpclIeZTGM0Q
         ASKlaRUY1a9PfY59gC0494scDA3m8kq+lkRwP3O9/0/wl2d015RUknolD2DIa5wxcaKd
         t6FQ==
X-Gm-Message-State: APjAAAVNgNbTFNVZruRglU+cHwyh2Ifo2+IhAb31dcq5xsvHDr6+FIcH
        8lFXCKcV07JLZpsxcDgamJs=
X-Google-Smtp-Source: APXvYqwoA25pcNknR+e0oz/7BbsQ90UoXlTporjGpXPOml4oYPrdSdhCvGVjm8LfUB+a7lwrl/71/A==
X-Received: by 2002:a17:902:8f87:: with SMTP id z7mr61354115plo.65.1560435870952;
        Thu, 13 Jun 2019 07:24:30 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id n26sm3750384pfa.83.2019.06.13.07.24.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:24:30 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 7/7] drivers: regulator: qcom: add PMS405 SPMI regulator
Date:   Thu, 13 Jun 2019 07:24:25 -0700
Message-Id: <20190613142425.9036-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>

The PMS405 has 5 HFSMPS and 13 LDO regulators,

This commit adds support for one of the 5 HFSMPS regulators (s3) to
the spmi regulator driver.

The PMIC HFSMPS 430 regulators have 8 mV step size and a voltage
control scheme consisting of two  8-bit registers defining a 16-bit
voltage set point in units of millivolts

S3 controls the cpu voltages (s3 is a buck regulator of type HFS430);
it is therefore required so we can enable voltage scaling for safely
running cpufreq.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 41 +++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index c7880c1d4bcd..975655e787fe 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -105,6 +105,7 @@ enum spmi_regulator_logical_type {
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_HO_SMPS,
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
 	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426,
+	SPMI_REGULATOR_LOGICAL_TYPE_HFS430,
 };
 
 enum spmi_regulator_type {
@@ -157,6 +158,7 @@ enum spmi_regulator_subtype {
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL2	= 0x0e,
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL3	= 0x0f,
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL4	= 0x10,
+	SPMI_REGULATOR_SUBTYPE_HFS430		= 0x0a,
 };
 
 enum spmi_common_regulator_registers {
@@ -302,6 +304,8 @@ enum spmi_common_control_register_index {
 /* Clock rate in kHz of the FTSMPS426 regulator reference clock. */
 #define SPMI_FTSMPS426_CLOCK_RATE		4800
 
+#define SPMI_HFS430_CLOCK_RATE			1600
+
 /* Minimum voltage stepper delay for each step. */
 #define SPMI_FTSMPS426_STEP_DELAY		2
 
@@ -515,6 +519,10 @@ static struct spmi_voltage_range ult_pldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1750000, 1750000, 3337500, 3337500, 12500),
 };
 
+static struct spmi_voltage_range hfs430_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 2040000, 2040000, 8000),
+};
+
 static DEFINE_SPMI_SET_POINTS(pldo);
 static DEFINE_SPMI_SET_POINTS(nldo1);
 static DEFINE_SPMI_SET_POINTS(nldo2);
@@ -530,6 +538,7 @@ static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
 static DEFINE_SPMI_SET_POINTS(ult_ho_smps);
 static DEFINE_SPMI_SET_POINTS(ult_nldo);
 static DEFINE_SPMI_SET_POINTS(ult_pldo);
+static DEFINE_SPMI_SET_POINTS(hfs430);
 
 static inline int spmi_vreg_read(struct spmi_regulator *vreg, u16 addr, u8 *buf,
 				 int len)
@@ -1397,12 +1406,24 @@ static struct regulator_ops spmi_ftsmps426_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
+static struct regulator_ops spmi_hfs430_ops = {
+	/* always on regulators */
+	.set_voltage_sel	= spmi_regulator_ftsmps426_set_voltage,
+	.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel,
+	.get_voltage		= spmi_regulator_ftsmps426_get_voltage,
+	.map_voltage		= spmi_regulator_single_map_voltage,
+	.list_voltage		= spmi_regulator_common_list_voltage,
+	.set_mode		= spmi_regulator_ftsmps426_set_mode,
+	.get_mode		= spmi_regulator_ftsmps426_get_mode,
+};
+
 /* Maximum possible digital major revision value */
 #define INF 0xFF
 
 static const struct spmi_regulator_mapping supported_regulators[] = {
 	/*           type subtype dig_min dig_max ltype ops setpoints hpm_min */
 	SPMI_VREG(BUCK,  GP_CTL,   0, INF, SMPS,   smps,   smps,   100000),
+	SPMI_VREG(BUCK,  HFS430,   0, INF, HFS430, hfs430, hfs430,  10000),
 	SPMI_VREG(LDO,   N300,     0, INF, LDO,    ldo,    nldo1,   10000),
 	SPMI_VREG(LDO,   N600,     0,   0, LDO,    ldo,    nldo2,   10000),
 	SPMI_VREG(LDO,   N1200,    0,   0, LDO,    ldo,    nldo2,   10000),
@@ -1570,7 +1591,8 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
 	return ret;
 }
 
-static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
+static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg,
+						   int clock_rate)
 {
 	int ret;
 	u8 reg = 0;
@@ -1587,7 +1609,7 @@ static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
 	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
 
 	/* slew_rate has units of uV/us */
-	slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
+	slew_rate = clock_rate * range->step_uV;
 	slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
 	slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
 	slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
@@ -1739,7 +1761,14 @@ static int spmi_regulator_of_parse(struct device_node *node,
 			return ret;
 		break;
 	case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426:
-		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg);
+		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
+						SPMI_FTSMPS426_CLOCK_RATE);
+		if (ret)
+			return ret;
+		break;
+	case SPMI_REGULATOR_LOGICAL_TYPE_HFS430:
+		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
+							SPMI_HFS430_CLOCK_RATE);
 		if (ret)
 			return ret;
 		break;
@@ -1907,6 +1936,11 @@ static const struct spmi_regulator_data pm8005_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pms405_regulators[] = {
+	{ "s3", 0x1a00, }, /* supply name in the dts only */
+	{ }
+};
+
 static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
@@ -1914,6 +1948,7 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
 	{ .compatible = "qcom,pm8994-regulators", .data = &pm8994_regulators },
 	{ .compatible = "qcom,pmi8994-regulators", .data = &pmi8994_regulators },
+	{ .compatible = "qcom,pms405-regulators", .data = &pms405_regulators },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
-- 
2.17.1

