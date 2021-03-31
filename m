Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244BB34FEB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235148AbhCaK6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbhCaK5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:57:54 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19ABC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:53 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id r20so23327253ljk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2BFbZkO/BIpt0L8p4e5FuhdeXR7JXR15V9w6Ttpy8Pw=;
        b=U8UzpcXyLZUHvYbdwEKQlnZu4Cm9nBwaBxsG17WtdTrmYrEbFY4LCB24CeiV8v02aZ
         MGs/Mwcn64lolJJ88zuIjFX+IQAVC8aqnBYq1Bi9XB7QAxxHRTL9c5Bh+9dP2Sml5WKM
         nfYG0db8Y+vtOfbY+XZVkR3olzlfzvlMdwmsn6SKB+g4eHN+OK6WumJnOcdC+x17tvh2
         JjurwuWIu2HD0YCEFj7RLpy6lqmUFVwtHUwZuli+3aXzrBXVPd+vZTPmgtyfbx3W90AA
         Bg4hIFSsN2izs8mxKZULdOnr/gofoSFB83NWg6xdD42dRanoPeYfcbHqXkFHJ4T9MGCU
         tE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2BFbZkO/BIpt0L8p4e5FuhdeXR7JXR15V9w6Ttpy8Pw=;
        b=lA8FaQ9aw6vN2jsXamh5uGgXOuzp8yEYfV3hYUqWERZ0jxoGpEujNFWp5ABPQaOcEs
         eexYYnNgVm4edp6MuMyNPrQ9GrBaX2yZu5LZdUOJNLnpp6si7gT6in9yvaJSuRrRZTSr
         zuQHV8yqVdCMZPsRxsW8iqNBHqpeLIgnvN9YVliuNKDeRE3t8TWwjiyT2M0Ev8K5iMUd
         al/bnfhBcD3W8SoYurd40KAlkPO9btxzWeqQ/5giS7ndP9RPcpOW9f7OrTAplAwcCTdj
         mmSlkIAUK033VxPaD1csteoz5bPm/qkR/8Q0QdhgwWQIayudVa4FETqzPxQZ7y8w+tnH
         5Nxg==
X-Gm-Message-State: AOAM532UO1oAJ9BhbIK60M0ARrT474IsDpGLJ0Xnp6lDY1lyy/6GCXn8
        ql2vKBO/Q8JtZrEaknRcMiPPlQ==
X-Google-Smtp-Source: ABdhPJw60AHZ9U0TzYDLlbv2XIweB0mj51cTXtKhwZAesX+U5sRaiEGy6pRATddfcFt/ce/6+oKJYA==
X-Received: by 2002:a2e:81c9:: with SMTP id s9mr1711798ljg.366.1617188272266;
        Wed, 31 Mar 2021 03:57:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 17/24] drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
