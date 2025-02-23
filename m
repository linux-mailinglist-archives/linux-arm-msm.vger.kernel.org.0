Return-Path: <linux-arm-msm+bounces-49061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEBAA40EE9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8281E189ADCA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEA320C02C;
	Sun, 23 Feb 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cq9ZK5s6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786E20B7EE;
	Sun, 23 Feb 2025 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313363; cv=none; b=SvfuYOZsRzxhPx/CT0NfDh13IhKdxh9St9ygKgS5op8CoaUrnxPJ6goBCI6zrHiQvYksLAQB6MgSWhbZfVGEQYXPRMMyvJj+QqQjv+7DYVCn4bDBTpHm05HTlEE/SkEbIc5YKJXPQkVY2ZSk18uyQ+MwXnCW4zOxNWtX7QET5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313363; c=relaxed/simple;
	bh=QNSa3aRW3WG2Wjc3QNhfE78/uzTq93FyGueo8wjMNeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKOGcHrWhdkk4IBPNoYtZif0Bgcw/HZRwnHkPU5nY5jwUWbD7eozvpQQ6vLTAYvEUzPYgmwPEFxNZXvvePkpfnwlOesUbO9A1CSs10QlYZKOWlRClR6DbcmdLMtOR6GhpeP+JotJQp9n5WDK9zKG3LnDKR7ugkpuh9AaV/ALouU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cq9ZK5s6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so2634624f8f.1;
        Sun, 23 Feb 2025 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313360; x=1740918160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX6OdJxwETGtTGGkJLPqG+9wSA4petjmxxTURrNfA8Q=;
        b=Cq9ZK5s6NFnm5wG7IA7podCjmftB15JckbF3FDHwTu5YKV6Oco6WDwmU81h1lt2oeO
         9ZODI5CZcI+zca4oR7mBNlsvEERnNtz/6ny3i+UjqLejHpw1sjvpkYRxs1tOB2ONudZs
         3n9lqE0VCiBFh2aP1PXdF1HtoXq7gViGcLlHqUFa2BcI1DNnIxzIAI7mNIwywr5K6skF
         cqA7r6S03vu6YBy/eIbj6npR5F15D+aHpqjtZsgQxiK74zdj7bFz84bYTori87NVf2TI
         AFZ25GrP9ZKs28kihVmNmR45vOXDMsQvadn7UwcZY5f5NiQRiht7sgkLzAGvpXxZOOmg
         KPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313360; x=1740918160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX6OdJxwETGtTGGkJLPqG+9wSA4petjmxxTURrNfA8Q=;
        b=bCkQuDqPVRpbZGcHDuq+wSU3ocPt8GIlnMn8hJOP/RD5GqwmCH6X2pI1NfvduR/I+0
         viT6KGWScaqYidkWCkBvmk0Z3QYrlod4gxMntYaCgGcKaDXKtFo+xmch1ag73QkwjRvq
         D7ccDpNNNw6uJmR/DvQPd845G6wj9ue/n5pmhI/WykZ86RR5DkNXPElQGj1e9ycwJtaF
         Ee8/rlF3pMSxxpBJ+lbyCbr21aQ9Olhs0U8QqQD0nsH20u/LvtA0ZNxAw6WDt0J7tNuh
         NfBNfWl7UgB84CmZdimywewFUtcMw7tgrvJVgF7aqTAMg5jApxJZyDnF6FDhxzyR6q19
         cffQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTOj1vNnvraHTLLQYWsE8AAav+cpPEJ1k0ye3AbXFiqAhik+3Fx2OBIy6yFySWpGGvJVxwk4akIClrNcXF@vger.kernel.org, AJvYcCWfDcpY24hn2y2Xou5iG7EqKxWqmQT22t6sE3GRQWIbPvjtfo8JccNS7VBr3Bk2WZIH/ito/RYxoCBdXcPRToUURXs=@vger.kernel.org, AJvYcCXlaoREcN6/uKWXt4BFBMZYD8pzJlqm2QMAbQjO5kpBU1XWzsFRpBLB5nord02FH7vQg0tLi3fE4s+j@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1Eu62DPullunz4lTl7Pn1MRDPLFy3R91NnghYrRp2SXkf+MM
	UNwMMfkm7YbS3MiJlqevpUdpy/wFcpVvD9/x6okZiKS63ADdag9Q
X-Gm-Gg: ASbGncv22BMqiHvWYeKR6a5K8dG4qMMRQpTU6fgYNjC6WAXCqc1V9gAKSqOK319ZPuG
	TzDCZ2iA+/nuLRQLUt802nXQ0jcB2AnoyrlMfy5zpT8/0p1sGygSoOx3N6JjJMXjKCG6MogYrnS
	2IvMaETDUZTkOcpGMTKjIa0sCgzYuc5+I8XfB4PcJoto3CRo6wFRYA9g0acb7mmgdGJ5dlnpYZW
	SLNPyAvcWKcXV9SODCj8y2dLTcSDXyXSTfSZVmVWz1qf4C/oDWfF3XAftAq9cFDiwNKnCu5B6RR
	yAPR11c7kfCKtQQPUTkDxj2L7sklkphF4cG25Ptg+X1FB4/vHNVFe9rJQBi1XDnBnMxdxy+JVDx
	Rpw==
X-Google-Smtp-Source: AGHT+IGM38Zp+pP6TM93b+qjLZgJemULvP7cowReOHzSCfeBj9XGBP7OMOSTNANHlWJlZmr6UB7gYw==
X-Received: by 2002:a05:6000:2a8:b0:38d:d69e:1326 with SMTP id ffacd0b85a97d-38f70783ad2mr7683466f8f.9.1740313360081;
        Sun, 23 Feb 2025 04:22:40 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:39 -0800 (PST)
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
Subject: [PATCH v2 7/8] phy: phy-snps-eusb2: add support for exynos2200
Date: Sun, 23 Feb 2025 14:22:26 +0200
Message-ID: <20250223122227.725233-8-ivo.ivanov.ivanov1@gmail.com>
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

The Exynos2200 SoC reuses the Synopsis eUSB2 PHY IP, alongside an
external repeater, for USB 2.0. Add support for it to the existing
driver.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/Kconfig          |   2 +-
 drivers/phy/phy-snps-eusb2.c | 172 +++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+), 1 deletion(-)

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
index 7a242fe32..67a19d671 100644
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
@@ -196,6 +229,93 @@ static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
 				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
 }
 
+static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
+{
+	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+
+	switch (ref_clk_freq) {
+	case 19200000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_19_2_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_19_2_MHZ_VAL);
+		break;
+
+	case 20000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_20_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_20_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_20_MHZ_VAL);
+		break;
+
+	case 24000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_24_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_24_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_24_MHZ_VAL);
+		break;
+
+	case 26000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_26_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_26_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_26_MHZ_VAL);
+		break;
+
+	case 48000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_48_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_48_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_48_MHZ_VAL);
+		break;
+	default:
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
 	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
@@ -240,6 +360,55 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
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
@@ -488,6 +657,9 @@ static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
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


