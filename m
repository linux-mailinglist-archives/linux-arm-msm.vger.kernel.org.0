Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CEE43E4C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 17:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhJ1PSc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 11:18:32 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59306 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhJ1PSb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 11:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635434164; x=1666970164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=923feWdbn4vlJZZpTnuR8xsLj7pPjFTIBW/lpuEnkkI=;
  b=GJLF2oaXq6ajQViARiQEkGPY83w0fq9LVX09J4vQlehwJCuamBKeqH8U
   2YjXLGRopKQcLyQSAFSVCQ2jXSw8AMdlCUbbShzLlkeZ3wk9kPEA2DvMV
   Fa0jFcYQ4f2GDk8Cds/QBTZw8klP1H1tMh/JIkH0AXVV6KTy0Zos7bzUq
   E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 28 Oct 2021 08:16:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 08:16:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:16:02 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:15:58 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V3 3/4] regulator: Add a regulator driver for the PM8008 PMIC
Date:   Thu, 28 Oct 2021 20:44:31 +0530
Message-ID: <1635434072-32055-4-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm Technologies, Inc. PM8008 is an I2C controlled PMIC
containing 7 LDO regulators.  Add a PM8008 regulator driver to
support PMIC regulator management via the regulator framework.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
---
Changes in V2:
 - As per Mark's comments
 - Using regmap helpers for regulator enable/disable and is_enabled APIs
 - Changed pr_err to dev_err wherever possible.
 - Removed init_voltage property as it is not used.
 - Removed if check for registering LDOs
 - Other minor changes.

Changes in V3:
 - As per Stephen's comments, 
   - Removed unused includes
   - Removed PM8008_MAX_LDO macro.
   - Removed pm8008_read/write APIs, using regmap_bulk_read/write APIs
   - Using le16_to_cpu/cpu_to_le16 APIs in pm8008_regulator_get/set_voltage
   - Consolidated all probe related functions into single probe function.
   - Added of_parse_cb call back and removed regulator-name matching loop.
   - Fixed other minor nits.

 drivers/regulator/Kconfig                 |   9 +
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-pm8008-regulator.c | 269 ++++++++++++++++++++++++++++++
 3 files changed, 279 insertions(+)
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6be9b1c..61e3e98 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -916,6 +916,15 @@ config REGULATOR_PWM
 	  This driver supports PWM controlled voltage regulators. PWM
 	  duty cycle can increase or decrease the voltage.
 