Date:   Wed, 31 Mar 2021 13:57:28 +0300
Message-Id: <20210331105735.3690009-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make save_state/restore callbacks accept struct msm_dsi_phy rather than
struct msm_dsi_pll. This moves them to struct msm_dsi_phy_ops, allowing
us to drop struct msm_dsi_pll_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 12 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         | 11 +++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 24 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 24 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 34 ++++++++-----------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 18 +++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 24 ++++++-------
 7 files changed, 64 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index a1360e2dad3b..2c5ccead3baa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -858,9 +858,9 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
 {
-	if (phy->cfg->pll_ops.save_state) {
-		phy->cfg->pll_ops.save_state(phy->pll);
-		phy->pll->state_saved = true;
+	if (phy->cfg->ops.save_pll_state) {
+		phy->cfg->ops.save_pll_state(phy);
+		phy->state_saved = true;
 	}
 }
 
@@ -868,12 +868,12 @@ int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	int ret;
 
-	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
-		ret = phy->cfg->pll_ops.restore_state(phy->pll);
+	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
+		ret = phy->cfg->ops.restore_pll_state(phy);
 		if (ret)
 			return ret;
 
-		phy->pll->state_saved = false;
+		phy->state_saved = false;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b477d21804c8..0b51828c3146 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -17,7 +17,6 @@
 struct msm_dsi_pll {
 	struct clk_hw	clk_hw;
 	bool		pll_on;
-	bool		state_saved;
 
 	const struct msm_dsi_phy_cfg *cfg;
 };
@@ -29,17 +28,13 @@ struct msm_dsi_phy_ops {
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
 			struct msm_dsi_phy_clk_request *clk_req);
 	void (*disable)(struct msm_dsi_phy *phy);
-};
-
-struct msm_dsi_pll_ops {
-	void (*save_state)(struct msm_dsi_pll *pll);
-	int (*restore_state)(struct msm_dsi_pll *pll);
+	void (*save_pll_state)(struct msm_dsi_phy *phy);
+	int (*restore_pll_state)(struct msm_dsi_phy *phy);
 };
 
 struct msm_dsi_phy_cfg {
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
-	const struct msm_dsi_pll_ops pll_ops;
 
 	unsigned long	min_pll_rate;
 	unsigned long	max_pll_rate;
@@ -115,6 +110,8 @@ struct msm_dsi_phy {
 	struct msm_dsi_pll *pll;
 
 	struct clk_hw_onecell_data *provided_clocks;
+
+	bool state_saved;
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 91ae0f8dbd88..fefff08f83fd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -518,9 +518,9 @@ static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
  * PLL Callbacks
  */
 
-static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_10nm_pll_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
@@ -541,9 +541,9 @@ static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
-static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_10nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 val;
@@ -562,7 +562,9 @@ static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_10nm_vco_set_rate(&pll->clk_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
+	ret = dsi_pll_10nm_vco_set_rate(&phy->pll->clk_hw,
+			pll_10nm->vco_current_rate,
+			pll_10nm->vco_ref_clk_rate);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
@@ -1005,10 +1007,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_10nm_save_state,
-		.restore_state = dsi_pll_10nm_restore_state,
+		.save_pll_state = dsi_10nm_pll_save_state,
+		.restore_pll_state = dsi_10nm_pll_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1029,10 +1029,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_10nm_save_state,
-		.restore_state = dsi_pll_10nm_restore_state,
+		.save_pll_state = dsi_10nm_pll_save_state,
+		.restore_pll_state = dsi_10nm_pll_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 91c5bb2fd169..fb22c4b1b765 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -795,9 +795,9 @@ static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
  * PLL Callbacks
  */
 
-static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_14nm_pll_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
 	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
 	u32 data;
@@ -810,18 +810,18 @@ static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
 	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 }
 
-static int dsi_pll_14nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_14nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
 	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
 	u32 data;
 	int ret;
 
-	ret = dsi_pll_14nm_vco_set_rate(&pll->clk_hw,
+	ret = dsi_pll_14nm_vco_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_14nm->pdev->dev,
@@ -1166,10 +1166,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_14nm_save_state,
-		.restore_state = dsi_pll_14nm_restore_state,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -1190,10 +1188,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_14nm_save_state,
-		.restore_state = dsi_pll_14nm_restore_state,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 20b31398b540..e589ec8f4cc8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -470,9 +470,9 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
  * PLL Callbacks
  */
 
-static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 
@@ -481,20 +481,20 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
 	cached_state->byte_mux = pll_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
-	if (dsi_pll_28nm_clk_is_enabled(&pll->clk_hw))
-		cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	if (dsi_pll_28nm_clk_is_enabled(&phy->pll->clk_hw))
+		cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 	else
 		cached_state->vco_rate = 0;
 }
 
-static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 	int ret;
 
-	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
+	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
@@ -527,7 +527,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 
 	DBG("%d", pll_28nm->id);
 
-	if (pll_28nm->base.cfg->type == MSM_DSI_PHY_28NM_LP)
+	if (pll_28nm->base.cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
 	else
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
@@ -783,10 +783,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -807,10 +805,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -831,10 +827,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 952444e3e8f0..1e35971b7132 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -334,9 +334,9 @@ static const struct clk_ops clk_bytediv_ops = {
 /*
  * PLL Callbacks
  */
-static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 
@@ -347,17 +347,17 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 }
 
-static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 	int ret;
 
-	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
+	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
@@ -662,10 +662,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_8960_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 321d23b3ed18..8ac57f907ed3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -543,9 +543,9 @@ static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
  * PLL Callbacks
  */
 
-static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
@@ -566,9 +566,9 @@ static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
-static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 val;
@@ -587,7 +587,9 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	ret = dsi_pll_7nm_vco_set_rate(&phy->pll->clk_hw,
+			pll_7nm->vco_current_rate,
+			pll_7nm->vco_ref_clk_rate);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
@@ -1038,10 +1040,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_7nm_save_state,
-		.restore_state = dsi_pll_7nm_restore_state,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
@@ -1063,10 +1063,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_7nm_save_state,
-		.restore_state = dsi_pll_7nm_restore_state,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
-- 
2.30.2

