Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2E0394984
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 02:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhE2A05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 20:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhE2A05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 20:26:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5251C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a2so7716312lfc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0myhhwQw1DX5ERjVy5isiupy8P99vq2r3iL98W1qNk=;
        b=xdI1St13jCR84pKFFkr3NytQGaw8aUa83o5O5KlvwbLPeYpNEz4m8/MVluH1GdH3SA
         47ectaztRJMeUzmgJQ2Tr7e7HWdDSuc9Fd/BhJEemyqV/uftjL+PDQTSp7R8CQLe8Flz
         SpBdQckLfQKbbBbBLkFwLkJNSleRQADK9J2ahdnEi60NQepRw5kbSEpwOru7MhtN8ZBf
         z8j/tzP4O+G5zZupiGdWNVWEW/khNBnNLmKnHsE4BK7iB+qUwSjjSMmb6Krok1Ae5epw
         O1IlGR8bSUlhTrnthv0pb9ZTFBdI6eY6ZV3Zk26HqBejI8DrUynNFyFI4zYgcDvk/xTv
         TtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0myhhwQw1DX5ERjVy5isiupy8P99vq2r3iL98W1qNk=;
        b=m7sgcLfLKteBAHQu+QTW10toFJn+vRGg4nAWZkr4aoFeFflt3gC8UFWtBGuwPNL27i
         AZGwOQKlIQpzaP2WxSgmpAoAAX3vfVMsXasLFgt4xSIncch929aAPTODTvIYMy3yC1El
         Mhrx1GsEdddp3UIq2S+8BqAzw/bR5U9ypuGKSKDOSfFXNkV7hnNtJ9eGLhrtP0WU9lSE
         PCS+zAkrvypVOXxjbBrUOyBS+X9Tv+24Nss8lobkZMm1tQ5OiP8RP8IwNZ+lqKpIKQXm
         mSJ8DA/3I5yIK6VEI34BEdBgrtjIlyVdPNcNy3QyJ/fGsUNgCwMHh6TuIP4t5q/VYQ9A
         5cnA==
X-Gm-Message-State: AOAM532YD9Pp/VvRcL8IMrVX1zoN1XZonwjP+Jw4lACvPEdowTbCDbu4
        vQaBzPPVCqB3TqCeSy6iLfcdgw==
X-Google-Smtp-Source: ABdhPJwLHnP1Y7WOu1kLQQf1Wg3vDNmahUU5TviiYqcjegJrFCej1BGK+Jpqnpzh2YSTuyAsqs9JnA==
X-Received: by 2002:a19:2454:: with SMTP id k81mr5045371lfk.331.1622247918946;
        Fri, 28 May 2021 17:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 17:25:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 4/8] drm/msm/dsi: move msm_dsi_phy_pll_save_state call to msm_dsi_phy_disable
Date:   Sat, 29 May 2021 03:25:04 +0300
Message-Id: <20210529002508.3839467-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move DSI PHY state saving from dsi manager to dsi_phy driver. This way
the manager does not need to know that the DSI state is not preserved
acrosss resets. Everything is handled by the DSI PHY driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 21 ++++++++++++---------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index c467ad609453..d64db1badd4b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -169,7 +169,6 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
-void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 88d56a2bc8ab..de1c41dc5c15 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -524,9 +524,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
-	/* Save PHY status if it is a clock source */
-	msm_dsi_phy_pll_save_state(msm_dsi->phy);
-
 	ret = msm_dsi_host_power_off(host);
 	if (ret)
 		pr_err("%s: host %d power off failed,%d\n", __func__, id, ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index e5d25b44f8cb..b7b178cc318b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -559,6 +559,14 @@ static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
 	pm_runtime_put_autosuspend(&phy->pdev->dev);
 }
 
+static void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
+{
+	if (phy->cfg->ops.save_pll_state) {
+		phy->cfg->ops.save_pll_state(phy);
+		phy->state_saved = true;
+	}
+}
+
 static int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	int ret;
@@ -845,6 +853,10 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 {
+	/* Save PHY status if it is a clock source */
+	if (phy->usecase != MSM_DSI_PHY_SLAVE)
+		msm_dsi_phy_pll_save_state(phy);
+
 	if (!phy || !phy->cfg->ops.disable)
 		return;
 
@@ -860,15 +872,6 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 	if (phy)
 		phy->usecase = uc;
 }
-
-void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
-{
-	if (phy->cfg->ops.save_pll_state) {
-		phy->cfg->ops.save_pll_state(phy);
-		phy->state_saved = true;
-	}
-}
-
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy)
 {
 	msm_disp_snapshot_add_block(disp_state,
-- 
2.30.2

