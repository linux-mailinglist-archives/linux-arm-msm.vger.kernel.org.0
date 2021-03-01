Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9562732A0F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240988AbhCBEoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345623AbhCAX0v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:26:51 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D43CC061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:11 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 18so19742128lff.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfgu+pAvfWG6VFJRhvipkkqbx67rCdpP3wQluOyEGj8=;
        b=wQSEIXHdAbqwiaquPFRTjMmgcsaklFvVednS9YAD58aQu7QkwEJMhNgWpBpU/MWAxi
         b2BD8ArE0F7ZCd/AFcXfG75FrDCrHY8sMb6vpzr5PtsR15sTOxM4d0C/wS6QBr4hptWM
         SOelZVr3FdOYci8XSUgz5MZcLfr3MX9XPWuNGmIYtxc5XlG4A8TTR1T6GlI2/V5htVH3
         9yZPOPnFghNwRy7AYFrjG1Txp7wXfoQNf4Pkk0SOFqY4WYRAV9Hn2mx9rWJZu4DU74UX
         PEW4mIQjlTiqirukDWy17I+u+5WSVpn2zlU7tuAhPLS0S2CUBhtPMIWUZpECLe4jUFLb
         20aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfgu+pAvfWG6VFJRhvipkkqbx67rCdpP3wQluOyEGj8=;
        b=Yy4+aMtFlWpe/RLliWTLdvA4rUCUGTWy28n0gnxec2DYOP7znPe3D7dnk5HUfJe6lA
         iZ1AK4BeCvPDyFpWlz2EzwexM1nYRo+jlZNAzpQbK4Ppdn2u8UzBmMTcKPf6T9zEKIJX
         vfnC2Ee4kao1n66XIDpTaGdpIMbtFdLXP2rJn72kEr16BPjh0M7yct5EQ1BZGV43YKar
         8wTD5kmrHKLxAVkQcPGymAKkx0n14nm9hUgO3uzhp4AWbWVcdMl9kzkd/4viK6BA86ey
         8ECRlKa3mCKl+SkNZePRYjCG+KgNiryHI03RtrzvSmaK9Db7iPyMCuIPeAClJDP1xTsy
         cAWw==
X-Gm-Message-State: AOAM5322EsEfc5CDAgtcpoXTwN2hZdA7hu3GxcP3Jdw/iIgtXxtCGmw/
        54zDb9OJuNmDejutLWAhIUT70A==
X-Google-Smtp-Source: ABdhPJx6ASBwwcP9kXYkJMtBjyoCs8MQwLCZEi6291t5cVDBPlr2e2TkK3I715Zn3/v1DMoZnlCA5Q==
X-Received: by 2002:ac2:4d39:: with SMTP id h25mr7166090lfk.604.1614641169920;
        Mon, 01 Mar 2021 15:26:09 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 02/24] drm/msm/dsi: drop multiple pll enable_seq support
Date:   Tue,  2 Mar 2021 02:24:45 +0300
Message-Id: <20210301232506.3057401-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only PLL using multiple enable sequences is the 28nm PLL, which just
does the single step in the loop. Push that support back into the PLL
code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 23 +++++--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 65 +++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 +-
 5 files changed, 42 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 4cf289ff8d7e..bd73aa612e76 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1087,8 +1087,7 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 
 	pll_14nm->vco_delay = 1;
 
-	pll->en_seq_cnt = 1;
-	pll->enable_seqs[0] = dsi_pll_14nm_enable_seq;
+	pll->enable_seq = dsi_pll_14nm_enable_seq;
 
 	ret = pll_14nm_register(pll_14nm);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index b2eac57700ce..e92070633b5f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -311,7 +311,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
 /*
  * PLL Callbacks
  */
-static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 	struct device *dev = &pll_28nm->pdev->dev;
@@ -386,6 +386,19 @@ static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 	return locked ? 0 : -EINVAL;
 }
 
