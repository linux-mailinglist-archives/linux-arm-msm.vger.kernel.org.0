Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCB514AA87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 20:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgA0Td3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 14:33:29 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41578 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgA0Td3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 14:33:29 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so12909018wrw.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 11:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ur1xElH2a3KjCXwt5yMSaZ0mU4+2qf1O6RR8Y+YILRA=;
        b=SaOCai35YyJqZx66q8+dYnvNFHbi6P0uazgnvAUFnNMAv0/+HnMLLBCVDXASnIyvvP
         OqlNO1SD/awTxexg7hYdHhEvj/aeIXcR53Bxc3I57U8aCShZ3aFFTrvC1/Rk0v9tphHL
         1pDhC3uqkaQ9A4G/dq0MdlG4BmSg0YfhQVMepPsURWXEm5wg24iG6WYKSmsWunng6Z8m
         ylEavYUGbgbC0vDyEuhSMRVVdMJYqol6my3ib1D0UfSvD+a/ZqFq+b6kOASCjo9iucwN
         qNXaPwF/umty8RW0gSHY+UkD2ZXmAdBd/14cjSzNvpOyLLYC7/f6uZPJ9u4z3XVkeg3t
         00AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ur1xElH2a3KjCXwt5yMSaZ0mU4+2qf1O6RR8Y+YILRA=;
        b=BXxhx4AOfQpPljeFlhF5keyr6zfK6kCSQoaJ1tJIdv0VUabpf93kuFZ9pfNFbSukh2
         faoLOUy51+L58CY9+VSeKt3Wt9zABj9DadpCJxCd+cF0zkXl33bohISuSYWB2uqghBqz
         o6YXzv5T7VQoPkpL30HetHf/JkbgfE9WN2XqrxR+1ov7aFxEa3Rh1Qca2IicTQSRgAsM
         ovvHGN5VrwpSDpkGMZngtMYzzgJfvCFu9Xpfk8PFb5A0ZTDbtd5JP+GdcZdz0Di0LLyE
         pSFVegP9gVYyAmRACggVGrl7bkemkbyBNVCQLpCQaafaWXdPvaHiHzMUkoCl6L+SOP3n
         wNPg==
X-Gm-Message-State: APjAAAVoomA+A2oEAN3LSLLjPaLmyueHJwp6XoGSpTrGAq3dM1pieUuA
        jmDUKewfeqODsmXei+HFlJOwzzEDJQJG0A==
X-Google-Smtp-Source: APXvYqy4945PNmEto2PtoO6wzyGnfls1eEjQUM0L2di3wLY1EFQ5IM88HKNnQ/a7Ra7DYEa7OTvkig==
X-Received: by 2002:adf:ee88:: with SMTP id b8mr25011881wro.249.1580153606551;
        Mon, 27 Jan 2020 11:33:26 -0800 (PST)
Received: from localhost.localdomain ([188.252.202.167])
        by smtp.googlemail.com with ESMTPSA id c15sm21895211wrt.1.2020.01.27.11.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 11:33:25 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 1/3] phy:  add driver for Qualcomm IPQ40xx USB PHY
Date:   Mon, 27 Jan 2020 20:32:29 +0100
Message-Id: <20200127193230.1539233-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Crispin <john@phrozen.org>

Add a driver to setup the USB phy on Qualcom Dakota SoCs.
The driver sets up HS and SS phys. In case of HS some magic values need to
be written to magic offsets. These were taken from the SDK driver.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v1 to v2:
* Remove magic writes as they are not needed

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

