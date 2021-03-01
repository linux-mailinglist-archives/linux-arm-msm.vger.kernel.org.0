Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAEF32A11F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377473AbhCBEtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240792AbhCAXa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:30:26 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85137C0611C0
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:26 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id q25so8083388lfc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8mTFmJ9EWVLqtg/nAnyEsK4Ph69zgNCC9jsQgxyFpRY=;
        b=YG7F2iobrLYyvzhg7RVhXXk+arkjHU0poJp42wVUNekAwEZmfqpkEBIw+O1BZer2K0
         6VDd7pwV2QM0ZySatxjyxiBHu9QVpaVZtyjwf+gnIrCcw1899k2vdIcPd+dmhEc63fiD
         Jw0Qg9BT/hgQmfBoCQgEpRSIstXjsImDY3T+lzWPo7vMgshkvnxv6OGnFbjosgGNJPD1
         z6h81caEYgRAjlLJ1CTivCxUQZTUxZjSJA0rUAeZNyCnXtAR/DL+hO7GIKWe2CksPHC3
         84ADlaTRf2GHV4B5D0d6vDrqOR4vQYBNxyXwM/Czys/HQnskZqsy73i1ihC6Jkz/K/H4
         JjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8mTFmJ9EWVLqtg/nAnyEsK4Ph69zgNCC9jsQgxyFpRY=;
        b=dyO+eFLveVZxbJ5Av4dMuFvNZs3awpYCVpCK6sPZqXs9+32t309cQR1i2B4T1nM9Ei
         cNfmFLHCKsu2ruQv9v91qmUt7pX8ugWrn76JLtPHIxpSVcLEmVano3+RjAqS8JmqlH/r
         qOLvVIQ8S1za5UJRFKElfzs19SR3el88VCP+9fPZAoMI/xIilXT34yyfIuSxtLZyo/i+
         aaY7hgRPclq9qlhTo+/i4hYMpmkJzgxR8lAXQmfOUyTgKEbvKz9jPUN0phJR+qjTb7GJ
         XXls0m8gNoGy+YBPtMgqX8EuwdeCl60xcN58uG4/S5CKXTkflTKGgyBSkQJqziV6qOcp
         Stkw==
X-Gm-Message-State: AOAM531b1CAowZWEN+kcVXqbOFY0AMvgy9djQpsGRRUCWHcztZZ1C5OF
        DmQOG/MkXBBOXMp1Jdkm/Oj+8A==
X-Google-Smtp-Source: ABdhPJzdx9NoDdZU/qDETy9JrLoDNFG/UnBfb80yzHCslZ+O4MTEibXLJH1USBGWutuS0jx4+0f1ug==
X-Received: by 2002:a19:ee13:: with SMTP id g19mr10836296lfb.657.1614641184898;
        Mon, 01 Mar 2021 15:26:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 22/24] drm/msm/dsi: remove temp data from global pll structure
Date:   Tue,  2 Mar 2021 02:25:05 +0300
Message-Id: <20210301232506.3057401-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 7nm, 10nm and 14nm drivers would store interim data used during
VCO/PLL rate setting in the global dsi_pll_Nnm structure. Move this data
structures to the onstack storage. While we are at it, drop
unused/static 'config' data, unused config fields, etc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 167 ++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 342 +++++++--------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 161 ++++------
 3 files changed, 221 insertions(+), 449 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index e5ea16e4459f..5456ba67245c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -36,40 +36,22 @@
  */
 
 #define VCO_REF_CLK_RATE		19200000
