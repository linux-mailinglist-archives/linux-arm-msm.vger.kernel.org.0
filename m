Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7AF34B664
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 12:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhC0LDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 07:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhC0LDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 07:03:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA602C0613B1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o126so11560853lfa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bxGZn7TqCWUO79PMlNNzyhpq1led4I1g12oGFN/YoEQ=;
        b=KHvfpkB/WpD7qBdR9WF3yy9Xmhodjpt0dr40kvODynI2fsGGfLeBYAtGCJ9Rg8XpOk
         uXty3fjxqoyl8ohIesOi1Dfop7DviwrKlhHywbf2u4USfZfuxDi42HNOKXyoslGoAwG6
         2mIQNeARd2nDMmNxXDQbhRqNOeKvkHy+VqliMeqM9tSC2jGsjg5+vchIjy8oiM2ptaJg
         mzKrrZ8V9fdwjdfNEvD5jPXGgMFaPnTnNT/4glDW8DlLL+Iki33851w/KusWXA2N4j2g
         tEH5hUmsOsSV+yTQDTWiiH9itJtdGKNCITcrHcDxwqd6LRzc5BrZ5OwB/k87UaYk6BTx
         l1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bxGZn7TqCWUO79PMlNNzyhpq1led4I1g12oGFN/YoEQ=;
        b=JHof9F3Y/eZmAZqHjzX5AE7NC/25NHkuBTRS7A9NfOwv6wuaWpvgEeKrL7pfoOsT8+
         0xVbUaIzf1GPkuVBunkjG4t4xICClW3pwu5ipMZBUMLH3IcldPays8JTAn1qiXXce8mX
         buB0pAm23evtnoQjypjkM/PIU/yq2AjX+VYUs6NptpCtqku1TAmcZXU39BFYRY8ws0AR
         zsz52mDGF1MaRTdS/w1Z9917K1yDFK5JQOz8LSx/cIa05Bz94lFaKCorGX5RY66utL5W
         pg1rCmoort5WbtcsC6icAdiiYHGHMH+AbYbFCQkCg9egNnXjoEzzRuzC3BssBJg7777H
         /MPQ==
X-Gm-Message-State: AOAM531E37det3+pmetMwQRv9ZxEcS3T9wLIIFR5LTv9J+NcMYOruToo
        2WI7eqgU1J6GflMk9diY0F/EmA==
X-Google-Smtp-Source: ABdhPJyQITpoKIo2/aHaGEXwdjf2lN5DQ1SdhVjGNhDyi7joYjFOTVD/eJgfXo36XoOD78iP7Lffig==
X-Received: by 2002:ac2:43a3:: with SMTP id t3mr10764536lfl.340.1616842996342;
        Sat, 27 Mar 2021 04:03:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 06/25] drm/msm/dsi: drop multiple pll enable_seq support
Date:   Sat, 27 Mar 2021 14:02:46 +0300
Message-Id: <20210327110305.3289784-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only PLL using multiple enable sequences is the 28nm PLL, which just
does the single step in the loop. Push that support back into the PLL
code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 23 +++++--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 65 +++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 +-
 5 files changed, 42 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 6a63901da7a4..4386edfa91fe 100644
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
index 2f502efa4dd5..760cf7956fa2 100644
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
index 4a40513057e8..2cfb7edf91d8 100644
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
index 3dc65877fa10..9e9fa90bf504 100644
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
index bbecb1de5678..eebf90671eec 100644
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

