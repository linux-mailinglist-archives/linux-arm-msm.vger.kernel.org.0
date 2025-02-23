Return-Path: <linux-arm-msm+bounces-49062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70421A40EEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384A63AE2AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B6620C492;
	Sun, 23 Feb 2025 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAPZ94Vx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449B020C01A;
	Sun, 23 Feb 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313365; cv=none; b=T6D8RV56C8VeUOYwBEJlZ7gFX/LeeVUWvaDeWT0Jf7Ss35xmS85hQJfhYL6bA5qHMNuA8RZWHpCZ1X3H3ZT5VCpLWOG37Cl50jGUKS6gwTHQLIjJBjmiueXkBqFdmI8T6Ekb1B5a84eSMYqTkabVjaB6QG5MohOietcbx4HUd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313365; c=relaxed/simple;
	bh=aCBVubB+MrIOdvY44VTkDt+RnIcfU+/oZw+otDn16SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMSMtkM5J7Mxhk1T4IKsS3odiw6PJWXP9mf6b7MA28+h/0IOIjJDnodXv2buk6kzna211O+qPUMuqcVxXgAk6m1gvzOkcKxAv+hjjpTIXcOt6mGsYVKgyy/xiIYfAeskHsPvR4mn7xyzPZqVsd6Wv4UcMX2fNHwHUTSQGMAEOkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAPZ94Vx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4398e3dfc66so31206875e9.0;
        Sun, 23 Feb 2025 04:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313361; x=1740918161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk17Af825MoY5+ViL1QPuoghulUe2DIpjNeLf3FSRxs=;
        b=KAPZ94Vxykx/ND1l1MthPDwdj2awli1Czis43US+BXkRvN9vScGMlYiR1Sj0INc+1B
         04mIaXBGPye9wJul8Fs1jrvCFnqN61rdGjlQFHic4sCqf//Vy4Y1WhyGeBc8Wj7ECBVg
         uWJigdisCatYHP6gWRXb6QFAR4rBrv/yoh7mmhtH8Y592lLUggXYFuLoXsHHpgYBxrjD
         732V/ltHz4Bz8ChrdlalX54R/7AAElF3as+9ey5+4sMXIZiNQsWWCRkN+H437FkOHQyq
         icItGECpmKtwCH2bj3YLJKbtCG9mgJUAXKCrE/yqmLGAZnNCLRb2SRcWD6v2OcPH/cxZ
         GpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313361; x=1740918161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mk17Af825MoY5+ViL1QPuoghulUe2DIpjNeLf3FSRxs=;
        b=dZ9ey2B0ychJ7GAYyvtWOHh/IMWAlFF7jQw5YixqqY8C2rO2HyyDQM0PHsB0H6YcnF
         ery8HU4z2voo5buL3CI6a6sYwkgLCzcfj9BmbzwlAK1/15G/+C202s4dcYD8r16l5GyN
         MIxpNRv2A8VYl01Hori2Qt5ilkL9sPwmAT2GZcOGI+YwYwgnpXwwxCQbj9PcnDpiA3Vb
         r6ur6LvyqjA4l6DFX05XzF6DLVzFtv3KnXkwoc8xcS3OKhVNO4uRD30+pQ2VxnJUy5Ea
         C97Z6nbzQaxfINqNFHknrKdIc+9yAhYEdv90qqIaPFhU48HduXn/6PCjsk6mt1+lTyuy
         JoNg==
X-Forwarded-Encrypted: i=1; AJvYcCVD7rakPe63dyzG5WuhvAJwq1NCM8UKOgkJRToLxhge1P0Wo7zcYCNvsoy7oAjiZIEfqWwIN4QhhJjMcod/qz8xLJU=@vger.kernel.org, AJvYcCVqm1RIamZmPFppybue0ZrJXJoK4R1wiMHv54GAK0d6VF3B+6zcUcsNL1OT6XieTV0qVwppY548mzJydwnS@vger.kernel.org, AJvYcCXqdmhBiP5qLDR42TY4+WDqjQSnuUePYFGvVefGarJvTxfMjoKJa3DFpzphPT/mxew47FYskmfso0dB@vger.kernel.org
X-Gm-Message-State: AOJu0YzsNNfxCe/1SVgzrbFT6vbMrOgGqZTFtqkiYskROshUSMWAQWsx
	fzUiDYDQpZzH0gM4s/9QTnl3tIkPpm+GW6F5ZjMIiUbuh2KdJjtc3C35hA==
