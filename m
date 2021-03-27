Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A14634B668
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 12:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhC0LDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 07:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhC0LDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 07:03:19 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDE9C0613B3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:19 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a198so11498318lfd.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NNCJlMGTrKFNEFKumS7Du1sVLdXlzvlR46jkVl+xVTQ=;
        b=GwhbovDhINxyJqEJWdxXTtnsIP80XMfjc8MZxDZiL+nUwBpqnFMNUPD+VueJf8CprL
         5CIIFXzMkeIrNh06vZjXWun6+nOkugl7VUcoXuMVholbQYt12pI2Qz7AxHNtwHgrhsib
         DfzEffrYEufAO4ebd6QfN9lxk7Zdmy14+gxXC46zWt+wSHzCZn6Y9mN8QQ+WmbtyftQp
         lV4E1Uzv0qAHgZ+rJPAflRr3l6DS7XkYMSEZEOJTg7f/bzQgcSUbPpM76aQYN1l9T44U
         CY8b1piAUnp4I0DG8dPbwy1ZhP8/CztARUS2skMG+AzY+aY/QwzETqdcgshXJMnkJDHy
         n+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NNCJlMGTrKFNEFKumS7Du1sVLdXlzvlR46jkVl+xVTQ=;
        b=JpUA/YhdPrGG8lccGzbUcqv0EARpksLiT+Uok1dR4/fkIJNtG7cEN6yoPdhrOKHYCR
         R/2VMp9dU2lyNUBdlqy3RyHpG6I9PAumLMjXZNs7aj/TNL8/abW7+6auGKyxAIMIavA5
         VRIF318A7IdtWBD4ag7VXi01Uu5M6mTbIjCTvWIGV++5KUrKPa0mcH+pYp49HmK7P3N2
         FAeVOaeYvOdXN2Eph6urg2SSH2PhFpC0XEIvZZO98Q2sBTZDruhrcbVPMdyVobjNYypz
         5BmSQqCDSLgJqF7hwpsBWPVqsryw5KEFL0aZjVCW7LpZ5cos6NhnublrgEcnka/jTi+f
         7SYw==
X-Gm-Message-State: AOAM533fB5bYlNL07hfumqM1arrVdOZ3nbbuUOl7l09nL2cgMOuGotEQ
        JihG3PG8gqBdc1viUD1gYMgpiA==
X-Google-Smtp-Source: ABdhPJx4chsNNG3/npl6FIGCtMdQ2zjp90xo7c5qsFWEkpzCG0syeIntyqFBVkeFPI6CGuQh1P4zbA==
X-Received: by 2002:a19:4cc2:: with SMTP id z185mr10440049lfa.461.1616842997941;
        Sat, 27 Mar 2021 04:03:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 08/25] drm/msm/dsi: drop global msm_dsi_phy_type enumaration
Date:   Sat, 27 Mar 2021 14:02:48 +0300
Message-Id: <20210327110305.3289784-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the current upstream driver the msm_dsi_phy_type enum does not make
much sense: all DSI PHYs are probed using the dt bindings, the phy type
is not passed between drivers. Use quirks in phy individual PHY drivers
to differentiate minor harware differences and drop the enum.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                 | 12 -----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 11 +++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 19 ++++++++----------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 20 ++++++++++---------
 8 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 21cf883fb6f1..98a4b296fa30 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -23,18 +23,6 @@
 struct msm_dsi_phy_shared_timings;
 struct msm_dsi_phy_clk_request;
 
