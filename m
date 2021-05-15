Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4DB3818FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 15:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhEONNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 09:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhEONNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 09:13:41 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D02C061761
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:27 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id e11so1695238ljn.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HiyaubK/rimbaquekKFKfCw3V1vIA8wXpgbPDCDJpLI=;
        b=nZxzcIu2W66RLzbIisFP2D6dwvcsFeDugJHsIugmfvgRHzDF3qvQ8b/yOy6Gr4QCAz
         c3iuIOdSX0wYTdTHZTZIIG950arcZUftIP+KmvZbVcdtMFcwJGaCxGTf8TJgqisO5wL/
         hJjrxEjurhfsO1XOLgilKjliGPkUi/7+K/lAMZSnEPzngBCDDaYQZ/zvg91If7DZ6HuI
         X3Ku4OappzJHDt36n5pIlN5AY3vCx3PTBgfVBPpW6sTb40BKpfqGQ433EJhIdIkGqTlI
         kY+I6PNYUptbg9Lf+yOu/+yZ+ParcAGwSFZ5V2DnrHkMd2xi/47TXeyKs3uVZ/VyUsl/
         Y+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HiyaubK/rimbaquekKFKfCw3V1vIA8wXpgbPDCDJpLI=;
        b=huX/zb1lkzsSGSPTrl4x1Uzp7M5LT7QB+A+BArYvNdpLpM5GpsO1N/1jtht1WRk5OW
         0meWNjyabuJ11YOoDYLBaOsPqdmO/YLy/IciWHvnW/SEZVKSCdddO9cDk8shDd7PnAWB
         wfthneAwL3LtMnynvJfe9opbKXj8f9Wm7yAdbJDV9uFGcgJ4mSK47Cc+nj+FW9PrOG64
         rkowkUIljCpUsleKbN83eCPgiOY3uDDD3/uaU2O5g7oR7hZ2he8caJe8Ssi/RwTC5VGZ
         R/Qs/lY42JBggrlkBxPwOCyg0DM336GZebHoE9QPsplrIBVqZjO9yOQli44JSihvBUtS
         ytFw==
X-Gm-Message-State: AOAM532FItcpfhIcNolFmB6a89HhcqIjrgLvBrudpm1ykP4T2IgU5LEb
        BJg+FpHuRnMHPhBssIITtAnRHw==
X-Google-Smtp-Source: ABdhPJysJNyTWGSyXYR4eOJwvOBdhaAts7i7yQVpzn4zoIZOsLySGDRDHyg24xujNTgFX4sPN9voGA==
X-Received: by 2002:a2e:b524:: with SMTP id z4mr41203313ljm.62.1621084345605;
        Sat, 15 May 2021 06:12:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:12:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 7/8] drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
Date:   Sat, 15 May 2021 16:12:16 +0300
Message-Id: <20210515131217.1540412-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of fetching shared timing through an extra function call, get
them directly from msm_dsi_phy_enable. This would allow removing phy
timings from the struct msm_dsi_phy in the next patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  5 ++---
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  3 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++++--------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 2041980548f0..84f9900ff878 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -163,10 +163,9 @@ struct msm_dsi_phy_clk_request {
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
index 12efc8c69046..88d56a2bc8ab 100644
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
index feaeb34b7071..53a02c02dd6e 100644
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