-
-struct dsi_pll_regs {
-	u32 pll_prop_gain_rate;
-	u32 pll_lockdet_rate;
-	u32 decimal_div_start;
-	u32 frac_div_start_low;
-	u32 frac_div_start_mid;
-	u32 frac_div_start_high;
-	u32 pll_clock_inverters;
-	u32 ssc_stepsize_low;
-	u32 ssc_stepsize_high;
-	u32 ssc_div_per_low;
-	u32 ssc_div_per_high;
-	u32 ssc_adjper_low;
-	u32 ssc_adjper_high;
-	u32 ssc_control;
-};
+#define FRAC_BITS 18
 
 struct dsi_pll_config {
-	u32 ref_freq;
-	bool div_override;
-	u32 output_div;
-	bool ignore_frac;
-	bool disable_prescaler;
 	bool enable_ssc;
 	bool ssc_center;
-	u32 dec_bits;
-	u32 frac_bits;
-	u32 lock_timer;
 	u32 ssc_freq;
 	u32 ssc_offset;
 	u32 ssc_adj_per;
-	u32 thresh_cycles;
-	u32 refclk_cycles;
+
+	/* out */
+	u32 pll_prop_gain_rate;
+	u32 decimal_div_start;
+	u32 frac_div_start;
+	u32 pll_clock_inverters;
+	u32 ssc_stepsize;
+	u32 ssc_div_per;
 };
 
 struct pll_10nm_cached_state {
@@ -85,15 +67,11 @@ struct dsi_pll_10nm {
 
 	struct msm_dsi_phy *phy;
 
-	u64 vco_ref_clk_rate;
 	u64 vco_current_rate;
 
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	struct dsi_pll_config pll_configuration;
-	struct dsi_pll_regs reg_setup;
-
 	struct pll_10nm_cached_state cached_state;
 
 	struct dsi_pll_10nm *slave;
@@ -107,34 +85,19 @@ struct dsi_pll_10nm {
  */
 static struct dsi_pll_10nm *pll_10nm_list[DSI_MAX];
 
-static void dsi_pll_setup_config(struct dsi_pll_10nm *pll)
+static void dsi_pll_setup_config(struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-
-	config->ref_freq = pll->vco_ref_clk_rate;
-	config->output_div = 1;
-	config->dec_bits = 8;
-	config->frac_bits = 18;
-	config->lock_timer = 64;
 	config->ssc_freq = 31500;
 	config->ssc_offset = 5000;
 	config->ssc_adj_per = 2;
-	config->thresh_cycles = 32;
-	config->refclk_cycles = 256;
-
-	config->div_override = false;
-	config->ignore_frac = false;
-	config->disable_prescaler = false;
 
 	config->enable_ssc = false;
-	config->ssc_center = 0;
+	config->ssc_center = false;
 }
 
-static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
+static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 fref = VCO_REF_CLK_RATE;
 	u64 pll_freq;
 	u64 divider;
 	u64 dec, dec_multiple;
@@ -143,40 +106,32 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
 
 	pll_freq = pll->vco_current_rate;
 
-	if (config->disable_prescaler)
-		divider = fref;
-	else
-		divider = fref * 2;
+	divider = fref * 2;
 
-	multiplier = 1 << config->frac_bits;
+	multiplier = 1 << FRAC_BITS;
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	dec = div_u64_rem(dec_multiple, multiplier, &frac);
 
 	if (pll_freq <= 1900000000UL)
-		regs->pll_prop_gain_rate = 8;
+		config->pll_prop_gain_rate = 8;
 	else if (pll_freq <= 3000000000UL)
-		regs->pll_prop_gain_rate = 10;
+		config->pll_prop_gain_rate = 10;
 	else
-		regs->pll_prop_gain_rate = 12;
+		config->pll_prop_gain_rate = 12;
 	if (pll_freq < 1100000000UL)
-		regs->pll_clock_inverters = 8;
+		config->pll_clock_inverters = 8;
 	else
-		regs->pll_clock_inverters = 0;
+		config->pll_clock_inverters = 0;
 
-	regs->pll_lockdet_rate = config->lock_timer;
-	regs->decimal_div_start = dec;
-	regs->frac_div_start_low = (frac & 0xff);
-	regs->frac_div_start_mid = (frac & 0xff00) >> 8;
-	regs->frac_div_start_high = (frac & 0x30000) >> 16;
+	config->decimal_div_start = dec;
+	config->frac_div_start = frac;
 }
 
 #define SSC_CENTER		BIT(0)
 #define SSC_EN			BIT(1)
 
-static void dsi_pll_calc_ssc(struct dsi_pll_10nm *pll)
+static void dsi_pll_calc_ssc(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 	u32 ssc_per;
 	u32 ssc_mod;
 	u64 ssc_step_size;
@@ -187,58 +142,49 @@ static void dsi_pll_calc_ssc(struct dsi_pll_10nm *pll)
 		return;
 	}
 
-	ssc_per = DIV_ROUND_CLOSEST(config->ref_freq, config->ssc_freq) / 2 - 1;
+	ssc_per = DIV_ROUND_CLOSEST(VCO_REF_CLK_RATE, config->ssc_freq) / 2 - 1;
 	ssc_mod = (ssc_per + 1) % (config->ssc_adj_per + 1);
 	ssc_per -= ssc_mod;
 
-	frac = regs->frac_div_start_low |
-			(regs->frac_div_start_mid << 8) |
-			(regs->frac_div_start_high << 16);
-	ssc_step_size = regs->decimal_div_start;
-	ssc_step_size *= (1 << config->frac_bits);
+	frac = config->frac_div_start;
+	ssc_step_size = config->decimal_div_start;
+	ssc_step_size *= (1 << FRAC_BITS);
 	ssc_step_size += frac;
 	ssc_step_size *= config->ssc_offset;
 	ssc_step_size *= (config->ssc_adj_per + 1);
 	ssc_step_size = div_u64(ssc_step_size, (ssc_per + 1));
 	ssc_step_size = DIV_ROUND_CLOSEST_ULL(ssc_step_size, 1000000);
 
-	regs->ssc_div_per_low = ssc_per & 0xFF;
-	regs->ssc_div_per_high = (ssc_per & 0xFF00) >> 8;
-	regs->ssc_stepsize_low = (u32)(ssc_step_size & 0xFF);
-	regs->ssc_stepsize_high = (u32)((ssc_step_size & 0xFF00) >> 8);
-	regs->ssc_adjper_low = config->ssc_adj_per & 0xFF;
-	regs->ssc_adjper_high = (config->ssc_adj_per & 0xFF00) >> 8;
-
-	regs->ssc_control = config->ssc_center ? SSC_CENTER : 0;
+	config->ssc_div_per = ssc_per;
+	config->ssc_stepsize = ssc_step_size;
 
 	pr_debug("SCC: Dec:%d, frac:%llu, frac_bits:%d\n",
-		 regs->decimal_div_start, frac, config->frac_bits);
+		 config->decimal_div_start, frac, FRAC_BITS);
 	pr_debug("SSC: div_per:0x%X, stepsize:0x%X, adjper:0x%X\n",
 		 ssc_per, (u32)ssc_step_size, config->ssc_adj_per);
 }
 
-static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
+static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 
-	if (pll->pll_configuration.enable_ssc) {
+	if (config->enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			  regs->ssc_stepsize_low);
+			  config->ssc_stepsize & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			  regs->ssc_stepsize_high);
+			  config->ssc_stepsize >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			  regs->ssc_div_per_low);
+			  config->ssc_div_per & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			  regs->ssc_div_per_high);
+			  config->ssc_div_per >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1,
-			  regs->ssc_adjper_low);
+			  config->ssc_adj_per & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1,
-			  regs->ssc_adjper_high);
+			  config->ssc_adj_per >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_CONTROL,
-			  SSC_EN | regs->ssc_control);
+			  SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
 	}
 }
 
@@ -268,50 +214,48 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_IFILT, 0x3f);
 }
 
