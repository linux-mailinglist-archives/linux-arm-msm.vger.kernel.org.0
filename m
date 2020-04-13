Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312BF1A6A24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 18:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731728AbgDMQpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 12:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731652AbgDMQpH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 12:45:07 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7B6C0A3BDC;
        Mon, 13 Apr 2020 09:45:07 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id m19so7009401lfq.13;
        Mon, 13 Apr 2020 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j0/ojehsgN6WFhJxo84PGsofi9PZNXG9f0uE47ESYDI=;
        b=h4RILQvUAFVhV4HDVTfiv0vSB76SQh0DSCmqFYw0RvcD/w3sTZwX2WeduV0O83KZL6
         6dJYWz0uUZ5i3iuea6nH0WNSTJVu4LdYXir4fuVVfxEAYqbXtZVNDKeetAvbAhNU+8Cn
         /PzVMZ28u83he+KWzokUjIBgZajeF+f6hCSx7I/rBNUCfHECAPAARMFN2oMXMeMOpFCW
         eqTrQMI5vJ8kEEjyexZxxiVKJTN9YLAHUukyiPPeQdo1/B4gm+C7vt5abOWrv0n415rZ
         2g2/Jc+gkJojHhgZfs9AIRjKWgkcaXp2n8KGiXm7rJoN9KOjkQHSiYfxnvxTiO4Ar+JE
         HIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j0/ojehsgN6WFhJxo84PGsofi9PZNXG9f0uE47ESYDI=;
        b=Ju+jiNJL1m0wIHuQYbq4i7y4MnyqvAwCwBqRB+HfM+DopbYfNbplgc/N+ChJ0MWiR6
         tP+XGBfkefoRFa2FsPsAu+HDCv7OeS6ojiHXU4FsRIKGlObdP0tzokoG68qlEsrnl2P1
         eRaM5ZnoHnystiH8ZrQWtGXy/OhTVixPyJSWJPYnobJEN3iAYEuHVE1R30YyHdXHh5nD
         A6VHbXkNaF4npPWjkbBtUFxp87kfuPQWDCUjxCfWftbpZ2xnbzG1QvciHhH+3YE9/0jy
         XzSX6CC8gFp7Egid867CCmguhlduPqAbaI9qOCI9nPj9cYZJJt8X2Q06ScppIB4xdj/j
         YDAw==
X-Gm-Message-State: AGi0Puakem0xnfhvgavHfVUKXac9DwDF1bizmYbeN5NPn6jys4iUI5Fc
        ID7U8EIOkXEzn1hmtig0zX8gDLRZk6/2uQ==
X-Google-Smtp-Source: APiQypLQmhMYfdNx/hNdyQrep4gGHZ5hGSStSBvfd4sRTE6o+Jye6QlF1xlooQQVU5HQizmuDZRSDw==
X-Received: by 2002:ac2:5042:: with SMTP id a2mr10967815lfm.13.1586796304920;
        Mon, 13 Apr 2020 09:45:04 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id n26sm7440740ljg.93.2020.04.13.09.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 09:45:04 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 1/3] regulator: max77826: Add max77826 regulator driver
Date:   Mon, 13 Apr 2020 19:44:38 +0300
Message-Id: <20200413164440.1138178-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413164440.1138178-1-iskren.chernev@gmail.com>
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding regulator driver for the Maxim max77826 device.
The max77826 PMIC contains a high-efficiency BUCK regulator, a BUCK
BOOST regulator and 15 LDOs. It is designed for smartphone and tablet
applications and is accessed over I2C.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/regulator/Kconfig              |  10 +
 drivers/regulator/Makefile             |   1 +
 drivers/regulator/max77826-regulator.c | 301 +++++++++++++++++++++++++
 3 files changed, 312 insertions(+)
 create mode 100644 drivers/regulator/max77826-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index f4b72cb098ef..e8f7a0965ae9 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -585,6 +585,16 @@ config REGULATOR_MAX77802
 	  Exynos5420/Exynos5800 SoCs to control various voltages.
 	  It includes support for control of voltage and ramp speed.
 
