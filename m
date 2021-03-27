Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7C634B67D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 12:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhC0LD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 07:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhC0LD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 07:03:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D07C0613B8
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:24 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b14so11489208lfv.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6SPcQ3rOU1M+d5rn+hxpcarF5MAsSjTj9sicv1mJgY=;
        b=huNFz/oEwPOiR79RlXRp6FuOWGcy8j0Ng1Faq2cBsCpo5fq6ZnSn2F/O0SeNeIKUOg
         RBSDZnaCyjnfNekNc3dDCSu2P8iNSmFAShqivCcum59kA5QLt5hPFx2F+qV/LLzAC55N
         XPNI+vwcDMNzbklzkd3Z37QYoQdeTzq86f197uzFF1pDc6yzVAKdv+bYGc5cRwlnnR6B
         keTMiMj5vLut+Zm/T1oTXid+mmhOEhTtbwVvfAF9DlrFkCIVgnnbqpZguqYn9sJ39v96
         0SrH3cvMKYIRSuaNBSeGqpqodclI4JQex+NVeRAPf0L/TIewM0MGtjcwlcmSqbVLlX/f
         +Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6SPcQ3rOU1M+d5rn+hxpcarF5MAsSjTj9sicv1mJgY=;
        b=Xym/FnRPIWPp80waTnYG4fUKB+jdXebl/Rv6XwmHPpjbW2d568YljgNZibX7Jdajuz
         Yy6EdsHCqhJodxjSWNhbbAB/Caaoj7YnVTxdL89aH3wwMCdHsF+LOqV569r5YzA6h2r0
         2As2AfBKrLU89LdA5Q5iRWMUfpT0MyXZtupsWAzxJGKC9OJCFrQnCgjujGoQOPM4vopx
         puCyB5N3uTFfLiFlINL858AIFb//3LjtT/MQ2nttfQxl5GNXDEXJi+k98tSOqbEBZODx
         DXgo+hWkdiwcLTZ7c7NIyleuAzD1dz3FeSVf+z20thxk2x81yLkWpKbceaCRioWunZRA
         gzbg==
X-Gm-Message-State: AOAM531w5bcfeDjGxNtat+WuGh8fVFh8WU7bN+DpEjO6XGeDObxrZ11N
        YHCiJZGLWqaTIVD0ddDSXyqaCQ==
X-Google-Smtp-Source: ABdhPJyny2FRmPgYfygPAX1Zzc4mSw6F0GUvwVL4W9YKGq5d2gD3cyLxjX77w1gyUoAjDlB/TaBZIw==
X-Received: by 2002:a19:521a:: with SMTP id m26mr11170274lfb.56.1616843003378;
        Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 15/25] drm/msm/dsi: drop vco_delay setting from 7nm, 10nm, 14nm drivers
Date:   Sat, 27 Mar 2021 14:02:55 +0300
Message-Id: <20210327110305.3289784-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
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

