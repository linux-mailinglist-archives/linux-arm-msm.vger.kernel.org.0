Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC54196673
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 14:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgC1N4o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 09:56:44 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36669 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgC1N4o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 09:56:44 -0400
Received: by mail-wm1-f67.google.com with SMTP id g62so15833730wme.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2020 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMjjibIIWKkjS3mT8K/LaAOt0umug6ECpFrUMrbf80Q=;
        b=Zj9977bHjaB09yAPwDZyZzHGCvoSs+HuKu40DVFrBL6m5HHOFap7vzBixOfnMnvwij
         dfHrqHrvmsvbPpci7d62jcfiL70Daz+0xw4quqpeO7lTqEu/9bMoHgSXpNvUuXuHMbI7
         A15BLvvngWVwADRaarQJIckd8YldLeV49pllURCFP6ozg588tcIRtSwLf6CpBEC79kPc
         UshHAAiGC4kVXvuqZO3GSW2HCXkYBDwZ2091G5eotPZ4e2KqLadqLA0wv27G5sFTMahP
         /DRK/1R+X+jiUjHJv3vrlRvknlXjSrBV+ynPLd1GuCHBGkes9QPTR4iyKGf4WMvNNw+r
         uz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMjjibIIWKkjS3mT8K/LaAOt0umug6ECpFrUMrbf80Q=;
        b=V3IOD0Iuc5pW1qP2NnSj5gdRJq6IA3wMC9lioaorED1MXydxJHuxZ0L9Nw3J5fOF9Q
         Z531UygCSBJXY7XcqBnpx4GLccGBBfbEfAK5mcdrSbdNFzI1NfEPl1U/CFXWrwZPQfTG
         bLM3pvil/3pmkoZcAulQNtxcUyb06ilmwutyJmKWa5/MoBp+N+E8+OIvSn2dEXWV2qTG
         NknqSBChZ37CPFKyTGpN23s9O+Or58L+F92zaPZXQ3i7ruDW3yiUgkYXpp8bhqbSRarW
         H0Yh2AJW58rvS4DSThLBZoqSe7LFPkH2Br2d2UXNo+qFZtqIKlcUq49hHfKQLd3mG5pg
         QiiQ==
X-Gm-Message-State: ANhLgQ02FjDVknOYPXqHbqMnbobrTzevdjGVXErjboUxaWwfVBx+/Q+R
        7me3cGlIxKc1AFMXbt4Ucd6aIw==
X-Google-Smtp-Source: ADFU+vucBnK4QBDQ0SlXaKME/T+OFBV0XfuTMEMJbY9YzNL1c1gitEsNS70qbDqQJ69i2Q64Mg41Jg==
X-Received: by 2002:a05:600c:257:: with SMTP id 23mr4104677wmj.155.1585403802961;
        Sat, 28 Mar 2020 06:56:42 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-177.xnet.hr. [88.207.96.177])
        by smtp.googlemail.com with ESMTPSA id f12sm8461975wrm.94.2020.03.28.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 06:56:42 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v4 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
Date:   Sat, 28 Mar 2020 14:53:47 +0100
Message-Id: <20200328135345.695622-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
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
2.26.0

