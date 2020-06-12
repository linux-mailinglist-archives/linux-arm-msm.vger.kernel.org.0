Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6321F7F99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 01:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgFLXUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 19:20:14 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:11866 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726390AbgFLXTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 19:19:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592003973; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4YGkZbsKguGnYpKIS69O19O/+T6nme5gPEwJRcvkS+0=; b=Ln8mLHaFoFpXozqQKY9ySSTgfvbNhd9XIrMB854k4239B3e3rY11NgaJzIVNwodIMYEthoy/
 Ax9tc+r9LNzvefPtjmLGN8sQiRq74mTfSBZoVWVdl3AEib05txZtP45LW68KYnnMdQUFMJ5+
 l2lQeR6I1crDDGrqMhJ4Xll5r28=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5ee40d80fe1db4db89088b33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 23:19:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A347DC4339C; Fri, 12 Jun 2020 23:19:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D21BCC433CB;
        Fri, 12 Jun 2020 23:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D21BCC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     robh+dt@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        broonie@kernel.org, lgirdwood@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        lijun.kernel@gmail.com, rdunlap@infradead.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2 4/6] regulator: Add support for QCOM PMIC VBUS booster
Date:   Fri, 12 Jun 2020 16:19:16 -0700
Message-Id: <20200612231918.8001-5-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612231918.8001-1-wcheng@codeaurora.org>
References: <20200612231918.8001-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some Qualcomm PMICs have the capability to source the VBUS output to
connected peripherals.  This driver will register a regulator to the
regulator list to enable or disable this source by an external driver.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/regulator/Kconfig                   |  10 ++
 drivers/regulator/Makefile                  |   1 +
 drivers/regulator/qcom_usb_vbus-regulator.c | 147 ++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 drivers/regulator/qcom_usb_vbus-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 074a2ef55943..f9165f9f9051 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -797,6 +797,16 @@ config REGULATOR_QCOM_SPMI
 	  Qualcomm SPMI PMICs as a module. The module will be named
 	  "qcom_spmi-regulator".
 
+config REGULATOR_QCOM_USB_VBUS
+	tristate "Qualcomm USB Vbus regulator driver"
+	depends on SPMI || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  regulator used to enable the VBUS output.
+
+	  Say M here if you want to include support for enabling the VBUS output
+	  as a module. The module will be named "qcom_usb-regulator".
+
 config REGULATOR_RC5T583
 	tristate "RICOH RC5T583 Power regulators"
 	depends on MFD_RC5T583
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index c0d6b96ebd78..cbab28aa7b56 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
+obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
 obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
 obj-$(CONFIG_REGULATOR_PFUZE100) += pfuze100-regulator.o
 obj-$(CONFIG_REGULATOR_PV88060) += pv88060-regulator.o
diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
new file mode 100644
index 000000000000..2b8129a04684
--- /dev/null
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regmap.h>
+
+#define CMD_OTG				0x40
+#define OTG_EN				BIT(0)
+#define OTG_CFG				0x53
+#define OTG_EN_SRC_CFG			BIT(1)
+
+struct qcom_vbus {
+	struct device	*dev;
+	u32		base;
+	struct regmap	*regmap;
+	struct regulator_dev *usb_vbus_reg;
+};
+
+static int qcom_usb_vbus_enable(struct regulator_dev *rdev)
+{
+	struct qcom_vbus *vbus_out = rdev_get_drvdata(rdev);
+	int rc;
+
+	rc = regmap_update_bits(vbus_out->regmap, vbus_out->base + CMD_OTG,
+				OTG_EN, OTG_EN);
+	if (rc)
+		dev_err(vbus_out->dev, "failed to enable usb_vbus\n");
+
+	return rc;
+}
+
+static int qcom_usb_vbus_disable(struct regulator_dev *rdev)
+{
+	struct qcom_vbus *vbus_out = rdev_get_drvdata(rdev);
+	int rc;
+
+	rc = regmap_update_bits(vbus_out->regmap, vbus_out->base + CMD_OTG,
+				OTG_EN, 0);
+	if (rc)
+		dev_err(vbus_out->dev, "failed to disable usb_vbus\n");
+
+	return rc;
+}
+
+static int qcom_usb_vbus_is_enabled(struct regulator_dev *rdev)
+{
+	struct qcom_vbus *vbus_out = rdev_get_drvdata(rdev);
+	unsigned int value = 0;
+	int rc;
+
+	rc = regmap_read(vbus_out->regmap, vbus_out->base + CMD_OTG, &value);
+	if (rc)
+		dev_err(vbus_out->dev, "failed to read OTG_CTL\n");
+
+	return !!(value & OTG_EN);
+}
+
+static const struct regulator_ops qcom_usb_vbus_reg_ops = {
+	.enable = qcom_usb_vbus_enable,
+	.disable = qcom_usb_vbus_disable,
+	.is_enabled = qcom_usb_vbus_is_enabled,
+};
+
+static const struct regulator_desc qcom_usb_vbus_rdesc = {
+	.name = "usb_vbus",
+	.ops = &qcom_usb_vbus_reg_ops,
+	.owner = THIS_MODULE,
+	.type = REGULATOR_VOLTAGE,
+};
+
+static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
+	{ .compatible = "qcom,pm8150b-vbus-reg" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);
+
+static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	struct qcom_vbus *vbus_out;
+	struct device *dev = &pdev->dev;
+	struct regulator_config config = { };
+	struct regulator_init_data init_data = { };
+	int ret;
+	u32 reg;
+
+	ret = of_property_read_u32(dev->of_node, "reg", &reg);
+	if (ret < 0) {
+		dev_err(dev, "no base address found\n");
+		return ret;
+	}
+
+	vbus_out = devm_kzalloc(dev, sizeof(vbus_out), GFP_KERNEL);
+	if (!vbus_out)
+		return -ENOMEM;
+	vbus_out->base = reg;
+	vbus_out->dev = dev;
+
+	vbus_out->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!vbus_out->regmap) {
+		dev_err(dev, "Failed to get regmap\n");
+		return -ENOENT;
+	}
+
+	init_data.constraints.valid_ops_mask |= REGULATOR_CHANGE_STATUS;
+	config.dev = dev;
+	config.driver_data = vbus_out;
+	config.init_data = &init_data;
+
+	vbus_out->usb_vbus_reg = devm_regulator_register(dev,
+							 &qcom_usb_vbus_rdesc,
+							 &config);
+	if (IS_ERR(vbus_out->usb_vbus_reg)) {
+		ret = PTR_ERR(vbus_out->usb_vbus_reg);
+		dev_err(dev, "not able to register vbus reg %d\n", ret);
+		return ret;
+	}
+
+	/* Disable HW logic for VBUS enable */
+	regmap_update_bits(vbus_out->regmap, vbus_out->base + OTG_CFG,
+			   OTG_EN_SRC_CFG, 0);
+
+	return 0;
+}
+
+static struct platform_driver qcom_usb_vbus_regulator_driver = {
+	.driver		= {
+		.name	= "qcom-usb-vbus-regulator",
+		.of_match_table = qcom_usb_vbus_regulator_match,
+	},
+	.probe		= qcom_usb_vbus_regulator_probe,
+};
+module_platform_driver(qcom_usb_vbus_regulator_driver);
+
+MODULE_DESCRIPTION("Qualcomm USB vbus regulator driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-usb-vbus-regulator");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

