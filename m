Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1369B3CC35D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 14:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhGQMnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 08:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhGQMnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 08:43:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77001C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b26so20710446lfo.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysvvGQmoa08plNkduw7rJX6WTAzRTvZ9iBIAoQ2LibM=;
        b=rMU8nBl61ss+BYlbRpQthguaXjHdPilFUk3+l70a1HcWHEBMvc8rf9zD2A/+qB3GAG
         ZG6yajM3VEbet1JPqIefXR4c8DVTXiuQmqwrIl4LOcwjzlniJRQpIw+0IXWg10qaqehz
         Dz1KNjR3XlTAyA8BjvxU5LQW5KYI6BNlmiC3AHVFuCt/tQqFW8YaCOnGrcdTmrTFbSxh
         WZlWvmkPvdcyAKvodKi0U+9WjVBw3aSpWUFvH1+RBAeDouCEotBvu0Ekz2DiaZTJr1f2
         hC688OtCPouhOW1SZ37Pw2kw+u1AN7dRvj4CJv7hPg+JvYBLeVsu2ytKls8v4ZdkXfA5
         PKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysvvGQmoa08plNkduw7rJX6WTAzRTvZ9iBIAoQ2LibM=;
        b=VHyI0IL3oNB1Nj72QUsQrNi3Y+XMn/oUDQT1/AToAxWPzLlN3pllxqGK4mtC+nyHhw
         mw9oVec/1XM6yxTqIO7RwbYOX8BLvOXygaoylRI39ytEZqNT6P+KEl6LBdxRoY89yEod
         XdCZtOdShOp0WSkUf2KPqY2YhP7hSC3l1gS/goJ1c9Los2+ApBbEj9BaFz8+XMK8pd4a
         h0q3lq/V0PB4hyYD8bb4f7g6a5h1aYoUNlepbuWv5vO2hP7SrFuQpxhOUTPQG8jbl+pL
         TuMADifSKZ5sVOeox0/FJFrid93R0FEE/LuY9XKLXJ6dCox8en6qXdX1uCquRO+TP/ak
         NIWg==
X-Gm-Message-State: AOAM533RSWTJm88S9F4pQso0stfU46+vwhHmcHwCBvwink1BJUBJiEKf
        BvIrqhlazBoSMbuDG0/NwbyZ3w==
X-Google-Smtp-Source: ABdhPJxlMD1BwxZVEJOM4lGTdDTwUWSE0L26RCrmISAGQvEAGwoBO6u3jpG9hOVtzw7yYLlysjHXbw==
X-Received: by 2002:a19:8642:: with SMTP id i63mr11819172lfd.156.1626525622812;
        Sat, 17 Jul 2021 05:40:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:40:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/7] drm/msm/dsi: add three helper functions
Date:   Sat, 17 Jul 2021 15:40:11 +0300
Message-Id: <20210717124016.316020-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add three helper functions to be used by display drivers for setting up
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  7 +++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 +++++++++++--------
 drivers/gpu/drm/msm/msm_drv.h         | 17 +++++++++++++++--
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75afc12a7b25..5201d7eb0490 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -13,6 +13,13 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
 	return msm_dsi->encoder;
 }
 
+bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
+{
+	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
+
+	return !(host_flags & MIPI_DSI_MODE_VIDEO);
+}
+
 static int dsi_get_phy(struct msm_dsi *msm_dsi)
 {
 	struct platform_device *pdev = msm_dsi->pdev;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b20645ab279b..27d3b9ebf831 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -216,12 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
-{
-	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
-	return !(host_flags & MIPI_DSI_MODE_VIDEO);
-}
-
 void msm_dsi_manager_setup_encoder(int id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
@@ -231,7 +225,7 @@ void msm_dsi_manager_setup_encoder(int id)
 
 	if (encoder && kms->funcs->set_encoder_mode)
 		kms->funcs->set_encoder_mode(kms, encoder,
-					     dsi_mgr_is_cmd_mode(msm_dsi));
+					     msm_dsi_is_cmd_mode(msm_dsi));
 }
 
 static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
@@ -276,7 +270,7 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 	if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
 		kms->funcs->set_split_display(kms, master_dsi->encoder,
 					      slave_dsi->encoder,
-					      dsi_mgr_is_cmd_mode(msm_dsi));
+					      msm_dsi_is_cmd_mode(msm_dsi));
 	}
 
 out:
@@ -839,3 +833,12 @@ void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi)
 		msm_dsim->dsi[msm_dsi->id] = NULL;
 }
 
+bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
+{
+	return IS_BONDED_DSI();
+}
+
+bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
+{
+	return IS_MASTER_DSI_LINK(msm_dsi->id);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1a48a709ffb3..9bfd37855969 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -350,7 +350,9 @@ void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
-
+bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
+bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
+bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -367,7 +369,18 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
 {
 }
-
+static inline bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
+static bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
+bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
-- 
2.30.2

