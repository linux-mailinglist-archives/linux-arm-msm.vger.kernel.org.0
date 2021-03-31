Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6F034FE9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235128AbhCaK6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235147AbhCaK5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:57:50 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F213C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q29so28407430lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jks6uw8vKOVjHJ64qxajKP26j7EyBfYIM430M0HkHfs=;
        b=wfwRQZyiNacy1vxu713dR9WuHQPios7+Qcd+scxyCncpwRqJqLHzG3Nw6DGhpz4ifm
         OF2Vika9dXagyLxGkTp7wuMP5v//K3boi+Ew1MF4ZeJtZJc+N34a5BAZJN/SGbDkhWPm
         hop+1M5zoX9kwbWsP+fIGGqrb9tX5etOSYQkDy9bH7lBswgNJWwl77cFJKlhAn24urWZ
         XCck8+NeT3gevE7aR5651uA/sbURa/6wEsV77Xv8dW76Y9/qDYizS9Jmh7tOZFCRhcA5
         o5Ab1eWsBNKL+GaVksvH+5zEQtuKD51oudsr71H2hlC0eryy5Y9EejliuzEEn749/o7I
         0YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jks6uw8vKOVjHJ64qxajKP26j7EyBfYIM430M0HkHfs=;
        b=CJrGHZtqdl1NFDbEr2aleHy20JI+d4k9sY1tG5HKq5RlzDtKbAWDGp5p6mgNOsm/xj
         avoN6uC+jcnaNHdQlfNIKlzBcx9bkeMCRv+Prei4PpP3athZ3KzxLQb49nTcqB5pgHya
         1r3QMKmKewWIfax/iPsQ3aXgQQIGIESpI5/3lvWN9U0DOEMzMFiOgrxhy4rS0QWm1YNb
         B6pFBVCL/X/qfMOWDB6WVlEDU3L69AqYBvxGtHIUNbqQgWx9vYDaRFFZ4Jf08s9UaiEi
         acbHL0byRpZLaa/l7N/AqK6CebvubwRD2RbkMzM65tEN+DpQQTfLQ+3VkikB8MrvEQpH
         3M0Q==
X-Gm-Message-State: AOAM532d6JOGgIwcgA1jwrPaKS6tzMuaJIQ1SiujaralHm0k3IeMxUtS
        EOa9nChyIRZIl5r5Hqu9gcZNdg==
X-Google-Smtp-Source: ABdhPJzq/Rzg/aZWsJnMdr6s1o/6IhvZXxo7SK+LVH+8VHk27vL6j0oNidRPwF6sVZyCPOsHpAbk0g==
X-Received: by 2002:ac2:465c:: with SMTP id s28mr1862968lfo.135.1617188268714;
        Wed, 31 Mar 2021 03:57:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 13/24] drm/msm/dsi: make save/restore_state phy-level functions
Date:   Wed, 31 Mar 2021 13:57:24 +0300
Message-Id: <20210331105735.3690009-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Morph msm_dsi_pll_save/restore_state() into msm_dsi_phy_save/restore_state(),
thus removing last bits of knowledge about msm_dsi_pll from dsi_manager.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
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
index 0970f05cd47f..7f99e12efd52 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -92,21 +92,6 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 
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
@@ -182,11 +167,12 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_shared_timings *shared_timing);
-struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
 int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
+void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
+int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 86e36be58701..e116e5ff5d24 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -498,7 +498,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct drm_panel *panel = msm_dsi->panel;
-	struct msm_dsi_pll *src_pll;
 	bool is_dual_dsi = IS_DUAL_DSI();
 	int ret;
 
@@ -532,9 +531,8 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
-	/* Save PLL status if it is a clock source */
-	src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
-	msm_dsi_pll_save_state(src_pll);
+	/* Save PHY status if it is a clock source */
+	msm_dsi_phy_pll_save_state(msm_dsi->phy);
 
 	ret = msm_dsi_host_power_off(host);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 46561435a27d..a1360e2dad3b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -799,9 +799,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	 * source.
 	 */
 	if (phy->usecase != MSM_DSI_PHY_SLAVE) {
-		ret = msm_dsi_pll_restore_state(phy->pll);
+		ret = msm_dsi_phy_pll_restore_state(phy);
 		if (ret) {
-			DRM_DEV_ERROR(dev, "%s: failed to restore pll state, %d\n",
+			DRM_DEV_ERROR(dev, "%s: failed to restore phy state, %d\n",
 				__func__, ret);
 			goto pll_restor_fail;
 		}
@@ -838,14 +838,6 @@ void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
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
@@ -863,3 +855,26 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 
 	return -EINVAL;
 }
+
+void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
+{
+	if (phy->cfg->pll_ops.save_state) {
+		phy->cfg->pll_ops.save_state(phy->pll);
+		phy->pll->state_saved = true;
+	}
+}
+
+int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
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
index 2c5196844ba9..8133732e0c7f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -6,6 +6,7 @@
 #ifndef __DSI_PHY_H__
 #define __DSI_PHY_H__
 
+#include <linux/clk-provider.h>
 #include <linux/regulator/consumer.h>
 
 #include "dsi.h"
@@ -13,6 +14,16 @@
 #define dsi_phy_read(offset) msm_readl((offset))
 #define dsi_phy_write(offset, data) msm_writel((data), (offset))
 
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
index 6300b92c65eb..d81cea661f5c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -782,7 +782,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	phy->pll = pll;
 
 	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_pll_save_state(pll);
+	msm_dsi_phy_pll_save_state(phy);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c482e51d1bee..d725ceb0b90c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -807,7 +807,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	phy->pll = pll;
 
 	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_pll_save_state(pll);
+	msm_dsi_phy_pll_save_state(phy);
 
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

