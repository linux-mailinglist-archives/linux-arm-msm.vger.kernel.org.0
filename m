Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9E213947F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 16:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbgAMPNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 10:13:25 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:35792 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgAMPNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 10:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=fB+Mx6t0UocIM4CFh9Sb4QrA7DyQT+QIprk0cjQmTVI=; b=GPSNLJS6qNgR
        xTvDMNfVcaHq1UrjJsn1th2UToCYGqXOyhSKkKPH2ovO5Ac38Fm/HXGjVvFWOcbePD9ueP+1PwYE8
        rrIRDdlIBWEGUei96KgTKKk4DO3Ihp7jW4+BHkwQcsPnNCWZdxs7ocv6s08FRxLs1XFiSBFQpluyE
        Iq2eg=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1ir1P8-0003NV-NY; Mon, 13 Jan 2020 15:13:22 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 6F1E5D01AE4; Mon, 13 Jan 2020 15:13:22 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mantas Pucka <mantas@8devices.com>,
        Mark Brown <broonie@kernel.org>, robh+dt@kernel.org
Subject: Applied "regulator: add IPQ4019 SDHCI VQMMC LDO driver" to the regulator tree
In-Reply-To: <20200112113003.11110-1-robert.marko@sartura.hr>
Message-Id: <applied-20200112113003.11110-1-robert.marko@sartura.hr>
X-Patchwork-Hint: ignore
Date:   Mon, 13 Jan 2020 15:13:22 +0000 (GMT)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: add IPQ4019 SDHCI VQMMC LDO driver

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From ebf652b408200504194be32ad0a3f5bb49d6000a Mon Sep 17 00:00:00 2001
From: Robert Marko <robert.marko@sartura.hr>
Date: Sun, 12 Jan 2020 12:30:01 +0100
Subject: [PATCH] regulator: add IPQ4019 SDHCI VQMMC LDO driver

This introduces the IPQ4019 VQMMC LDO driver needed for
the SD/EMMC driver I/O level operation.
This will enable introducing SD/EMMC support for the built-in controller.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Link: https://lore.kernel.org/r/20200112113003.11110-1-robert.marko@sartura.hr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/Kconfig                   |   7 ++
 drivers/regulator/Makefile                  |   1 +
 drivers/regulator/vqmmc-ipq4019-regulator.c | 111 ++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/regulator/vqmmc-ipq4019-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 9fe2aa9fbbc1..97bfdd47954f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1110,6 +1110,13 @@ config REGULATOR_VEXPRESS
 	  This driver provides support for voltage regulators available
 	  on the ARM Ltd's Versatile Express platform.
 
+config REGULATOR_VQMMC_IPQ4019
+	tristate "IPQ4019 VQMMC SD LDO regulator support"
+	depends on ARCH_QCOM
+	help
+	  This driver provides support for the VQMMC LDO I/0
+	  voltage regulator of the IPQ4019 SD/EMMC controller.
+
 config REGULATOR_WM831X
 	tristate "Wolfson Microelectronics WM831x PMIC regulators"
 	depends on MFD_WM831X
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index b8c9072f8500..07bc977c52b0 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -135,6 +135,7 @@ obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
 obj-$(CONFIG_REGULATOR_UNIPHIER) += uniphier-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
 obj-$(CONFIG_REGULATOR_VEXPRESS) += vexpress-regulator.o
+obj-$(CONFIG_REGULATOR_VQMMC_IPQ4019) += vqmmc-ipq4019-regulator.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-dcdc.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-isink.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-ldo.o
diff --git a/drivers/regulator/vqmmc-ipq4019-regulator.c b/drivers/regulator/vqmmc-ipq4019-regulator.c
new file mode 100644
index 000000000000..dae16094d3a2
--- /dev/null
+++ b/drivers/regulator/vqmmc-ipq4019-regulator.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2019 Mantas Pucka <mantas@8devices.com>
+// Copyright (c) 2019 Robert Marko <robert.marko@sartura.hr>
+//
+// Driver for IPQ4019 SD/MMC controller's I/O LDO voltage regulator
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+static const unsigned int ipq4019_vmmc_voltages[] = {
+	1500000, 1800000, 2500000, 3000000,
+};
+
+static struct regulator_ops ipq4019_regulator_voltage_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+static struct regulator_desc vmmc_regulator = {
+	.name		= "vmmcq",
+	.ops		= &ipq4019_regulator_voltage_ops,
+	.type		= REGULATOR_VOLTAGE,
+	.owner		= THIS_MODULE,
+	.volt_table	= ipq4019_vmmc_voltages,
+	.n_voltages	= ARRAY_SIZE(ipq4019_vmmc_voltages),
+	.vsel_reg	= 0,
+	.vsel_mask	= 0x3,
+};
+
+const struct regmap_config ipq4019_vmmcq_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+};
+
+static int ipq4019_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regulator_init_data *init_data;
+	struct regulator_config cfg = {};
+	struct regulator_dev *rdev;
+	struct resource *res;
+	struct regmap *rmap;
+	void __iomem *base;
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node,
+					       &vmmc_regulator);
+	if (!init_data)
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	rmap = devm_regmap_init_mmio(dev, base, &ipq4019_vmmcq_regmap_config);
+	if (IS_ERR(rmap))
+		return PTR_ERR(rmap);
+
+	cfg.dev = dev;
+	cfg.init_data = init_data;
+	cfg.of_node = dev->of_node;
+	cfg.regmap = rmap;
+
+	rdev = devm_regulator_register(dev, &vmmc_regulator, &cfg);
+	if (IS_ERR(rdev)) {
+		dev_err(dev, "Failed to register regulator: %ld\n",
+			PTR_ERR(rdev));
+		return PTR_ERR(rdev);
+	}
+	platform_set_drvdata(pdev, rdev);
+
+	return 0;
+}
+
+static int ipq4019_regulator_remove(struct platform_device *pdev)
+{
+	struct regulator_dev *rdev = platform_get_drvdata(pdev);
+
+	regulator_unregister(rdev);
+
+	return 0;
+}
+
+static const struct of_device_id regulator_ipq4019_of_match[] = {
+	{ .compatible = "qcom,vqmmc-ipq4019-regulator", },
+	{},
+};
+
+static struct platform_driver ipq4019_regulator_driver = {
+	.probe = ipq4019_regulator_probe,
+	.remove = ipq4019_regulator_remove,
+	.driver = {
+		.name = "vqmmc-ipq4019-regulator",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(regulator_ipq4019_of_match),
+	},
+};
+module_platform_driver(ipq4019_regulator_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mantas Pucka <mantas@8devices.com>");
+MODULE_DESCRIPTION("IPQ4019 VQMMC voltage regulator");
-- 
2.20.1

