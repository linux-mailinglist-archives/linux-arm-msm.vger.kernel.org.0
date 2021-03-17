Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413D033F37C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhCQOlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhCQOk7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66D8C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u20so3426241lja.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69KNFaVrTSr7S1ZZcdnbCwBqT6v2VtM4VG8+YzYsLCk=;
        b=rEqPe1YOskPqXoX+oSNqmbu3NcGqON3WXT0vUrO0nKdnc/UP9DlNDvIBDqGS40Kzqh
         sZwvfOwrj7+eH47Z/nWmYm0wGDQu4jTSc0vuhVbzsPib53VVW2YtgVmH1iEnIYNBiUcv
         16mJvEbNKpjkLmsIqgGw953ItPHV9TMinyV+sI/gRqaBDZRWzadlSHiOFZoBKvrmhb7w
         WLyT3KK1xyRWCcaFrGMKSNEdE5U24ANm1LOhvUpRLUw/0MikxpJzluBn1ddCksPZrOa/
         DKpzWoYAp1fe9b0GSpgOL5T8iOk6oUxTHh0JHQ2sZy5LJ1CryOBrlanGeVt7QY+8rm5N
         QLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69KNFaVrTSr7S1ZZcdnbCwBqT6v2VtM4VG8+YzYsLCk=;
        b=SYjH75Cy0arpjw+sfiuR4szWOfv2C4RUgvu5zoMRfY7gflfpt70fgxy4ftTKV3BQx4
         H34e8iwKVAsNXE/qB7sYfA8O1KLzVxIRe9O1z5qcM1/87ksifTpNyxd3RzGU0VjD/QnN
         r1QdufjjQYS9BIogSkSbgrik8L2rUa5q0ufYsAbHMjyfKUstRUxkxsFefk2HaaRCHCNw
         Wcr9chYmsfK6sbQGLNrb5nUJSRNoKDfIvSKepqaHR5CjPe3EY/Gw+tmBZqTmOhIms0s/
         h/59g61k4XsIMbj3+hIquE6YEvwRltsicf/FnszWRC04OJQcrzZQxfJ5wjBefJjPmV5e
         yXzg==
X-Gm-Message-State: AOAM5326UpSs73/oQLc4bdnm0hKD9qoxpbvFxw4Kpcbdl1kpv8Mpu9b1
        HapGlJY5XwkUIyg7Q1Txw+fUNNjPUgQJOw==
X-Google-Smtp-Source: ABdhPJzW6HqYXbe0dc5bBaYJey1PE1XkHpQCvQt5qycNCjJYjMggZw++WMrvCE9y1+eJ6C40auP6tA==
X-Received: by 2002:a2e:b817:: with SMTP id u23mr2579427ljo.44.1615992057419;
        Wed, 17 Mar 2021 07:40:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 16/26] drm/msm/dsi: limit vco_delay to 28nm PHY
Date:   Wed, 17 Mar 2021 17:40:29 +0300
Message-Id: <20210317144039.556409-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
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
2.30.2

