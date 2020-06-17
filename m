Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7621FD40E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 20:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgFQSDa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 14:03:30 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:54980 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727047AbgFQSCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 14:02:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592416963; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4VhfVakAj/P5YPhjNjDDhHWoeXOmcz4X4evHz/y01XE=; b=N9VN5vEYot6r+C6H/KSx30qPG0ilkHfE5/E2ku5PT+43bZE2QJKjCvbrNXet2KWixFwJzCMh
 wGlMbnYIkMujlSFr47xEDlU9NqXrOiD0KovTdvR+jKsIMYzpec6BfwQ92t4Q44K9KbBz1l9i
 IsGTTxqYDgKjOJze+wFrT6kHmlk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5eea5ab0bfb34e631c7b1679 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Jun 2020 18:02:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81FB1C433AD; Wed, 17 Jun 2020 18:02:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CE461C433A1;
        Wed, 17 Jun 2020 18:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CE461C433A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     heikki.krogerus@linux.intel.com, mark.rutland@arm.com,
        broonie@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com, agross@kernel.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, rdunlap@infradead.org,
        bryan.odonoghue@linaro.org, lijun.kernel@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v3 4/6] regulator: Add support for QCOM PMIC VBUS booster
Date:   Wed, 17 Jun 2020 11:02:07 -0700
Message-Id: <20200617180209.5636-5-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617180209.5636-1-wcheng@codeaurora.org>
References: <20200617180209.5636-1-wcheng@codeaurora.org>
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
 drivers/regulator/qcom_usb_vbus-regulator.c | 100 ++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/regulator/qcom_usb_vbus-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 074a2ef55943..79d6b7596f0b 100644
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
+	  as a module. The module will be named "qcom_usb_vbus-regulator".
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
index 000000000000..fa7a3d891808
--- /dev/null
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Qualcomm PMIC VBUS output regulator driver
+//
+// Copyright (c) 2020, The Linux Foundation. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/regmap.h>
+
+#define CMD_OTG				0x40
+#define OTG_EN				BIT(0)
+#define OTG_CFG				0x53
+#define OTG_EN_SRC_CFG			BIT(1)
+
+static const struct regulator_ops qcom_usb_vbus_reg_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static struct regulator_desc qcom_usb_vbus_rdesc = {
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
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+	struct regmap	*regmap;
+	struct regulator_config config = { };
+	struct regulator_init_data *init_data;
+	int ret;
+	u32 base;
+
+	ret = of_property_read_u32(dev->of_node, "reg", &base);
+	if (ret < 0) {
+		dev_err(dev, "no base address found\n");
+		return ret;
+	}
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (regmap) {
+		dev_err(dev, "Failed to get regmap\n");
+		return -ENOENT;
+	}
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node,
+					       &qcom_usb_vbus_rdesc);
+	if (!init_data)
+		return -ENOMEM;
+
+	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
+	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
+	config.dev = dev;
+	config.init_data = init_data;
+	config.regmap = regmap;
+
+	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
+	if (IS_ERR(rdev)) {
+		ret = PTR_ERR(rdev);
+		dev_err(dev, "not able to register vbus reg %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, rdev);
+
+	/* Disable HW logic for VBUS enable */
+	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
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