+config REGULATOR_MAX77826
+	tristate "Maxim 77826 regulator"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This driver controls a Maxim 77826 regulator via I2C bus.
+	  The regulator include 15 LDOs, BUCK and BUCK BOOST regulator.
+	  It includes support for control of output voltage. This
+	  regulator is found on the Samsung Galaxy S5 (klte) smartphone.
+
 config REGULATOR_MC13XXX_CORE
 	tristate
 
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6610ee001d9a..e8f163371071 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_REGULATOR_MAX8998) += max8998.o
 obj-$(CONFIG_REGULATOR_MAX77686) += max77686-regulator.o
 obj-$(CONFIG_REGULATOR_MAX77693) += max77693-regulator.o
 obj-$(CONFIG_REGULATOR_MAX77802) += max77802-regulator.o
+obj-$(CONFIG_REGULATOR_MAX77826) += max77826-regulator.o
 obj-$(CONFIG_REGULATOR_MC13783) += mc13783-regulator.o
 obj-$(CONFIG_REGULATOR_MC13892) += mc13892-regulator.o
 obj-$(CONFIG_REGULATOR_MC13XXX_CORE) +=  mc13xxx-regulator-core.o
diff --git a/drivers/regulator/max77826-regulator.c b/drivers/regulator/max77826-regulator.c
new file mode 100644
index 000000000000..070fbc2e1e43
--- /dev/null
+++ b/drivers/regulator/max77826-regulator.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// max77826-regulator.c  - regulator driver for Maxim MAX77826
+//
+// Author: Iskren Chernev <iskren.chernev@gmail.com>
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+enum max77826_registers {
+	MAX77826_REG_INT_SRC = 0x00,
+	MAX77826_REG_SYS_INT,
+	MAX77826_REG_INT1,
+	MAX77826_REG_INT2,
+	MAX77826_REG_BB_INT,
+	MAX77826_REG_INT_SRC_M,
+	MAX77826_REG_TOPSYS_INT_M,
+	MAX77826_REG_INT1_M,
+	MAX77826_REG_INT2_M,
+	MAX77826_REG_BB_INT_M,
+	MAX77826_REG_TOPSYS_STAT,
+	MAX77826_REG_STAT1,
+	MAX77826_REG_STAT2,
+	MAX77826_REG_BB_STAT,
+	/* 0x0E - 0x0F: Reserved */
+	MAX77826_REG_LDO_OPMD1 = 0x10,
+	MAX77826_REG_LDO_OPMD2,
+	MAX77826_REG_LDO_OPMD3,
+	MAX77826_REG_LDO_OPMD4,
+	MAX77826_REG_B_BB_OPMD,
+	/* 0x15 - 0x1F: Reserved */
+	MAX77826_REG_LDO1_CFG = 0x20,
+	MAX77826_REG_LDO2_CFG,
+	MAX77826_REG_LDO3_CFG,
+	MAX77826_REG_LDO4_CFG,
+	MAX77826_REG_LDO5_CFG,
+	MAX77826_REG_LDO6_CFG,
+	MAX77826_REG_LDO7_CFG,
+	MAX77826_REG_LDO8_CFG,
+	MAX77826_REG_LDO9_CFG,
+	MAX77826_REG_LDO10_CFG,
+	MAX77826_REG_LDO11_CFG,
+	MAX77826_REG_LDO12_CFG,
+	MAX77826_REG_LDO13_CFG,
+	MAX77826_REG_LDO14_CFG,
+	MAX77826_REG_LDO15_CFG,
+	/* 0x2F: Reserved */
+	MAX77826_REG_BUCK_CFG = 0x30,
+	MAX77826_REG_BUCK_VOUT,
+	MAX77826_REG_BB_CFG,
+	MAX77826_REG_BB_VOUT,
+	/* 0x34 - 0x3F: Reserved */
+	MAX77826_REG_BUCK_SS_FREQ = 0x40,
+	MAX77826_REG_UVLO_FALL,
+	/* 0x42 - 0xCE: Reserved */
+	MAX77826_REG_DEVICE_ID = 0xCF,
+};
+
+enum max77826_regulators {
+	MAX77826_LDO1 = 0,
+	MAX77826_LDO2,
+	MAX77826_LDO3,
+	MAX77826_LDO4,
+	MAX77826_LDO5,
+	MAX77826_LDO6,
+	MAX77826_LDO7,
+	MAX77826_LDO8,
+	MAX77826_LDO9,
+	MAX77826_LDO10,
+	MAX77826_LDO11,
+	MAX77826_LDO12,
+	MAX77826_LDO13,
+	MAX77826_LDO14,
+	MAX77826_LDO15,
+	MAX77826_BUCK,
+	MAX77826_BUCKBOOST,
+	MAX77826_MAX_REGULATORS,
+};
+
+#define MAX77826_MASK_LDO		0x7f
+#define MAX77826_MASK_BUCK		0xff
+#define MAX77826_MASK_BUCKBOOST		0x7f
+#define MAX77826_BUCK_RAMP_DELAY	12500
+
+/* values in mV */
+/* for LDO1-3 */
+#define MAX77826_NMOS_LDO_VOLT_MIN	600000
+#define MAX77826_NMOS_LDO_VOLT_MAX	2187500
+#define MAX77826_NMOS_LDO_VOLT_STEP	12500
+
+/* for LDO4-15 */
+#define MAX77826_PMOS_LDO_VOLT_MIN	800000
+#define MAX77826_PMOS_LDO_VOLT_MAX	3975000
+#define MAX77826_PMOS_LDO_VOLT_STEP	25000
+
+/* for BUCK */
+#define MAX77826_BUCK_VOLT_MIN		500000
+#define MAX77826_BUCK_VOLT_MAX		1800000
+#define MAX77826_BUCK_VOLT_STEP		6250
+
+/* for BUCKBOOST */
+#define MAX77826_BUCKBOOST_VOLT_MIN	2600000
+#define MAX77826_BUCKBOOST_VOLT_MAX	4187500
+#define MAX77826_BUCKBOOST_VOLT_STEP	12500
+#define MAX77826_VOLT_RANGE(_type)					\
+	((MAX77826_ ## _type ## _VOLT_MAX -				\
+	  MAX77826_ ## _type ## _VOLT_MIN) /				\
+	 MAX77826_ ## _type ## _VOLT_STEP + 1)
+
+#define MAX77826_LDO(_id, _type)					\
+	[MAX77826_LDO ## _id] = {					\
+		.id = MAX77826_LDO ## _id,				\
+		.name = "LDO"#_id,					\
+		.of_match = of_match_ptr("LDO"#_id),			\
+		.regulators_node = "regulators",			\
+		.ops = &max77826_most_ops,				\
+		.min_uV = MAX77826_ ## _type ## _LDO_VOLT_MIN,		\
+		.uV_step = MAX77826_ ## _type ## _LDO_VOLT_STEP,	\
+		.n_voltages = MAX77826_VOLT_RANGE(_type ## _LDO),	\
+		.enable_reg = MAX77826_REG_LDO_OPMD1 + (_id - 1) / 4,	\
+		.enable_mask = BIT(((_id - 1) % 4) * 2 + 1),		\
+		.vsel_reg = MAX77826_REG_LDO1_CFG + (_id - 1),		\
+		.vsel_mask = MAX77826_MASK_LDO,				\
+		.owner = THIS_MODULE,					\
+	}
+
+#define MAX77826_BUCK(_idx, _id, _ops)					\
+	[MAX77826_ ## _id] = {						\
+		.id = MAX77826_ ## _id,					\
+		.name = #_id,						\
+		.of_match = of_match_ptr(#_id),				\
+		.regulators_node = "regulators",			\
+		.ops = &_ops,						\
+		.min_uV =  MAX77826_ ## _id ## _VOLT_MIN,		\
+		.uV_step = MAX77826_ ## _id ## _VOLT_STEP,		\
+		.n_voltages = MAX77826_VOLT_RANGE(_id),			\
+		.enable_reg = MAX77826_REG_B_BB_OPMD,			\
+		.enable_mask = BIT(_idx * 2 + 1),			\
+		.vsel_reg = MAX77826_REG_BUCK_VOUT + _idx * 2,		\
+		.vsel_mask = MAX77826_MASK_ ## _id,			\
+		.owner = THIS_MODULE,					\
+	}
+
+
+
+struct max77826_regulator_info {
+	struct regmap *regmap;
+	struct regulator_desc *rdesc;
+};
+
+static const struct regmap_config max77826_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77826_REG_DEVICE_ID,
+};
+
+static int max77826_set_voltage_time_sel(struct regulator_dev *,
+				unsigned int old_selector,
+				unsigned int new_selector);
+
+static const struct regulator_ops max77826_most_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+};
+
+static const struct regulator_ops max77826_buck_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel	= max77826_set_voltage_time_sel,
+};
+
+static struct regulator_desc max77826_regulators_desc[] = {
+	MAX77826_LDO(1, NMOS),
+	MAX77826_LDO(2, NMOS),
+	MAX77826_LDO(3, NMOS),
+	MAX77826_LDO(4, PMOS),
+	MAX77826_LDO(5, PMOS),
+	MAX77826_LDO(6, PMOS),
+	MAX77826_LDO(7, PMOS),
+	MAX77826_LDO(8, PMOS),
+	MAX77826_LDO(9, PMOS),
+	MAX77826_LDO(10, PMOS),
+	MAX77826_LDO(11, PMOS),
+	MAX77826_LDO(12, PMOS),
+	MAX77826_LDO(13, PMOS),
+	MAX77826_LDO(14, PMOS),
+	MAX77826_LDO(15, PMOS),
+	MAX77826_BUCK(0, BUCK, max77826_buck_ops),
+	MAX77826_BUCK(1, BUCKBOOST, max77826_most_ops),
+};
+
+static int max77826_set_voltage_time_sel(struct regulator_dev *rdev,
+				unsigned int old_selector,
+				unsigned int new_selector)
+{
+	if (new_selector > old_selector) {
+		return DIV_ROUND_UP(MAX77826_BUCK_VOLT_STEP *
+				(new_selector - old_selector),
+				MAX77826_BUCK_RAMP_DELAY);
+	}
+
+	return 0;
+}
+
+static int max77826_read_device_id(struct regmap *regmap, struct device *dev)
+{
+	unsigned int device_id;
+	int res;
+
+	res = regmap_read(regmap, MAX77826_REG_DEVICE_ID, &device_id);
+	if (!res)
+		dev_dbg(dev, "DEVICE_ID: 0x%x\n", device_id);
+
+	return res;
+}
+
+static int max77826_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct max77826_regulator_info *info;
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	int i;
+
+	info = devm_kzalloc(dev, sizeof(struct max77826_regulator_info),
+				GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->rdesc = max77826_regulators_desc;
+	regmap = devm_regmap_init_i2c(client, &max77826_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "Failed to allocate regmap!\n");
+		return PTR_ERR(regmap);
+	}
+
+	info->regmap = regmap;
+	i2c_set_clientdata(client, info);
+
+	config.dev = dev;
+	config.regmap = regmap;
+	config.driver_data = info;
+
+	for (i = 0; i < MAX77826_MAX_REGULATORS; i++) {
+		rdev = devm_regulator_register(dev,
+					       &max77826_regulators_desc[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "Failed to register regulator!\n");
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return max77826_read_device_id(regmap, dev);
+}
+
+static const struct of_device_id max77826_of_match[] = {
+	{ .compatible = "maxim,max77826-regulator" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, max77826_of_match);
+
+static const struct i2c_device_id max77826_id[] = {
+	{ "max77826-regulator" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, max77826_id);
+
+static struct i2c_driver max77826_regulator_driver = {
+	.driver = {
+		.name = "max77826",
+		.of_match_table = of_match_ptr(max77826_of_match),
+	},
+	.probe_new = max77826_i2c_probe,
+	.id_table = max77826_id,
+};
+module_i2c_driver(max77826_regulator_driver);
+
+MODULE_AUTHOR("Iskren Chernev <iskren.chernev@gmail.com>");
+MODULE_DESCRIPTION("MAX77826 PMIC regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.26.0

