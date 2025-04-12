Return-Path: <linux-arm-msm+bounces-54119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4DA86F9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D5B3AE112
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20BF233D86;
	Sat, 12 Apr 2025 20:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSLeIvqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14BD233727;
	Sat, 12 Apr 2025 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489633; cv=none; b=uwJT0L9mPnznULtdaiuzZPZpCfelC72AAESKOeCt/+GHLf/qyyS+qttaSoZ/Jl4qcBcghmQbTp3l0xGg6/1EOo6ZSS7KlvKBuQ3jtgM7t+i89q7PBI6MUlThMt8wSFDlkVUw+oKzor1NfbapwjA5Rb1+42th3VAP+fZ0DKHUcA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489633; c=relaxed/simple;
	bh=0HfmoJ1eKCUXeAcBueVOMB1m2AGBavKU7wCDRnfCPc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzQGzQrUtthQlCBbvFkyCQzyctoKK+VZ/Jas3kTG5nF14qBXiGsujlf0mlVusT8WUSVaBsa+Tdim0I9Dxb3evcwKaNKBb3Mmkcn+RWWJTn0l1AHA6pYAbXK+XdAMOJQOFVJi9KbLo3FLCPVd00xr0Z0zd/edU+YUMGDfwTkkwz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSLeIvqe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso24698275e9.2;
        Sat, 12 Apr 2025 13:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489629; x=1745094429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiAf53C7ZnTbYps0PrN9/DfVbsgINyfTunf3aDFoB+k=;
        b=KSLeIvqeTgw+5RSjOOMHi5F0X3kD3MLg4+gQFB8EZvWWFYaT8wZpxTnlh7Eg3IKX5G
         6gd4XAXEw8Cd18AYcHoW3DuFMLQhEJaePB3MEUgg//gRsDAzW3hLP7PcnsWr2I/ZQWeW
         5BfNXoqpKfh/3dhaEOecTioK0DpGjzhQ+OftQKu6Al9BdUcTxuV0n5qtlA1+c+0CgUJQ
         K+XPFdXoFyYzBxGWtLWoIrcdreex4sgFNuSYfZlDcKFCYVYsYY/ZuhVFT0cKxkk5yRzT
         Osbtv3IeTwu4Oq4hLBhL+6v4m2xbh2whHHp08vEki3rQP4Tvk+Zs+eDpid+sDru+oFak
         f14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489629; x=1745094429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiAf53C7ZnTbYps0PrN9/DfVbsgINyfTunf3aDFoB+k=;
        b=WoHizd/srOhYdr+9Go5KU/FL/pUF0EqGyzpnD5RzPm1C3zfdHurDdGqgqGbg3IdeIR
         +hKy32H9T1taDobNxBvEhAdvz6CUPJHkaA+ZkKcw/69Cpi1B6jahTQRqU8NSnOXCAh8H
         4HB0b9TLqqHi65VX3eJg0rzuLUhy+wxOfo5c/H0+LUx01OgV6wkqQSH2mM+4fptuL/HL
         nsKb3cLceUqi37/1WXC0buUHHBpgdO+Duz/j+tHsYvyMYboYWzzEdP0scEPuEifVWV8e
         PEIIeUhY9cRkMAMfKxPG7/PYZ5x/Dnw55GjqL7ycGq9Z6wB4lIVc89QKBrmoEtR/NCTa
         dB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/fXXU06oewirii3wTYMqnOuReSO0gtAdS/5AXvyLYI2WxXPZLFwepRscFD7+C1J9Exo0oveKV/4p5qW49FQ==@vger.kernel.org, AJvYcCWf6za9TlNmrkMMJ3UbcggN0QK+8ILHzURm8qTnUwwcPe0N6UNrXO44+QjaY7Uuuwladc58sKMZ3+rJ@vger.kernel.org, AJvYcCXYM3ZPWDmy+yUL/1V3sVK1RlvwjFMxkND1mEMS8+EEk3schTPsfcP2CvkyvheoQw2Mkuh/j4baBjLMKsSM@vger.kernel.org
X-Gm-Message-State: AOJu0YwgcS1qN/wrGkEvJXKgArkYmFAaG11aLPwgktBkNlBiEi5CM8/F
	boOBiSJGbD23c12wESdaU8dvBSLbnOTKh4X9WQm7JaQnXvKdnLITDipqmg==