X-Gm-Gg: ASbGncvl73C/fmcuzwfnMf0d+PcvYw56T2gMg2Q15gYbWYQ2wMH3KcBnSKdcJ5nTakq
	85xMOv1jOFbsVh2YuKcpKOZ+WrOedPvmAzl2M9dlYJIb3J8s+SsMvN0oORYVZB3OoOK4IyXCFXo
	8aWbqco1WbtNRCNnGjrmoKWp/frV0mHtL/vLx7w7lniHvuPkqPkz3nQqovbwmMmjM+Fu7Qjv51J
	TkzeEGnrMMKAe9sxkjnohhnMgUMYQop/WbzTqbZpd6KTAkPAyUcEB8ikcX+O6GTTqPbBiStzzW5
	g4UVb0DnCbsk44dCi85darFM/1PeGXdcUv4cD5+aJj2SBk/THGdGfdFe3n8SqwrGhK7VDzlet9L
	bxA==
X-Google-Smtp-Source: AGHT+IGWxAXkSNHk+1KebllT+xCEuhjnywiq2a9VK2BhfWGgHCBvEOWfCz0XyKO8Rf1jRfUwEJMmcw==
X-Received: by 2002:a05:6000:1ac7:b0:38d:d299:709f with SMTP id ffacd0b85a97d-38f6f0d1d13mr8003029f8f.48.1740313361328;
        Sun, 23 Feb 2025 04:22:41 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:40 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] phy: samsung: add Exynos2200 usb phy controller
Date: Sun, 23 Feb 2025 14:22:27 +0200
Message-ID: <20250223122227.725233-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos2200 SoC comes with a TI external repeater and 3 USB PHYs:
- snps eUSB2 for UTMI
- snps USBDP combophy for PIPE3 and DP
- samsung USBCON phy

The USBCON phy is an intermediary between the USB controller (DWC3)
and the underlying PHYs. Add a new driver for it, modelled to take
a phandle to the high-speed PHY for now.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/Kconfig                 |  12 +
 drivers/phy/samsung/Makefile                |   1 +
 drivers/phy/samsung/phy-exynos2200-usbcon.c | 250 ++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e2330b089..0f809a382 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -77,6 +77,18 @@ config PHY_S5PV210_USB2
 	  particular SoC is compiled in the driver. In case of S5PV210 two phys
 	  are available - device and host.
 
