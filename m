Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E556C41E65E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 06:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237659AbhJAEDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 00:03:25 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22391 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhJAEDY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 00:03:24 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 30 Sep 2021 21:01:39 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Sep 2021 21:01:37 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Oct 2021 09:31:17 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 38FFA551B; Fri,  1 Oct 2021 09:31:16 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, collinsd@codeurora.org,
        subbaram@codeaurora.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 3/4] regulator: Add a regulator driver for the PM8008 PMIC
Date:   Fri,  1 Oct 2021 09:30:58 +0530
Message-Id: <1633060859-22969-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: satya priya <skakit@codeaurora.org>

Qualcomm Technologies, Inc. PM8008 is an I2C controlled PMIC
containing 7 LDO regulators.  Add a PM8008 regulator driver to
support PMIC regulator management via the regulator framework.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - As per Mark's comments
   - Using regmap helpers for regulator enable/disable and is_enabled APIs
   - Changed pr_err to dev_err wherever possible.
   - Removed init_voltage property as it is not used.
   - Removed if check for registering LDOs
   - Other minor changes.

 drivers/regulator/Kconfig                 |   9 +
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-pm8008-regulator.c | 320 ++++++++++++++++++++++++++++++
 3 files changed, 330 insertions(+)
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 27578e9..95d234f 100644
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
index 9e382b5..5e935ff 100644
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
index 0000000..5dacaa4
--- /dev/null
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2021, The Linux Foundation. All rights reserved. */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/pm.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
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
+#define STEP_RATE_MASK			GENMASK(1, 0)
+
+#define PM8008_MAX_LDO			7
+
+struct regulator_data {
+	char		*name;
+	char		*supply_name;
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
+static const struct regulator_data reg_data[PM8008_MAX_LDO] = {
+	/* name  parent      min_uv  max_uv  headroom_uv */
+	{"l1", "vdd_l1_l2",  528000, 1504000, 225000},
+	{"l2", "vdd_l1_l2",  528000, 1504000, 225000},
+	{"l3", "vdd_l3_l4", 1504000, 3400000, 200000},
+	{"l4", "vdd_l3_l4", 1504000, 3400000, 200000},
+	{"l5", "vdd_l5",    1504000, 3400000, 300000},
+	{"l6", "vdd_l6",    1504000, 3400000, 300000},
+	{"l7", "vdd_l7",    1504000, 3400000, 300000},
+};
+
+static int pm8008_read(struct regmap *regmap,  u16 reg, u8 *val, int count)
+{
+	int rc;
+
+	rc = regmap_bulk_read(regmap, reg, val, count);
+	if (rc < 0)
+		pr_err("failed to read %#x, rc=%d\n", reg, rc);
+
+	return rc;
+}
+
+static int pm8008_write(struct regmap *regmap, u16 reg, u8 *val, int count)
+{
+	int rc;
+
+	pr_debug("Writing [%*ph] from address %#x\n", count, val, reg);
+	rc = regmap_bulk_write(regmap, reg, val, count);
+	if (rc < 0)
+		pr_err("failed to write %#x rc=%d\n", reg, rc);
+
+	return rc;
+}
+
+static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
+	u8 vset_raw[2];
+	int rc;
+
+	rc = pm8008_read(pm8008_reg->regmap,
+			LDO_VSET_LB_REG(pm8008_reg->base),
+			vset_raw, 2);
+	if (rc < 0) {
+		dev_err(pm8008_reg->dev, "failed to read regulator voltage rc=%d\n", rc);
+		return rc;
+	}
+
+	return (vset_raw[1] << 8 | vset_raw[0]) * 1000;
+}
+
+static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg, int min_uv,
+				int max_uv)
+{
+	int rc = 0, mv;
+	u8 vset_raw[2];
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
+	vset_raw[0] = mv & 0xff;
+	vset_raw[1] = (mv & 0xff00) >> 8;
+	rc = pm8008_write(pm8008_reg->regmap, LDO_VSET_LB_REG(pm8008_reg->base),
+			vset_raw, 2);
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
+	.enable		= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_voltage		= pm8008_regulator_set_voltage,
+	.get_voltage		= pm8008_regulator_get_voltage,
+	.list_voltage		= regulator_list_voltage_linear,
+	.set_voltage_time	= pm8008_regulator_set_voltage_time,
+};
+
+static int pm8008_register_ldo(struct pm8008_regulator *pm8008_reg,
+						const char *name)
+{
+	struct regulator_config reg_config = {};
+	struct regulator_init_data *init_data;
+	struct device *dev = pm8008_reg->dev;
+	struct device_node *reg_node = pm8008_reg->of_node;
+	int rc, i;
+	u32 base = 0;
+	u8 reg;
+
+	/* get regulator data */
+	for (i = 0; i < PM8008_MAX_LDO; i++)
+		if (strstr(name, reg_data[i].name))
+			break;
+
+	if (i == PM8008_MAX_LDO) {
+		dev_err(dev, "Invalid regulator name %s\n", name);
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u32(reg_node, "reg", &base);
+	if (rc < 0) {
+		dev_err(dev, "%s: failed to get regulator base rc=%d\n", name, rc);
+		return rc;
+	}
+	pm8008_reg->base = base;
+
+	/* get slew rate */
+	rc = pm8008_read(pm8008_reg->regmap,
+			LDO_STEPPER_CTL_REG(pm8008_reg->base), &reg, 1);
+	if (rc < 0) {
+		dev_err(dev, "%s: failed to read step rate configuration rc=%d\n",
+				name, rc);
+		return rc;
+	}
+	pm8008_reg->step_rate = 38400 >> (reg & STEP_RATE_MASK);
+
+	init_data = of_get_regulator_init_data(dev, reg_node,
+						&pm8008_reg->rdesc);
+	if (init_data == NULL) {
+		dev_err(dev, "%s: failed to get regulator data\n", name);
+		return -ENODATA;
+	}
+
+	init_data->constraints.input_uV = init_data->constraints.max_uV;
+	reg_config.dev = dev;
+	reg_config.init_data = init_data;
+	reg_config.driver_data = pm8008_reg;
+	reg_config.of_node = reg_node;
+
+	pm8008_reg->rdesc.type = REGULATOR_VOLTAGE;
+	pm8008_reg->rdesc.ops = &pm8008_regulator_ops;
+	pm8008_reg->rdesc.name = init_data->constraints.name;
+	pm8008_reg->rdesc.supply_name = reg_data[i].supply_name;
+	pm8008_reg->rdesc.uV_step = VSET_STEP_UV;
+	pm8008_reg->rdesc.min_uV = reg_data[i].min_uv;
+	pm8008_reg->rdesc.n_voltages
+		= ((reg_data[i].max_uv - reg_data[i].min_uv)
+			/ pm8008_reg->rdesc.uV_step) + 1;
+
+	pm8008_reg->rdesc.enable_reg = LDO_ENABLE_REG(base);
+	pm8008_reg->rdesc.enable_mask = ENABLE_BIT;
+	pm8008_reg->rdesc.min_dropout_uV = reg_data[i].min_dropout_uv;
+	of_property_read_u32(reg_node, "qcom,min-dropout-voltage",
+			     &pm8008_reg->rdesc.min_dropout_uV);
+
+	pm8008_reg->rdev = devm_regulator_register(dev, &pm8008_reg->rdesc,
+						&reg_config);
+	if (IS_ERR(pm8008_reg->rdev)) {
+		rc = PTR_ERR(pm8008_reg->rdev);
+		dev_err(dev, "%s: failed to register regulator rc=%d\n",
+				pm8008_reg->rdesc.name, rc);
+		return rc;
+	}
+
+	dev_dbg(dev, "%s regulator registered\n", name);
+
+	return 0;
+}
+
+static int pm8008_parse_regulator(struct regmap *regmap, struct device *dev)
+{
+	int rc = 0;
+	const char *name;
+	struct device_node *child;
+	struct pm8008_regulator *pm8008_reg;
+
+	/* parse each subnode and register regulator for regulator child */
+	for_each_available_child_of_node(dev->of_node, child) {
+		pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
+
+		pm8008_reg->regmap = regmap;
+		pm8008_reg->of_node = child;
+		pm8008_reg->dev = dev;
+
+		rc = of_property_read_string(child, "regulator-name", &name);
+		if (rc)
+			continue;
+
+		rc = pm8008_register_ldo(pm8008_reg, name);
+		if (rc < 0) {
+			dev_err(dev, "failed to register regulator %s rc=%d\n",
+					name, rc);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static int pm8008_regulator_probe(struct platform_device *pdev)
+{
+	int rc = 0;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		dev_err(&pdev->dev, "parent regmap is missing\n");
+		return -EINVAL;
+	}
+
+	rc = pm8008_parse_regulator(regmap, &pdev->dev);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "failed to parse device tree rc=%d\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id pm8008_regulator_match_table[] = {
+	{ .compatible = "qcom,pm8008-regulator", },
+	{ },
+};
+
+static struct platform_driver pm8008_regulator_driver = {
+	.driver	= {
+		.name		= "qcom,pm8008-regulator",
+		.of_match_table	= pm8008_regulator_match_table,
+	},
+	.probe		= pm8008_regulator_probe,
+};
+
+module_platform_driver(pm8008_regulator_driver);
+
+MODULE_DESCRIPTION("Qualcomm PM8008 PMIC Regulator Driver");
+MODULE_LICENSE("GPL v2");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