X-Gm-Gg: ASbGncs3edsoU5frNCmpn1AWYo2xJxsGjppsPk3XCblkU3ODH7M5p3NSTN5koyrTWi2
	sh1RGhYSwFr+XG5mbT9eAgyWxOnNc400rHuZNfZ7mEu2oF6go1PcF1fPHZHNcL0hAYddW5uUH7a
	W4DikMZP04e3KU2ZmnlyqSHj+H7tCjJwRiW2QsesdeQ7Rm9H3JfkKW9fAYgoOS18844jQEt3DMz
	OcUmX/d/v029tQ6CnUt/4b3BuCUDlVWceD38j+fxVwMXHZHTLAoC7oIc4B5sOTJXLjJeiz/b99L
	AkCMvbrQl39p2P1P5qzdKoz9GkujL3SIY9+2EcUm1od/3aNKHD4jUEa+irrrkaXbiPWBlrhie2l
	d/F0h0VOYGSk13HuBfZHUOu5Qs4Y=
X-Google-Smtp-Source: AGHT+IG0+EQ5ZHlXT+K0utbNPBKa36hf+YEVRE97ohaH5aCTaJIRJCESsDT0lPqorgHmB8JT1EHFPw==
X-Received: by 2002:a05:600c:83c4:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-43f3a925ademr59846615e9.1.1744489628646;
        Sat, 12 Apr 2025 13:27:08 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 09/10] phy: phy-snps-eusb2: add support for exynos2200
Date: Sat, 12 Apr 2025 23:26:19 +0300
Message-ID: <20250412202620.738150-10-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos2200 SoC reuses the Synopsis eUSB2 PHY IP, alongside an
external repeater, for USB 2.0. Add support for it to the existing
driver, while keeping in mind that it requires enabled more than the
reference clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/Kconfig          |   2 +-
 drivers/phy/phy-snps-eusb2.c | 162 ++++++++++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 11c166204..58c911e1b 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -45,7 +45,7 @@ config PHY_PISTACHIO_USB
 
 config PHY_SNPS_EUSB2
 	tristate "SNPS eUSB2 PHY Driver"
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on OF && (ARCH_EXYNOS || ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
 	  Enable support for the USB high-speed SNPS eUSB2 phy on select
diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 8caa62c0b..1ce18cbac 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,6 +13,39 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
+#define USB_PHY_RST_MASK		GENMASK(1, 0)
+#define UTMI_PORT_RST_MASK		GENMASK(5, 4)
+
+#define EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON	(0x4)
+#define RPTR_MODE			BIT(10)
+#define FSEL_20_MHZ_VAL			(0x1)
+#define FSEL_24_MHZ_VAL			(0x2)
+#define FSEL_26_MHZ_VAL			(0x3)
+#define FSEL_48_MHZ_VAL			(0x2)
+
+#define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
+#define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)
+#define DIV_19_8_19_2_MHZ_VAL		(0x170)
+#define DIV_19_8_20_MHZ_VAL		(0x160)
+#define DIV_19_8_24_MHZ_VAL		(0x120)
+#define DIV_19_8_26_MHZ_VAL		(0x107)
+#define DIV_19_8_48_MHZ_VAL		(0x120)
+
+#define EXYNOS_USB_PHY_CFG_PLLCFG1	(0xc)
+#define EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(11, 8)
+#define EXYNOS_DIV_11_8_19_2_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_20_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_24_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_26_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_48_MHZ_VAL	(0x1)
+
+#define EXYNOS_PHY_CFG_TX		(0x14)
+#define EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(2, 1)
+
+#define EXYNOS_USB_PHY_UTMI_TESTSE	(0x20)
+#define TEST_IDDQ			BIT(6)
+
 #define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM				BIT(0)
 #define OPMODE_MASK			GENMASK(4, 3)
@@ -123,6 +156,8 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 struct snps_eusb2_phy_drvdata {
 	int (*phy_init)(struct phy *p);
+	const char * const *clk_names;
+	int num_clks;
 };
 
 struct snps_eusb2_hsphy {
@@ -130,6 +165,7 @@ struct snps_eusb2_hsphy {
 	void __iomem *base;
 
 	struct clk *ref_clk;
+	struct clk_bulk_data *clks;
 	struct reset_control *phy_reset;
 
 	struct regulator_bulk_data vregs[EUSB2_NUM_VREGS];
@@ -199,6 +235,46 @@ struct snps_eusb2_ref_clk {
 	u32 div_11_8_val;
 };
 
+static const struct snps_eusb2_ref_clk exynos_eusb2_ref_clk[] = {
+	{ 19200000, FSEL_19_2_MHZ_VAL, DIV_19_8_19_2_MHZ_VAL, EXYNOS_DIV_11_8_19_2_MHZ_VAL },
+	{ 20000000, FSEL_20_MHZ_VAL, DIV_19_8_20_MHZ_VAL, EXYNOS_DIV_11_8_20_MHZ_VAL },
+	{ 24000000, FSEL_24_MHZ_VAL, DIV_19_8_24_MHZ_VAL, EXYNOS_DIV_11_8_24_MHZ_VAL },
+	{ 26000000, FSEL_26_MHZ_VAL, DIV_19_8_26_MHZ_VAL, EXYNOS_DIV_11_8_26_MHZ_VAL },
+	{ 48000000, FSEL_48_MHZ_VAL, DIV_19_8_48_MHZ_VAL, EXYNOS_DIV_11_8_48_MHZ_VAL },
+};
+
+static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
+{
+	const struct snps_eusb2_ref_clk *config = NULL;
+	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+
+	for (int i = 0; i < ARRAY_SIZE(exynos_eusb2_ref_clk); i++) {
+		if (exynos_eusb2_ref_clk[i].freq == ref_clk_freq) {
+			config = &exynos_eusb2_ref_clk[i];
+			break;
+		}
+	}
+
+	if (!config) {
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		return -EINVAL;
+	}
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+				    FSEL_MASK,
+				    FIELD_PREP(FSEL_MASK, config->fsel_val));
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+				    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					       config->div_7_0_val));
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+				    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+				    config->div_11_8_val);
+	return 0;
+}
+
 static const struct snps_eusb2_ref_clk qcom_eusb2_ref_clk[] = {
 	{ 19200000, FSEL_19_2_MHZ_VAL, DIV_7_0_19_2_MHZ_VAL, DIV_11_8_19_2_MHZ_VAL },
 	{ 38400000, FSEL_38_4_MHZ_VAL, DIV_7_0_38_4_MHZ_VAL, DIV_11_8_38_4_MHZ_VAL },
@@ -239,6 +315,55 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	return 0;
 }
 
