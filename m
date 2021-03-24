Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EE2347C50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236599AbhCXPUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbhCXPTt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E20C0613AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b4so8596406lfi.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6SPcQ3rOU1M+d5rn+hxpcarF5MAsSjTj9sicv1mJgY=;
        b=kVQxFEwRg/dLwRA58uX0wgY9+ikO6I2UA9DHxCfFo2gRFYG0owX0OUSrEMtOo8pOlO
         YZc9oYXf+9Nlu2uogQA+wpGjtEHv1e4QD+C+YgoAXURFYCKEBf7EXBEowNXfZyppIAiZ
         FZiJpDLqukFDohpKCosas6TSGGK2jyaEGcLNKTWqTYPIeLWvNMirdOnZboEcjqBsuLyY
         ilGeOL8pP9LS+Blb7ClnjzEJ8OULdBtN7tQTiCcttd4iSX2FnOCqh5K8aj7jxKmU3pkT
         UUacUqhM/Mk4kDOfHU03yp8Ee0aUadPfW1w5rdq0b9xFcbE7lcV08JK+Vz0C/7eIXFed
         zcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6SPcQ3rOU1M+d5rn+hxpcarF5MAsSjTj9sicv1mJgY=;
        b=Z7bhlE6z4x24IrWHMMGxlzcMZqsz+qrsQu/2WieIb8U7GH8d2iqOiTr0d0r7+o+x6V
         v+VA7dQl1v2cXw2X4lp/DHcM1Kv0K41BHgX8+FeCwqwZPwDUd5RMcblAcUoZTH516HFn
         fwWkb4M3IokTPoFE5zF1jg1X3QFgFYm6ORkEuY/9paMUBeMSonoT65PtFMDqDdSkODOO
         kk5PZEyKZ716rCpnCaAu/bCcBNS7/NT51zmuC54d/DmceFne+dgpD3lkABhX4FBOaNl2
         Clmg5lQb9vgI16g1xAukYJJcbMWje5UPeAudySSV/EMI89ajZ298BSRA86rmLxGUhRE5
         E5Tw==
X-Gm-Message-State: AOAM530CCo1T2ebOQRNedYPBuCAxhcJG3ZUq03q8X0oS0teK24J4/+Np
        JpTeCzAZ8q74L0Z7g48EZf9f6Q==
X-Google-Smtp-Source: ABdhPJwzmimYaoGWeEMF8ZgYD7XosKMIpaR9EQokHoWDQhPnU7SUoEiySGwZ6wOc6ujBLuru/0LbuQ==
X-Received: by 2002:a19:ef02:: with SMTP id n2mr2206276lfh.141.1616599171146;
        Wed, 24 Mar 2021 08:19:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 18/28] drm/msm/dsi: drop vco_delay setting from 7nm, 10nm, 14nm drivers
Date:   Wed, 24 Mar 2021 18:18:36 +0300
Message-Id: <20210324151846.2774204-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These drivers do not use vco_delay variable, so drop it from all of
them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index e0df12a841b2..bfb96d87d1d7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -99,7 +99,6 @@ struct dsi_pll_10nm {
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -771,8 +770,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_10nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_10nm->vco_delay = 1;
-
 	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 7fe7c8348b42..434d02ffa7fe 100644
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
 	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e6c8040e1bd3..f760904efac9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -99,7 +99,6 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -796,8 +795,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_7nm->vco_delay = 1;
-
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-- 
2.30.2

