Return-Path: <linux-arm-msm+bounces-3789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C180977A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD741F20FED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9935184F;
	Fri,  8 Dec 2023 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPRabcSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF8C1720
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:44:22 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso18335381fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701996261; x=1702601061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TX16fSMOtAptZ+KQ1Fpt8pGTr8c3dCFokXWt3oZ130c=;
        b=sPRabcSPPzA5MvpNI/8yacIQznepIQ74FgRs/a/9lFBaY3fzlcs1sJf8RaCE0hqoOC
         HN7XI1ZxZxNXjeYg5K396sNk9WE2etcqzyFDIP71n7vww98CivLKrglzlop+1AOTIKkf
         KiPxY02kmcK9fNl0sC1arQdT/rCt4icyS2rA+lJCx4607SHL+7SvOitsLLU5QI1Wh3nD
         jiuNdAPdhclWDEF2vi8ZXY1B8OI74CYPv7oxzWpGrG9aDT27bhnGSJ5Z6/2YJLD8vD5n
         MxVgDpwCsmd1MQAlV2/2ks+B24LOiBO2HiEgjqvjlmiSKXZ8LmQsCTeoJ+GpQ6AMyZMz
         68Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701996261; x=1702601061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TX16fSMOtAptZ+KQ1Fpt8pGTr8c3dCFokXWt3oZ130c=;
        b=ICOSF1lBIpTAFz/64ZEv0DF6sTa2lLz+gJ5uzGaqqsoee7cSB8MLQeCHKRzC/ZWc4g
         B4bp+ogCLyMhy1vZ7wkYSITqCiaWIQhGWu3WwYUlMBuS9p4j5iZKiLWl495u2tFQKYhD
         fnS0JgYjgX8YHhDqPFtJfr5PR/11mE17hlT71B7eyD/ltcRIuoH+medRiU0HCCbQ1DVz
         uPd1+XzSNJZtL32PB/zMOiQpkZImFajyKG1s/qhAPAeJu47Ve6qUZKcP5sFvm5YHVyYt
         GCUIcEOtDosI5qLtCNZbJnJcaNqdTJOG2xASYmmeiL+qRIn/HsgWqW6PAwdogiEm2ECn
         /w4g==
X-Gm-Message-State: AOJu0YwtN5/DN/6FFPLH2Wx93usUaUbkkE2EdADXOvrSvWre1aNOQQQb
	djACDzIPo9s4tgVLB6FNM2klUQ==
X-Google-Smtp-Source: AGHT+IEnNBWZbdcBKohsgDDT9Frn+1lWyZl4NN9DxSEu/Pe/lHmMQheoqPpKNTAUoGr/gXtwAEhWnQ==
X-Received: by 2002:a2e:80c4:0:b0:2ca:1b43:d9d5 with SMTP id r4-20020a2e80c4000000b002ca1b43d9d5mr994476ljg.103.1701996260994;
        Thu, 07 Dec 2023 16:44:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b002c9f2c7cdecsm82645ljl.22.2023.12.07.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 16:44:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 04/11] soc: qcom: spm: add support for voltage regulator
Date: Fri,  8 Dec 2023 03:44:10 +0300
Message-Id: <20231208004417.3393299-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
References: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPM / SAW2 device also provides a voltage regulator functionality
with optional AVS (Adaptive Voltage Scaling) support. The exact register
sequence and voltage ranges differs from device to device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/spm.c | 234 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 229 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index b15435f7cb0d..5eefaec72a13 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -6,20 +6,40 @@
  * SAW power controller driver
  */
 
-#include <linux/kernel.h>
+#include <linux/bitfield.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/linear_range.h>
 #include <linux/module.h>
-#include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
+
+#include <linux/regulator/driver.h>
+
 #include <soc/qcom/spm.h>
 
+#define FIELD_SET(current, mask, val)	\
+	(((current) & ~(mask)) | FIELD_PREP((mask), (val)))
+
 #define SPM_CTL_INDEX		0x7f
 #define SPM_CTL_INDEX_SHIFT	4
 #define SPM_CTL_EN		BIT(0)
 
