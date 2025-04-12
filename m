Return-Path: <linux-arm-msm+bounces-54120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29794A86F85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DFBE165057
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757F52343BE;
	Sat, 12 Apr 2025 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQrMGxyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48A233736;
	Sat, 12 Apr 2025 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489634; cv=none; b=nJcD956Ht1CcCVA5sE58ooVyHkqVBqaQ1D9TAZcC78w638arHUSXoBtzW8e/Qix/sv5wFlJ+QqiTj0VkWnRbbpq0al//skZDiPf76xA5KTcQAzhZJBel4ErIJ3B395gyjMBIybaAUFLwG5MrH2j6MK/AaeTSuk5gLywCQrvR/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489634; c=relaxed/simple;
	bh=419pGHS6E3Wy9OaZ5aQdZp14d/QKmc0lbbOW28DgCzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxjN3AR88LvNv1TbO6XPPP8PMTFeuPKagnLty6/3aA6/tDGVhHKlg4TJIm6jRMqxZufB2rdi6xun48W4rlARxWTBTV3lKmxwZhfIjEZ+3uFn+O5CW678ntOwUaCfm52FhCjx4V7k/oKOtVkw7jOuEbEgsuWtUOi4/Gyac0DBaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQrMGxyM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0618746bso23513205e9.2;
        Sat, 12 Apr 2025 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489630; x=1745094430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=;
        b=EQrMGxyMQ1m1skX4uhdkU+NtXBIty2FAoNPN9AY6pvB/SCCLim+RtK0H4sNGqLwoNI
         q6Az02e/DtwavmHJQpc85IbHFuvjsE0CorD9/LjGZbuNhlS9Ds/plcnFUC2no7h3ytfV
         dzROjWoTe6D0s/SIc5sEIrhONkQKwpIvpNRi+0VewKuuSQkFA8WvODllU1Q23LlpgmFf
         6pgiUGKsLhB4mRM+ybKxhjfeTp/Ev9IwjGaUXs1w20sRYEcV6+hWBuWxMl1VCLjIYyRr
         /1QZoLcwxAhcBloFnjVSdhBvknPfmN8eIOCkxvN2LT+x1q3NVJ7N2c/1hNdhfAOuDlOw
         upSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489630; x=1745094430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=;
        b=xJFYl88xn2mUvMEqiqj7f2biA6/EZnmc3rt9eBc97jmv3e0nqC5kIcR87+ryNRDMxo
         XSL/H3jrtBo3+cEQhzCtUCQnCfSHCa1U7huCdHmUKLOcG8o7RgWMLAg2jc0CLFMIGMsr
         FyYGMQXpFbmdoavOJcDClyHhK4pVnpRjBPPOFWJWuA+Vi/VctJBMTF3bFXJD1Gwb8z1H
         vPzMWeOeWSdTgQD0xVCMsS6f/1wmtgl9rP9R/YaJo0RkXLtuF/drvOjJ9SGsn9Lr/0PB
         7+Cg7E1onqmVno32iF2kC7zfMhIKA/FOYsApRp6u6UHk4KqsRfdlG0+ebug4pwul9TEX
         anng==
X-Forwarded-Encrypted: i=1; AJvYcCUeCbbe9YPs1PUmz52pb3Of7yHlxsSzCwj7PlMT/KYOsqFEGbOIU9DjAkI2n1gsjn6hvP8ExaW2vDk3/VYdEQ==@vger.kernel.org, AJvYcCVhGz5EQynlj82FNIBn889IfEDgkSCXlrvTlqZ2I8swUle8G0Ekv5vNWKYKWiHcq/Eb5n10SmFy3FoA@vger.kernel.org, AJvYcCW3F9cXgfjI14/V/MyhFgcIdo3wCt1v/KmkNeR5ENQGTMnAaXfk3+S56//YqFvuHjwtO+dyskLyiLEgdZik@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwB10llGeQ+KSIo1OkObUE+JZisDo4k2ZIyX/FPpvGHw8bQxa
	IgGiP9FthsHA5nCo4ieD6H9X5kNhUjHNT5RRII3fNBzdHyQs24do
