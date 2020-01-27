Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 067F714AB89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 22:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgA0VWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 16:22:53 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35446 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgA0VWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 16:22:53 -0500
Received: by mail-wm1-f66.google.com with SMTP id b2so143120wma.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 13:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EhwCmtaQ5z38Dh4LdrIcWd+8GWIRdht98z03oyUG448=;
        b=sB5h7Yg0LGkjWOuzFeE9UadeN0i28fRgEyEjqjQXBpduzqX6FEjBYcVLdTjDsrMlpm
         dLDZNvQoh6PUfmW9jDtFeqC66guLyrQniKRkSn8Uiab3DHETfoo5HubICmJE3Abb2I7g
         y6eHJW9LrgffvAda1voafFlQ6r0+3RcmIOmy4T/YUnywnEXMYXPh3OROhESH6xFh69Ba
         oSPLNxHcnD3x8g1AcUEV70WHW02ERA0qeMjN6a6PO2yd0eAC3l75HUSlzblpidnFmb4V
         /blCU/fo5Ec4ZURi/nHoqmvP9pXX27uFCdoiyrA6KBSAfqywORQWpalIsQif1jbQrbRi
         X8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EhwCmtaQ5z38Dh4LdrIcWd+8GWIRdht98z03oyUG448=;
        b=Wp0nwB0xI65hq/YrZ24zgFUUtatbU4MPeVUPxtsYhB19sFS1GdaA1KrQuucRnxp/f4
         HY9tBjtQgDIuBnge85VgtV1s3719kBf5PxG2+DsJI3mb8ukeba0Rgf0JwqoTx6csc0Hw
         wD2tOnv/WjNyVikRwoUmPV584NIheXLwK0BiYhnU5jC8q1hMWA1PkL80Xj7WUgjni2vb
         H9rcI/ReMzdsPqr2ultLCeO0v/otzqobOOGADtYxTSOVmFwFP8z/+k8qQo13z4sLpNXI
         tjImrUk1JEv4rhL++5vvjj4COlmnTiAZMp+P6E2Ul4NS6rk9ke/7AtNU6Q3A83JsRgBq
         zI5A==
X-Gm-Message-State: APjAAAVyuwT3+Eqhv1OS0bM15MB4lmCg31OaxWRlzv+oUD82prjwKEsN
        6ZI3NfYbHwcQp5pWXBiID7gWew==
X-Google-Smtp-Source: APXvYqx5VTrxUWqNnJHDUbZRaBhuz7drrwpq/K7IYc5ZyyTjX+WyHZIYm0GwiDmVLjRJSPTCdtj54w==
X-Received: by 2002:a05:600c:218a:: with SMTP id e10mr647065wme.6.1580160170086;
        Mon, 27 Jan 2020 13:22:50 -0800 (PST)
Received: from localhost.localdomain ([188.252.202.167])
        by smtp.googlemail.com with ESMTPSA id n14sm110646wmi.26.2020.01.27.13.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 13:22:49 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 1/3] phy:  add driver for Qualcomm IPQ40xx USB PHY
Date:   Mon, 27 Jan 2020 22:22:07 +0100
Message-Id: <20200127212208.1544052-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Crispin <john@phrozen.org>

Add a driver to setup the USB phy on Qualcom Dakota SoCs.
The driver sets up HS and SS phys.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v2 to v3:
* Remove magic writes as they are not needed
* Correct commit message

 drivers/phy/qualcomm/Kconfig                |   7 +
 drivers/phy/qualcomm/Makefile               |   1 +
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 152 ++++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index e46824da29f6..964bd5d784d2 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -18,6 +18,13 @@ config PHY_QCOM_APQ8064_SATA
 	depends on OF
 	select GENERIC_PHY
 
+config PHY_QCOM_IPQ4019_USB
+	tristate "Qualcomm IPQ4019 USB PHY module"
+	depends on OF && ARCH_QCOM
+	select GENERIC_PHY
+	help
+	  Support for the USB PHY on QCOM IPQ4019/Dakota chipsets.
+
 config PHY_QCOM_IPQ806X_SATA
 	tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
 	depends on ARCH_QCOM
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 283251d6a5d9..8afe6c4f5178 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PHY_ATH79_USB)		+= phy-ath79-usb.o
 obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
+obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
new file mode 100644
index 000000000000..7efebae6b6fd
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2018 John Crispin <john@phrozen.org>
+ *
+ * Based on code from
+ * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+struct ipq4019_usb_phy {
+	struct device		*dev;
+	struct phy		*phy;
+	void __iomem		*base;
+	struct reset_control	*por_rst;
+	struct reset_control	*srif_rst;
+};
+
+static int ipq4019_ss_phy_power_off(struct phy *_phy)
+{
+	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
+
+	reset_control_assert(phy->por_rst);
+	msleep(10);
+
+	return 0;
+}
+
+static int ipq4019_ss_phy_power_on(struct phy *_phy)
+{
+	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
+
+	ipq4019_ss_phy_power_off(_phy);
+
+	reset_control_deassert(phy->por_rst);
+
+	return 0;
+}
+
+static struct phy_ops ipq4019_usb_ss_phy_ops = {
+	.power_on	= ipq4019_ss_phy_power_on,
+	.power_off	= ipq4019_ss_phy_power_off,
+};
+
+static int ipq4019_hs_phy_power_off(struct phy *_phy)
+{
+	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
+
+	reset_control_assert(phy->por_rst);
+	msleep(10);
+
+	reset_control_assert(phy->srif_rst);
+	msleep(10);
+
+	return 0;
+}
+
+static int ipq4019_hs_phy_power_on(struct phy *_phy)
+{
+	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
+
+	ipq4019_hs_phy_power_off(_phy);
+
+	reset_control_deassert(phy->srif_rst);
+	msleep(10);
+
+	reset_control_deassert(phy->por_rst);
+
+	return 0;
+}
+
+static struct phy_ops ipq4019_usb_hs_phy_ops = {
+	.power_on	= ipq4019_hs_phy_power_on,
+	.power_off	= ipq4019_hs_phy_power_off,
+};
+
+static const struct of_device_id ipq4019_usb_phy_of_match[] = {
+	{ .compatible = "qcom,usb-hs-ipq4019-phy", .data = &ipq4019_usb_hs_phy_ops},
+	{ .compatible = "qcom,usb-ss-ipq4019-phy", .data = &ipq4019_usb_ss_phy_ops},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ipq4019_usb_phy_of_match);
+
+static int ipq4019_usb_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct phy_provider *phy_provider;
+	struct ipq4019_usb_phy *phy;
+	const struct of_device_id *match;
+
+	match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
+	if (!match)
+		return -ENODEV;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->dev = &pdev->dev;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	phy->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(phy->base)) {
+		dev_err(dev, "failed to remap register memory\n");
+		return PTR_ERR(phy->base);
+	}
+
+	phy->por_rst = devm_reset_control_get(phy->dev, "por_rst");
+	if (IS_ERR(phy->por_rst)) {
+		if (PTR_ERR(phy->por_rst) != -EPROBE_DEFER)
+			dev_err(dev, "POR reset is missing\n");
+		return PTR_ERR(phy->por_rst);
+	}
+
+	phy->srif_rst = devm_reset_control_get_optional(phy->dev, "srif_rst");
+	if (IS_ERR(phy->srif_rst))
+		return PTR_ERR(phy->srif_rst);
+
+	phy->phy = devm_phy_create(dev, NULL, match->data);
+	if (IS_ERR(phy->phy)) {
+		dev_err(dev, "failed to create PHY\n");
+		return PTR_ERR(phy->phy);
+	}
+	phy_set_drvdata(phy->phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver ipq4019_usb_phy_driver = {
+	.probe	= ipq4019_usb_phy_probe,
+	.driver = {
+		.of_match_table	= ipq4019_usb_phy_of_match,
+		.name  = "ipq4019-usb-phy",
+	}
+};
+module_platform_driver(ipq4019_usb_phy_driver);
+
+MODULE_DESCRIPTION("QCOM/IPQ4019 USB phy driver");
+MODULE_AUTHOR("John Crispin <john@phrozen.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.24.1

