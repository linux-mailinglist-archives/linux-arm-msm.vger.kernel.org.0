Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38C01E66B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 17:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404732AbgE1Prn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 11:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404695AbgE1PrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 11:47:15 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26CCC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:15 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ci23so3253168pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wx5aZAA2kgOq4IleLhAQPeiiPlraf5A+rXTLPd1JNIw=;
        b=Iajg5mUWeIxX1zJJkELZJT/Zl2KfR9vwzR3UF9/3IEr1PB4nWrK9x5+aZdvYCf3GP2
         Itw3yhcx38OyWurkVcM4w5ATZNtZPB3fOMgIZe7LUFZ7Bc/9al0kUV3+99pssDrp+AWa
         PcolB9Sf2IrT4GL9Y7m5xy6QvVCaSB9r/qCk8yGAr50KBokrDJx3UFWPbDndLr8Fiasx
         QHQQuzjIR3T+BrkKa/79g2RP80MOO/YZpEg2XA9JeSTP0PyEw9Su9UlrnU9rcmxPCvve
         fgjC+P7/emKojWRifaOHfHDW2ubilZ7oLyBDZrrQQ6ZkVoFfQD4U7Prm1MJ/iv6HmLSO
         uebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wx5aZAA2kgOq4IleLhAQPeiiPlraf5A+rXTLPd1JNIw=;
        b=Lb6AXRFUw2N3PWpk8FpnIbxVsVj2thhDuLlsCZu2v07AEnDox+Z5KBKzWryoLhe4P9
         YAKlaAR2DYKxWDT0LmuVAYw3FzDvBaSRHV5dmdrTpDKjIDHZ4L3lmH8OE2lKRZiBAdbY
         tliGpdPI09vQVyIKWqQn6XJQ9jLLzy8igao63rIA0EEMBFiv/fp5h9E/YAeslR8VnCxY
         aNBWHgSc3jQgkbPhdHz7ixky8rsyWIMmCNiPMAkEVjTNqhilzPO6HsV/8TRQJoN1MVmX
         fttT5a6vKL0JIapbYAQCKeEK8nLAnFRRbyzFqrcWvLrmGVRJ5sL6O3MLFk0dOsR5ZfCy
         mwYw==
X-Gm-Message-State: AOAM531i9/t1yJsYaRh/OS04C9oiKXXn5mZzdWnG3ZKfR1a1B3CQaV2K
        buPF1c9YYzn9HzjWu0i9RkhVLw==
X-Google-Smtp-Source: ABdhPJzpnu42SCdBn7Y6SErNPbPXGO6hYpLYNPmuXtb2Qv5qU0QdRex0sC0meUd5ni27cu/StKFINA==
X-Received: by 2002:a17:902:bd07:: with SMTP id p7mr3946318pls.293.1590680835189;
        Thu, 28 May 2020 08:47:15 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id y22sm5212551pfc.132.2020.05.28.08.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 08:47:14 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v3 4/5] regulator: qcom: Add labibb driver
Date:   Thu, 28 May 2020 21:16:24 +0530
Message-Id: <20200528154625.17742-5-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528154625.17742-1-sumit.semwal@linaro.org>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Qualcomm platforms have LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost)
regulators, labibb for short, which are used as power supply for
LCD Mode displays.

This patch adds labibb regulator driver for pmi8998 PMIC, found on
SDM845 platforms.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

--
v2: sumits: reworked the driver for more common code, and addressed
     review comments from v1
v3: sumits: addressed review comments from v2; moved to use core
     regulator features like enable_time, off_on_delay, and the newly
     added poll_enabled_time. Moved the check_enabled functionality
     to core framework via poll_enabled_time.