+/* These registers might be specific to SPM 1.1 */
+#define SPM_VCTL_VLVL			GENMASK(7, 0)
+#define SPM_PMIC_DATA_0_VLVL		GENMASK(7, 0)
+#define SPM_PMIC_DATA_1_MIN_VSEL	GENMASK(5, 0)
+#define SPM_PMIC_DATA_1_MAX_VSEL	GENMASK(21, 16)
+
+#define SPM_1_1_AVS_CTL_AVS_ENABLED	BIT(27)
+#define SPM_AVS_CTL_MAX_VLVL		GENMASK(22, 17)
+#define SPM_AVS_CTL_MIN_VLVL		GENMASK(15, 10)
+
 enum spm_reg {
 	SPM_REG_CFG,
 	SPM_REG_SPM_CTL,
@@ -29,10 +49,12 @@ enum spm_reg {
 	SPM_REG_PMIC_DATA_1,
 	SPM_REG_VCTL,
 	SPM_REG_SEQ_ENTRY,
-	SPM_REG_SPM_STS,
+	SPM_REG_STS0,
+	SPM_REG_STS1,
 	SPM_REG_PMIC_STS,
 	SPM_REG_AVS_CTL,
 	SPM_REG_AVS_LIMIT,
+	SPM_REG_RST,
 	SPM_REG_NR,
 };
 
@@ -49,11 +71,20 @@ struct spm_reg_data {
 	u32 avs_limit;
 	u8 seq[MAX_SEQ_DATA];
 	u8 start_index[PM_SLEEP_MODE_NR];
+
+	smp_call_func_t set_vdd;
+	/* for now we support only a single range */
+	struct linear_range *range;
+	unsigned int ramp_delay;
+	unsigned int init_uV;
 };
 
 struct spm_driver_data {
 	void __iomem *reg_base;
 	const struct spm_reg_data *reg_data;
+	struct device *dev;
+	unsigned int volt_sel;
+	int reg_cpu;
 };
 
 static const u16 spm_reg_offset_v4_1[SPM_REG_NR] = {
@@ -189,6 +220,10 @@ static const struct spm_reg_data spm_reg_8226_cpu  = {
 
 static const u16 spm_reg_offset_v1_1[SPM_REG_NR] = {
 	[SPM_REG_CFG]		= 0x08,
+	[SPM_REG_STS0]		= 0x0c,
+	[SPM_REG_STS1]		= 0x10,
+	[SPM_REG_VCTL]		= 0x14,
+	[SPM_REG_AVS_CTL]	= 0x18,
 	[SPM_REG_SPM_CTL]	= 0x20,
 	[SPM_REG_PMIC_DLY]	= 0x24,
 	[SPM_REG_PMIC_DATA_0]	= 0x28,
@@ -196,7 +231,12 @@ static const u16 spm_reg_offset_v1_1[SPM_REG_NR] = {
 	[SPM_REG_SEQ_ENTRY]	= 0x80,
 };
 
+static void smp_set_vdd_v1_1(void *data);
+
 /* SPM register data for 8064 */
+static struct linear_range spm_v1_1_regulator_range =
+	REGULATOR_LINEAR_RANGE(700000, 0, 56, 12500);
+
 static const struct spm_reg_data spm_reg_8064_cpu = {
 	.reg_offset = spm_reg_offset_v1_1,
 	.spm_cfg = 0x1F,
@@ -207,6 +247,10 @@ static const struct spm_reg_data spm_reg_8064_cpu = {
 		0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },
 	.start_index[PM_SLEEP_MODE_STBY] = 0,
 	.start_index[PM_SLEEP_MODE_SPC] = 2,
+	.set_vdd = smp_set_vdd_v1_1,
+	.range = &spm_v1_1_regulator_range,
+	.init_uV = 1300000,
+	.ramp_delay = 1250,
 };
 
 static inline void spm_register_write(struct spm_driver_data *drv,
@@ -258,6 +302,185 @@ void spm_set_low_power_mode(struct spm_driver_data *drv,
 	spm_register_write_sync(drv, SPM_REG_SPM_CTL, ctl_val);
 }
 
+static int spm_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
+{
+	struct spm_driver_data *drv = rdev_get_drvdata(rdev);
+
+	drv->volt_sel = selector;
+
+	/* Always do the SAW register writes on the corresponding CPU */
+	return smp_call_function_single(drv->reg_cpu, drv->reg_data->set_vdd, drv, true);
+}
+
+static int spm_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct spm_driver_data *drv = rdev_get_drvdata(rdev);
+
+	return drv->volt_sel;
+}
+
+static const struct regulator_ops spm_reg_ops = {
+	.set_voltage_sel	= spm_set_voltage_sel,
+	.get_voltage_sel	= spm_get_voltage_sel,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+};
+
+static void smp_set_vdd_v1_1(void *data)
+{
+	struct spm_driver_data *drv = data;
+	unsigned int vctl, data0, data1, avs_ctl, sts;
+	unsigned int vlevel, volt_sel;
+	bool avs_enabled;
+
+	volt_sel = drv->volt_sel;
+	vlevel = volt_sel | 0x80; /* band */
+
+	avs_ctl = spm_register_read(drv, SPM_REG_AVS_CTL);
+	vctl = spm_register_read(drv, SPM_REG_VCTL);
+	data0 = spm_register_read(drv, SPM_REG_PMIC_DATA_0);
+	data1 = spm_register_read(drv, SPM_REG_PMIC_DATA_1);
+
+	avs_enabled = avs_ctl & SPM_1_1_AVS_CTL_AVS_ENABLED;
+
+	/* If AVS is enabled, switch it off during the voltage change */
+	if (avs_enabled) {
+		avs_ctl &= ~SPM_1_1_AVS_CTL_AVS_ENABLED;
+		spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
+	}
+
+	/* Kick the state machine back to idle */
+	spm_register_write(drv, SPM_REG_RST, 1);
+
+	vctl = FIELD_SET(vctl, SPM_VCTL_VLVL, vlevel);
+	data0 = FIELD_SET(data0, SPM_PMIC_DATA_0_VLVL, vlevel);
+	data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MIN_VSEL, volt_sel);
+	data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MAX_VSEL, volt_sel);
+
+	spm_register_write(drv, SPM_REG_VCTL, vctl);
+	spm_register_write(drv, SPM_REG_PMIC_DATA_0, data0);
+	spm_register_write(drv, SPM_REG_PMIC_DATA_1, data1);
+
+	if (read_poll_timeout_atomic(spm_register_read,
+				     sts, sts == vlevel,
+				     1, 200, false,
+				     drv, SPM_REG_STS1)) {
+		dev_err_ratelimited(drv->dev, "timeout setting the voltage (%x %x)!\n", sts, vlevel);
+		goto enable_avs;
+	}
+
+	if (avs_enabled) {
+		unsigned int max_avs = volt_sel;
+		unsigned int min_avs = max(max_avs, 4U) - 4;
+
+		avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MIN_VLVL, min_avs);
+		avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MAX_VLVL, max_avs);
+		spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
+	}
+
+enable_avs:
+	if (avs_enabled) {
+		avs_ctl |= SPM_1_1_AVS_CTL_AVS_ENABLED;
+		spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
+	}
+}
+
+static int spm_get_cpu(struct device *dev)
+{
+	int cpu;
+	bool found;
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node, *saw_node;
+
+		cpu_node = of_cpu_device_node_get(cpu);
+		if (!cpu_node)
+			continue;
+
+		saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
+		found = (saw_node == dev->of_node);
+		of_node_put(saw_node);
+		of_node_put(cpu_node);
+
+		if (found)
+			return cpu;
+	}
+
+	/* L2 SPM is not bound to any CPU, voltage setting is not supported */
+
+	return -EOPNOTSUPP;
+}
+
+#ifdef CONFIG_REGULATOR
+static int spm_register_regulator(struct device *dev, struct spm_driver_data *drv)
+{
+	struct regulator_config config = {
+		.dev = dev,
+		.driver_data = drv,
+	};
+	struct regulator_desc *rdesc;
+	struct regulator_dev *rdev;
+	int ret;
+	bool found;
+
+	if (!drv->reg_data->set_vdd)
+		return 0;
+
+	rdesc = devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
+	if (!rdesc)
+		return -ENOMEM;
+
+	rdesc->name = "spm";
+	rdesc->of_match = of_match_ptr("regulator");
+	rdesc->type = REGULATOR_VOLTAGE;
+	rdesc->owner = THIS_MODULE;
+	rdesc->ops = &spm_reg_ops;
+
+	rdesc->linear_ranges = drv->reg_data->range;
+	rdesc->n_linear_ranges = 1;
+	rdesc->n_voltages = rdesc->linear_ranges[rdesc->n_linear_ranges - 1].max_sel + 1;
+	rdesc->ramp_delay = drv->reg_data->ramp_delay;
+
+	ret = spm_get_cpu(dev);
+	if (ret < 0)
+		return ret;
+
+	drv->reg_cpu = ret;
+	dev_dbg(dev, "SAW2 bound to CPU %d\n", drv->reg_cpu);
+
+	/*
+	 * Program initial voltage, otherwise registration will also try
+	 * setting the voltage, which might result in undervolting the CPU.
+	 */
+	drv->volt_sel = DIV_ROUND_UP(drv->reg_data->init_uV - rdesc->min_uV,
+				     rdesc->uV_step);
+	ret = linear_range_get_selector_high(drv->reg_data->range,
+					     drv->reg_data->init_uV,
+					     &drv->volt_sel,
+					     &found);
+	if (ret) {
+		dev_err(dev, "Initial uV value out of bounds\n");
+		return ret;
+	}
+
+	/* Always do the SAW register writes on the corresponding CPU */
+	smp_call_function_single(drv->reg_cpu, drv->reg_data->set_vdd, drv, true);
+
+	rdev = devm_regulator_register(dev, rdesc, &config);
+	if (IS_ERR(rdev)) {
+		dev_err(dev, "failed to register regulator\n");
+		return PTR_ERR(rdev);
+	}
+
+	return 0;
+}
+#else
+static int spm_register_regulator(struct device *dev, struct spm_driver_data *drv)
+{
+	return 0;
+}
+#endif
+
 static const struct of_device_id spm_match_table[] = {
 	{ .compatible = "qcom,sdm660-gold-saw2-v4.1-l2",
 	  .data = &spm_reg_660_gold_l2 },
@@ -308,6 +531,7 @@ static int spm_dev_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	drv->reg_data = match_id->data;
+	drv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, drv);
 
 	/* Write the SPM sequences first.. */
@@ -335,7 +559,7 @@ static int spm_dev_probe(struct platform_device *pdev)
 	if (drv->reg_data->reg_offset[SPM_REG_SPM_CTL])
 		spm_set_low_power_mode(drv, PM_SLEEP_MODE_STBY);
 
-	return 0;
+	return spm_register_regulator(&pdev->dev, drv);
 }
 
 static struct platform_driver spm_driver = {
-- 
2.39.2


