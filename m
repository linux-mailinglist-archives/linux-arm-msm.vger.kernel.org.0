Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE61347C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbhCXPUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236578AbhCXPTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:38 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDF6C061793
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:22 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u4so30676283ljo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zd6cvJ3+XU4QkBwijy37jRcuA9f/DooPKIPSb6ns/58=;
        b=T8Ms+03lwMnoEbvtcKLdULxswKsmdA9EtBfrVDzaBjZSt2elmj3Uc8pdvwGskq9j6x
         TERE30MqqUO1cZjVb4ta3kDlTjGHufstcaC4C8iENrbWjqr0AxMrtC2XTpH639rKZAsf
         K7LqBoRFhAT5FbJCeARusb08mPL+d1mKOE6Tzn6a/HA0yRtXJBFkti5vfqEVVAnLhHeC
         UKc+JGLbYJFYdjbCUrWKXNR2MKo0KgSKqO12t1KTlhyfxcJem0uXcCfrKdT3ODscVdgb
         9D34IkiNEuvTxfJb3lpm1dCbhXgUm5PFLfTP5tO5cFuiJYDs6ElyRRPkULqcxy5pgI9z
         dl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zd6cvJ3+XU4QkBwijy37jRcuA9f/DooPKIPSb6ns/58=;
        b=n5Gt8IuoHfW8BenAlHfMCUupdlhOdR6iRtb1X0flSTEP0fQpN4sSGxS0NdY4ArRDaT
         DZ9y3o9up0h0i2WT9wkgCnPu7glvMiKRotoAGobgl0TXOAd3lmE89a2fd88I6QEqeBU4
         T1BZqdmdn1Rw6Zt9BCc+tXzQBEBEUbzuIzlmV4kog7B3qeI+HzTiglfMtYhIa0SiK/zg
         LTQKMJ4yNtPhKeyXx4tDC3WxU4zlGuUHnUEuBpRLQI+I0ymY3QFW+VcL++/RXnmVp74W
         +blh3YqKvdKpKNhvQEv4LZ9xr1kuFfKv3my/f6k6cpJgzOLi5fxSUOCXE1zvMkHRyvEW
         8Gmg==
X-Gm-Message-State: AOAM532BCM/aANsl1vwCO7r36NsMbQTAhYAq4+L0npWGLo/zmx6Ckfsr
        rLLoy9HvNH6DSx7z+TB5pskZeQ==
X-Google-Smtp-Source: ABdhPJx1Kesb1YWTgSeQmMb28IyqvaSbIFmUIh0wvcGr6ccvI+D7Kgc2zjvZkEDkNpTCDJ84CVP+Kg==
X-Received: by 2002:a2e:509:: with SMTP id 9mr2493424ljf.170.1616599161208;
        Wed, 24 Mar 2021 08:19:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 10/28] drm/msm/dsi: remove msm_dsi_pll_set_usecase
Date:   Wed, 24 Mar 2021 18:18:28 +0300
Message-Id: <20210324151846.2774204-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_dsi_pll_set_usecase() function is not used outside of individual DSI
PHY drivers, so drop it in favour of calling the the respective
set_usecase functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h              | 7 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 9 ---------
 6 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 98a4b296fa30..b310cf344ed4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -100,8 +100,6 @@ int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
 int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
-int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-			    enum msm_dsi_phy_usecase uc);
 #else
 static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
@@ -118,11 +116,6 @@ static inline int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 {
 	return 0;
 }
-static inline int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-					  enum msm_dsi_phy_usecase uc)
-{
-	return -ENODEV;
-}
 #endif
 
 /* dsi host */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 000e4207dabc..f737bef74b91 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -29,8 +29,6 @@ struct msm_dsi_pll_ops {
 	void (*destroy)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
-	int (*set_usecase)(struct msm_dsi_pll *pll,
-			   enum msm_dsi_phy_usecase uc);
 };
 
 struct msm_dsi_phy_cfg {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 5f9d0cfc4e03..7a98e420414f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -1049,7 +1049,7 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_10nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1109,7 +1109,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1136,7 +1135,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8e4528301e5d..bab86fa6dc4b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1190,7 +1190,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
 				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_14nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1231,7 +1231,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
@@ -1260,7 +1259,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 4831d6769da7..5acdfe1f63be 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1064,7 +1064,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_7nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1142,7 +1142,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
@@ -1170,7 +1169,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index e607adffe001..98ee4560581a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -113,12 +113,3 @@ int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 
 	return 0;
 }
-
-int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-			    enum msm_dsi_phy_usecase uc)
-{
-	if (pll->cfg->pll_ops.set_usecase)
-		return pll->cfg->pll_ops.set_usecase(pll, uc);
-
-	return 0;
-}
-- 
2.30.2