-static void dsi_pll_commit(struct dsi_pll_10nm *pll)
+static void dsi_pll_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *reg = &pll->reg_setup;
 
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1,
-		  reg->decimal_div_start);
+		  config->decimal_div_start);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1,
-		  reg->frac_div_start_low);
+		  config->frac_div_start & 0xff);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1,
-		  reg->frac_div_start_mid);
+		  (config->frac_div_start & 0xff00) >> 8);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
-		  reg->frac_div_start_high);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1,
-		  reg->pll_lockdet_rate);
+		  (config->frac_div_start & 0x30000) >> 16);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1, 64);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
-		  reg->pll_clock_inverters);
+		  config->pll_clock_inverters);
 }
 
 static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
+	struct dsi_pll_config config;
 
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_10nm->phy->id, rate,
 	    parent_rate);
 
 	pll_10nm->vco_current_rate = rate;
-	pll_10nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
 
-	dsi_pll_setup_config(pll_10nm);
+	dsi_pll_setup_config(&config);
 
-	dsi_pll_calc_dec_frac(pll_10nm);
+	dsi_pll_calc_dec_frac(pll_10nm, &config);
 
-	dsi_pll_calc_ssc(pll_10nm);
+	dsi_pll_calc_ssc(pll_10nm, &config);
 
-	dsi_pll_commit(pll_10nm);
+	dsi_pll_commit(pll_10nm, &config);
 
 	dsi_pll_config_hzindep_reg(pll_10nm);
 
-	dsi_pll_ssc_commit(pll_10nm);
+	dsi_pll_ssc_commit(pll_10nm, &config);
 
 	/* flush, ensure all register writes are done*/
 	wmb();
@@ -458,9 +402,8 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
-	struct dsi_pll_config *config = &pll_10nm->pll_configuration;
 	void __iomem *base = pll_10nm->phy->pll_base;
-	u64 ref_clk = pll_10nm->vco_ref_clk_rate;
+	u64 ref_clk = VCO_REF_CLK_RATE;
 	u64 vco_rate = 0x0;
 	u64 multiplier;
 	u32 frac;
@@ -480,7 +423,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	 * TODO:
 	 *	1. Assumes prescaler is disabled
 	 */
-	multiplier = 1 << config->frac_bits;
+	multiplier = 1 << FRAC_BITS;
 	pll_freq = dec * (ref_clk * 2);
 	tmp64 = (ref_clk * 2 * frac);
 	pll_freq += div_u64(tmp64, multiplier);
@@ -562,7 +505,7 @@ static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_mux;
 	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
+	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw, pll_10nm->vco_current_rate, VCO_REF_CLK_RATE);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_10nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 36b340a99e19..88800d68b1bb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -37,51 +37,19 @@
 #define VCO_MIN_RATE			1300000000UL
 #define VCO_MAX_RATE			2600000000UL
 