X-Gm-Gg: ASbGncvL1Hps7zmxmuzjj1JrlndbFmchvj44oz8NfBvuPp1rakACSky79RS+7YXHUtN
	DroPfv1LQFvrwW9XPAQcluHJAJzv+Dn93H97enyPGmiu0rM4+DeuMS86IJZuywd9daT7A8CKAiR
	5ogBWlmnOTWvEFdYvRY0xDDa0888cO3SkZsV1NvCIlI0Rr6j3acODiYK19UiWCk0rCwIMIMSRik
	L6UXns8836+zvRAG7r5QuAJHnNXPlMg5eF2Ie4VqZ/VM/bi/PVWX4jhsdMH75TnKl+6lQ/OvnOr
	KGiZLamQDW5a/XWqrO98yQkvX4vD4qH0sJeSk802mUkOFXwn0gDvg826h94ybZiU0WbMC9eNo/3
	aBHJCSdArb5DCQCZj
X-Google-Smtp-Source: AGHT+IEtxyW3UZ/3u0BXgkHZsM+YoFZNao9NjKVr3gYfBTIxWSJRFnSO9EXDpk7LBa79WamAspfqPg==
X-Received: by 2002:a05:600c:3b19:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-43f3a9b02f9mr74840105e9.27.1744489630266;
        Sat, 12 Apr 2025 13:27:10 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:09 -0700 (PDT)
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
Subject: [PATCH v4 10/10] phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller
Date: Sat, 12 Apr 2025 23:26:20 +0300
Message-ID: <20250412202620.738150-11-ivo.ivanov.ivanov1@gmail.com>
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

Add support for the Exynos USB 3.2 DRD 4nm controller. It's used in
recent 4nm SoCs like Exynos2200 and Exynos2400.

This device consists of 3 underlying and independent phys: SEC link
control phy, Synopsys eUSB 2.0 and Synopsys USBDP/SS combophy. Unlike
older device designs, where the internal phy blocks were all IP of
Samsung, Synopsys phys are present. This means that the link controller
is now mapped differently to account for missing bits and registers.
The Synopsys phys also have separate register bases.

As there are non-SEC PHYs present now, it doesn't make much sense to
implement them in this driver. They are expected to be configured
by external drivers, so pass phandles to them. USBDRD3.2 link controller
set up is still required beforehand.

This commit adds the necessary changes for USB HS to work. USB SS and
DisplayPort are out of scope in this commit and will be introduced
in the future.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 227 ++++++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h |   3 +
 2 files changed, 215 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 817fddee0..f9a657642 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -36,6 +36,21 @@
 #define EXYNOS5_FSEL_26MHZ		0x6
 #define EXYNOS5_FSEL_50MHZ		0x7
 
+/* USB 3.2 DRD 4nm PHY link controller registers */
+#define EXYNOS2200_DRD_CLKRST			0x0c
+#define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
+
+#define EXYNOS2200_DRD_UTMI			0x10
+#define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
+#define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
+
+#define EXYNOS2200_DRD_HSP_MISC			0x114
+#define HSP_MISC_SET_REQ_IN2			BIT(4)
+#define HSP_MISC_RES_TUNE			GENMASK(1, 0)
+#define RES_TUNE_PHY1_PHY2			0x1
+#define RES_TUNE_PHY1				0x2
+#define RES_TUNE_PHY2				0x3
+
 /* Exynos5: USB 3.0 DRD PHY registers */
 #define EXYNOS5_DRD_LINKSYSTEM			0x04
 #define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
@@ -389,6 +404,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @clks: clocks for register access
  * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as required)
  * @drv_data: pointer to SoC level driver data structure
+ * @hs_phy: pointer to non-Samsung IP high-speed phy controller
  * @phy_mutex: mutex protecting phy_init/exit & TCPC callbacks
  * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
  *	    instances each with its 'phy' and 'phy_cfg'.
