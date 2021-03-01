Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDBF32A111
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344040AbhCBEsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234534AbhCAX20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:28:26 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4023BC06121E
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:20 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id h4so21420280ljl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ws8jQl7L8+PCFFuGma/sOA32AZvVscRo6S+BWJRajc=;
        b=nQ63FpXQH/QmQidnP3ulWjJAmO95ofWtL4Lon53/csVXXbDPJz7InFyDRzeuDBga9f
         U/cb4ePSf/4M3GyiblobBZsFVGpC8xVEG6z9exJ38NWpcXhxbXYzy6/yibb5TT0mMN4q
         LulYe5t9NA1Ohl2E3q9rPVngpKrfVg+oUSMblnSpGX7b9vuQUA8WoqR2LJyo20NcGTB5
         NmK0roAPuoWW4mndUlUVIK6bAMMqYTBEREIPo8NcCXbTvWzg6JVLWlOZZhjaVnPXEThS
         InFhfXJBUxtUKdX9KIcjUNGWuGnMEp7wxHxPw/4VEWvQNd+hDPAFoNqOEuy8Fmbv2Eqs
         BtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ws8jQl7L8+PCFFuGma/sOA32AZvVscRo6S+BWJRajc=;
        b=mpCCWvYqwNtgT5HTzGLpWI976dnFZKLP5ncEeyvAGr8cg294bQiZMZotZ0rXjRp0J0
         /S1nZ550WMDGXzwHZWFIfVPc+OK9BguAZZzV+QU7fLYTLC6ecPhiIpGgGhJtwLrjo/+e
         LHw+wCcIUoj6ue446rYNi6Yebk4repKvTVkO+1BS/kx2KWO0VpmLVX2pVhKB4U8fO9Ma
         PwnEKKDTLvmat3BX5ATzbIf1fATuBKfuiJMoGp3MDFDTppeiXo4Ou2g3J8i9DN7d4Qu3
         F+RVT8BdoJTEhPueU2b0/d0jou6+gSq8P0Xwlcon16/5D20paOlT6RZFCo782+G4ZUi5
         WN3g==
X-Gm-Message-State: AOAM532FQDmmNMrxmCCSr+TuS8pMJFUPJm4tw9Om9o4w9hUVpKdI1DPn
        4okqjeZZcc9sEewJrkyjCqliHYqrM51XGA==
X-Google-Smtp-Source: ABdhPJzG+7E4Jd5R7ZVsTRReip7RjaEvpBDqUL/MCQCaFZvYAhDJ/UdsjFizj7w8Ul2dMuLowRIkIw==
X-Received: by 2002:a2e:b8cc:: with SMTP id s12mr10248432ljp.221.1614641178775;
        Mon, 01 Mar 2021 15:26:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 14/24] drm/msm/dsi: make save/restore_state phy-level functions
Date:   Tue,  2 Mar 2021 02:24:57 +0300
Message-Id: <20210301232506.3057401-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
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
2.30.0

