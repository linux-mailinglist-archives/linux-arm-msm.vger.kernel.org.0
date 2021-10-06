Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B126424838
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 22:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhJFUuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 16:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbhJFUuZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 16:50:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCF6C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 13:48:32 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y26so15803919lfa.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omBxJqx/FyuXHNB3iSfAI33Nu5vXJyXne6zSU6njhHw=;
        b=kMXzRWnKXIXhCAcuRaafEUEmwhOd6NWc2nEUh4LClHTs3R5bCtkIYFIrS9/Raog3Ku
         D9NVdxNw0AhF7oynGKTQtWVEkdlzqV4QVksSstJ7iiiXsM1irYJUsF4WQmFQMcUOkvcZ
         4W4rzmCo2Z7QfJwiCOliCag0FYJ2x6Q9lLE2Khlexe0X5VsDoP1uaIMhMD+zlz6shRjs
         qqAskVVYkxk9n2HLXFN+odr0++5h6qMv5XJbr+200nIyXOA6Q2Q96ND3AVjU7nPpOYYX
         7q9tnCZr6z7eugPd1jwCd+Da5GcGR3etXmaPv5WLAwd2rbOMi8BF+3oMoUyyrx3QckY0
         fCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omBxJqx/FyuXHNB3iSfAI33Nu5vXJyXne6zSU6njhHw=;
        b=eDFzwtQgf1JIpPDtRHBlxIV7BfuZQmMb5hqCa95MOs1zCkLdGGYsLJqNZ/Ed56YXuE
         ULwh1ovSy0qi+xeZcYYJVeOBUxdj9dazhIp8hqkz8AijCSQc5ftx+PirKuGaAbp2nrE1
         ob2xke80QUWlSQDQPskYIoAU0+mWJ1EbBspD2oPJpBYaeZM5fnGUJJhfb1zmC1cEpOJT
         LVqihOVb4JmstLFffAjGX4zAcwFaMl/D+wbdmasZEy5UN7Bf6IGDIFNqb4hocBsu16fb
         RS1oXcP6OSLHSydrUw5DODRWaPhlGhBbrKn/vatJKeB4FGujHGzLeSEFK2EBWw2FGmj8
         shPw==
X-Gm-Message-State: AOAM530G9JVODF7xWADnAYUkDC5ozz2cXKDwil/GQNP6MHKKxkYkzwwW
        ygBGwmYFWCi/madqKOMejElSILEWzCtlsQ==
X-Google-Smtp-Source: ABdhPJwzRAoSXLNBfgkpGRLNZ/6a2V7s0SldbWKOa+R9EMgjB1wOVpraMIWLbcsaUID8xKyMa2a4Ew==
X-Received: by 2002:a05:6512:1291:: with SMTP id u17mr238075lfs.226.1633553310810;
        Wed, 06 Oct 2021 13:48:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y19sm2378787ljc.116.2021.10.06.13.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:48:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dsi: stop setting clock parents manually
Date:   Wed,  6 Oct 2021 23:48:28 +0300
Message-Id: <20211006204828.1218225-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
References: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no reason to set clock parents manually, use device tree to
assign DSI/display clock parents to DSI PHY clocks. Dropping this manual
setup allows us to drop repeating code and to move registration of hw
clock providers to generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 -
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 53 ---------------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 11 +-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ------
 4 files changed, 2 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 7dfb6d198ca9..c03a8d09c764 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -173,8 +173,6 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
-int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1ffcd0577e99..9600b4fa27eb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2232,59 +2232,6 @@ void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
 	msm_host->cphy_mode = src_phy->cphy_mode;
 }
 
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-	struct msm_dsi_phy *src_phy)
-{
-	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct clk *byte_clk_provider, *pixel_clk_provider;
-	int ret;
-
-	msm_host->cphy_mode = src_phy->cphy_mode;
-
-	ret = msm_dsi_phy_get_clk_provider(src_phy,
-				&byte_clk_provider, &pixel_clk_provider);
-	if (ret) {
-		pr_info("%s: can't get provider from pll, don't set parent\n",
-			__func__);
-		return 0;
-	}
-
-	ret = clk_set_parent(msm_host->byte_clk_src, byte_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to byte_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	ret = clk_set_parent(msm_host->pixel_clk_src, pixel_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to pixel_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	if (msm_host->dsi_clk_src) {
-		ret = clk_set_parent(msm_host->dsi_clk_src, pixel_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to dsi_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-	if (msm_host->esc_clk_src) {
-		ret = clk_set_parent(msm_host->esc_clk_src, byte_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to esc_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-exit:
-	return ret;
-}
-
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 49a0a0841487..9342a822ad20 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -78,10 +78,7 @@ static int dsi_mgr_setup_components(int id)
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
 		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
-	} else if (!other_dsi) {
-		ret = 0;
-	} else {
+	} else if (other_dsi) {
 		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
 							msm_dsi : other_dsi;
 		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
@@ -107,13 +104,9 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_SLAVE);
 		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
 		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
-		if (ret)
-			return ret;
-		ret = msm_dsi_host_set_src_pll(other_dsi->host, clk_master_dsi->phy);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int enable_phy(struct msm_dsi *msm_dsi,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c65ef6968ca..8ec331e751a2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -890,17 +890,6 @@ bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 	return phy->cfg->ops.set_continuous_clock(phy, enable);
 }
 
-int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
-{
-	if (byte_clk_provider)
-		*byte_clk_provider = phy->provided_clocks->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
 {
 	if (phy->cfg->ops.save_pll_state) {
-- 
2.33.0