-#define DSI_PLL_DEFAULT_VCO_POSTDIV	1
+struct dsi_pll_config {
+	u64 vco_current_rate;
 
-struct dsi_pll_input {
-	u32 fref;	/* reference clk */
-	u32 fdata;	/* bit clock rate */
-	u32 dsiclk_sel; /* Mux configuration (see diagram) */
 	u32 ssc_en;	/* SSC enable/disable */
-	u32 ldo_en;
 
 	/* fixed params */
-	u32 refclk_dbler_en;
-	u32 vco_measure_time;
-	u32 kvco_measure_time;
-	u32 bandgap_timer;
-	u32 pll_wakeup_timer;
 	u32 plllock_cnt;
-	u32 plllock_rng;
 	u32 ssc_center;
 	u32 ssc_adj_period;
 	u32 ssc_spread;
 	u32 ssc_freq;
-	u32 pll_ie_trim;
-	u32 pll_ip_trim;
-	u32 pll_iptat_trim;
-	u32 pll_cpcset_cur;
-	u32 pll_cpmset_cur;
-
-	u32 pll_icpmset;
-	u32 pll_icpcset;
-
-	u32 pll_icpmset_p;
-	u32 pll_icpmset_m;
-
-	u32 pll_icpcset_p;
-	u32 pll_icpcset_m;
-
-	u32 pll_lpf_res1;
-	u32 pll_lpf_cap1;
-	u32 pll_lpf_cap2;
-	u32 pll_c3ctrl;
-	u32 pll_r3ctrl;
-};
 
-struct dsi_pll_output {
-	u32 pll_txclk_en;
+	/* calculated */
 	u32 dec_start;
 	u32 div_frac_start;
 	u32 ssc_period;
@@ -91,19 +59,6 @@ struct dsi_pll_output {
 	u32 pll_vco_count;
 	u32 pll_kvco_div_ref;
 	u32 pll_kvco_count;
-	u32 pll_misc1;
-	u32 pll_lpf2_postdiv;
-	u32 pll_resetsm_cntrl;
-	u32 pll_resetsm_cntrl2;
-	u32 pll_resetsm_cntrl5;
-	u32 pll_kvco_code;
-
-	u32 cmn_clk_cfg0;
-	u32 cmn_clk_cfg1;
-	u32 cmn_ldo_cntrl;
-
-	u32 pll_postdiv;
-	u32 fcvo;
 };
 
 struct pll_14nm_cached_state {
@@ -117,18 +72,11 @@ struct dsi_pll_14nm {
 
 	struct msm_dsi_phy *phy;
 
-	struct dsi_pll_input in;
-	struct dsi_pll_output out;
-
 	/* protects REG_DSI_14nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	u64 vco_current_rate;
-	u64 vco_ref_clk_rate;
-
 	struct pll_14nm_cached_state cached_state;
 
-	enum msm_dsi_phy_usecase uc;
 	struct dsi_pll_14nm *slave;
 };
 
@@ -196,78 +144,50 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 	return pll_locked;
 }
 
-static void dsi_pll_14nm_input_init(struct dsi_pll_14nm *pll)
+static void dsi_pll_14nm_config_init(struct dsi_pll_config *pconf)
 {
-	pll->in.fref = pll->vco_ref_clk_rate;
-	pll->in.fdata = 0;
-	pll->in.dsiclk_sel = 1;	/* Use the /2 path in Mux */
-	pll->in.ldo_en = 0;	/* disabled for now */
-
 	/* fixed input */
-	pll->in.refclk_dbler_en = 0;
-	pll->in.vco_measure_time = 5;
-	pll->in.kvco_measure_time = 5;
-	pll->in.bandgap_timer = 4;
-	pll->in.pll_wakeup_timer = 5;
-	pll->in.plllock_cnt = 1;
-	pll->in.plllock_rng = 0;
+	pconf->plllock_cnt = 1;
 
 	/*
 	 * SSC is enabled by default. We might need DT props for configuring
 	 * some SSC params like PPM and center/down spread etc.
 	 */
-	pll->in.ssc_en = 1;
-	pll->in.ssc_center = 0;		/* down spread by default */
-	pll->in.ssc_spread = 5;		/* PPM / 1000 */
-	pll->in.ssc_freq = 31500;	/* default recommended */
-	pll->in.ssc_adj_period = 37;
-
-	pll->in.pll_ie_trim = 4;
-	pll->in.pll_ip_trim = 4;
-	pll->in.pll_cpcset_cur = 1;
-	pll->in.pll_cpmset_cur = 1;
-	pll->in.pll_icpmset = 4;
-	pll->in.pll_icpcset = 4;
-	pll->in.pll_icpmset_p = 0;
-	pll->in.pll_icpmset_m = 0;
-	pll->in.pll_icpcset_p = 0;
-	pll->in.pll_icpcset_m = 0;
-	pll->in.pll_lpf_res1 = 3;
-	pll->in.pll_lpf_cap1 = 11;
-	pll->in.pll_lpf_cap2 = 1;
-	pll->in.pll_iptat_trim = 7;
-	pll->in.pll_c3ctrl = 2;
-	pll->in.pll_r3ctrl = 1;
+	pconf->ssc_en = 1;
+	pconf->ssc_center = 0;		/* down spread by default */
+	pconf->ssc_spread = 5;		/* PPM / 1000 */
+	pconf->ssc_freq = 31500;	/* default recommended */
+	pconf->ssc_adj_period = 37;
 }
 
 #define CEIL(x, y)		(((x) + ((y) - 1)) / (y))
 
-static void pll_14nm_ssc_calc(struct dsi_pll_14nm *pll)
+static void pll_14nm_ssc_calc(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
 	u32 period, ssc_period;
 	u32 ref, rem;
 	u64 step_size;
 
-	DBG("vco=%lld ref=%lld", pll->vco_current_rate, pll->vco_ref_clk_rate);
+	DBG("vco=%lld ref=%d", pconf->vco_current_rate, VCO_REF_CLK_RATE);
 
-	ssc_period = pll->in.ssc_freq / 500;
-	period = (u32)pll->vco_ref_clk_rate / 1000;
+	ssc_period = pconf->ssc_freq / 500;
+	period = (u32)VCO_REF_CLK_RATE / 1000;
 	ssc_period  = CEIL(period, ssc_period);
 	ssc_period -= 1;
-	pll->out.ssc_period = ssc_period;
+	pconf->ssc_period = ssc_period;
 
-	DBG("ssc freq=%d spread=%d period=%d", pll->in.ssc_freq,
-	    pll->in.ssc_spread, pll->out.ssc_period);
+	DBG("ssc freq=%d spread=%d period=%d", pconf->ssc_freq,
+	    pconf->ssc_spread, pconf->ssc_period);
 
-	step_size = (u32)pll->vco_current_rate;
-	ref = pll->vco_ref_clk_rate;
+	step_size = (u32)pconf->vco_current_rate;
+	ref = VCO_REF_CLK_RATE;
 	ref /= 1000;
 	step_size = div_u64(step_size, ref);
 	step_size <<= 20;
 	step_size = div_u64(step_size, 1000);
-	step_size *= pll->in.ssc_spread;
+	step_size *= pconf->ssc_spread;
 	step_size = div_u64(step_size, 1000);
-	step_size *= (pll->in.ssc_adj_period + 1);
+	step_size *= (pconf->ssc_adj_period + 1);
 
 	rem = 0;
 	step_size = div_u64_rem(step_size, ssc_period + 1, &rem);
@@ -278,18 +198,16 @@ static void pll_14nm_ssc_calc(struct dsi_pll_14nm *pll)
 
 	step_size &= 0x0ffff;	/* take lower 16 bits */
 
-	pll->out.ssc_step_size = step_size;
+	pconf->ssc_step_size = step_size;
 }
 
-static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll)
+static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
-	struct dsi_pll_input *pin = &pll->in;
-	struct dsi_pll_output *pout = &pll->out;
 	u64 multiplier = BIT(20);
 	u64 dec_start_multiple, dec_start, pll_comp_val;
 	u32 duration, div_frac_start;
-	u64 vco_clk_rate = pll->vco_current_rate;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 vco_clk_rate = pconf->vco_current_rate;
+	u64 fref = VCO_REF_CLK_RATE;
 
 	DBG("vco_clk_rate=%lld ref_clk_rate=%lld", vco_clk_rate, fref);
 
@@ -298,14 +216,14 @@ static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll)
 
 	dec_start = div_u64(dec_start_multiple, multiplier);
 
-	pout->dec_start = (u32)dec_start;
-	pout->div_frac_start = div_frac_start;
+	pconf->dec_start = (u32)dec_start;
+	pconf->div_frac_start = div_frac_start;
 
-	if (pin->plllock_cnt == 0)
+	if (pconf->plllock_cnt == 0)
 		duration = 1024;
-	else if (pin->plllock_cnt == 1)
+	else if (pconf->plllock_cnt == 1)
 		duration = 256;
-	else if (pin->plllock_cnt == 2)
+	else if (pconf->plllock_cnt == 2)
 		duration = 128;
 	else
 		duration = 32;
@@ -314,10 +232,7 @@ static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll)
 	pll_comp_val = div_u64(pll_comp_val, multiplier);
 	do_div(pll_comp_val, 10);
 