---
 drivers/regulator/Kconfig                 |  10 +
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-labibb-regulator.c | 224 ++++++++++++++++++++++
 3 files changed, 235 insertions(+)
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
index 000000000000..634d08461c6e
--- /dev/null
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2020, The Linux Foundation. All rights reserved.
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
+#define LABIBB_ENABLE_TIME		1000
+#define LAB_POLL_ENABLED_TIME		(LABIBB_ENABLE_TIME * 2)
+#define IBB_POLL_ENABLED_TIME		(LABIBB_ENABLE_TIME * 10)
+#define LABIBB_OFF_ON_DELAY		(8200)
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
+struct labibb_regulator_data {
+	u16				base;
+	const char			*name;
+	u8				type;
+	unsigned int			poll_enabled_time;
+};
+
+static int qcom_labibb_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	int ret;
+	unsigned int val;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(reg->regmap, reg->base + REG_LABIBB_STATUS1, &val);
+	if (ret < 0) {
+		dev_err(reg->dev, "Read register failed ret = %d\n", ret);
+		return ret;
+	}
+	return !!(val & LABIBB_STATUS1_VREG_OK_BIT);
+}
+
+static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
+{
+	int ret;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regulator_enable_regmap(rdev);
+	if (ret < 0)
+		dev_err(reg->dev, "Write failed: enable %s regulator\n",
+			reg->desc.name);
+
+	return ret;
+}
+
+static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
+{
+	int ret = 0;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regulator_disable_regmap(rdev);
+	if (ret < 0)
+		dev_err(reg->dev, "Disable failed: disable %s\n",
+			reg->desc.name);
+
+	return ret;
+}
+
+static struct regulator_ops qcom_labibb_ops = {
+	.enable			= qcom_labibb_regulator_enable,
+	.disable		= qcom_labibb_regulator_disable,
+	.is_enabled		= qcom_labibb_regulator_is_enabled,
+};
+
+static int register_labibb_regulator(struct labibb_regulator *reg,
+				const struct labibb_regulator_data *reg_data,
+				struct device_node *of_node)
+{
+	struct regulator_config cfg = {};
+
+	reg->base = reg_data->base;
+	reg->type = reg_data->type;
+	reg->desc.enable_reg = reg->base + REG_LABIBB_ENABLE_CTL;
+	reg->desc.enable_val = LABIBB_CONTROL_ENABLE;
+	reg->desc.of_match = reg_data->name;
+	reg->desc.name = reg_data->name;
+	reg->desc.owner = THIS_MODULE;
+	reg->desc.type = REGULATOR_VOLTAGE;
+	reg->desc.ops = &qcom_labibb_ops;
+
+	reg->desc.enable_time = LABIBB_ENABLE_TIME;
+	reg->desc.poll_enabled_time = reg_data->poll_enabled_time;
+	reg->desc.off_on_delay = LABIBB_OFF_ON_DELAY;
+
+	cfg.dev = reg->dev;
+	cfg.driver_data = reg;
+	cfg.regmap = reg->regmap;
+	cfg.of_node = of_node;
+
+	reg->rdev = devm_regulator_register(reg->dev, &reg->desc, &cfg);
+	return PTR_ERR_OR_ZERO(reg->rdev);
+}
+
+static const struct labibb_regulator_data pmi8998_labibb_data[] = {
+	{0xde00, "lab", QCOM_LAB_TYPE, LAB_POLL_ENABLED_TIME},
+	{0xdc00, "ibb", QCOM_IBB_TYPE, IBB_POLL_ENABLED_TIME},
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
+	struct labibb_regulator *labibb_reg;
+	struct device *dev;
+	struct device_node *child;
+	const struct of_device_id *match;
+	const struct labibb_regulator_data *reg_data;
+	struct regmap *reg_regmap;
+	unsigned int type;
+	int ret;
+
+	reg_regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!reg_regmap) {
+		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
+		return -ENODEV;
+	}
+
+	dev = &pdev->dev;
+
+	match = of_match_device(qcom_labibb_match, &pdev->dev);
+	if (!match)
+		return -ENODEV;
+
+	for (reg_data = match->data; reg_data->name; reg_data++) {
+		child = of_get_child_by_name(pdev->dev.of_node, reg_data->name);
+
+		/* TODO: This validates if the type of regulator is indeed
+		 * what's mentioned in DT.
+		 * I'm not sure if this is needed, but we'll keep it for now.
+		 */
+		ret = regmap_read(reg_regmap, reg_data->base + REG_PERPH_TYPE,
+				  &type);
+		if (ret < 0) {
+			dev_err(dev,
+				"Peripheral type read failed ret=%d\n",
+				ret);
+			return -EINVAL;
+		}
+
+		if ((type != QCOM_LAB_TYPE) && (type != QCOM_IBB_TYPE)) {
+			dev_err(dev,
+				"qcom_labibb: unknown peripheral type\n");
+			return -EINVAL;
+		} else if (type != reg_data->type) {
+			dev_err(dev,
+				"qcom_labibb: type %x doesn't match DT %x\n",
+				type, reg_data->type);
+			return -EINVAL;
+		}
+
+		labibb_reg  = devm_kzalloc(&pdev->dev, sizeof(*labibb_reg),
+					   GFP_KERNEL);
+		if (!labibb_reg)
+			return -ENOMEM;
+
+		labibb_reg->regmap = reg_regmap;
+		labibb_reg->dev = dev;
+
+		switch (reg_data->type) {
+		case QCOM_LAB_TYPE:
+			labibb_reg->desc.enable_mask = LAB_ENABLE_CTL_MASK;
+			break;
+
+		case QCOM_IBB_TYPE:
+			labibb_reg->desc.enable_mask = IBB_ENABLE_CTL_MASK;
+			break;
+		}
+
+		dev_info(dev, "Registering %s regulator\n", child->full_name);
+
+		ret = register_labibb_regulator(labibb_reg, reg_data, child);
+		if (ret < 0) {
+			dev_err(dev,
+				"qcom_labibb: error registering %s : %d\n",
+				child->full_name, ret);
+			return ret;
+		}
+	}
+
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

