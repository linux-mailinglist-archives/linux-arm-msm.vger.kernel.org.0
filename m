Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0527B1CB921
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 22:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgEHUmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 16:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727869AbgEHUmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 16:42:52 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BF1C05BD09
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 13:42:52 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id p25so1536105pfn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVjbZlHrSVv9m2cwhBcBLc6LEjcvRx6+IGpIi6KYIyE=;
        b=nsg+fNO+AZ1XW5nJWEXP8JVFjWOy9vRiTFuxosPSb58u/uwHDH4Ep55V5j2iNPFVx/
         CYEpALPa7q+EGRgoAobwFDNpj/Fk+RVaocf8579+b1dj3DOFbBixyfcZz7gdkpVq78RC
         DRZa79VoCPcsD3aYFNwfmCyvcvQlaXtIltFy03n5iKNhKhiCYPDorQXHjQ42ijROgCxR
         Qnfmy64wnaVUFTV9LhAyhWIM5UK9WHfExO6CogxJrNgavMerAcTYQXHEB9VJlZTsR3J1
         CVCcNhnTApiOAk2yNb3TIfm4VNa+qScfC279+0SoF+sq/LqIaZPf+pS3EJRsQ6u7KfW+
         86Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVjbZlHrSVv9m2cwhBcBLc6LEjcvRx6+IGpIi6KYIyE=;
        b=D084D3SR8Zvzwe7Bxu99uXvSyTkr0F133Ks9ILpTFpK+/hkwbFVbra8CeqoEjZ0/Zd
         oolhPWjxzPFlKej3bNTv9Vu2UWlwPst15sP+2qHigx/QliscAvjlZLSmaNgMPJZ1wUfj
         aS9zVau81Jbz9hQkw4wCAyPNtp1L3fz81BcKWiyOwIEd+P652+yzbyT7m7/M+Abc82Js
         nr520e190LMkZ37wMLli2cIz+5SlnX3oU1cysEnK/2fXmcpZVzBK065tOSlaQwV0IVQb
         tisEzmSlQSq4Wp87LGtkXfPXKO602XCIBnSjjP6/2qDhqgpY6XhU1oDdvozIFasYROz2
         wpHg==
X-Gm-Message-State: AGi0PuYkqkS1qSMXV7BL1qROTMtV1rWfzmyT4SHiD831gUauhqa9tXEa
        cu/SwTmel1BAPCER9Lb3irPOMA==
X-Google-Smtp-Source: APiQypKRiZiS4d2dDsEoLlGqOHsfzXEJEctb3Zb7RvUKglVOqO9hrCuwwLZAF3uJ6DOWLSOn5m/sfQ==
X-Received: by 2002:a63:3c4b:: with SMTP id i11mr3548334pgn.179.1588970571453;
        Fri, 08 May 2020 13:42:51 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id h191sm2670720pfe.44.2020.05.08.13.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 13:42:50 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [v2 3/4] regulator: qcom: Add labibb driver
Date:   Sat,  9 May 2020 02:11:59 +0530
Message-Id: <20200508204200.13481-4-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508204200.13481-1-sumit.semwal@linaro.org>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Qualcomm platforms have LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost)
Regulators, labibb for short, which are used as power supply for
LCD Mode displays.

This patch adds labibb regulator driver for pmi8998 pmic, found on
SDM845 platforms.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

--
v2: sumits: reworked the driver for more common code, and addressed
    review comments from v1. This includes merging regulator_ops into
    one, and allowing for future labibb variations.
---
 drivers/regulator/Kconfig                 |  10 +
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-labibb-regulator.c | 288 ++++++++++++++++++++++
 3 files changed, 299 insertions(+)
 create mode 100644 drivers/regulator/qcom-labibb-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index f4b72cb098ef..58704a9fd05d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1167,5 +1167,15 @@ config REGULATOR_WM8994
 	  This driver provides support for the voltage regulators on the
 	  WM8994 CODEC.
 
