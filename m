Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4483F37CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 20:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfFFSxO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 14:53:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34938 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfFFSxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 14:53:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id s27so1865130pgl.2;
        Thu, 06 Jun 2019 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2ro+lP/FA6+DcoZSPcQtKQmHJBN8Sm7FF/ObqevYH60=;
        b=Eewjw3Ol2a+LEZf//XS2vKDBvTdcWff7Q7JQR8xBYqZEwvq1t/j4Q43lJmm2Z9/EWa
         93x9KQ9LB/e5KZnUE+hvv4zyEj3AutBqjl/sZIzInUpzZSlk6t8GKA/vZh3a7/8kcUw7
         l1FeSX6uy8MUgsx3X48tBNi9M57IFpXzY5GXZgGnI0uQ2FrwCUNKVIA8ExHQ2b30aUdy
         WAK+Up8iCgcmq1ATz9fP+Brc+jnrMg24X5vyen+CY5MdJWFMd9FbqdSKZilWUkp3o1Ix
         TDrtYLMWASDawz27BASogxgMhRYcC49Wj/xWWipaSw0NAhmWoW0v34vUOt5AuVp9/Gzo
         AeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2ro+lP/FA6+DcoZSPcQtKQmHJBN8Sm7FF/ObqevYH60=;
        b=nEQkDWr+fbNHiwYMebJn91kOkcNJxAJo0+oUL4yaSV4GhB9LpwXhceWHg47L+BNcUD
         f4vAFaj48IfJMBdQQVhUtqt1EsP2f6PTCxqt8RytFvX9RgEzuXgiNXLeXmVSsHXKb0C3
         fGLGN8DDuZBvEuEM+MhKSBOagIyKav80TfgER4HGTTyItIi9j19tu2F6YyuhVQBN3gD/
         7KbuoeOU8ilwjphmWpceW2L/ytH8IsxEoygCo5xwI6CaFfDKX9rS+0jxE6ft8WIFlmaT
         +4UJJxPqB5G7/K/e3+J/i8hrWO0ZeEHTgI23oxT2UFlTSFgLyN+9Nhkzjm474XMWGApM
         6qkw==
X-Gm-Message-State: APjAAAVkfn5V7+uxKn7OW8BaiVTigJXB/AUWWWdZOup1E+q0YB3T0gLH
        8GlsgQDm2ltMpf2zY27NOvT4+Dpl
X-Google-Smtp-Source: APXvYqyv47+M4mRYCRrl3AG1NtAoIbGfbUEbtEJYpA6xtbiYnPpqIQeshnwrz/JKfxcwahwDvihk1g==
X-Received: by 2002:a63:1d53:: with SMTP id d19mr32590pgm.152.1559847193090;
        Thu, 06 Jun 2019 11:53:13 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j23sm2642925pgb.63.2019.06.06.11.53.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:53:12 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 7/7] drivers: regulator: qcom: add PMS405 SPMI regulator
Date:   Thu,  6 Jun 2019 11:51:46 -0700
Message-Id: <20190606185146.39890-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
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

