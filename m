Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF671347C5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236525AbhCXPUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236558AbhCXPTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:50 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6E2C0613AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q29so32368269lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFHW0LdlrmaF7YDk0vokBt8XF/nut54+Ls9k+Au93LE=;
        b=znoqwLJm7izb5lBmvfQwSvrc7kAZkwlBIOkIwe1r2FpSKUwHYcNd2RvOtQBv6rjHes
         idvTjUKowrFuKSzrhG6PTGe55Ftzt/KlSBbbsAYEhSNYfYL7DuGeV3Co1ak+2rlZtuGq
         u/53FicoWS8BniYtKaiPTNj1qvuO2hjzj5iNJVqxelDgGT7KwWMZWAP9biyyWEkjPYl1
         XsCOz0nQfNaBe3oN0/wI5tYgkyu/k0RO+07V4WOT3Dpa79QLxUG2cNuPIMpBSSfljBdQ
         7/doPKIxu+z//vNI/5vVkaYIi5RmBhggCZzSscdDEJ6pv3SXyHuxko/n4wuKffA2fePS
         t/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFHW0LdlrmaF7YDk0vokBt8XF/nut54+Ls9k+Au93LE=;
        b=YpwhrtDhHgtsalo3tYAKLutcdpYLPmVOy6DVU5ef1uOUTrEPwkhDPzIkxN5jLOjs2/
         cM/zKSONshacsUVHcRzlOWRyQu4AGGUUlHwjg8FCor+ygqwEcBZRgk8ATeqG3szgAm3A
         6+NO5yPJ3XIosHP8j/W0fCqwJW4LwUUZjLMlfK9S4AIMfcniQquksZ4HNdyo982g8Wug
         p4gX18R2/ZF06JekhhyTtPrhjs+vIvFZRa1qyfnZJ+MNrbz1sGn/Q2xDMbEL1GmCeDLZ
         AKmKgbEa+WrCEZdTGUQI6kxxz5x9ar8hctZjrtD2yUtG40qBCOQyNeITC1Bdc+pLL0je
         2wLg==
X-Gm-Message-State: AOAM5302jRwDLQnqDLqDFdz9sVsUjIyCaiWT6phdypl47Hjb0NL8Suxa
        Dd5khfhnc5QRT4O87vmnn6CJSw==
X-Google-Smtp-Source: ABdhPJzWQcwJvCfTtwbapc57LbykfrinjAf0yupRWqNHinRXX5Af6AkUjr8v2aftNoYW6OjSTLrQ1w==
X-Received: by 2002:ac2:5146:: with SMTP id q6mr2347257lfd.441.1616599172213;
        Wed, 24 Mar 2021 08:19:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 19/28] drm/msm/dpu: simplify vco_delay handling in dsi_phy_28nm driver
Date:   Wed, 24 Mar 2021 18:18:37 +0300
Message-Id: <20210324151846.2774204-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of setting the variable and then using it just in the one place,
determine vco_delay directly at the PLL configuration time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 3e9b7949b038..87d1aa4114e4 100644
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
+	if (pll->cfg->type == MSM_DSI_PHY_28NM_HPM)
+		udelay(1);
+	else /* LP */
+		udelay(1000);
 
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

