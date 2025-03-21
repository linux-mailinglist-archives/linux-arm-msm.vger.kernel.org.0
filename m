Return-Path: <linux-arm-msm+bounces-52195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4707A6BC7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D64107AA4DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C4A22CBE4;
	Fri, 21 Mar 2025 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJxMHW8O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8EF22578A;
	Fri, 21 Mar 2025 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565556; cv=none; b=JzDZvEttkKEmOiT2EG4VzGsJ6706hD0tBib5MnffgzrDyLhGoZtaVQxytyS/zaiJVv9Vqez8/ZuCVay6E2qe4vb9XSBHEyk6I/DPhKw5OAFrCHW094AcxlyVvq8zCz4jVeiKDOk2N3jqkkaHL/v9dfQbppWEOcnMZYOudwuNqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565556; c=relaxed/simple;
	bh=A3em0Lfxm7ZnWn4ONR98tbJRiGQCPpUSTel3ORvpaHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r32aL120ERmBujCyJJ/iF/ANN58LJ5LVM6oExx6Sejaksk0VB1chgjWYrlAhG43PnaRvj5AlZU9U1WNZok4+1Bc0xij8tQa0GutM5CfjIb+UDbAoEZGWDqzS95N6BDxaLAIxF9r1cPn0doS3CHQ7fyY3d0VyCBIc3BZij2e6sBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJxMHW8O; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3996af42857so2049245f8f.0;
        Fri, 21 Mar 2025 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565552; x=1743170352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoHg50laesVH6CBpuSOJvrId0cJWf2bjffYDRvhMe1w=;
        b=NJxMHW8Ol3pYAuGwp8aTfr+VoJ74cO2TVz3aHR05cy79xJON49D1jFPXg6xoF0RPlX
         /dUt56kohg4d7E7lP+ZzaL20hHiEfLkprdnDd+FfHeXtuzAFh1eWDpJWkZcX3XrAtHD6
         WV35B3tIq0NaNUula5P3+snOrKm65JjGw3OtjdaezJwcSvQUkX0S98RRXP+9Sz6lK1e/
         E2QH6vw8O6+eiE8fNqrGCNSTz8tEJGl9k0CrKdJ6pk7Y+58wHtxZD2ZD5TKlb0zsbSUZ
         DXPeG84stJq5I7gBCUGkruTylggQtDQZV5QpuPAO1A8HQ4BYIOS6dUUpn7V9YVpMHRCL
         V22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565552; x=1743170352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoHg50laesVH6CBpuSOJvrId0cJWf2bjffYDRvhMe1w=;
        b=B+CtgBsj2xTtn3yfhNrgtwXvYOSUe+So46Ft+uxRIVolxInNbU3wq33z7EnSVnw1lg
         iBJEOb25NMYo8vUt8Y+GkZ4nVKVbns/OOsQ5nf916SBmqr5fPU88MF+btnwsqNSRKLq/
         EQleEx/FqRTIWNw6s2V81IYTjgvgmT1h5EJ4v9QU4t8ZPfVhGWS2ZGbzScujPaiKFw3V
         rc1T4FS4iZxbiFa8gOcUXgsRiPrNfHuv1aKbzHpaOZHjSSt+r3j0+CQ9FdJ3Zd2uFrE3
         uQ9fjE2CU7Kh5wq4udRFvcnojAUx+JjcfZx2qxFX+n7Q9OLSy7fJoP9wlW5I76sXkDDO
         8jRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU84lTcn0xh+95PuwWD3WbDgyTyRcf0nDkVH/26TAQS6eNJyJHEUAyctxAVH/ljsRzrqLetyGd1ZemI2k0X@vger.kernel.org, AJvYcCVPOMtBvdvjUeJyxfXQLalwLuyDaOHWSeuaFBEet4gi4a2Nirs9RONgx68Wj1WZz7Jy2tKLKo0X3MXZ@vger.kernel.org, AJvYcCWiYO4qZajKNyDgVE/pEZqFEAQl28qCthdCDBSmuljN64H0fHAVEzv0/lDwXZfK5gGoBCvZt3Ob2eGjN7Hrc9r81j4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBtw39CZaZuAI8WzC7rLvyTJ3oUCXR52d0tpZQiskyRXvpjFD
	oRISh1Agx3oNXM1aUWJcLIENLko5XKGRmp0y6R9PGHgqWmKkw8mk
