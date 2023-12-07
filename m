Return-Path: <linux-arm-msm+bounces-3710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCD8088D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30881281FC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCE4405FA;
	Thu,  7 Dec 2023 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Akh1dCwl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D20F10E7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:07:08 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be3eed85aso839316e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701954427; x=1702559227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLKGJjqVnU2Wm3Zgin7pA30JtWvao8SZmntEz34aPKQ=;
        b=Akh1dCwlDcrtKCApTT6PneXu4s2/ts4uOnJgXeSgMOO7Gcm/QGAYui5JCqQMW4j4o2
         ejZLtfD9Od12r+HuUfYr0aGT0ovEPfgyKukji7meP0vgsXRpcUfIoCShYuNwpTg0QWAN
         buKVg1ELEetLWHHvyKAjrsxBbkuj1jyCt/WUnFMOw+V5Q400ZI10OnkeWxWyDJ7ENnkI
         4jscXExq1pcXAH182V49rKCd5llp+j0e4sfQjDZKhDvpDKXiglsJohnSeJNCghLO/bA2
         1KmqGogh06u2TNsy+SJ86kYYxq5g1zCGNhk+UfkvPaXmB7GhLwPwOBc2aows+LrMsrnj
         dIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954427; x=1702559227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLKGJjqVnU2Wm3Zgin7pA30JtWvao8SZmntEz34aPKQ=;
        b=d1CjCOpT9TcKf/Y8OfmW3qR0Uci0msgChOTLy7OBLnSW7dc6Dp3Qj+3SG/wlmHzMsX
         OSMZvEgPBVrSlJuFw/CaLBi45cjzDxsGddNeyzt3/wKaiddF1Hd73ZwSUna3heHSxb1L
         wxDYtfQZIdPPgguKIT3+ggUCLGrxkbhvnU9j9FtrUN5geEcV2x3Iusv8MDnsFJ1QEKPF
         Z3lCR0Ce/qwkoCtV/N/5btVC1hTlWYOErm0OxvDW981NJ8Uam5WsvRC7oDCEPU0uDQ+T
         GLLe/fkJ+9m53KLxjMj/1GAMLkWyI8ixRY8snJ2migakqjBIiH9lLaRGGAyc2tRwTGrs
         AROA==
X-Gm-Message-State: AOJu0YzmqADowPd67DkaZbJYf12XKITpHx5/bMl5sxBYM3xUlfC7ky7e
	elSxHMkxmqaZ5J57IHfi4AeAYw==
X-Google-Smtp-Source: AGHT+IGZ5PJupehTovqOBieFi4dd1mejoSpUIVv6UVfHefiU0RDKcsrTORGCYbNq7uWsVG8pvQADRg==
X-Received: by 2002:a05:6512:ad5:b0:50c:1bc5:6a73 with SMTP id n21-20020a0565120ad500b0050c1bc56a73mr792071lfu.33.1701954426863;
        Thu, 07 Dec 2023 05:07:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b0050bc41caf04sm167685lfg.304.2023.12.07.05.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:07:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 03/10] soc: qcom: spm: add support for voltage regulator
Date: Thu,  7 Dec 2023 16:06:56 +0300
Message-Id: <20231207130703.3322321-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
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
 drivers/soc/qcom/spm.c | 221 ++++++++++++++++++++++++++++++++++++++++-
 include/soc/qcom/spm.h |   9 ++
 2 files changed, 225 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index 2f0b1bfe7658..595e2afb2141 100644
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
 
@@ -169,6 +191,10 @@ static const struct spm_reg_data spm_reg_8226_cpu  = {
 
 static const u16 spm_reg_offset_v1_1[SPM_REG_NR] = {
 	[SPM_REG_CFG]		= 0x08,
+	[SPM_REG_STS0]		= 0x0c,
+	[SPM_REG_STS1]		= 0x10,
+	[SPM_REG_VCTL]		= 0x14,
+	[SPM_REG_AVS_CTL]	= 0x18,
 	[SPM_REG_SPM_CTL]	= 0x20,
 	[SPM_REG_PMIC_DLY]	= 0x24,
 	[SPM_REG_PMIC_DATA_0]	= 0x28,
@@ -176,7 +202,12 @@ static const u16 spm_reg_offset_v1_1[SPM_REG_NR] = {
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
@@ -187,6 +218,10 @@ static const struct spm_reg_data spm_reg_8064_cpu = {
 		0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },
 	.start_index[PM_SLEEP_MODE_STBY] = 0,
 	.start_index[PM_SLEEP_MODE_SPC] = 2,
+	.set_vdd = smp_set_vdd_v1_1,
+	.range = &spm_v1_1_regulator_range,
+	.init_uV = 1300000,
+	.ramp_delay = 1250,
 };
 
 static inline void spm_register_write(struct spm_driver_data *drv,
@@ -238,6 +273,181 @@ void spm_set_low_power_mode(struct spm_driver_data *drv,
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
+	/* L2 SPM is not bound to any CPU, tie it to CPU0 */
+
+	return 0;
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
+	drv->reg_cpu = spm_get_cpu(dev);
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
@@ -288,6 +498,7 @@ static int spm_dev_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	drv->reg_data = match_id->data;
+	drv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, drv);
 
 	/* Write the SPM sequences first.. */
@@ -315,7 +526,7 @@ static int spm_dev_probe(struct platform_device *pdev)
 	if (drv->reg_data->reg_offset[SPM_REG_SPM_CTL])
 		spm_set_low_power_mode(drv, PM_SLEEP_MODE_STBY);
 
-	return 0;
+	return spm_register_regulator(&pdev->dev, drv);
 }
 
 static struct platform_driver spm_driver = {
diff --git a/include/soc/qcom/spm.h b/include/soc/qcom/spm.h
index 4951f9d8b0bd..9859ebe42003 100644
--- a/include/soc/qcom/spm.h
+++ b/include/soc/qcom/spm.h
@@ -30,11 +30,20 @@ struct spm_reg_data {
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
 
 void spm_set_low_power_mode(struct spm_driver_data *drv,
-- 
2.39.2