+config REGULATOR_QCOM_LABIBB
+	tristate "QCOM LAB/IBB regulator support"
+	depends on SPMI || COMPILE_TEST
+	help
+	  This driver supports Qualcomm's LAB/IBB regulators present on the
+	  Qualcomm's PMIC chip pmi8998. QCOM LAB and IBB are SPMI
+	  based PMIC implementations. LAB can be used as positive
+	  boost regulator and IBB can be used as a negative boost regulator
+	  for LCD display panel.
+
 endif
 
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6610ee001d9a..5b313786c0e8 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6358)	+= mt6358-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
+obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
new file mode 100644
index 000000000000..a9dc7c060375
--- /dev/null
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, The Linux Foundation. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+#define REG_PERPH_TYPE                  0x04
+#define QCOM_LAB_TYPE			0x24
+#define QCOM_IBB_TYPE			0x20
+
+#define REG_LABIBB_STATUS1		0x08
+#define REG_LABIBB_ENABLE_CTL		0x46
+#define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
+#define LABIBB_CONTROL_ENABLE		BIT(7)
+
+#define LAB_ENABLE_CTL_MASK		BIT(7)
+#define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
+
+#define POWER_DELAY			8000
+
+struct labibb_regulator {
+	struct regulator_desc		desc;
+	struct device			*dev;
+	struct regmap			*regmap;
+	struct regulator_dev		*rdev;
+	u16				base;
+	u8				type;
+};
+
+struct qcom_labibb {
+	struct device			*dev;
+	struct regmap			*regmap;
+	struct labibb_regulator		lab;
+	struct labibb_regulator		ibb;
+};
+
+struct labibb_regulator_data {
+	u16				base;
+	const char			*name;
+	const char			*irq_name;
+	u8				type;
+};
+
+static int qcom_labibb_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	int ret;
+	u8 val;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regmap_bulk_read(reg->regmap, reg->base +
+			       REG_LABIBB_STATUS1, &val, 1);
+	if (ret < 0) {
+		dev_err(reg->dev, "Read register failed ret = %d\n", ret);
+		return ret;
+	}
+
+	if (val & LABIBB_STATUS1_VREG_OK_BIT)
+		return 1;
+	else
+		return 0;
+}
+
+static int _check_enabled_with_retries(struct regulator_dev *rdev,
+			int retries, int enabled)
+{
+	int ret;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	while (retries--) {
+		/* Wait for a small period before checking REG_LABIBB_STATUS1 */
+		usleep_range(POWER_DELAY, POWER_DELAY + 200);
+
+		ret = qcom_labibb_regulator_is_enabled(rdev);
+
+		if (ret < 0) {
+			dev_err(reg->dev, "Can't read %s regulator status\n",
+				reg->desc.name);
+			return ret;
+		}
+
+		if (ret == enabled)
+			return ret;
+
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
+{
+	int ret, retries = 10;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regulator_enable_regmap(rdev);
+
+	if (ret < 0) {
+		dev_err(reg->dev, "Write failed: enable %s regulator\n",
+			reg->desc.name);
+		return ret;
+	}
+
+	ret = _check_enabled_with_retries(rdev, retries, 1);
+	if (ret < 0) {
+		dev_err(reg->dev, "retries exhausted: enable %s regulator\n",
+			reg->desc.name);
+		return ret;
+	}
+
+	if (ret)
+		return 0;
+
+
+	dev_err(reg->dev, "Can't enable %s\n", reg->desc.name);
+	return -EINVAL;
+}
+
+static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
+{
+	int ret, retries = 2;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regulator_disable_regmap(rdev);
+
+	if (ret < 0) {
+		dev_err(reg->dev, "Write failed: disable %s regulator\n",
+			reg->desc.name);
+		return ret;
+	}
+
+	ret = _check_enabled_with_retries(rdev, retries, 0);
+	if (ret < 0) {
+		dev_err(reg->dev, "retries exhausted: disable %s regulator\n",
+			reg->desc.name);
+		return ret;
+	}
+
+	if (!ret)
+		return 0;
+
+	dev_err(reg->dev, "Can't disable %s\n", reg->desc.name);
+	return -EINVAL;
+}
+
+static struct regulator_ops qcom_labibb_ops = {
+	.enable			= qcom_labibb_regulator_enable,
+	.disable		= qcom_labibb_regulator_disable,
+	.is_enabled		= qcom_labibb_regulator_is_enabled,
+};
+
+static int register_labibb_regulator(struct qcom_labibb *labibb,
+				const struct labibb_regulator_data *reg_data,
+				struct device_node *of_node)
+{
+	int ret;
+	struct labibb_regulator *reg;
+	struct regulator_config cfg = {};
+
+	if (reg_data->type == QCOM_LAB_TYPE) {
+		reg = &labibb->lab;
+		reg->desc.enable_mask = LAB_ENABLE_CTL_MASK;
+	} else {
+		reg = &labibb->ibb;
+		reg->desc.enable_mask = IBB_ENABLE_CTL_MASK;
+	}
+
+	reg->dev = labibb->dev;
+	reg->base = reg_data->base;
+	reg->type = reg_data->type;
+	reg->regmap = labibb->regmap;
+	reg->desc.enable_reg = reg->base + REG_LABIBB_ENABLE_CTL;
+	reg->desc.enable_val = LABIBB_CONTROL_ENABLE;
+	reg->desc.of_match = reg_data->name;
+	reg->desc.name = reg_data->name;
+	reg->desc.owner = THIS_MODULE;
+	reg->desc.type = REGULATOR_VOLTAGE;
+	reg->desc.ops = &qcom_labibb_ops;
+
+	cfg.dev = labibb->dev;
+	cfg.driver_data = reg;
+	cfg.regmap = labibb->regmap;
+	cfg.of_node = of_node;
+
+	reg->rdev = devm_regulator_register(labibb->dev, &reg->desc,
+							&cfg);
+	if (IS_ERR(reg->rdev)) {
+		ret = PTR_ERR(reg->rdev);
+		dev_err(labibb->dev,
+			"unable to register %s regulator\n", reg_data->name);
+		return ret;
+	}
+	return 0;
+}
+
+static const struct labibb_regulator_data pmi8998_labibb_data[] = {
+	{0xde00, "lab", "lab-sc-err", QCOM_LAB_TYPE},
+	{0xdc00, "ibb", "ibb-sc-err", QCOM_IBB_TYPE},
+	{ },
+};
+
+static const struct of_device_id qcom_labibb_match[] = {
+	{ .compatible = "qcom,pmi8998-lab-ibb", .data = &pmi8998_labibb_data},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_labibb_match);
+
+static int qcom_labibb_regulator_probe(struct platform_device *pdev)
+{
+	struct qcom_labibb *labibb;
+	struct device_node *child;
+	const struct of_device_id *match;
+	const struct labibb_regulator_data *reg;
+	u8 type;
+	int ret;
+
+	labibb = devm_kzalloc(&pdev->dev, sizeof(*labibb), GFP_KERNEL);
+	if (!labibb)
+		return -ENOMEM;
+
+	labibb->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!labibb->regmap) {
+		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
+		return -ENODEV;
+	}
+
+	labibb->dev = &pdev->dev;
+
+	match = of_match_device(qcom_labibb_match, &pdev->dev);
+	if (!match)
+		return -ENODEV;
+
+	for (reg = match->data; reg->name; reg++) {
+		child = of_get_child_by_name(pdev->dev.of_node, reg->name);
+
+		/* TODO: This validates if the type of regulator is indeed
+		 * what's mentioned in DT.
+		 * I'm not sure if this is needed, but we'll keep it for now.
+		 */
+		ret = regmap_bulk_read(labibb->regmap,
+					reg->base + REG_PERPH_TYPE,
+					&type, 1);
+		if (ret < 0) {
+			dev_err(labibb->dev,
+				"Peripheral type read failed ret=%d\n",
+				ret);
+			return -EINVAL;
+		}
+
+		if ((type != QCOM_LAB_TYPE) && (type != QCOM_IBB_TYPE)) {
+			dev_err(labibb->dev,
+				"qcom_labibb: unknown peripheral type\n");
+			return -EINVAL;
+		} else if (type != reg->type) {
+			dev_err(labibb->dev,
+				"qcom_labibb: type read %x doesn't match DT %x\n",
+				type, reg->type);
+			return -EINVAL;
+		}
+
+		ret = register_labibb_regulator(labibb, reg, child);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"qcom_labibb: error registering %s regulator: %d\n",
+				child->full_name, ret);
+			return ret;
+		}
+	}
+
+	dev_set_drvdata(&pdev->dev, labibb);
+	return 0;
+}
+
+static struct platform_driver qcom_labibb_regulator_driver = {
+	.driver		= {
+		.name		= "qcom-lab-ibb-regulator",
+		.of_match_table	= qcom_labibb_match,
+	},
+	.probe		= qcom_labibb_regulator_probe,
+};
+module_platform_driver(qcom_labibb_regulator_driver);
+
+MODULE_DESCRIPTION("Qualcomm labibb driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