X-Gm-Gg: ASbGncuHw928+O1/2lTepa/d5upHC9Zv+jjxILhr+k4zniRuaeyksU6fLwfbYa49GrJ
	1j6Hq9JvfStHzpuV1jCw8Xgqt4wV69j+M5EcYTkSbjfyGh2tbWhARSc93nogAA/pGbcqHB2cI6y
	rkkvT4pa7W7ELZGr09Xp5IoEuRIOWchibFJ/dlYmAtXIlF1ejS4PCgtNQYyPeshP+bM1zzdlhAV
	cPiWtzglleJK0z0e5tuWzZe8+81tJSIhxwCcD08NxL5CVj9Gkl5dVBTlzo0xKIKEAkJuZx4r2aq
	D0oYhHNxZB+prsBP8vEq5ppyF0wBg+4elpVHG/ozeyMZV8TGu30920GQXkmxctgRlXmrjs33dAT
	o2v3ah/C9ksZCSuYfEeV/0yx0s50qtJ8=
X-Google-Smtp-Source: AGHT+IH8AxzOKAAv4IyhNwmi4+8+DTPXWnwEhFBpJxheVkEB9WaJ5eFWW7j3piT/WonO+0Ku4TvAWw==
X-Received: by 2002:a5d:5989:0:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-3997f8f7526mr3595461f8f.1.1742565552184;
        Fri, 21 Mar 2025 06:59:12 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:11 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 10/10] phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller
Date: Fri, 21 Mar 2025 15:58:54 +0200
Message-ID: <20250321135854.1431375-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
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
index c421b495e..f85b22a7a 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -34,6 +34,21 @@
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
@@ -383,6 +398,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @clks: clocks for register access
  * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as required)
  * @drv_data: pointer to SoC level driver data structure
+ * @hs_phy: pointer to non-Samsung IP high-speed phy controller
  * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
  *	    instances each with its 'phy' and 'phy_cfg'.
  * @extrefclk: frequency select settings when using 'separate
@@ -397,6 +413,7 @@ struct exynos5_usbdrd_phy {
 	struct clk_bulk_data *clks;
 	struct clk_bulk_data *core_clks;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
+	struct phy *hs_phy;
 	struct phy_usb_instance {
 		struct phy *phy;
 		u32 index;
@@ -1049,6 +1066,149 @@ static const struct phy_ops exynos5_usbdrd_phy_ops = {
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
@@ -1350,27 +1510,37 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
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
+		if (!ref_clk)
+			return dev_err_probe(phy_drd->dev, -ENODEV,
+					     "failed to find phy reference clock\n");
+
+		ref_rate = clk_get_rate(ref_clk);
+		ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
+		if (ret)
+			return dev_err_probe(phy_drd->dev, ret,
+					     "clock rate (%ld) not supported\n",
+					     ref_rate);
 	}
-	if (!ref_clk)
-		return dev_err_probe(phy_drd->dev, -ENODEV,
-				     "failed to find phy reference clock\n");
-
-	ref_rate = clk_get_rate(ref_clk);
-	ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
-	if (ret)
-		return dev_err_probe(phy_drd->dev, ret,
-				     "clock rate (%ld) not supported\n",
-				     ref_rate);
 
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
 static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -1410,6 +1580,19 @@ static const char * const exynos5_regulator_names[] = {
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
@@ -1651,6 +1834,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	{
 		.compatible = "google,gs101-usb31drd-phy",
 		.data = &gs101_usbd31rd_phy
+	}, {
+		.compatible = "samsung,exynos2200-usb32drd-phy",
+		.data = &exynos2200_usb32drd_phy,
 	}, {
 		.compatible = "samsung,exynos5250-usbdrd-phy",
 		.data = &exynos5250_usbdrd_phy
@@ -1719,6 +1905,17 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
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


