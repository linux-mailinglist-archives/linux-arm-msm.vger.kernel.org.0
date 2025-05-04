Return-Path: <linux-arm-msm+bounces-56693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3BAA86ED
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947401898F1A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608B51F30A4;
	Sun,  4 May 2025 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMvQrlsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A61F0E38;
	Sun,  4 May 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369955; cv=none; b=uBRNe0NWpg4lGs5m1zrHrO2iRlBehDn0bYdCE47UcqAE4XxcJmlfgi3QJkCkkCwlgtNb7r3Aw5FhM6R19BBYjKyKPY6eybVQM75mkUP8YXDdRyRJlo89K04uEcxoUw8d3DJNAe0h84UmrVBSpokskrGX07uIGzfEfL81oBhwA7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369955; c=relaxed/simple;
	bh=ogdJs3P0nw4zm4/Rb98FqrgIjmxVeN0yklkwRVCI9K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzlIADBGj6wyGi3CPhrbsaasHQiNbW18Yc8GSIxV5jV85UXLDUl8xPJYX2vS/x7Ua41L/9K5U5YeivLHaezwmXuMJWdf7fepF94DUzPXWVpWXAISyfx4SDxeq9CE2n2qwTTN93h2I1CEYr1ZEwD5OqRs/CRWosa5NwFEhXjlbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMvQrlsE; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6750743a12.0;
        Sun, 04 May 2025 07:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369950; x=1746974750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWVQ4JZdxhs/sxIlA/zTTHauX53b7ANsdgsUWP29zDk=;
        b=nMvQrlsEdJ1wgxpRK/OJ6xMviC5UlbXPbbOn7EGisVY6H9jPMDnChvWHGGImJ2Y579
         O3F2AlGYT6btD7gnfTjCL2fW8jzfVk+8cPM1ePRh+z9tfpUP02k9NeDz0/7/ERcLIN+t
         AmrfzoDjYvYUEEnMWsjV9OZnfRAOsfv2zpdqpTWVLtK5TfZGkFWMP8ySCYs8/wR0m4dY
         286D11WeGXfHoC6viow82/6h1AOhX+7zooh6FfNXbfqu9yWFmVjvLJUT4j72CWixhTs7
         UrRkLS3/6roUAAvkvMULgBYWEndagWb95yw+lDHMKjsdncqqyzr73UWvRWO6wfR9bL41
         NJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369950; x=1746974750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWVQ4JZdxhs/sxIlA/zTTHauX53b7ANsdgsUWP29zDk=;
        b=bkdorj+R2k7e6kaWBHvSGhsCfXBmEfJZwIwiaZXp4+NqUwI7ho2DnmMlMPnaD+9vo0
         XWf22aBTZG/XOip4ryfSab+7tlsUmwy21OZMAsuecvY10gbV2pIUTnBZ+fM9KpFwoaqb
         HcVAIbcmsQaiJMT49eVPhmqMNvLGpq8l9SRnX06Kpj9XWNPz0w4DcZNtP9RYlAU1X3+r
         9etIzGA1Oq832ppa2HamdEvVfVMWSB9FwzUFkye+fbuBExDtuZu6Gga2K6run5SBZdsg
         qIVTysh9Gz9q60PEkE8O8ZH/FIXZ6FYl0+soYdBelk3iQ9Ffp30tVfPnpoF3rmrpiDi2
         5FnA==
X-Forwarded-Encrypted: i=1; AJvYcCU2zoZFtXmIDG9KSgWkXIAXKWu4AS5vzWz3DJmVkwfIrv6nv8nd8zMPG38yMcNtLgA5+mP/XmUCwZRrIOl9tQ==@vger.kernel.org, AJvYcCVoUBjpEJjyFegwFbWEPvSmIgWElNxIHBUtXJGE3d1gg9ceUz/0X4Yuv4R8Zb55w3Z5pDMlbnuBLGTy@vger.kernel.org, AJvYcCVrWbVhBtywVr9j9SsvyAzhATNGGyaEjglZDUlKgspIiRkzhNJG6wfFTgbuTy27x4ApTaXi+RrQyCwaA5YL@vger.kernel.org, AJvYcCXPz+fEF81FAe9bula1w7SQ91/VJsDBh24ooxlleltfIHqX/NHnkvq6jo/HUY11n3ZPL3hKBvT5k5/IfBfv28iqaA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5pu1ByVzSLYC8aEIvPE090ITrrmUUmjeHEGax7Q6L08/Pcv9
	/a0/fdDinNvWi19ao142MLxFWom0m5XJgS/NWW32ZumaaF9H1Z9F
X-Gm-Gg: ASbGncvDwieJG03MCHu6ZVbs8KxWkqsW8vOc94PtOhrPjhBAyE+WyDdtbTqTqbMnQxZ
	bJjhxg1jkbWnJUYJcxKxBMbQ/s+xBMwbMhGyYOIXVr6aO0SI3J1Ux2LyIXNMvFGMFd2RuF0CB/9
	11FJeZ4efe4iKCiPcKltyBE3NYOzXbQyHvoWQcSRfXgyYnElG/sZzWdDneI2/UwJpvpbL7HYMWu
	v+R0/ovySrO8uTBuJvm9fic+aprefCkggWRiJbah4DRvRh5L/N23yt0GKKAiAhBDV8xT9tQpxur
	ErWg/JmVWjnYdhT1a4NoHlGU6HUMNWgYFIJGWxRjp9Dj0TGGzA5dDlxkWswECJN/idcWELPdkDM
	dI8zZGKPi7lg9q15Y
X-Google-Smtp-Source: AGHT+IGcQhxZ8Ee0gV4Kq8eL/mz0wCqQOqMRE5y14X2fF6dY6I/c/y/b+aDL82lTFIMEL31lTx8VwA==
X-Received: by 2002:a05:6402:90b:b0:5f8:604a:3a74 with SMTP id 4fb4d7f45d1cf-5fab057e1f8mr3077604a12.20.1746369950437;
        Sun, 04 May 2025 07:45:50 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:50 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/10] phy: phy-snps-eusb2: add support for exynos2200
Date: Sun,  4 May 2025 17:45:26 +0300
Message-ID: <20250504144527.1723980-10-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
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
index 8caa62c0b..b73a1d7e5 100644
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
+		.compatible = "samsung,exynos2200-eusb2-phy",
+		.data = &exynos2200_snps_eusb2_phy,
 	}, { },
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
-- 
2.43.0


