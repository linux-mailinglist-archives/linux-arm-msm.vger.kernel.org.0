Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389F92869E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 23:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgJGVJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 17:09:53 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37023 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728593AbgJGVJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 17:09:45 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Oct 2020 14:09:43 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 07 Oct 2020 14:09:43 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 5FCC4195D; Wed,  7 Oct 2020 14:09:43 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RFC PATCH v1 3/3] mfd: Add PM8008 driver
Date:   Wed,  7 Oct 2020 14:09:41 -0700
Message-Id: <d48a2c433ce3053fb4f3948d489f4c225b9b3567.1602099524.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1602099524.git.gurus@codeaurora.org>
References: <cover.1602099524.git.gurus@codeaurora.org>
In-Reply-To: <cover.1602099524.git.gurus@codeaurora.org>
References: <cover.1602099524.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8008 is a PMIC that contains 7 LDOs, 2 GPIOs, temperature monitoring,
and can be interfaced over I2C. This driver uses the regmap-irq
framework to handle interrupts, creates a regmap and uses it to
instantiate all the child nodes under it in the device tree.

Only four peripherals have been added at the moment.

Every peripheral that has its TYPE register's hw default value as
zero must have it set to an all-ones mask (to cover all interrupts it
supports) in pm8008_init(). This is as per commit 84267d1b18ab ("regmap:
regmap-irq: Remove default irq type setting from core").

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/mfd/Kconfig       |  14 ++++
 drivers/mfd/Makefile      |   1 +
 drivers/mfd/qcom-pm8008.c | 197 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/mfd/qcom-pm8008.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df083..3d4e989 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1960,6 +1960,20 @@ config MFD_ROHM_BD70528
 	  10 bits SAR ADC for battery temperature monitor and 1S battery
 	  charger.
 
+config MFD_QCOM_PM8008
+	tristate "QCOM PM8008 Power Management IC"
+	depends on I2C && OF
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	help
+	  Select this option to get support for the PM8008 PMIC chip. PM8008 is
+	  a low-cost PMIC that contains 7 LDOs, 2 GPIOs, temperature
+	  monitoring, and can be interfaced over I2C. This driver provides
+	  common support for accessing the device by instantiating all the
+	  child nodes under it in the device tree and, therefore, additional
+	  drivers must be enabled in order to use the functionality of the
+	  device.
+
 config MFD_ROHM_BD71828
 	tristate "ROHM BD71828 Power Management IC"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a60e5f8..e316064 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -260,6 +260,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
 obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
 obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
 obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
+obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
 obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
 obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
 
diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
new file mode 100644
index 0000000..56a5951
--- /dev/null
+++ b/drivers/mfd/qcom-pm8008.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/regmap.h>
+
+#define I2C_INTR_STATUS_BASE	0x0550
+#define INT_RT_STS_OFFSET	0x10
+#define INT_SET_TYPE_OFFSET	0x11
+#define INT_POL_HIGH_OFFSET	0x12
+#define INT_POL_LOW_OFFSET	0x13
+#define INT_LATCHED_CLR_OFFSET	0x14
+#define INT_EN_SET_OFFSET	0x15
+#define INT_EN_CLR_OFFSET	0x16
+#define INT_LATCHED_STS_OFFSET	0x18
+
+#define PM8008_NUM_PERIPHS	4
+
+#define PM8008_PERIPH_0_BASE	0x900
+#define PM8008_PERIPH_1_BASE	0x2400
+#define PM8008_PERIPH_2_BASE	0xC000
+#define PM8008_PERIPH_3_BASE	0xC100
+
+#define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
+#define PM8008_TEMP_ALARM_EN	0x1
+
+#define PM8008_STATUS_BASE	(PM8008_PERIPH_0_BASE | INT_LATCHED_STS_OFFSET)
+#define PM8008_MASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_SET_OFFSET)
+#define PM8008_UNMASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_CLR_OFFSET)
+#define PM8008_TYPE_BASE	(PM8008_PERIPH_0_BASE | INT_SET_TYPE_OFFSET)
+#define PM8008_ACK_BASE		(PM8008_PERIPH_0_BASE | INT_LATCHED_CLR_OFFSET)
+#define PM8008_POLARITY_HI_BASE	(PM8008_PERIPH_0_BASE | INT_POL_HIGH_OFFSET)
+#define PM8008_POLARITY_LO_BASE	(PM8008_PERIPH_0_BASE | INT_POL_LOW_OFFSET)
+
+#define ADDRESS_OFFSET(paddr, base)	(paddr - base)
+
+#define PM8008_PERIPH_OFFSET(paddr)	\
+	ADDRESS_OFFSET(paddr, PM8008_PERIPH_0_BASE)
+
+struct pm8008_data {
+	struct device *dev;
+	struct regmap *regmap;
+	int irq;
+	struct regmap_irq_chip_data *irq_data;
+};
+
+unsigned int pm8008_periph_offs[] = {
+	PM8008_PERIPH_OFFSET(PM8008_PERIPH_0_BASE),
+	PM8008_PERIPH_OFFSET(PM8008_PERIPH_1_BASE),
+	PM8008_PERIPH_OFFSET(PM8008_PERIPH_2_BASE),
+	PM8008_PERIPH_OFFSET(PM8008_PERIPH_3_BASE),
+};
+
+/* Need to define enums for the interrupt numbers and masks */
+static struct regmap_irq pm8008_irqs[] = {
+	/* MISC IRQs */
+	REGMAP_IRQ_REG(0,	0,	BIT(0)),
+	REGMAP_IRQ_REG(1,	0,	BIT(1)),
+	REGMAP_IRQ_REG(2,	0,	BIT(2)),
+	REGMAP_IRQ_REG(3,	0,	BIT(3)),
+	REGMAP_IRQ_REG(4,	0,	BIT(4)),
+	/* TEMP ALARM IRQs */
+	REGMAP_IRQ_REG(5,	1,	BIT(0)),
+	/* GPIO1 IRQs */
+	REGMAP_IRQ_REG(6,	2,	BIT(0)),
+	/* GPIO2 IRQs */
+	REGMAP_IRQ_REG(7,	3,	BIT(0)),
+};
+
+static struct regmap_irq_chip pm8008_irq_chip = {
+	.name			= "pm8008_irq",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8008_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8008_irqs),
+	.num_regs		= PM8008_NUM_PERIPHS,
+	.periph_offs		= pm8008_periph_offs,
+	.status_base		= PM8008_STATUS_BASE,
+	/*
+	 * mask_base and unmask_base are swapped (SET and CLR) because
+	 * "unmask_offset" in framework expects unmask_base to be larger than
+	 * mask_base.
+	 */
+	.mask_base		= PM8008_MASK_BASE,
+	.unmask_base		= PM8008_UNMASK_BASE,
+	.type_base		= PM8008_TYPE_BASE,
+	.ack_base		= PM8008_ACK_BASE,
+	.polarity_hi_base	= PM8008_POLARITY_HI_BASE,
+	.polarity_lo_base	= PM8008_POLARITY_LO_BASE,
+	.num_type_reg		= PM8008_NUM_PERIPHS,
+};
+
+static struct regmap_config i2c_pmic_regmap_config = {
+	.reg_bits	= 16,
+	.val_bits	= 8,
+	.max_register	= 0xFFFF,
+};
+
+static int pm8008_init(struct pm8008_data *chip)
+{
+	/*
+	 * Set TEMP_ALARM peripheral's TYPE so that the regmap-irq framework
+	 * reads this as the default value instead of zero, the HW default.
+	 */
+
+	return regmap_write(chip->regmap,
+			(PM8008_TEMP_ALARM_ADDR | INT_SET_TYPE_OFFSET),
+			PM8008_TEMP_ALARM_EN);
+}
+
+static int pm8008_probe(struct i2c_client *client,
+			     const struct i2c_device_id *id)
+{
+	int rc, i;
+	struct regmap_irq_type *type;
+	struct pm8008_data *chip;
+	struct regmap_irq_chip_data *irq_data;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &client->dev;
+	chip->regmap = devm_regmap_init_i2c(client, &i2c_pmic_regmap_config);
+	if (!chip->regmap)
+		return -ENODEV;
+
+	i2c_set_clientdata(client, chip);
+
+	rc = pm8008_init(chip);
+	if (rc) {
+		dev_err(chip->dev, "Init failed: %d\n", rc);
+		return rc;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pm8008_irqs); i++) {
+		type = &pm8008_irqs[i].type;
+
+		/* All IRQs support both edge and level triggers */
+		type->types_supported = (IRQ_TYPE_EDGE_BOTH |
+				IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW);
+
+		type->type_reg_offset 	  = pm8008_irqs[i].reg_offset;
+		type->type_rising_val 	  = pm8008_irqs[i].mask;
+		type->type_falling_val 	  = pm8008_irqs[i].mask;
+		type->type_level_high_val = pm8008_irqs[i].mask;
+		type->type_level_low_val  = pm8008_irqs[i].mask;
+	}
+
+	rc = devm_regmap_add_irq_chip(chip->dev, chip->regmap, client->irq,
+			IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+	if (rc) {
+		dev_err(chip->dev, "Failed to add IRQ chip: %d\n", rc);
+		return rc;
+	}
+
+	return devm_of_platform_populate(chip->dev);
+}
+
+static int pm8008_remove(struct i2c_client *client)
+{
+	i2c_set_clientdata(client, NULL);
+
+	return 0;
+}
+
+static const struct of_device_id pm8008_match[] = {
+	{ .compatible = "qcom,pm8008-irqchip", },
+	{ },
+};
+
+static const struct i2c_device_id i2c_pmic_id[] = {
+	{ "qcom-i2c-pmic", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, i2c_pmic_id);
+
+static struct i2c_driver pm8008_irq_driver = {
+	.driver = {
+		.name = "pm8008-irqchip",
+		.of_match_table = pm8008_match,
+	},
+	.probe 		= pm8008_probe,
+	.remove 	= pm8008_remove,
+	.id_table	= i2c_pmic_id,
+};
+module_i2c_driver(pm8008_irq_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("i2c:qcom-pm8008");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