@@ -406,6 +422,7 @@ struct exynos5_usbdrd_phy {
 	struct clk_bulk_data *clks;
 	struct clk_bulk_data *core_clks;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
+	struct phy *hs_phy;
 	struct mutex phy_mutex;
 	struct phy_usb_instance {
 		struct phy *phy;
@@ -1075,6 +1092,149 @@ static const struct phy_ops exynos5_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static void exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	/* Configure non-Samsung IP PHY, responsible for UTMI */
+	phy_init(phy_drd->hs_phy);
+}
+
+static void exynos2200_usbdrd_link_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This will force
+	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
+	 * the PHY clock is not gated by the hardware.
+	 */
+	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
+	reg |= LINKCTRL_FORCE_QACT;
+	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
+
+	/* De-assert link reset */
+	reg = readl(regs_base + EXYNOS2200_DRD_CLKRST);
+	reg &= ~CLKRST_LINK_SW_RST;
+	writel(reg, regs_base + EXYNOS2200_DRD_CLKRST);
+
+	/* Set link VBUS Valid */
+	reg = readl(regs_base + EXYNOS2200_DRD_UTMI);
+	reg |= EXYNOS2200_UTMI_FORCE_BVALID | EXYNOS2200_UTMI_FORCE_VBUSVALID;
+	writel(reg, regs_base + EXYNOS2200_DRD_UTMI);
+}
+
+static void
+exynos2200_usbdrd_link_attach_detach_pipe3_phy(struct phy_usb_instance *inst)
+{
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		/* force pipe3 signal for link */
+		reg &= ~LINKCTRL_FORCE_PHYSTATUS;
+		reg |= LINKCTRL_FORCE_PIPE_EN | LINKCTRL_FORCE_RXELECIDLE;
+	} else {
+		/* disable forcing pipe interface */
+		reg &= ~LINKCTRL_FORCE_PIPE_EN;
+	}
+	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
+
+	reg = readl(regs_base + EXYNOS2200_DRD_HSP_MISC);
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		/* calibrate only eUSB phy */
+		reg |= FIELD_PREP(HSP_MISC_RES_TUNE, RES_TUNE_PHY1);
+		reg |= HSP_MISC_SET_REQ_IN2;
+	} else {
+		/* calibrate for dual phy */
+		reg |= FIELD_PREP(HSP_MISC_RES_TUNE, RES_TUNE_PHY1_PHY2);
+		reg &= ~HSP_MISC_SET_REQ_IN2;
+	}
+	writel(reg, regs_base + EXYNOS2200_DRD_HSP_MISC);
+
+	reg = readl(regs_base + EXYNOS2200_DRD_CLKRST);
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
+		reg &= ~EXYNOS2200_CLKRST_LINK_PCLK_SEL;
+	else
+		reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
+
+	writel(reg, regs_base + EXYNOS2200_DRD_CLKRST);
+}
+
+static int exynos2200_usbdrd_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		/* Power-on PHY ... */
+		ret = regulator_bulk_enable(phy_drd->drv_data->n_regulators,
+					    phy_drd->regulators);
+		if (ret) {
+			dev_err(phy_drd->dev,
+				"Failed to enable PHY regulator(s)\n");
+			return ret;
+		}
+	}
+	/*
+	 * ... and ungate power via PMU. Without this here, we get an SError
+	 * trying to access PMA registers
+	 */
+	exynos5_usbdrd_phy_isol(inst, false);
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* Set up the link controller */
+	exynos2200_usbdrd_link_init(phy_drd);
+
+	/* UTMI or PIPE3 link preparation */
+	exynos2200_usbdrd_link_attach_detach_pipe3_phy(inst);
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynos2200_usbdrd_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	reg = readl(regs_base + EXYNOS2200_DRD_UTMI);
+	reg &= ~(EXYNOS2200_UTMI_FORCE_BVALID | EXYNOS2200_UTMI_FORCE_VBUSVALID);
+	writel(reg, regs_base + EXYNOS2200_DRD_UTMI);
+
+	reg = readl(regs_base + EXYNOS2200_DRD_CLKRST);
+	reg |= CLKRST_LINK_SW_RST;
+	writel(reg, regs_base + EXYNOS2200_DRD_CLKRST);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	exynos5_usbdrd_phy_isol(inst, true);
+	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+				      phy_drd->regulators);
+}
+
+static const struct phy_ops exynos2200_usbdrd_phy_ops = {
+	.init		= exynos2200_usbdrd_phy_init,
+	.exit		= exynos2200_usbdrd_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
 static void
 exynos5_usbdrd_usb_v3p1_pipe_override(struct exynos5_usbdrd_phy *phy_drd)
 {
@@ -1384,27 +1544,37 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 		return dev_err_probe(phy_drd->dev, ret,
 				     "failed to get phy core clock(s)\n");
 
-	ref_clk = NULL;
-	for (int i = 0; i < phy_drd->drv_data->n_core_clks; ++i) {
-		if (!strcmp(phy_drd->core_clks[i].id, "ref")) {
-			ref_clk = phy_drd->core_clks[i].clk;
-			break;
+	if (phy_drd->drv_data->n_core_clks) {
+		ref_clk = NULL;
+		for (int i = 0; i < phy_drd->drv_data->n_core_clks; ++i) {
+			if (!strcmp(phy_drd->core_clks[i].id, "ref")) {
+				ref_clk = phy_drd->core_clks[i].clk;
+				break;
+			}
 		}
-	}
-	if (!ref_clk)
-		return dev_err_probe(phy_drd->dev, -ENODEV,
-				     "failed to find phy reference clock\n");
+		if (!ref_clk)
+			return dev_err_probe(phy_drd->dev, -ENODEV,
+					     "failed to find phy reference clock\n");
 
-	ref_rate = clk_get_rate(ref_clk);
-	ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
-	if (ret)
-		return dev_err_probe(phy_drd->dev, ret,
-				     "clock rate (%ld) not supported\n",
-				     ref_rate);
+		ref_rate = clk_get_rate(ref_clk);
+		ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
+		if (ret)
+			return dev_err_probe(phy_drd->dev, ret,
+					     "clock rate (%ld) not supported\n",
+					     ref_rate);
+	}
 
 	return 0;
 }
 
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynos2200[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynos2200_usbdrd_utmi_init,
+	},
+};
+
 static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 				       enum typec_orientation orientation)
 {
@@ -1525,6 +1695,19 @@ static const char * const exynos5_regulator_names[] = {
 	"vbus", "vbus-boost",
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
+	.phy_cfg		= phy_cfg_exynos2200,
+	.phy_ops		= &exynos2200_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOS2200_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	/* clocks and regulators are specific to the underlying PHY blocks */
+	.core_clk_names		= NULL,
+	.n_core_clks		= 0,
+	.regulator_names	= NULL,
+	.n_regulators		= 0,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
@@ -1769,6 +1952,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	{
 		.compatible = "google,gs101-usb31drd-phy",
 		.data = &gs101_usbd31rd_phy
+	}, {
+		.compatible = "samsung,exynos2200-usb32drd-phy",
+		.data = &exynos2200_usb32drd_phy,
 	}, {
 		.compatible = "samsung,exynos5250-usbdrd-phy",
 		.data = &exynos5250_usbdrd_phy
@@ -1841,6 +2027,17 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 			return PTR_ERR(phy_drd->reg_phy);
 	}
 
+	/*
+	 * USB32DRD 4nm controller implements Synopsys eUSB2.0 PHY
+	 * and Synopsys SS/USBDP COMBOPHY, managed by external code.
+	 */
+	if (of_property_present(dev->of_node, "phy-names")) {
+		phy_drd->hs_phy = devm_of_phy_get(dev, dev->of_node, "hs");
+		if (IS_ERR(phy_drd->hs_phy))
+			return dev_err_probe(dev, PTR_ERR(phy_drd->hs_phy),
+					     "failed to get hs_phy\n");
+	}
+
 	ret = exynos5_usbdrd_phy_clk_handle(phy_drd);
 	if (ret)
 		return ret;
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index ce1a3790d..b77187ba5 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -185,6 +185,9 @@
 /* Only for S5Pv210 */
 #define S5PV210_EINT_WAKEUP_MASK	0xC004
 
+/* Only for Exynos2200 */
+#define EXYNOS2200_PHY_CTRL_USB20	0x72C
+
 /* Only for Exynos4210 */
 #define S5P_CMU_CLKSTOP_LCD1_LOWPWR	0x1154
 #define S5P_CMU_RESET_LCD1_LOWPWR	0x1174
-- 
2.43.0