-	pout->plllock_cmp = (u32)pll_comp_val;
-
-	pout->pll_txclk_en = 1;
-	pout->cmn_ldo_cntrl = 0x3c;
+	pconf->plllock_cmp = (u32)pll_comp_val;
 }
 
 static u32 pll_14nm_kvco_slop(u32 vrate)
@@ -334,74 +249,66 @@ static u32 pll_14nm_kvco_slop(u32 vrate)
 	return slop;
 }
 
-static void pll_14nm_calc_vco_count(struct dsi_pll_14nm *pll)
+static void pll_14nm_calc_vco_count(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
-	struct dsi_pll_input *pin = &pll->in;
-	struct dsi_pll_output *pout = &pll->out;
-	u64 vco_clk_rate = pll->vco_current_rate;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 vco_clk_rate = pconf->vco_current_rate;
+	u64 fref = VCO_REF_CLK_RATE;
+	u32 vco_measure_time = 5;
+	u32 kvco_measure_time = 5;
 	u64 data;
 	u32 cnt;
 
-	data = fref * pin->vco_measure_time;
+	data = fref * vco_measure_time;
 	do_div(data, 1000000);
 	data &= 0x03ff;	/* 10 bits */
 	data -= 2;
-	pout->pll_vco_div_ref = data;
+	pconf->pll_vco_div_ref = data;
 
 	data = div_u64(vco_clk_rate, 1000000);	/* unit is Mhz */
-	data *= pin->vco_measure_time;
+	data *= vco_measure_time;
 	do_div(data, 10);
-	pout->pll_vco_count = data;
+	pconf->pll_vco_count = data;
 
-	data = fref * pin->kvco_measure_time;
+	data = fref * kvco_measure_time;
 	do_div(data, 1000000);
 	data &= 0x03ff;	/* 10 bits */
 	data -= 1;
-	pout->pll_kvco_div_ref = data;
+	pconf->pll_kvco_div_ref = data;
 
 	cnt = pll_14nm_kvco_slop(vco_clk_rate);
 	cnt *= 2;
 	cnt /= 100;
-	cnt *= pin->kvco_measure_time;
-	pout->pll_kvco_count = cnt;
-
-	pout->pll_misc1 = 16;
-	pout->pll_resetsm_cntrl = 48;
-	pout->pll_resetsm_cntrl2 = pin->bandgap_timer << 3;
-	pout->pll_resetsm_cntrl5 = pin->pll_wakeup_timer;
-	pout->pll_kvco_code = 0;
+	cnt *= kvco_measure_time;
+	pconf->pll_kvco_count = cnt;
 }
 
-static void pll_db_commit_ssc(struct dsi_pll_14nm *pll)
+static void pll_db_commit_ssc(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_input *pin = &pll->in;
-	struct dsi_pll_output *pout = &pll->out;
 	u8 data;
 
-	data = pin->ssc_adj_period;
+	data = pconf->ssc_adj_period;
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1, data);
-	data = (pin->ssc_adj_period >> 8);
+	data = (pconf->ssc_adj_period >> 8);
 	data &= 0x03;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2, data);
 
-	data = pout->ssc_period;
+	data = pconf->ssc_period;
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER1, data);
-	data = (pout->ssc_period >> 8);
+	data = (pconf->ssc_period >> 8);
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER2, data);
 
-	data = pout->ssc_step_size;
+	data = pconf->ssc_step_size;
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1, data);
-	data = (pout->ssc_step_size >> 8);
+	data = (pconf->ssc_step_size >> 8);
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2, data);
 
-	data = (pin->ssc_center & 0x01);
+	data = (pconf->ssc_center & 0x01);
 	data <<= 1;
 	data |= 0x01; /* enable */
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER, data);
@@ -410,8 +317,7 @@ static void pll_db_commit_ssc(struct dsi_pll_14nm *pll)
 }
 
 static void pll_db_commit_common(struct dsi_pll_14nm *pll,
-				 struct dsi_pll_input *pin,
-				 struct dsi_pll_output *pout)
+				 struct dsi_pll_config *pconf)
 {
 	void __iomem *base = pll->phy->pll_base;
 	u8 data;
@@ -420,55 +326,41 @@ static void pll_db_commit_common(struct dsi_pll_14nm *pll,
 	data = 0;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET, data);
 
-	data = pout->pll_txclk_en;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_TXCLK_EN, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_TXCLK_EN, 1);
 
-	data = pout->pll_resetsm_cntrl;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL, data);
-	data = pout->pll_resetsm_cntrl2;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2, data);
-	data = pout->pll_resetsm_cntrl5;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL, 48);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2, 4 << 3); /* bandgap_timer */
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5, 5); /* pll_wakeup_timer */
 
-	data = pout->pll_vco_div_ref & 0xff;
+	data = pconf->pll_vco_div_ref & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1, data);
-	data = (pout->pll_vco_div_ref >> 8) & 0x3;
+	data = (pconf->pll_vco_div_ref >> 8) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2, data);
 
