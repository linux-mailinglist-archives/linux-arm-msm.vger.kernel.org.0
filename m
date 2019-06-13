Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4564C44E74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfFMV1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:27:15 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44982 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMV1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:27:15 -0400
Received: by mail-pl1-f196.google.com with SMTP id t7so58575plr.11;
        Thu, 13 Jun 2019 14:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IUjO1pR1uIH5yko1XbRBF4PHb6nz15fqs0FzmtDMeKI=;
        b=Lb2BMnHzhaYzABgkPrHMnYgpaFUJiBR0PnwOVdlHX4WA85/W84SdMLuzwls/tSU2Zf
         GH7c2szW4Tv3RmMagAb1KMYRBUNRvmKhj7vegFpMhavrnrdywi132QQrTs0gDKGB8C5j
         7ey0AyrrpqYCY9rVkUUZ90JAP4x3y2Ya2QlX1Knb6vXdgXfu4aP1vtQ8BsyxnFd+MQ3s
         3EgwoAEt4+HFYuOorjEIAp2X84r553TBeAqVHHqRM9NlZ1e0UMIMSNy4chijAG5G5bv4
         I3TcT8st7MTKWSe1wCLQHB9aYjpqy7UhqE5qTcCtRv7IbsjCJMmvRbnFmXN2Fl4itHl2
         LsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IUjO1pR1uIH5yko1XbRBF4PHb6nz15fqs0FzmtDMeKI=;
        b=H98pnWJpyqyK0vJsUv7KVqebtB+qpfc5lZdNAOhO7ZhKg4+aD0XMr1CQrqsPmY+NK+
         qfIN8i1RV0GRO7Tt6Okk+ehenN/Chko2YIyMxIPWN5sz+R/JyVTe5ZOCPlLSW1xzzk/U
         NpbGl/Tb0ripvbnXiku3BGtj/GlzkXXqyjyHEpAGy2vtumyYFVJkQt3NLH71KQFgQ8NY
         M64OoRs0FaNdfrjBlHNVhC9g++k60frhZAU//fIsfaMJij+Isq3ETMX5uh9ajT27tUag
         JVzfSvIpFXs3PJXlp67eZ1a41++RUTUmrmrUWCo1oJkaTEYX1xHNyQxPHNJArduoHMte
         dXOA==
X-Gm-Message-State: APjAAAUHdQ0wqJdykd4li0kn7JopH7g7IlwXVbFOpJJfZIbPIqIkOCTI
        ip88ItCgiBAf2yZ6FHby7LY=
X-Google-Smtp-Source: APXvYqyotze5mV/JUNyv6s4N2pL/WdH6ewvdLcZdLkgyZg1qNUkWRrI5BWMJbnObH8L+gfk1/GtWeA==
X-Received: by 2002:a17:902:1e6:: with SMTP id b93mr46330936plb.295.1560461234380;
        Thu, 13 Jun 2019 14:27:14 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j14sm613798pfn.120.2019.06.13.14.27.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:27:13 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 7/7] regulator: qcom_spmi: add PMS405 SPMI regulator
Date:   Thu, 13 Jun 2019 14:27:07 -0700
Message-Id: <20190613212707.5966-2-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613212707.5966-1-jeffrey.l.hugo@gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212707.5966-1-jeffrey.l.hugo@gmail.com>
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
 drivers/regulator/qcom_spmi-regulator.c | 43 +++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index c8791b036c53..debe4dc74d27 100644
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
@@ -1399,12 +1408,26 @@ static struct regulator_ops spmi_ftsmps426_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
+static struct regulator_ops spmi_hfs430_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
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
@@ -1572,7 +1595,8 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
 	return ret;
 }
 
-static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
+static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg,
+						   int clock_rate)
 {
 	int ret;
 	u8 reg = 0;
@@ -1589,7 +1613,7 @@ static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
 	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
 
 	/* slew_rate has units of uV/us */
-	slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
+	slew_rate = clock_rate * range->step_uV;
 	slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
 	slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
 	slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
@@ -1741,7 +1765,14 @@ static int spmi_regulator_of_parse(struct device_node *node,
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
@@ -1909,6 +1940,11 @@ static const struct spmi_regulator_data pm8005_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pms405_regulators[] = {
+	{ "s3", 0x1a00, "vdd_s3"},
+	{ }
+};
+
 static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
@@ -1916,6 +1952,7 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
 	{ .compatible = "qcom,pm8994-regulators", .data = &pm8994_regulators },
 	{ .compatible = "qcom,pmi8994-regulators", .data = &pmi8994_regulators },
+	{ .compatible = "qcom,pms405-regulators", .data = &pms405_regulators },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
-- 
2.17.1

