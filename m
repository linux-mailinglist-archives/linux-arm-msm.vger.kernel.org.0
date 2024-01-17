Return-Path: <linux-arm-msm+bounces-7480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912F830AA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 17:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2848AB25E01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 16:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21BD24B5C;
	Wed, 17 Jan 2024 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CKTeIh6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1E25553
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507724; cv=none; b=CytO6uiZyMZgyn3BIGPBj6hu7ekKx6MkVxVFjBN+oL+11Z3OuS84gOn+N/4QnnfecI89AYOf2slDxIwdGoXG7B2VYh5FQhWtazNBKdQaw3481Q1CdSzFMoYAgx0eiDMI2d5G4rdiCrVVneMFin7tdE/AcIbh3VL5A35QJiA6y0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507724; c=relaxed/simple;
	bh=WFyrJs1id+9YZIOtZ6FpABayALnwskaiuM+TVLg1sSM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=sE1aBW8UF/jRtelkUiW5DdB1uQ6MK8mmmJrXLhgUYpVx2b0z+Vad4f/muCQtcnJca5bOY2gZoFKGpeXsAHMXAoJD5B2dWmkAbvOCehExU1Akp/AcuEi6LJjpY5MxoVzW2436f7Ck5g+f56xFZTfc7/0k/Y8Ku81ABVIHBmR4yzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CKTeIh6F; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336c5b5c163so6704606f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 08:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705507721; x=1706112521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csdPOquKgbyta51Uec8uuMPVMGRbxtZFd+25sTlPk8k=;
        b=CKTeIh6FgfS8dDceOOxEBjqu3PRAv17lJIOP54BEuwvcxXccpqnOLWxOdzt+YDtDG8
         wWuTkW1p5J/6jBLzu3E2d1gvi2+C1RwvW/DPuCOW/9gUGW1Wyvz3gJ8N+o3x1yV5OCjf
         jRUcdN4kfjKmjFz+l+B80tyaLZ4A4rVOy2o35bDf0udWi1E5GAa6ePzCNwI0IIDxdlyJ
         4V2Wf0+mH5BWdGsyDnHKFalAGUWCh0Xr9km5ZzV64RP6uwr4kmpB0ORuSRmrW+MEYzLn
         feTz4qru4FCDL5M9Em21tWR+fPqH6J7pmHvwQiHbz2GHR4rD6qEWg4+lBlhPhoZ+ILEl
         PpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507721; x=1706112521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csdPOquKgbyta51Uec8uuMPVMGRbxtZFd+25sTlPk8k=;
        b=Vl/j7+S85dMu686Ct5w0DXoXVVr9574tihCyhd6FodrrVkiFZEzcxj3hbC6PLb2aRt
         oCLGRx6LnA1kGLdXWLX9SABG3IekuQuCKIBOQq/oeydSWiZ4BTNINOO2qm/8EFLymuMn
         RZtAt2LM+HuU+hOU/XloinsjM8zWJCcEMjOgeCnA7R/kN6vz0u/ybJi5f5wxAFgEu9Wm
         5ozCEZ0yroeoqW2s/oszEXWVAeOSsJlC7vujW0h5wQ7hE9fe7pstJgZ0D29lc/Fr1lzj
         FBBy9wJ2NnS+g0vCc4ol0aXjeFQWsJZWI9deiIM/49VW2x8hhCkvGyhEMT1NyD2/HNWW
         s0+Q==
X-Gm-Message-State: AOJu0YzaacQA55j42W5EV3i02POkYv7iQopypw7dGHkhVUgX41qux2cq
	gebVCmIiPiKzTNpTn7DA9o9Kylf/6jY+P8MLGFkxYfurWCpdG88C37IhRZa0zLM=
X-Google-Smtp-Source: AGHT+IE8hEEtpTYbJU01ZoUcCZSKPg5Q30PyVE7OMBk7WjjvUlXJokzoqSuozUEKiQC6pE+bjmyMZA==
X-Received: by 2002:adf:ab09:0:b0:337:7b7a:6540 with SMTP id q9-20020adfab09000000b003377b7a6540mr591631wrc.5.1705507721046;
        Wed, 17 Jan 2024 08:08:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d0b5:43ec:48:baad])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d6a4a000000b00337b0374a3dsm1972092wrw.57.2024.01.17.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:08:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peng Fan <peng.fan@nxp.com>,
	Robert Richter <rrichter@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Lukas Wunner <lukas@wunner.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 9/9] PCI/pwrseq: add a pwrseq driver for QCA6390