-enum msm_dsi_phy_type {
-	MSM_DSI_PHY_28NM_HPM,
-	MSM_DSI_PHY_28NM_LP,
-	MSM_DSI_PHY_20NM,
-	MSM_DSI_PHY_28NM_8960,
-	MSM_DSI_PHY_14NM,
-	MSM_DSI_PHY_10NM,
-	MSM_DSI_PHY_7NM,
-	MSM_DSI_PHY_7NM_V4_1,
-	MSM_DSI_PHY_MAX
-};
-
 enum msm_dsi_phy_usecase {
 	MSM_DSI_PHY_STANDALONE,
 	MSM_DSI_PHY_MASTER,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 244d2c900d40..39abb86446f9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -13,9 +13,6 @@
 #define dsi_phy_read(offset) msm_readl((offset))
 #define dsi_phy_write(offset, data) msm_writel((data), (offset))
 
-/* v3.0.0 10nm implementation that requires the old timings settings */
-#define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
-
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
@@ -37,7 +34,6 @@ struct msm_dsi_pll_ops {
 };
 
 struct msm_dsi_phy_cfg {
-	enum msm_dsi_phy_type type;
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
 	const struct msm_dsi_pll_ops pll_ops;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index f697ff9a0d8e..dc8ccc994759 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -59,6 +59,9 @@ struct dsi_pll_regs {
 	u32 ssc_control;
 };
 
+/* v3.0.0 10nm implementation that requires the old timings settings */
+#define DSI_PHY_10NM_QUIRK_OLD_TIMINGS	BIT(0)
+
 struct dsi_pll_config {
 	u32 ref_freq;
 	bool div_override;
@@ -915,7 +918,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	u8 tx_dctrl[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
 	void __iomem *lane_base = phy->lane_base;
 
-	if (phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)
+	if (phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)
 		tx_dctrl[3] = 0x02;
 
 	/* Strength ctrl settings */
@@ -950,7 +953,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 			      tx_dctrl[i]);
 	}
 
-	if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
+	if (!(phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)) {
 		/* Toggle BIT 0 to release freeze I/0 */
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
@@ -1090,7 +1093,6 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
-	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1116,7 +1118,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
-	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1139,5 +1140,5 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	},
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
-	.quirks = V3_0_0_10NM_OLD_TIMINGS_QUIRK,
+	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 011d285bf2c0..d78f846cf8e4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1215,7 +1215,6 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
-	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1243,7 +1242,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
-	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index b752636f7f21..5e73f811d645 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -125,7 +125,6 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
-	.type = MSM_DSI_PHY_20NM,
 	.src_pll_truthtable = { {false, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index fb6e19d9495d..bb33261d606d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -40,6 +40,9 @@
 #define DSI_BYTE_PLL_CLK		0
 #define DSI_PIXEL_PLL_CLK		1
 
+/* v2.0.0 28nm LP implementation */
+#define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
+
 #define LPFR_LUT_SIZE			10
 struct lpfr_cfg {
 	unsigned long vco_rate;
@@ -624,14 +627,10 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_28nm->base;
 	pll->min_rate = VCO_MIN_RATE;
 	pll->max_rate = VCO_MAX_RATE;
-	if (phy->cfg->type == MSM_DSI_PHY_28NM_HPM) {
-		pll_28nm->vco_delay = 1;
-	} else if (phy->cfg->type == MSM_DSI_PHY_28NM_LP) {
+	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		pll_28nm->vco_delay = 1000;
-	} else {
-		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", phy->cfg->type);
-		return -EINVAL;
-	}
+	else
+		pll_28nm->vco_delay = 1;
 
 	pll->cfg = phy->cfg;
 
@@ -706,7 +705,7 @@ static void dsi_28nm_phy_regulator_enable_ldo(struct msm_dsi_phy *phy)
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
 
-	if (phy->cfg->type == MSM_DSI_PHY_28NM_LP)
+	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x05);
 	else
 		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x0d);
@@ -791,7 +790,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
-	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -818,7 +816,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
-	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -845,7 +842,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
-	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -869,5 +865,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	},
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 08f31be3b0dc..79b0842a8dc4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -690,7 +690,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
-	.type = MSM_DSI_PHY_28NM_8960,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 68b54e5060e4..44ae495e8fca 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -59,6 +59,9 @@ struct dsi_pll_regs {
 	u32 ssc_control;
 };
 
+/* Hardware is V4.1 */
+#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
+
 struct dsi_pll_config {
 	u32 ref_freq;
 	bool div_override;
@@ -178,7 +181,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
 
 	dec = div_u64(dec_multiple, multiplier);
 
-	if (pll->base.cfg->type != MSM_DSI_PHY_7NM_V4_1)
+	if (!(pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
 		regs->pll_clock_inverters = 0x28;
 	else if (pll_freq <= 1000000000ULL)
 		regs->pll_clock_inverters = 0xa0;
@@ -273,7 +276,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->mmio;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
-	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		if (pll->vco_current_rate >= 3100000000ULL)
 			analog_controls_five_1 = 0x03;
 
@@ -307,9 +310,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
-		  pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1 ? 0x3f : 0x22);
+		  pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
 
-	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		pll_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 		if (pll->slave)
 			pll_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
@@ -888,7 +891,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->min_rate = 1000000000UL;
 	pll->max_rate = 3500000000UL;
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		pll->min_rate = 600000000UL;
 		pll->max_rate = (unsigned long)5000000000ULL;
 		/* workaround for max rate overflowing on 32-bit builds: */
@@ -948,7 +951,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	const u8 *tx_dctrl = tx_dctrl_0;
 	void __iomem *lane_base = phy->lane_base;
 
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1)
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
 		tx_dctrl = tx_dctrl_1;
 
 	/* Strength ctrl settings */
@@ -1012,7 +1015,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
@@ -1129,7 +1132,6 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
-	.type = MSM_DSI_PHY_7NM_V4_1,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1152,10 +1154,10 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
-	.type = MSM_DSI_PHY_7NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
-- 
2.30.2