-	data = pout->pll_kvco_div_ref & 0xff;
+	data = pconf->pll_kvco_div_ref & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1, data);
-	data = (pout->pll_kvco_div_ref >> 8) & 0x3;
+	data = (pconf->pll_kvco_div_ref >> 8) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2, data);
 
-	data = pout->pll_misc1;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_MISC1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_MISC1, 16);
 
-	data = pin->pll_ie_trim;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IE_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IE_TRIM, 4);
 
-	data = pin->pll_ip_trim;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IP_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IP_TRIM, 4);
 
-	data = pin->pll_cpmset_cur << 3 | pin->pll_cpcset_cur;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR, 1 << 3 | 1);
 
-	data = pin->pll_icpcset_p << 3 | pin->pll_icpcset_m;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET, 0 << 3 | 0);
 
-	data = pin->pll_icpmset_p << 3 | pin->pll_icpcset_m;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET, 0 << 3 | 0);
 
-	data = pin->pll_icpmset << 3 | pin->pll_icpcset;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET, 4 << 3 | 4);
 
-	data = pin->pll_lpf_cap2 << 4 | pin->pll_lpf_cap1;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF1, 1 << 4 | 11);
 
-	data = pin->pll_iptat_trim;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM, 7);
 
-	data = pin->pll_c3ctrl | pin->pll_r3ctrl << 4;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL, 1 << 4 | 2);
 }
 
 static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
@@ -489,8 +381,7 @@ static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
 }
 
 static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
-			       struct dsi_pll_input *pin,
-			       struct dsi_pll_output *pout)
+			       struct dsi_pll_config *pconf)
 {
 	void __iomem *base = pll->phy->pll_base;
 	void __iomem *cmn_base = pll->phy->base;
@@ -498,57 +389,64 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
 
 	DBG("DSI%d PLL", pll->phy->id);
 
-	data = pout->cmn_ldo_cntrl;
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, data);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, 0x3c);
 
-	pll_db_commit_common(pll, pin, pout);
+	pll_db_commit_common(pll, pconf);
 
 	pll_14nm_software_reset(pll);
 
-	data = pin->dsiclk_sel; /* set dsiclk_sel = 1  */
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1, data);
+	/* Use the /2 path in Mux */
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1, 1);
 
 	data = 0xff; /* data, clk, pll normal operation */
 	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_0, data);
 
 	/* configure the frequency dependent pll registers */
-	data = pout->dec_start;
+	data = pconf->dec_start;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DEC_START, data);
 
-	data = pout->div_frac_start & 0xff;
+	data = pconf->div_frac_start & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1, data);
-	data = (pout->div_frac_start >> 8) & 0xff;
+	data = (pconf->div_frac_start >> 8) & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2, data);
-	data = (pout->div_frac_start >> 16) & 0xf;
+	data = (pconf->div_frac_start >> 16) & 0xf;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3, data);
 
-	data = pout->plllock_cmp & 0xff;
+	data = pconf->plllock_cmp & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1, data);
 
-	data = (pout->plllock_cmp >> 8) & 0xff;
+	data = (pconf->plllock_cmp >> 8) & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2, data);
 
-	data = (pout->plllock_cmp >> 16) & 0x3;
+	data = (pconf->plllock_cmp >> 16) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3, data);
 
-	data = pin->plllock_cnt << 1 | pin->plllock_rng << 3;
+	data = pconf->plllock_cnt << 1 | 0 << 3; /* plllock_rng */
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN, data);
 
-	data = pout->pll_vco_count & 0xff;
+	data = pconf->pll_vco_count & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT1, data);
-	data = (pout->pll_vco_count >> 8) & 0xff;
+	data = (pconf->pll_vco_count >> 8) & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT2, data);
 
-	data = pout->pll_kvco_count & 0xff;
+	data = pconf->pll_kvco_count & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT1, data);
-	data = (pout->pll_kvco_count >> 8) & 0x3;
+	data = (pconf->pll_kvco_count >> 8) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT2, data);
 
-	data = (pout->pll_postdiv - 1) << 4 | pin->pll_lpf_res1;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV, data);
+	/*
+	 * High nibble configures the post divider internal to the VCO. It's
+	 * fixed to divide by 1 for now.
+	 *
+	 * 0: divided by 1
+	 * 1: divided by 2
+	 * 2: divided by 4
+	 * 3: divided by 8
+	 */
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV, 0 << 4 | 3);
 
-	if (pin->ssc_en)
-		pll_db_commit_ssc(pll);
+	if (pconf->ssc_en)
+		pll_db_commit_ssc(pll, pconf);
 
 	wmb();	/* make sure register committed */
 }
@@ -560,47 +458,32 @@ static int dsi_pll_14nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
-	struct dsi_pll_input *pin = &pll_14nm->in;
-	struct dsi_pll_output *pout = &pll_14nm->out;
+	struct dsi_pll_config conf;
 
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_14nm->phy->id, rate,
 	    parent_rate);
 
-	pll_14nm->vco_current_rate = rate;
-	pll_14nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
-
-	dsi_pll_14nm_input_init(pll_14nm);
-
-	/*
-	 * This configures the post divider internal to the VCO. It's
-	 * fixed to divide by 1 for now.
-	 *
-	 * tx_band = pll_postdiv.
-	 * 0: divided by 1
-	 * 1: divided by 2
-	 * 2: divided by 4
-	 * 3: divided by 8
-	 */
-	pout->pll_postdiv = DSI_PLL_DEFAULT_VCO_POSTDIV;
+	dsi_pll_14nm_config_init(&conf);
+	conf.vco_current_rate = rate;
 
-	pll_14nm_dec_frac_calc(pll_14nm);
+	pll_14nm_dec_frac_calc(pll_14nm, &conf);
 
-	if (pin->ssc_en)
-		pll_14nm_ssc_calc(pll_14nm);
+	if (conf.ssc_en)
+		pll_14nm_ssc_calc(pll_14nm, &conf);
 
