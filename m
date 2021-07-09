Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E93C3C2AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 23:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhGIVK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 17:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbhGIVKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 17:10:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0609C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 14:07:40 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e20so10094496ljn.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+RsBgnaOEY6/D9h9tw7M0512ZsXvNepWazm5EwprVZg=;
        b=iqRjoC4sSD7JA2u5vPh98B8Q4dAjSCJKj32PG2lYW1fjpvKOO22OeHIGHwaJA6u2a5
         bdhYN2a0TlRCHFjfRHkDiq+0H1AHzHEH4sZTqnlFYKQml2IWb+WTllFSb8O+5aNxrX8X
         V78Tq/di6jrUycafAC9jEtRS9+Zimsda1MJBBjBmu18Bv9+AlF8LIWcG9Y8MmxvCDO00
         QnGcEQvl1oo4VgcRVpzH58nsSYjgTQ9f4rr0nk67tdxzFTSfvpJ/Yn93z0FC7LGEyx+I
         Uh9w29xgwymYox4l65aIa3BBsiBX8RFxjBI+n1ChgClkGkFybRMOIoJkAOqrfFiCYEiI
         SQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+RsBgnaOEY6/D9h9tw7M0512ZsXvNepWazm5EwprVZg=;
        b=lxLq8scL7USWKt922LVBAFXdBIhjOR3h+EkbCAMUKggjVJfI+XF/8Xk9irrR+2d+n+
         8TyJtSoBSanX9274D105QXderN6UmNODIwR0Yca8h0+plZLG484oEnBaYdy1QF/k+XkF
         PgHy6XoI98/H3sQtGvtMbt9kPnYKgRhT8DyKtSYGPMbg+DjchBs2XSe9pMr3aWTNi9qz
         X7sorC6mnEA1nDs3JqyNn7R+VSaoXJbwB1OgpZLghkbTrspZYPHeY6XK+gpphYtfO8mN
         JkylJtHpb/l1rytBFYWAkFo4BjTZRA/eA4G1YGSsZ0e+Im9p/R/iu0dcc89HYggpX3Ub
         20YQ==
X-Gm-Message-State: AOAM531cQzE/WSheS6hfIpq/gmosd+Tfgsww3/iWRf8r2u8oxg7W0Uam
        97iFpKdScwY2bKXROlJf1VOiWA==
X-Google-Smtp-Source: ABdhPJy+bRNWEhF2v78zUS/veuwMX06zlm2rQzbQCSuGPPvyXzwbBHqQ9acL5t89MQbGSzgPbuYwyA==
X-Received: by 2002:a05:651c:10b2:: with SMTP id k18mr20391724ljn.228.1625864859232;
        Fri, 09 Jul 2021 14:07:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
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
Subject: [PATCH v2 8/8] drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
Date:   Sat, 10 Jul 2021 00:07:29 +0300
Message-Id: <20210709210729.953114-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of fetching shared timing through an extra function call, get
them directly from msm_dsi_phy_enable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  5 ++---
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  3 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++++--------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 1f0ec78c6b05..876053ba615b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -164,10 +164,9 @@ struct msm_dsi_phy_clk_request {
 void msm_dsi_phy_driver_register(void);
 void msm_dsi_phy_driver_unregister(void);
 int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
-			struct msm_dsi_phy_clk_request *clk_req);
+			struct msm_dsi_phy_clk_request *clk_req,
+			struct msm_dsi_phy_shared_timings *shared_timings);
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
-void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
-			struct msm_dsi_phy_shared_timings *shared_timing);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 4a17f12b9316..6f90d9940e8b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -118,8 +118,7 @@ static int enable_phy(struct msm_dsi *msm_dsi,
 
 	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
 
-	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req);
-	msm_dsi_phy_get_shared_timings(msm_dsi->phy, shared_timings);
+	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req, shared_timings);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c76a6438ffb9..f479e37d6428 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -752,7 +752,8 @@ void __exit msm_dsi_phy_driver_unregister(void)
 }
 
 int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
-			struct msm_dsi_phy_clk_request *clk_req)
+			struct msm_dsi_phy_clk_request *clk_req,
+			struct msm_dsi_phy_shared_timings *shared_timings)
 {
 	struct device *dev = &phy->pdev->dev;
 	int ret;
@@ -780,6 +781,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 		goto phy_en_fail;
 	}
 
+	memcpy(shared_timings, &phy->timing.shared_timings,
+	       sizeof(*shared_timings));
+
 	/*
 	 * Resetting DSI PHY silently changes its PLL registers to reset status,
 	 * which will confuse clock driver and result in wrong output rate of
@@ -819,13 +823,6 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 	dsi_phy_disable_resource(phy);
 }
 
-void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
-			struct msm_dsi_phy_shared_timings *shared_timings)
-{
-	memcpy(shared_timings, &phy->timing.shared_timings,
-	       sizeof(*shared_timings));
-}
-
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc)
 {
-- 
2.30.2

