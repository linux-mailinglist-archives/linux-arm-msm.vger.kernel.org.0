Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDA51314D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgAFPdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:33:36 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36777 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgAFPdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:33:36 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so15703064wma.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0JRPiNtt3u1fwu5304YsC27D9nzp3GtGxqufyN7DwQ0=;
        b=2OCluKsl58KRcqFE6zYcG9FIghU5uAMvt9h9Dob1L3VF4wbkucoqlpCvqhOrYhwc1M
         MMsfHmPriEJnFDCl0sWgru29pJDg0Wf3uQTJjIG9QC/QxVbCW4HqqAk2Jq50Ex6CNlkS
         PAUOKb5XuoWtHWJ6lO8wry9LC//n23ufR0HKOi0vr+kcHIWSmL8tI802e/3Vc9jamB1Z
         nqfpyR63uLMV0OzVaUfqMszg7lvUfJq5b36U5m+XmTN+VlWA7H3yKfBKlrDeWj0fCAET
         BYUiZyGkHdJrvkd8bXvEAI11OoIJ3w91vDW1/X7c5X5NGYvcaPGXMHXpxOGDG0BQGsMn
         oxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0JRPiNtt3u1fwu5304YsC27D9nzp3GtGxqufyN7DwQ0=;
        b=UoUrHnlVE58+qbfcYF7+9icY7xivs4zcY6EAYLwXt3YhoyGmZRhixmLZk36M8ZnjmW
         FxoEWwiTiqgtEAd1yojt/h5RTvTbZOZZ/BzVcV8g1kXdn2hxxauMePOoaXXktP/6GYMn
         99BtBWyiZNjGLw9zH+m9KgBXxyPzZhc7Kt8ipSH+cZQWYdjZyzLR5XOuSrC5TDqIouaN
         tJYPI6T7pegQc++W2GJ5VywYPZ4/F/TGHaQ6UDsW7oHJiwoUE+vSVpdcnYwEbItsBfD5
         GjiR8/nWTrSzCJVwW06c7X94kuYo7gnMHtm1UWGppZozhJMiTuA/wW96M8KglSlClyLk
         ib2w==
X-Gm-Message-State: APjAAAWvyxPqSdVN49Vvr1IhATkRBoScSEgFOiVwH3l9kqE4xtKokaIs
        QAz5IHiQe9FOzywVmJ5BWdlrfbfBl1o=
X-Google-Smtp-Source: APXvYqzJQmAgT5lJh3TebYCZ/Hl140NWSL2zkP18c1OOEc/RvoVgYrWKYqtN1nBykrpR4ypJx+zitw==
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr35332858wme.148.1578324812800;
        Mon, 06 Jan 2020 07:33:32 -0800 (PST)
Received: from localhost.localdomain (93-137-254-179.adsl.net.t-com.hr. [93.137.254.179])
        by smtp.googlemail.com with ESMTPSA id m10sm73578046wrx.19.2020.01.06.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:33:32 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 1/3] phy:  add driver for Qualcomm IPQ40xx USB PHY
Date:   Mon,  6 Jan 2020 16:33:23 +0100
Message-Id: <20200106153325.1281420-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a driver to setup the USB phy on Qualcom Dakota SoCs.
The driver sets up HS and SS phys. In case of HS some magic values need to
be written to magic offsets. These were taken from the SDK driver.

Signed-off-by: John Crispin <john@phrozen.org>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 drivers/phy/qualcomm/Kconfig                |   7 +
 drivers/phy/qualcomm/Makefile               |   1 +
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 180 ++++++++++++++++++++
 3 files changed, 188 insertions(+)
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
index 000000000000..eddea2901062
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -0,0 +1,180 @@
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
+/*
+ * Magic registers copied from the SDK driver code
+ */
+#define PHY_CTRL0_ADDR	0x000
+#define PHY_CTRL1_ADDR	0x004
+#define PHY_CTRL2_ADDR	0x008
+#define PHY_CTRL3_ADDR	0x00C
+#define PHY_CTRL4_ADDR	0x010
+#define PHY_MISC_ADDR	0x024
+#define PHY_IPG_ADDR	0x030
+
+#define PHY_CTRL0_VAL	0xA4600015
+#define PHY_CTRL1_VAL	0x09500000
+#define PHY_CTRL2_VAL	0x00058180
+#define PHY_CTRL3_VAL	0x6DB6DCD6
+#define PHY_CTRL4_VAL	0x836DB6DB
+#define PHY_MISC_VAL	0x3803FB0C
+#define PHY_IPG_VAL	0x47323232
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
+	writel(PHY_CTRL0_VAL, phy->base + PHY_CTRL0_ADDR);
+	writel(PHY_CTRL1_VAL, phy->base + PHY_CTRL1_ADDR);
+	writel(PHY_CTRL2_VAL, phy->base + PHY_CTRL2_ADDR);
+	writel(PHY_CTRL3_VAL, phy->base + PHY_CTRL3_ADDR);
+	writel(PHY_CTRL4_VAL, phy->base + PHY_CTRL4_ADDR);
+	writel(PHY_MISC_VAL, phy->base + PHY_MISC_ADDR);
+	writel(PHY_IPG_VAL, phy->base + PHY_IPG_ADDR);
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