+config REGULATOR_QCOM_PM8008
+	tristate "Qualcomm Technologies, Inc. PM8008 PMIC regulators"
+	depends on MFD_QCOM_PM8008
+	help
+	  Select this option to get support for the voltage regulators
+	  of Qualcomm Technologies, Inc. PM8008 PMIC chip. PM8008 has 7 LDO
+	  regulators. This driver provides support for basic operations like
+	  set/get voltage and enable/disable.
+
 config REGULATOR_QCOM_RPM
 	tristate "Qualcomm RPM regulator driver"
 	depends on MFD_QCOM_RPM
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index b07d2a2..4fac16b6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
+obj-$(CONFIG_REGULATOR_QCOM_PM8008) += qcom-pm8008-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
new file mode 100644
index 0000000..74ba682
--- /dev/null
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2021, The Linux Foundation. All rights reserved. */
+
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+#define STARTUP_DELAY_USEC		20
+#define VSET_STEP_MV			8
+#define VSET_STEP_UV			(VSET_STEP_MV * 1000)
+
+#define LDO_ENABLE_REG(base)		(base + 0x46)
+#define ENABLE_BIT			BIT(7)
+
+#define LDO_STATUS1_REG(base)		(base + 0x08)
+#define VREG_READY_BIT			BIT(7)
+
+#define LDO_VSET_LB_REG(base)		(base + 0x40)
+
+#define LDO_STEPPER_CTL_REG(base)	(base + 0x3b)
+#define DEFAULT_VOLTAGE_STEPPER_RATE	38400
+#define STEP_RATE_MASK			GENMASK(1, 0)
+
+struct regulator_data {
+	const char	*name;
+	const char	*supply_name;
+	int		min_uv;
+	int		max_uv;
+	int		min_dropout_uv;
+};
+
+struct pm8008_regulator {
+	struct device		*dev;
+	struct regmap		*regmap;
+	struct regulator_desc	rdesc;
+	struct regulator_dev	*rdev;
+	struct device_node	*of_node;
+	u16			base;
+	int			step_rate;
+};
+
+static const struct regulator_data reg_data[] = {
+	/* name  parent      min_uv  max_uv  headroom_uv */
+	{ "l1", "vdd_l1_l2",  528000, 1504000, 225000 },
+	{ "l2", "vdd_l1_l2",  528000, 1504000, 225000 },
+	{ "l3", "vdd_l3_l4", 1504000, 3400000, 200000 },
+	{ "l4", "vdd_l3_l4", 1504000, 3400000, 200000 },
+	{ "l5", "vdd_l5",    1504000, 3400000, 300000 },
+	{ "l6", "vdd_l6",    1504000, 3400000, 300000 },
+	{ "l7", "vdd_l7",    1504000, 3400000, 300000 },
+	{ }
+};
+
+static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
+	__le16 mV;
+	int rc;
+
+	rc = regmap_bulk_read(pm8008_reg->regmap,
+			LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);
+	if (rc < 0) {
+		dev_err(pm8008_reg->dev,
+					"failed to read regulator voltage rc=%d\n", rc);
+		return rc;
+	}
+
+	return le16_to_cpu(mV) * 1000;
+}
+
+static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg,
+					int min_uv, int max_uv)
+{
+	int rc, mv;
+	u16 vset_raw;
+
+	mv = DIV_ROUND_UP(min_uv, 1000);
+
+	/*
+	 * Each LSB of regulator is 1mV and the voltage setpoint
+	 * should be multiple of 8mV(step).
+	 */
+	mv = DIV_ROUND_UP(mv, VSET_STEP_MV) * VSET_STEP_MV;
+	if (mv * 1000 > max_uv) {
+		dev_err(pm8008_reg->dev,
+			"requested voltage (%d uV) above maximum limit (%d uV)\n",
+				mv*1000, max_uv);
+		return -EINVAL;
+	}
+
+	vset_raw = cpu_to_le16(mv);
+
+	rc = regmap_bulk_write(pm8008_reg->regmap,
+			LDO_VSET_LB_REG(pm8008_reg->base),
+			(const void *)&vset_raw, sizeof(vset_raw));
+	if (rc < 0) {
+		dev_err(pm8008_reg->dev, "failed to write voltage rc=%d\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int pm8008_regulator_set_voltage_time(struct regulator_dev *rdev,
+				int old_uV, int new_uv)
+{
+	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
+
+	return DIV_ROUND_UP(abs(new_uv - old_uV), pm8008_reg->step_rate);
+}
+
+static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
+				int min_uv, int max_uv, unsigned int *selector)
+{
+	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
+	int rc;
+
+	rc = pm8008_write_voltage(pm8008_reg, min_uv, max_uv);
+	if (rc < 0)
+		return rc;
+
+	*selector = DIV_ROUND_UP(min_uv - pm8008_reg->rdesc.min_uV,
+				VSET_STEP_UV);
+
+	dev_dbg(pm8008_reg->dev, "voltage set to %d\n", min_uv);
+	return 0;
+}
+
+static const struct regulator_ops pm8008_regulator_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_voltage		= pm8008_regulator_set_voltage,
+	.get_voltage		= pm8008_regulator_get_voltage,
+	.list_voltage		= regulator_list_voltage_linear,
+	.set_voltage_time	= pm8008_regulator_set_voltage_time,
+};
+
+static int pm8008_regulator_of_parse(struct device_node *node,
+			const struct regulator_desc *desc,
+			struct regulator_config *config)
+{
+	struct pm8008_regulator *pm8008_reg = config->driver_data;
+	struct device *dev = config->dev;
+	int rc;
+	u8 reg;
+
+	rc = of_property_read_u32(node, "regulator-min-dropout-voltage-microvolt",
+			&pm8008_reg->rdesc.min_dropout_uV);
+	if (rc) {
+		dev_err(dev, "failed to read min-dropout voltage rc=%d\n", rc);
+		return rc;
+	}
+
+	/* get slew rate */
+	rc = regmap_bulk_read(pm8008_reg->regmap,
+			LDO_STEPPER_CTL_REG(pm8008_reg->base), (void *)&reg, 1);
+	if (rc < 0) {
+		dev_err(dev, "%s: failed to read step rate configuration rc=%d\n",
+				pm8008_reg->rdesc.name, rc);
+		return rc;
+	}
+	pm8008_reg->step_rate
+			= DEFAULT_VOLTAGE_STEPPER_RATE >> (reg & STEP_RATE_MASK);
+
+	return 0;
+}
+
+static int pm8008_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct pm8008_regulator *pm8008_reg;
+	struct regmap *regmap;
+	struct regulator_config reg_config = {};
+	const struct regulator_data *reg;
+	struct regulator_init_data *init_data;
+	int rc;
+	u32 base;
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap) {
+		dev_err(dev, "parent regmap is missing\n");
+		return -EINVAL;
+	}
+
+	for (reg = &reg_data[0]; reg->name; reg++) {
+		pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
+
+		pm8008_reg->regmap = regmap;
+
+		pm8008_reg->of_node = of_get_child_by_name(node, reg->name);
+		if (!pm8008_reg->of_node) {
+			dev_err(dev, "child node %s not found\n", reg->name);
+			return -ENODEV;
+		}
+
+		pm8008_reg->dev = dev;
+
+		rc = of_property_read_u32(pm8008_reg->of_node, "reg", &base);
+		if (rc < 0) {
+			dev_err(dev, "%s: failed to get regulator base rc=%d\n",
+						reg->name, rc);
+			return rc;
+		}
+		pm8008_reg->base = base;
+
+		init_data = of_get_regulator_init_data(dev, pm8008_reg->of_node,
+							&pm8008_reg->rdesc);
+		if (!init_data) {
+			dev_err(dev, "%s: failed to get regulator data\n", reg->name);
+			return -ENODATA;
+		}
+
+		pm8008_reg->rdesc.type = REGULATOR_VOLTAGE;
+		pm8008_reg->rdesc.ops = &pm8008_regulator_ops;
+		pm8008_reg->rdesc.name = init_data->constraints.name;
+		pm8008_reg->rdesc.supply_name = reg->supply_name;
+		pm8008_reg->rdesc.of_match = reg->name;
+		pm8008_reg->rdesc.of_parse_cb = pm8008_regulator_of_parse;
+		pm8008_reg->rdesc.uV_step = VSET_STEP_UV;
+		pm8008_reg->rdesc.min_uV = reg->min_uv;
+		pm8008_reg->rdesc.n_voltages
+			= ((reg->max_uv - reg->min_uv)
+				/ pm8008_reg->rdesc.uV_step) + 1;
+
+		pm8008_reg->rdesc.enable_reg = LDO_ENABLE_REG(base);
+		pm8008_reg->rdesc.enable_mask = ENABLE_BIT;
+		pm8008_reg->rdesc.min_dropout_uV = reg->min_dropout_uv;
+
+		init_data->constraints.input_uV = init_data->constraints.max_uV;
+		reg_config.dev = dev;
+		reg_config.init_data = init_data;
+		reg_config.driver_data = pm8008_reg;
+		reg_config.of_node = pm8008_reg->of_node;
+
+		return PTR_ERR_OR_ZERO(devm_regulator_register(dev, &pm8008_reg->rdesc,
+								&reg_config));
+	}
+
+	return 0;
+}
+
+static const struct of_device_id pm8008_regulator_match_table[] = {
+	{ .compatible = "qcom,pm8008-regulator", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pm8008_regulator_match_table);
+
+static struct platform_driver pm8008_regulator_driver = {
+	.driver	= {
+		.name		= "qcom,pm8008-regulator",
+		.of_match_table	= pm8008_regulator_match_table,
+	},
+	.probe	= pm8008_regulator_probe,
+};
+
+module_platform_driver(pm8008_regulator_driver);
+
+MODULE_DESCRIPTION("Qualcomm PM8008 PMIC Regulator Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