Date: Wed, 17 Jan 2024 17:07:48 +0100
Message-Id: <20240117160748.37682-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117160748.37682-1-brgl@bgdev.pl>
References: <20240117160748.37682-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a PCI power sequencing driver that's capable of correctly powering
up the ath11k module on QCA6390 and WCN7850 using the PCI pwrseq
functionality.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[Neil: add support for WCN7850]
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrseq/Kconfig              |   8 +
 drivers/pci/pwrseq/Makefile             |   1 +
 drivers/pci/pwrseq/pci-pwrseq-qca6390.c | 267 ++++++++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/pci/pwrseq/pci-pwrseq-qca6390.c

diff --git a/drivers/pci/pwrseq/Kconfig b/drivers/pci/pwrseq/Kconfig
index a721a8a955c3..667c9c121f34 100644
--- a/drivers/pci/pwrseq/Kconfig
+++ b/drivers/pci/pwrseq/Kconfig
@@ -5,4 +5,12 @@ menu "PCI Power sequencing drivers"
 config PCI_PWRSEQ
 	bool
 
+config PCI_PWRSEQ_QCA6390
+	tristate "PCI Power Sequencing driver for QCA6390"
+	select PCI_PWRSEQ
+	default (ATH11K_PCI && ARCH_QCOM)
+	help
+	  Enable support for the PCI power sequencing driver for the
+	  ath11k module of the QCA6390 WLAN/BT chip.
+
 endmenu
