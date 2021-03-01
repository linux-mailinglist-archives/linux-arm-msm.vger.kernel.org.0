Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C345632A114
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344320AbhCBEtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238960AbhCAXaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:30:00 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AD2C06121F
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:21 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id v5so28274297lft.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JAiLNEaAzcPuqvlTiRJz3t8GX2kF4dWHJhKN7UtiXiU=;
        b=rz3Ya1spM4psQUG9LFIvNyBfuMpl9QQGRdz7zhWnzdziJrs4wq0mhiotMOMD9nlGL0
         ZgvbkFcQJT+rP0KJgbQStAWgATJ72//e6i84hhrSl6hvAOpzxe6OuWIrq25xHNPFqqsZ
         5FWC1HLg+hyUpfkYnMJymrhIpT5tTR0lPxMgeflYisDx2gGDO08QqR0Z6SzTXe8Y63mo
         Faw+WZt/HGv8r1/TEwl4mB6hubxTM4yJL4gSVitbNjiwudLMg/09uJsGyNEujNe8eo95
         J2K1mkIN7RDtCQYV/EnOA3XgM4BKyC+RCcPiwZb72nsY9wtHt3DPSre0/xJiWW5rS5Ye
         ZXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JAiLNEaAzcPuqvlTiRJz3t8GX2kF4dWHJhKN7UtiXiU=;
        b=XGoXNLMolWECEz6S3GOO2Xw7WZDeyUlGug+l2KHpvL7kLloloC//lGiO+Hnm/TJBfa
         PnN83dAmk9UhUBDJU0Rkx7tMgRX8FsZWGSZvYw7cU5kzkiwNKohYx/hFgPOmFMvjO4Od
         CaWbBb1MX/rijbrVt7F5GyX6DhZ/uMIxZ3YSleUNL3NufbQmW+0X21kwovBkjFhZb/ZL
         724mqS/vSA7Vkekb4Pv+PCbZP7Fyomf5ctIr98CHIU/ML6qt//B4NYBLaf7bfs2O1ZVF
         Cz7AEK9+EPbkauF4iJoq50LNmP3hClgUtLWSup52772r2r0p3825gvgzpCMES4VkmPxv
         lBkA==
X-Gm-Message-State: AOAM532RO1mFF/6UBDnFZLYcAG7/OPFiJ/0y+R7I7PBrTxp5mWR09YLi
        reW0qJbhLBWo5JwbtTJFbNrL/w==
X-Google-Smtp-Source: ABdhPJyDz/biJ/9718dOb/JLJ7cffuer/wHwmXiNks3WMdtv9ogPRL4nw+L+myhqUTMbfIPWFMFKBw==
X-Received: by 2002:a05:6512:3226:: with SMTP id f6mr10303868lfe.171.1614641179566;
        Mon, 01 Mar 2021 15:26:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 15/24] drm/msm/dsi: limit vco_delay to 28nm PHY
Date:   Tue,  2 Mar 2021 02:24:58 +0300
Message-Id: <20210301232506.3057401-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Only 28nm PHY requires sleeping during the VCO rate setting procedure.
Rewrite sleeping for 28nm and drop vco_delay from the rest of PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |  3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |  4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 10 ++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |  3 ---
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 81ca0cf2a3ad..7533db8955a5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -96,7 +96,6 @@ struct dsi_pll_10nm {
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -768,8 +767,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_10nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_10nm->vco_delay = 1;
-
 	ret = pll_10nm_register(pll_10nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index c531ddf26521..023727623847 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -122,8 +122,6 @@ struct dsi_pll_14nm {
 	void __iomem *phy_cmn_mmio;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct dsi_pll_input in;
 	struct dsi_pll_output out;
 
@@ -1012,8 +1010,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_14nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_14nm->vco_delay = 1;
-
 	ret = pll_14nm_register(pll_14nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index fa96bfc21fdb..e77b21f0d3bf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -69,8 +69,6 @@ struct dsi_pll_28nm {
 	struct platform_device *pdev;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -209,8 +207,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->vco_delay)
-		udelay(pll_28nm->vco_delay);
+	if (pll->cfg->type == MSM_DSI_PHY_28NM_HPM)
+		udelay(1);
+	else /* LP */
+		udelay(1000);
 
 	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -576,7 +576,6 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll_28nm->vco_delay = 1;
 
 	pll->cfg = phy->cfg;
 
@@ -616,7 +615,6 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll_28nm->vco_delay = 1000;
 
 	pll->cfg = phy->cfg;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c6f0aca66fa9..d3fea4a2b498 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -96,7 +96,6 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -793,8 +792,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_7nm->vco_delay = 1;
-
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-- 
2.30.0

