Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAAC34FEB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbhCaK6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235153AbhCaK5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:57:52 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C714BC061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m12so28490602lfq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=24LsF/6oW5HLhGbrMso4ghJ48YFWrYItlbxPNj/3ct8=;
        b=FI41BkrGLO4q6rZieS2DNj6k81jGZNIMnT/IPSCmqhtdmbO7wiS47zzDSPUB238Dca
         799v+OB9oylpukfAOOEXaot0DX/ah9WDKdmoASvLHkqOOHP52Bs0cBAANNFDygYwRJI0
         2shPNB6V3Z1nIJYHhR7dKNUI80kGZ54q65+OtTVjSxep8nNoV5TBqgfICScnOjc3zDUU
         6H+AilVOMVyV0ccDK+f1ERBFcKZeVKGtysK5aYZUMK+ZkxYIU2ypYS+Wix2o/WPVl+U+
         8oNNBy9dg5l84KLbn0WE+9UERVdjqkgrInLAAE/OBFdjV5P6IHBI+pKI2mLS2SwRimCb
         hhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=24LsF/6oW5HLhGbrMso4ghJ48YFWrYItlbxPNj/3ct8=;
        b=mlB1tIWCPAHiFlFJj6EnLPC42BR2qtx8b2ixAt9Sl4/di3N2sJKwG9agIh227iHIey
         iQ5QS28W9Bgpg8v+nfrPD+wbnAhRhG/l/7n9eaC6uH2io9BTSQsAHXAn+F4UlP/0YDjD
         PFqCGV5wyhAadmX9QPgLA+g6Jmq2MdV6AFaVszFy1zKghin8nJwdRktR5bRH8vbHSC8W
         8yruDxGft8rSG/jMg9Y1GWzOyi1eDrDFfZdPFMNy0FZHYSCQMj6nJwRTGLzkGjguoY9Q
         T9iN41deGSUMXAmf7YmA2xHxR8dMoazHKhsPSEa0ci8FZfS/xHEnAsIfZI1a7AN9zpl6
         l6pw==
X-Gm-Message-State: AOAM533FWA3jXhaZ9+MqvubNyRLzdYywbHslNoD6Lc0vPLpEhyHoxBIf
        Wsz9EqwolnprZSpMDByqtO1p1A==
X-Google-Smtp-Source: ABdhPJwXXeCYYRDmlGZqRDma+CSssOi6hZviTr7hkFQpI+vSdKCVp/3tvA5SRf9MtUaPtgiGinbcGg==
X-Received: by 2002:a19:8c19:: with SMTP id o25mr1883820lfd.547.1617188270370;
        Wed, 31 Mar 2021 03:57:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 15/24] drm/msm/dsi: simplify vco_delay handling in dsi_phy_28nm driver
Date:   Wed, 31 Mar 2021 13:57:26 +0300
Message-Id: <20210331105735.3690009-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of setting the variable and then using it just in the one place,
determine vco_delay directly at the PLL configuration time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 3e9b7949b038..ed369eb18e9d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -72,8 +72,6 @@ struct dsi_pll_28nm {
 	struct platform_device *pdev;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -212,8 +210,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->vco_delay)
-		udelay(pll_28nm->vco_delay);
+	if (pll->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
+		udelay(1000);
+	else
+		udelay(1);
 
 	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -580,10 +580,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 
 	pll = &pll_28nm->base;
 	pll->cfg = phy->cfg;
-	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
-		pll_28nm->vco_delay = 1000;
-	else
-		pll_28nm->vco_delay = 1;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
-- 
2.30.2