diff --git a/drivers/pci/pwrseq/Makefile b/drivers/pci/pwrseq/Makefile
index 4052b6bb5aa5..5cf8cce01e82 100644
--- a/drivers/pci/pwrseq/Makefile
+++ b/drivers/pci/pwrseq/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_PCI_PWRSEQ)		+= pwrseq.o
+obj-$(CONFIG_PCI_PWRSEQ_QCA6390)	+= pci-pwrseq-qca6390.o
diff --git a/drivers/pci/pwrseq/pci-pwrseq-qca6390.c b/drivers/pci/pwrseq/pci-pwrseq-qca6390.c
new file mode 100644
index 000000000000..cdf3639ea29f
--- /dev/null
+++ b/drivers/pci/pwrseq/pci-pwrseq-qca6390.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pci-pwrseq.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+struct pci_pwrseq_qca6390_vreg {
+	const char *name;
+	unsigned int load_uA;
+};
+
+struct pci_pwrseq_qca6390_pdata {
+	struct pci_pwrseq_qca6390_vreg *vregs;
+	size_t num_vregs;
+	unsigned int delay_msec;
+};
+
+struct pci_pwrseq_qca6390_ctx {
+	struct pci_pwrseq pwrseq;
+	const struct pci_pwrseq_qca6390_pdata *pdata;
+	struct regulator_bulk_data *regs;
+	struct gpio_descs *en_gpios;
+	unsigned long *en_gpios_values;
+	struct clk *clk;
+};
+
+static struct pci_pwrseq_qca6390_vreg pci_pwrseq_qca6390_vregs[] = {
+	{
+		.name = "vddio",
+		.load_uA = 20000,
+	},
+	{
+		.name = "vddaon",
+		.load_uA = 100000,
+	},
+	{
+		.name = "vddpmu",
+		.load_uA = 1250000,
+	},
+	{
+		.name = "vddpcie1",
+		.load_uA = 35000,
+	},
+	{
+		.name = "vddpcie2",
+		.load_uA = 15000,
+	},
+	{
+		.name = "vddrfa1",
+		.load_uA = 200000,
+	},
+	{
+		.name = "vddrfa2",
+		.load_uA = 400000,
+	},
+	{
+		.name = "vddrfa3",
+		.load_uA = 400000,
+	},
+};
+
+static struct pci_pwrseq_qca6390_pdata pci_pwrseq_qca6390_of_data = {
+	.vregs = pci_pwrseq_qca6390_vregs,
+	.num_vregs = ARRAY_SIZE(pci_pwrseq_qca6390_vregs),
+	.delay_msec = 16,
+};
+
+static struct pci_pwrseq_qca6390_vreg pci_pwrseq_wcn7850_vregs[] = {
+	{
+		.name = "vdd",
+	},
+	{
+		.name = "vddio",
+	},
+	{
+		.name = "vddio12",
+	},
+	{
+		.name = "vddaon",
+	},
+	{
+		.name = "vdddig",
+	},
+	{
+		.name = "vddrfa1",
+	},
+	{
+		.name = "vddrfa2",
+	},
+};
+
+static struct pci_pwrseq_qca6390_pdata pci_pwrseq_wcn7850_of_data = {
+	.vregs = pci_pwrseq_wcn7850_vregs,
+	.num_vregs = ARRAY_SIZE(pci_pwrseq_wcn7850_vregs),
+	.delay_msec = 50,
+};
+
+static int pci_pwrseq_qca6390_power_on(struct pci_pwrseq_qca6390_ctx *ctx)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ctx->pdata->num_vregs, ctx->regs);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(ctx->clk);
+	if (ret)
+		return ret;
+
+	bitmap_fill(ctx->en_gpios_values, ctx->en_gpios->ndescs);
+
+	ret = gpiod_set_array_value_cansleep(ctx->en_gpios->ndescs,
+					     ctx->en_gpios->desc,
+					     ctx->en_gpios->info,
+					     ctx->en_gpios_values);
+	if (ret) {
+		regulator_bulk_disable(ctx->pdata->num_vregs, ctx->regs);
+		return ret;
+	}
+
+	if (ctx->pdata->delay_msec)
+		msleep(ctx->pdata->delay_msec);
+
+	return 0;
+}
+
+static int pci_pwrseq_qca6390_power_off(struct pci_pwrseq_qca6390_ctx *ctx)
+{
+	int ret;
+
+	bitmap_zero(ctx->en_gpios_values, ctx->en_gpios->ndescs);
+
+	ret = gpiod_set_array_value_cansleep(ctx->en_gpios->ndescs,
+					     ctx->en_gpios->desc,
+					     ctx->en_gpios->info,
+					     ctx->en_gpios_values);
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(ctx->clk);
+
+	return regulator_bulk_disable(ctx->pdata->num_vregs, ctx->regs);
+}
+
+static void devm_pci_pwrseq_qca6390_power_off(void *data)
+{
+	struct pci_pwrseq_qca6390_ctx *ctx = data;
+
+	pci_pwrseq_qca6390_power_off(ctx);
+}
+
+static int pci_pwrseq_qca6390_probe(struct platform_device *pdev)
+{
+	struct pci_pwrseq_qca6390_ctx *ctx;
+	struct device *dev = &pdev->dev;
+	int ret, i;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->pdata = of_device_get_match_data(dev);
+	if (!ctx->pdata)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to obtain platform data\n");
+
+	if (ctx->pdata->vregs) {
+		ctx->regs = devm_kcalloc(dev, ctx->pdata->num_vregs,
+					 sizeof(*ctx->regs), GFP_KERNEL);
+		if (!ctx->regs)
+			return -ENOMEM;
+
+		for (i = 0; i < ctx->pdata->num_vregs; i++)
+			ctx->regs[i].supply = ctx->pdata->vregs[i].name;
+
+		ret = devm_regulator_bulk_get(dev, ctx->pdata->num_vregs,
+					      ctx->regs);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to get all regulators\n");
+
+		for (i = 0; i < ctx->pdata->num_vregs; i++) {
+			if (!ctx->pdata->vregs[1].load_uA)
+				continue;
+
+			ret = regulator_set_load(ctx->regs[i].consumer,
+						 ctx->pdata->vregs[i].load_uA);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to set vreg load\n");
+		}
+	}
+
+	ctx->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ctx->clk))
+		return dev_err_probe(dev, PTR_ERR(ctx->clk),
+				     "Failed to get clock\n");
+
+	ctx->en_gpios = devm_gpiod_get_array_optional(dev, "enable",
+						      GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->en_gpios))
+		return dev_err_probe(dev, PTR_ERR(ctx->en_gpios),
+				     "Failed to get enable GPIOs\n");
+
+	ctx->en_gpios_values = devm_bitmap_zalloc(dev, ctx->en_gpios->ndescs,
+						  GFP_KERNEL);
+	if (!ctx->en_gpios_values)
+		return -ENOMEM;
+
+	ret = pci_pwrseq_qca6390_power_on(ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to power on the device\n");
+
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrseq_qca6390_power_off,
+				       ctx);
+	if (ret)
+		return ret;
+
+	ctx->pwrseq.dev = dev;
+
+	ret = devm_pci_pwrseq_device_enable(dev, &ctx->pwrseq);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register the pwrseq wrapper\n");
+
+	return 0;
+}
+
+static const struct of_device_id pci_pwrseq_qca6390_of_match[] = {
+	{
+		.compatible = "pci17cb,1101",
+		.data = &pci_pwrseq_qca6390_of_data,
+	},
+	{
+		.compatible = "pci17cb,1107",
+		.data = &pci_pwrseq_wcn7850_of_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pci_pwrseq_qca6390_of_match);
+
+static struct platform_driver pci_pwrseq_qca6390_driver = {
+	.driver = {
+		.name = "pci-pwrseq-qca6390",
+		.of_match_table = pci_pwrseq_qca6390_of_match,
+	},
+	.probe = pci_pwrseq_qca6390_probe,
+};
+module_platform_driver(pci_pwrseq_qca6390_driver);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("PCI Power Sequencing module for QCA6390");
+MODULE_LICENSE("GPL");
-- 
2.40.1


