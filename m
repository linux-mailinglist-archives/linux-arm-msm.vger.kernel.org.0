Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6104233F373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhCQOla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbhCQOk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E082CC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id n16so3345568lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c9Mgn5Fo/B64RZT42jJq34CnAm2h6JKwR4V3YoeB1BI=;
        b=TTKB/N4hweJoAulRv5YpXzuLKKnPG79njLoEnQx8OQxlIUb7Tj4H2kr3607j8YTvb/
         9RpNDgf0/1id4vtElh97+LQ3x3baZWsSHbufjAlqf3f4/UAQ99JyPwBnUSDmr8B58ITB
         KhjkfOSb2ebbPftxecvs8Op46D6l5dJLxJ9/pMnToJcgBIdQVPkmX0/88ZgB+XQD7br0
         IPOhe7eDbk3rmK5B+MttVqD4GblCTvVAt6nmknsURFZcU4AnjmjlkVQidbsncokM+iKQ
         1Rd2XtO+bikzfgAkjAxpItiBGf2q6Tr6iJWXu33nqhUr+/7hP5zfcOCCDaYXoWQfayN0
         jZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c9Mgn5Fo/B64RZT42jJq34CnAm2h6JKwR4V3YoeB1BI=;
        b=U2KK5DY54EYP46OGxpKE7GiLSrT+nXffuQ7KkrrxN+9gLGWyC54KGLe9kr6eiV+Wsn
         IvK/zcgHy7MbYGzENkdEf2j88woI5dAjcLjPv+eJW1UfewZHp/8nGR+GXq5pq3UOkcMm
         +mOggBe92qyXOlrT9OhZWGDxH6E4mowh7GVBgVoF1YZ9VX+40RORTNBNkza0A4p+wgOm
         1THyh1QhP1R8EcnvshY0Ljxja3mypF7f2ww2o+fFObSlDDhE/0ECuvF28vlFEGsMQGIR
         72w1TPyVAWD27ZSP1prXCnGXyAmjBkCRRvOKeXvXRGs1vMR7pJIkBxIzlY/+0JHonKdJ
         qpKg==
X-Gm-Message-State: AOAM533ZbIZECiT8djbyzRR4jDH25kxQVDl9ty6qa9/6lErZ+cSTAblk
        rh8WQywB6JBvFb7W8G4oFCJpbQ==
X-Google-Smtp-Source: ABdhPJyszic/4ZdHV+hnpdmP7pOOJHXI9srFSodNuwIYza0xXvcDkJgghKOQy5qvEOFWHZCSQYcWtA==
X-Received: by 2002:a05:6512:36c1:: with SMTP id e1mr2495384lfs.132.1615992056371;
        Wed, 17 Mar 2021 07:40:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 15/26] drm/msm/dsi: make save/restore_state phy-level functions
Date:   Wed, 17 Mar 2021 17:40:28 +0300
Message-Id: <20210317144039.556409-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Morph msm_dsi_pll_save/restore_state() into msm_dsi_phy_save/restore_state(),
thus removing last bits of knowledge about msm_dsi_pll from dsi_manager.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h              | 18 ++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c      |  6 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 35 +++++++++++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 11 +++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 26 ----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h      | 11 -------
 8 files changed, 42 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index c4a3ef4a3c09..351bfbeb53bd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -104,21 +104,6 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
-/* dsi pll */
-struct msm_dsi_pll;
-#ifdef CONFIG_DRM_MSM_DSI_PLL
-void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
-int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
-#else
-static inline void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
-{
-}
-static inline int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
-{
-	return 0;
-}
-#endif
-
 /* dsi host */
 struct msm_dsi_host;
 int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
@@ -192,9 +177,10 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_shared_timings *shared_timing);
-struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
+void msm_dsi_phy_save_state(struct msm_dsi_phy *phy);
+int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 6b65d86d116a..2976b09a881d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -493,7 +493,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct drm_panel *panel = msm_dsi->panel;
-	struct msm_dsi_pll *src_pll;
 	bool is_dual_dsi = IS_DUAL_DSI();
 	int ret;
 