+static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+{
+	int i, ret;
+
+	for (i = 0; i < 3; i++) {
+		ret = _dsi_pll_28nm_enable_seq_hpm(pll);
+		if (!ret)
+			return 0;
+	}
+
+	return ret;
+}
+
 static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -619,15 +632,11 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct platform_device *pdev,
 	if (type == MSM_DSI_PHY_28NM_HPM) {
 		pll_28nm->vco_delay = 1;
 
-		pll->en_seq_cnt = 3;
-		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_hpm;
-		pll->enable_seqs[1] = dsi_pll_28nm_enable_seq_hpm;
-		pll->enable_seqs[2] = dsi_pll_28nm_enable_seq_hpm;
+		pll->enable_seq = dsi_pll_28nm_enable_seq_hpm;
 	} else if (type == MSM_DSI_PHY_28NM_LP) {
 		pll_28nm->vco_delay = 1000;
 
-		pll->en_seq_cnt = 1;
-		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_lp;
+		pll->enable_seq = dsi_pll_28nm_enable_seq_lp;
 	} else {
 		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", type);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 50ed935a5d3e..1b9a5abc9275 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -515,8 +515,7 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
 	pll->save_state = dsi_pll_28nm_save_state;
 	pll->restore_state = dsi_pll_28nm_restore_state;
 
-	pll->en_seq_cnt = 1;
-	pll->enable_seqs[0] = dsi_pll_28nm_enable_seq;
+	pll->enable_seq = dsi_pll_28nm_enable_seq;
 
 	ret = pll_28nm_register(pll_28nm);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index a45fe95aff49..b409ae2874b4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -5,46 +5,6 @@
 
 #include "dsi_pll.h"
 
-static int dsi_pll_enable(struct msm_dsi_pll *pll)
-{
-	int i, ret = 0;
-
-	/*
-	 * Certain PLLs do not allow VCO rate update when it is on.
-	 * Keep track of their status to turn on/off after set rate success.
-	 */
-	if (unlikely(pll->pll_on))
-		return 0;
-
-	/* Try all enable sequences until one succeeds */
-	for (i = 0; i < pll->en_seq_cnt; i++) {
-		ret = pll->enable_seqs[i](pll);
-		DBG("DSI PLL %s after sequence #%d",
-			ret ? "unlocked" : "locked", i + 1);
-		if (!ret)
-			break;
-	}
-
-	if (ret) {
-		DRM_ERROR("DSI PLL failed to lock\n");
-		return ret;
-	}
-
-	pll->pll_on = true;
-
-	return 0;
-}
-
-static void dsi_pll_disable(struct msm_dsi_pll *pll)
-{
-	if (unlikely(!pll->pll_on))
-		return;
-
-	pll->disable_seq(pll);
-
-	pll->pll_on = false;
-}
-
 /*
  * DSI PLL Helper functions
  */
@@ -64,15 +24,36 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	int ret = 0;
 
-	return dsi_pll_enable(pll);
+	/*
+	 * Certain PLLs do not allow VCO rate update when it is on.
+	 * Keep track of their status to turn on/off after set rate success.
+	 */
+	if (unlikely(pll->pll_on))
+		return 0;
+
+	ret = pll->enable_seq(pll);
+	if (ret) {
+		DRM_ERROR("DSI PLL failed to lock\n");
+		return ret;
+	}
+
+	pll->pll_on = true;
+
+	return 0;
 }
 
 void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 
-	dsi_pll_disable(pll);
+	if (unlikely(!pll->pll_on))
+		return;
+
+	pll->disable_seq(pll);
+
+	pll->pll_on = false;
 }
 
 void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index 3405982a092c..3eedb79d8939 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -12,7 +12,6 @@
 #include "dsi.h"
 
 #define NUM_DSI_CLOCKS_MAX	6
-#define MAX_DSI_PLL_EN_SEQS	10
 
 struct msm_dsi_pll {
 	enum msm_dsi_phy_type type;
@@ -23,9 +22,8 @@ struct msm_dsi_pll {
 
 	unsigned long	min_rate;
 	unsigned long	max_rate;
-	u32		en_seq_cnt;
 
-	int (*enable_seqs[MAX_DSI_PLL_EN_SEQS])(struct msm_dsi_pll *pll);
+	int (*enable_seq)(struct msm_dsi_pll *pll);
 	void (*disable_seq)(struct msm_dsi_pll *pll);
 	int (*get_provider)(struct msm_dsi_pll *pll,
 			struct clk **byte_clk_provider,
-- 
2.30.0