+static int exynos_snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_RST,
+				    USB_PHY_RST_MASK | UTMI_PORT_RST_MASK,
+				    USB_PHY_RST_MASK | UTMI_PORT_RST_MASK);
+	fsleep(50); /* required after holding phy in reset */
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+				    RPTR_MODE, RPTR_MODE);
+
+	/* update ref_clk related registers */
+	ret = exynos_eusb2_ref_clk_init(phy);
+	if (ret)
+		return ret;
+
+	/* default parameter: tx fsls-vref */
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_PHY_CFG_TX,
+				    EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK,
+				    FIELD_PREP(EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK, 0x0));
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_UTMI_TESTSE,
+				    TEST_IDDQ, 0);
+	fsleep(10); /* required after releasing test_iddq */
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_RST,
+				    USB_PHY_RST_MASK, 0);
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+				    PHY_ENABLE, PHY_ENABLE);
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_RST,
+				    UTMI_PORT_RST_MASK, 0);
+
+	return 0;
+}
+
+static const char * const exynos_eusb2_hsphy_clock_names[] = {
+	"ref", "bus", "ctrl",
+};
+
+static const struct snps_eusb2_phy_drvdata exynos2200_snps_eusb2_phy = {
+	.phy_init	= exynos_snps_eusb2_hsphy_init,
+	.clk_names	= exynos_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(exynos_eusb2_hsphy_clock_names),
+};
+
 static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -315,8 +440,14 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	return 0;
 }
 
+static const char * const qcom_eusb2_hsphy_clock_names[] = {
+	"ref",
+};
+
 static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names      = qcom_eusb2_hsphy_clock_names,
+	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
 static int snps_eusb2_hsphy_init(struct phy *p)
@@ -334,7 +465,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 		goto disable_vreg;
 	}
 
-	ret = clk_prepare_enable(phy->ref_clk);
+	ret = clk_bulk_prepare_enable(phy->data->num_clks, phy->clks);
 	if (ret) {
 		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
 		goto disable_vreg;
@@ -361,7 +492,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 	return 0;
 
 disable_ref_clk:
-	clk_disable_unprepare(phy->ref_clk);
+	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
 
 disable_vreg:
 	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
@@ -415,8 +546,28 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-	phy->ref_clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(phy->ref_clk))
+	phy->clks = devm_kcalloc(dev, phy->data->num_clks, sizeof(*phy->clks),
+				 GFP_KERNEL);
+	if (!phy->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < phy->data->num_clks; ++i)
+		phy->clks[i].id = phy->data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, phy->data->num_clks, phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	phy->ref_clk = NULL;
+	for (int i = 0; i < phy->data->num_clks; ++i) {
+		if (!strcmp(phy->clks[i].id, "ref")) {
+			phy->ref_clk = phy->clks[i].clk;
+			break;
+		}
+	}
+
+	if (IS_ERR_OR_NULL(phy->ref_clk))
 		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
 				     "failed to get ref clk\n");
 
@@ -456,6 +607,9 @@ static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
+	}, {
+		.compatible = "samsung,exynos2200-snps-eusb2-phy",
+		.data = &exynos2200_snps_eusb2_phy,
 	}, { },
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
-- 
2.43.0