@@ -527,9 +526,8 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
-	/* Save PLL status if it is a clock source */
-	src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
-	msm_dsi_pll_save_state(src_pll);
+	/* Save PHY status if it is a clock source */
+	msm_dsi_phy_save_state(msm_dsi->phy);
 
 	ret = msm_dsi_host_power_off(host);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4535cc5d22a5..e9424a4c636e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -799,9 +799,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	 * source.
 	 */
 	if (phy->usecase != MSM_DSI_PHY_SLAVE) {
-		ret = msm_dsi_pll_restore_state(phy->pll);
+		ret = msm_dsi_phy_restore_state(phy);
 		if (ret) {
-			DRM_DEV_ERROR(dev, "%s: failed to restore pll state, %d\n",
+			DRM_DEV_ERROR(dev, "%s: failed to restore phy state, %d\n",
 				__func__, ret);
 			goto pll_restor_fail;
 		}
@@ -838,17 +838,32 @@ void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
 	       sizeof(*shared_timings));
 }
 
-struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy)
-{
-	if (!phy)
-		return NULL;
-
-	return phy->pll;
-}
-
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc)
 {
 	if (phy)
 		phy->usecase = uc;
 }
+
+void msm_dsi_phy_save_state(struct msm_dsi_phy *phy)
+{
+	if (phy->cfg->pll_ops.save_state) {
+		phy->cfg->pll_ops.save_state(phy->pll);
+		phy->pll->state_saved = true;
+	}
+}
+
+int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy)
+{
+	int ret;
+
+	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
+		ret = phy->cfg->pll_ops.restore_state(phy->pll);
+		if (ret)
+			return ret;
+
+		phy->pll->state_saved = false;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 06e560548c8e..75fc24f9f013 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -6,6 +6,7 @@
 #ifndef __DSI_PHY_H__
 #define __DSI_PHY_H__
 
+#include <linux/clk-provider.h>
 #include <linux/regulator/consumer.h>
 
 #include "dsi.h"
@@ -16,6 +17,16 @@
 /* v3.0.0 10nm implementation that requires the old timings settings */
 #define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
 
+struct msm_dsi_pll {
+	struct clk_hw	clk_hw;
+	bool		pll_on;
+	bool		state_saved;
+
+	const struct msm_dsi_phy_cfg *cfg;
+};
+
+#define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
+
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 9910cee8c9a5..81ca0cf2a3ad 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -779,7 +779,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	phy->pll = pll;
 
 	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_pll_save_state(pll);
+	msm_dsi_phy_save_state(phy);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 0b9438bb8050..c6f0aca66fa9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -804,7 +804,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	phy->pll = pll;
 
 	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_pll_save_state(pll);
+	msm_dsi_phy_save_state(phy);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 96de79b94f1b..652c2d6bfeec 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -56,29 +56,3 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 
 	pll->pll_on = false;
 }
-
-/*
- * DSI PLL API
- */
-void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
-{
-	if (pll->cfg->pll_ops.save_state) {
-		pll->cfg->pll_ops.save_state(pll);
-		pll->state_saved = true;
-	}
-}
-
-int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
-{
-	int ret;
-
-	if (pll->cfg->pll_ops.restore_state && pll->state_saved) {
-		ret = pll->cfg->pll_ops.restore_state(pll);
-		if (ret)
-			return ret;
-
-		pll->state_saved = false;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index c94f079b8275..eca13cf67c21 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -6,21 +6,10 @@
 #ifndef __DSI_PLL_H__
 #define __DSI_PLL_H__
 
-#include <linux/clk-provider.h>
 #include <linux/delay.h>
 
 #include "dsi.h"
 
-struct msm_dsi_pll {
-	struct clk_hw	clk_hw;
-	bool		pll_on;
-	bool		state_saved;
-
-	const struct msm_dsi_phy_cfg *cfg;
-};
-
-#define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
-
 static inline void pll_write(void __iomem *reg, u32 data)
 {
 	msm_writel(data, reg);
-- 
2.30.2