+config PHY_EXYNOS2200_USBCON
+	tristate "Exynos2200 USBCON PHY driver"
+	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
+	depends on HAS_IOMEM
+	select GENERIC_PHY
+	select MFD_SYSCON
+	default y
+	help
+	  Enable USBCON PHY support for Exynos2200 SoC.
+	  This driver provides PHY interface for the USBCON phy, which acts as
+	  an intermediary between the USB controller and underlying PHYs.
+
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
index fea1f96d0..e2686a3f5 100644
--- a/drivers/phy/samsung/Makefile
+++ b/drivers/phy/samsung/Makefile
@@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
+obj-$(CONFIG_PHY_EXYNOS2200_USBCON)	+= phy-exynos2200-usbcon.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
diff --git a/drivers/phy/samsung/phy-exynos2200-usbcon.c b/drivers/phy/samsung/phy-exynos2200-usbcon.c
new file mode 100644
index 000000000..aad59349e
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynos2200-usbcon.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+
+#define EXYNOS2200_USBCON_LINKCTRL		0x4
+#define LINKCTRL_FORCE_QACT			BIT(8)
+
+#define EXYNOS2200_USBCON_UTMI_CTRL		0x10
+#define UTMI_CTRL_FORCESLEEP			BIT(13)
+#define UTMI_CTRL_FORCESUSPEND			BIT(12)
+#define UTMI_CTRL_FORCE_VBUSVALID		BIT(1)
+#define UTMI_CTRL_FORCE_BVALID			BIT(0)
+
+#define EXYNOS2200_USBCON_LINK_CLKRST		0xc
+#define LINK_CLKRST_SW_RST			BIT(0)
+
+struct exynos2200_usbcon_phy_drvdata {
+	const char * const *clk_names;
+	int num_clks;
+};
+
+struct exynos2200_usbcon_phy {
+	struct phy *phy;
+	void __iomem *base;
+	struct regmap *reg_pmu;
+	struct clk_bulk_data *clks;
+	const struct exynos2200_usbcon_phy_drvdata *drv_data;
+	u32 pmu_offset;
+	struct phy *hs_phy;
+};
+
+static void exynos2200_usbcon_phy_isol(struct exynos2200_usbcon_phy *inst,
+				       bool isolate)
+{
+	unsigned int val;
+
+	if (!inst->reg_pmu)
+		return;
+
+	val = isolate ? 0 : EXYNOS4_PHY_ENABLE;
+
+	regmap_update_bits(inst->reg_pmu, inst->pmu_offset,
+			   EXYNOS4_PHY_ENABLE, val);
+}
+
+static void exynos2200_usbcon_phy_write_mask(void __iomem *base, u32 offset,
+					     u32 mask, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg &= ~mask;
+	reg |= val & mask;
+	writel(reg, base + offset);
+
+	/* Ensure above write is completed */
+	readl(base + offset);
+}
+
+static int exynos2200_usbcon_phy_init(struct phy *p)
+{
+	int ret;
+	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
+
+	/* Power-on PHY ... */
+	ret = clk_bulk_prepare_enable(phy->drv_data->num_clks, phy->clks);
+	if (ret)
+		return ret;
+
+	/*
+	 * ... and ungate power via PMU. Without this here, we can't access
+	 * registers
+	 */
+	exynos2200_usbcon_phy_isol(phy, false);
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This will force
+	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
+	 * the PHY clock is not gated by the hardware.
+	 */
+	exynos2200_usbcon_phy_write_mask(phy->base, EXYNOS2200_USBCON_LINKCTRL,
+					 LINKCTRL_FORCE_QACT,
+					 LINKCTRL_FORCE_QACT);
+
+	/* Reset Link */
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST,
+					 LINK_CLKRST_SW_RST);
+
+	fsleep(10); /* required after POR high */
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST, 0);
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_UTMI_CTRL,
+					 UTMI_CTRL_FORCESLEEP |
+					 UTMI_CTRL_FORCESUSPEND,
+					 0);
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_UTMI_CTRL,
+					 UTMI_CTRL_FORCE_BVALID |
+					 UTMI_CTRL_FORCE_VBUSVALID,
+					 UTMI_CTRL_FORCE_BVALID |
+					 UTMI_CTRL_FORCE_VBUSVALID);
+
+	return phy_init(phy->hs_phy);
+}
+
+static int exynos2200_usbcon_phy_exit(struct phy *p)
+{
+	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = phy_exit(phy->hs_phy);
+	if (ret)
+		return ret;
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_UTMI_CTRL,
+					 UTMI_CTRL_FORCESLEEP |
+					 UTMI_CTRL_FORCESUSPEND,
+					 UTMI_CTRL_FORCESLEEP |
+					 UTMI_CTRL_FORCESUSPEND);
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST,
+					 LINK_CLKRST_SW_RST);
+
+	/* Gate power via PMU */
+	exynos2200_usbcon_phy_isol(phy, true);
+
+	clk_bulk_disable_unprepare(phy->drv_data->num_clks, phy->clks);
+
+	return 0;
+}
+
+static const struct phy_ops exynos2200_usbcon_phy_ops = {
+	.init		= exynos2200_usbcon_phy_init,
+	.exit		= exynos2200_usbcon_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int exynos2200_usbcon_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos2200_usbcon_phy *phy;
+	const struct exynos2200_usbcon_phy_drvdata *drv_data;
+	struct phy_provider *phy_provider;
+	struct phy *generic_phy;
+	int ret;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
+	phy->drv_data = drv_data;
+
+	phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(phy->base))
+		return PTR_ERR(phy->base);
+
+	phy->clks = devm_kcalloc(dev, drv_data->num_clks,
+				 sizeof(*phy->clks), GFP_KERNEL);
+	if (!phy->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < drv_data->num_clks; ++i)
+		phy->clks[i].id = drv_data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, phy->drv_data->num_clks,
+				phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	phy->reg_pmu = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							    "samsung,pmu-syscon",
+							    1, &phy->pmu_offset);
+	if (IS_ERR(phy->reg_pmu)) {
+		dev_err(dev, "Failed to lookup PMU regmap\n");
+		return PTR_ERR(phy->reg_pmu);
+	}
+
+	phy->hs_phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	if (IS_ERR(phy->hs_phy))
+		return dev_err_probe(dev, PTR_ERR(phy->hs_phy),
+				     "failed to get hs_phy\n");
+
+	generic_phy = devm_phy_create(dev, NULL, &exynos2200_usbcon_phy_ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create phy %d\n", ret);
+
+	dev_set_drvdata(dev, phy);
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register phy provider\n");
+
+	return 0;
+}
+
+static const char * const exynos2200_clk_names[] = {
+	"bus",
+};
+
+static const struct exynos2200_usbcon_phy_drvdata exynos2200_usbcon_phy = {
+	.clk_names		= exynos2200_clk_names,
+	.num_clks		= ARRAY_SIZE(exynos2200_clk_names),
+};
+
+static const struct of_device_id exynos2200_usbcon_phy_of_match_table[] = {
+	{
+		.compatible = "samsung,exynos2200-usbcon-phy",
+		.data = &exynos2200_usbcon_phy,
+	}, { },
+};
+MODULE_DEVICE_TABLE(of, exynos2200_usbcon_phy_of_match_table);
+
+static struct platform_driver exynos2200_usbcon_phy_driver = {
+	.probe		= exynos2200_usbcon_phy_probe,
+	.driver = {
+		.name	= "exynos2200-usbcon-phy",
+		.of_match_table = exynos2200_usbcon_phy_of_match_table,
+	},
+};
+
+module_platform_driver(exynos2200_usbcon_phy_driver);
+MODULE_DESCRIPTION("Exynos2200 USBCON PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


