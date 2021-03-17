Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E800633F355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhCQOk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbhCQOkr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B494C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:47 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u4so3370341lfs.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8ydstOlnJ1QtQ62u0VOAsa9OmY+4jGAF8+Nt1SR6Og=;
        b=DRjX7yUoeLDOLZzM5HFaQPX6zdAOl48mHaOWWrueycBKwDpdNKc8HZtgV/Tp0rcE37
         t2ihH2iVcI4qKicwZlGl/V1wb4v3ToPUhmwA4c25b3qDANitIlGT0sgCxCm6YJyrIC3o
         GBqiPRl6A/5+BQzjQeVm79Yvy5aR1Ssvh7JqLoI9lrsRie/GT8GHy1H8prVdFHvBtbw+
         zLB4kNEeHleo/zhZQeTv+BdRWlMNtmrPqDDoqF77vJXL/NR8gzPkEbimCH/WZrhMQMuO
         xYFwYoNNHFlqjqoNyps5YKxNX7hXIsv32Vr34HOm5pQfDhTD5gDfO685obntlT1svKEX
         KSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8ydstOlnJ1QtQ62u0VOAsa9OmY+4jGAF8+Nt1SR6Og=;
        b=Il+Suvm/RThb156EDrWoaTV3nCOP14/rS9zeUbMkVIXdDL2gQbUggv6NmpPYUwkg9S
         zw9ZQPURjEQ7TUBseYk4JZ6KJsVMlvqCrqeDOOZEdG6hHvay6cNJyq8WyNHfQjqbW/UL
         q+8vu7z8Ccvl7V5O8HQ5U25nh+lPXxgz2YFTL/MZ8skv0ZZqAAgbTgSS2kZNsWi4Ddc0
         beLqERDgCrhYy6idkXILA0liQ3CMvKijvaqp7OWarnV3IP4ptq8JZsKuDWQzdMZl6PYe
         qDI5j5Da0zHYFy94d/M1vw30SqKTz2uiApjue8Kq3kz3qCDpuQImlysJhudIlMMwNTy9
         ULlA==
X-Gm-Message-State: AOAM531tX8mtPZay2b07Hnkoqxd1OEa+uk80js/lRaeXeb+wllhZJmij
        S/54FNri/MZiiAcM+X8z/brxfg==
X-Google-Smtp-Source: ABdhPJwkQxaYN3TrxzO84H8yYG0lSPMN/0eVKIYvcWmVjOFZYcxolkaIpyYhgZd9GNWkhyKccXq1Tg==
X-Received: by 2002:ac2:5e3b:: with SMTP id o27mr2475051lfg.392.1615992045805;
        Wed, 17 Mar 2021 07:40:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 04/26] drm/msm/dsi: drop multiple pll enable_seq support
Date:   Wed, 17 Mar 2021 17:40:17 +0300
Message-Id: <20210317144039.556409-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
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
2.30.2