-	pll_14nm_calc_vco_count(pll_14nm);
+	pll_14nm_calc_vco_count(pll_14nm, &conf);
 
 	/* commit the slave DSI PLL registers if we're master. Note that we
 	 * don't lock the slave PLL. We just ensure that the PLL/PHY registers
 	 * of the master and slave are identical
 	 */
-	if (pll_14nm->uc == MSM_DSI_PHY_MASTER) {
+	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 
-		pll_db_commit_14nm(pll_14nm_slave, pin, pout);
+		pll_db_commit_14nm(pll_14nm_slave, &conf);
 	}
 
-	pll_db_commit_14nm(pll_14nm, pin, pout);
+	pll_db_commit_14nm(pll_14nm, &conf);
 
 	return 0;
 }
@@ -777,7 +660,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	/* If we're master in dual DSI mode, then the slave PLL's post-dividers
 	 * follow the master's post dividers
 	 */
-	if (pll_14nm->uc == MSM_DSI_PHY_MASTER) {
+	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 		void __iomem *slave_base = pll_14nm_slave->phy->base;
 
@@ -841,7 +724,7 @@ static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
 	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
 
 	/* also restore post-dividers for slave DSI PLL */
-	if (pll_14nm->uc == MSM_DSI_PHY_MASTER) {
+	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 		void __iomem *slave_base = pll_14nm_slave->phy->base;
 
@@ -877,7 +760,6 @@ static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
 	if (bandgap)
 		dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_BANDGAP, bandgap);
 
-	pll_14nm->uc = phy->usecase;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ae42c3f4ea66..98dc6c3083fc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -36,40 +36,21 @@
  */
 
 #define VCO_REF_CLK_RATE		19200000
-
-struct dsi_pll_regs {
-	u32 pll_prop_gain_rate;
-	u32 pll_lockdet_rate;
-	u32 decimal_div_start;
-	u32 frac_div_start_low;
-	u32 frac_div_start_mid;
-	u32 frac_div_start_high;
-	u32 pll_clock_inverters;
-	u32 ssc_stepsize_low;
-	u32 ssc_stepsize_high;
-	u32 ssc_div_per_low;
-	u32 ssc_div_per_high;
-	u32 ssc_adjper_low;
-	u32 ssc_adjper_high;
-	u32 ssc_control;
-};
+#define FRAC_BITS 18
 
 struct dsi_pll_config {
-	u32 ref_freq;
-	bool div_override;
-	u32 output_div;
-	bool ignore_frac;
-	bool disable_prescaler;
 	bool enable_ssc;
 	bool ssc_center;
-	u32 dec_bits;
-	u32 frac_bits;
-	u32 lock_timer;
 	u32 ssc_freq;
 	u32 ssc_offset;
 	u32 ssc_adj_per;
-	u32 thresh_cycles;
-	u32 refclk_cycles;
+
+	/* out */
+	u32 decimal_div_start;
+	u32 frac_div_start;
+	u32 pll_clock_inverters;
+	u32 ssc_stepsize;
+	u32 ssc_div_per;
 };
 
 struct pll_7nm_cached_state {
@@ -85,15 +66,11 @@ struct dsi_pll_7nm {
 
 	struct msm_dsi_phy *phy;
 
-	u64 vco_ref_clk_rate;
 	u64 vco_current_rate;
 
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	struct dsi_pll_config pll_configuration;
-	struct dsi_pll_regs reg_setup;
-
 	struct pll_7nm_cached_state cached_state;
 
 	struct dsi_pll_7nm *slave;
@@ -107,35 +84,20 @@ struct dsi_pll_7nm {
  */
 static struct dsi_pll_7nm *pll_7nm_list[DSI_MAX];
 
-static void dsi_pll_setup_config(struct dsi_pll_7nm *pll)
+static void dsi_pll_setup_config(struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-
-	config->ref_freq = pll->vco_ref_clk_rate;
-	config->output_div = 1;
-	config->dec_bits = 8;
-	config->frac_bits = 18;
-	config->lock_timer = 64;
 	config->ssc_freq = 31500;
 	config->ssc_offset = 4800;
 	config->ssc_adj_per = 2;
-	config->thresh_cycles = 32;
-	config->refclk_cycles = 256;
-
-	config->div_override = false;
-	config->ignore_frac = false;
-	config->disable_prescaler = false;
 
 	/* TODO: ssc enable */
 	config->enable_ssc = false;
 	config->ssc_center = 0;
 }
 
-static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
+static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 fref = VCO_REF_CLK_RATE;
 	u64 pll_freq;
 	u64 divider;
 	u64 dec, dec_multiple;
@@ -144,42 +106,34 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
 
 	pll_freq = pll->vco_current_rate;
 
-	if (config->disable_prescaler)
-		divider = fref;
-	else
-		divider = fref * 2;
+	divider = fref * 2;
 
-	multiplier = 1 << config->frac_bits;
+	multiplier = 1 << FRAC_BITS;
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	div_u64_rem(dec_multiple, multiplier, &frac);
 
 	dec = div_u64(dec_multiple, multiplier);
 
 	if (pll->phy->cfg->type != MSM_DSI_PHY_7NM_V4_1)
-		regs->pll_clock_inverters = 0x28;
+		config->pll_clock_inverters = 0x28;
 	else if (pll_freq <= 1000000000ULL)
-		regs->pll_clock_inverters = 0xa0;
+		config->pll_clock_inverters = 0xa0;
 	else if (pll_freq <= 2500000000ULL)
-		regs->pll_clock_inverters = 0x20;
+		config->pll_clock_inverters = 0x20;
 	else if (pll_freq <= 3020000000ULL)
-		regs->pll_clock_inverters = 0x00;
+		config->pll_clock_inverters = 0x00;
 	else
-		regs->pll_clock_inverters = 0x40;
+		config->pll_clock_inverters = 0x40;
 
-	regs->pll_lockdet_rate = config->lock_timer;
-	regs->decimal_div_start = dec;
-	regs->frac_div_start_low = (frac & 0xff);
-	regs->frac_div_start_mid = (frac & 0xff00) >> 8;
-	regs->frac_div_start_high = (frac & 0x30000) >> 16;
+	config->decimal_div_start = dec;
+	config->frac_div_start = frac;
 }
 
 #define SSC_CENTER		BIT(0)
 #define SSC_EN			BIT(1)
 
-static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll)
+static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 	u32 ssc_per;
 	u32 ssc_mod;
 	u64 ssc_step_size;
@@ -190,58 +144,49 @@ static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll)
 		return;
 	}
 
