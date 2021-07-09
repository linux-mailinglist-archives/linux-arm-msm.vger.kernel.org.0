Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D713C2AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 23:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhGIVK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 17:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhGIVKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 17:10:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C44C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 14:07:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f13so25676200lfh.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OTq9Pkz4BYXwrH5zuaAUceLOenA5s9knn8yX5hFPoAo=;
        b=NtZd4pM3t3QN/vp/wSCA8FD5vv++YcXc+Q/SaeNQOJxOExszeMa9h8fqTwW6MH1VjT
         GvnGCIl0ndQ35qP8Nhmd44VGBRGQpCwlzqeCoGuXFVPY++JD7UWZxYqxxDyKdSYd3f5M
         tbJA7Ag3ztrtpteYubdoVZD9arfMxtKan9dlvWpTPRxrh5qfMANKPX68msgnRX/5tTiL
         oV8mAfsziHmJQJNFCCrxUC5R6TrxQej1Hx1+OM05414ecMyxFS0fYeQb1k00xu6SpGoe
         rZRZqP0XLQJCzqK+mFU9LNFh2DXKQZIgUKPfte1LCWB0x3vYz7WeoIiDWYSAqhvRgG8y
         llGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OTq9Pkz4BYXwrH5zuaAUceLOenA5s9knn8yX5hFPoAo=;
        b=RwlBW8rfsWiJY6azeypIToKLibBaeihMmYHIq1l2u24P/JkG0kXujoXEBE+RVeo8oZ
         6gkQyQ9b3+HmCZqx4qI8YHukjhMi7zRGz63ZPOGpcqFm+pq0nQXK/IBZ+FjWb92FfiCr
         zaKts1IlDOXXaQMeHgX+QAnEDShbWsBwmAlMYCNLAT7B0sw1RZaaIoZdgyZ9JlA9IoTE
         8+MrWjgOpQMbV7mssXj0tOksBcHZ1uYLuTueSib7IO4skhTUHZlNVYQOTfB8AZeYYxmf
         LyCFBTapfoA+nYu6LJtxBausHd21SqripNc03JVxKp/YgH1BPbFgDdCr/eK1+paWLku9
         DanA==
X-Gm-Message-State: AOAM5300ixy4HYtGSgs+kmFwlfUT3Mf0/ncNduUUq4wTjqDOKnTaBuYZ
        RE6OhcUDjjd5WjY7HnqoFwafsA==
X-Google-Smtp-Source: ABdhPJyNNXqPU2qqS5g9Sk/wHzyM1QJGuzuzNCLJPn46baXNSeyfgNnLDxaR6zkI1qHZB8/MzAAtGQ==
X-Received: by 2002:a19:910f:: with SMTP id t15mr13269411lfd.287.1625864857373;
        Fri, 09 Jul 2021 14:07:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 14:07:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 6/8] drm/msm/dsi: stop setting clock parents manually
Date:   Sat, 10 Jul 2021 00:07:27 +0300
Message-Id: <20210709210729.953114-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 --
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 51 ---------------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ------
 4 files changed, 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9b8e9b07eced..1f0ec78c6b05 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -170,8 +170,6 @@ void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_shared_timings *shared_timing);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
-int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ed504fe5074f..1fa6ee12395b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2219,57 +2219,6 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 	wmb();
 }
 
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-	struct msm_dsi_phy *src_phy)
-{
-	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct clk *byte_clk_provider, *pixel_clk_provider;
-	int ret;
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
index 4ebfedc4a9ac..4a17f12b9316 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -78,7 +78,6 @@ static int dsi_mgr_setup_components(int id)
 			return ret;
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
 	} else if (!other_dsi) {
 		ret = 0;
 	} else {
@@ -105,10 +104,6 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_MASTER);
 		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
 					MSM_DSI_PHY_SLAVE);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
-		if (ret)
-			return ret;
-		ret = msm_dsi_host_set_src_pll(other_dsi->host, clk_master_dsi->phy);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 6ca6bfd4809b..952fd0b95865 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -835,17 +835,6 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 		phy->usecase = uc;
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
2.30.2