-	ssc_per = DIV_ROUND_CLOSEST(config->ref_freq, config->ssc_freq) / 2 - 1;
+	ssc_per = DIV_ROUND_CLOSEST(VCO_REF_CLK_RATE, config->ssc_freq) / 2 - 1;
 	ssc_mod = (ssc_per + 1) % (config->ssc_adj_per + 1);
 	ssc_per -= ssc_mod;
 
-	frac = regs->frac_div_start_low |
-			(regs->frac_div_start_mid << 8) |
-			(regs->frac_div_start_high << 16);
-	ssc_step_size = regs->decimal_div_start;
-	ssc_step_size *= (1 << config->frac_bits);
+	frac = config->frac_div_start;
+	ssc_step_size = config->decimal_div_start;
+	ssc_step_size *= (1 << FRAC_BITS);
 	ssc_step_size += frac;
 	ssc_step_size *= config->ssc_offset;
 	ssc_step_size *= (config->ssc_adj_per + 1);
 	ssc_step_size = div_u64(ssc_step_size, (ssc_per + 1));
 	ssc_step_size = DIV_ROUND_CLOSEST_ULL(ssc_step_size, 1000000);
 
-	regs->ssc_div_per_low = ssc_per & 0xFF;
-	regs->ssc_div_per_high = (ssc_per & 0xFF00) >> 8;
-	regs->ssc_stepsize_low = (u32)(ssc_step_size & 0xFF);
-	regs->ssc_stepsize_high = (u32)((ssc_step_size & 0xFF00) >> 8);
-	regs->ssc_adjper_low = config->ssc_adj_per & 0xFF;
-	regs->ssc_adjper_high = (config->ssc_adj_per & 0xFF00) >> 8;
-
-	regs->ssc_control = config->ssc_center ? SSC_CENTER : 0;
+	config->ssc_div_per = ssc_per;
+	config->ssc_stepsize = ssc_step_size;
 
 	pr_debug("SCC: Dec:%d, frac:%llu, frac_bits:%d\n",
-		 regs->decimal_div_start, frac, config->frac_bits);
+		 config->decimal_div_start, frac, FRAC_BITS);
 	pr_debug("SSC: div_per:0x%X, stepsize:0x%X, adjper:0x%X\n",
 		 ssc_per, (u32)ssc_step_size, config->ssc_adj_per);
 }
 
-static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll)
+static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 
-	if (pll->pll_configuration.enable_ssc) {
+	if (config->enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			  regs->ssc_stepsize_low);
+			  config->ssc_stepsize & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			  regs->ssc_stepsize_high);
+			  config->ssc_stepsize >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			  regs->ssc_div_per_low);
+			  config->ssc_div_per & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			  regs->ssc_div_per_high);
+			  config->ssc_div_per >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1,
-			  regs->ssc_adjper_low);
+			  config->ssc_adj_per & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1,
-			  regs->ssc_adjper_high);
+			  config->ssc_adj_per >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL,
-			  SSC_EN | regs->ssc_control);
+			  SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
 	}
 }
 
@@ -293,44 +238,46 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	}
 }
 
-static void dsi_pll_commit(struct dsi_pll_7nm *pll)
+static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *reg = &pll->reg_setup;
 
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, reg->decimal_div_start);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, config->decimal_div_start);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1,
+		  config->frac_div_start & 0xff);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1,
+		  (config->frac_div_start & 0xff00) >> 8);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
+		  (config->frac_div_start & 0x30000) >> 16);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, config->pll_clock_inverters);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
+	struct dsi_pll_config config;
 
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
 	    parent_rate);
 
 	pll_7nm->vco_current_rate = rate;
-	pll_7nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
 
-	dsi_pll_setup_config(pll_7nm);
+	dsi_pll_setup_config(&config);
 
-	dsi_pll_calc_dec_frac(pll_7nm);
+	dsi_pll_calc_dec_frac(pll_7nm, &config);
 
-	dsi_pll_calc_ssc(pll_7nm);
+	dsi_pll_calc_ssc(pll_7nm, &config);
 
-	dsi_pll_commit(pll_7nm);
+	dsi_pll_commit(pll_7nm, &config);
 
 	dsi_pll_config_hzindep_reg(pll_7nm);
 
-	dsi_pll_ssc_commit(pll_7nm);
+	dsi_pll_ssc_commit(pll_7nm, &config);
 
 	/* flush, ensure all register writes are done*/
 	wmb();
@@ -484,7 +431,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 	void __iomem *base = pll_7nm->phy->pll_base;
-	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
+	u64 ref_clk = VCO_REF_CLK_RATE;
 	u64 vco_rate = 0x0;
 	u64 multiplier;
 	u32 frac;
@@ -587,7 +534,7 @@ static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_mux;
 	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw, pll_7nm->vco_current_rate, VCO_REF_CLK_RATE);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_7nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
-- 
2.30.0

