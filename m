Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4383C2BC7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 01:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhGIXxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 19:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhGIXxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 19:53:14 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F78DC0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 16:50:29 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c28so25996782lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 16:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IDjFBmgKDqg9nqXkFulzVe09hEu6HLAuDIHiVBMT/Zw=;
        b=fx1W89N9tfeOGVGzyI7fjpFthGMZ0mUGAwPNKEgjOd9HKewi/a0JqoUlWireolh57L
         CtQcGvsE1GS8jSe+NkpVzTXNFNJIJZRfe2ixQcNRVOK87RTC/Cr4qCqKu+xB5Cqz0Tm5
         D5afe1VqxCNL9ouOh0YTbKk/M9yAgxTXSM7oFdVvoUtwh/1DxKoxJRAIJ3U8f9bm73Oz
         0n983xcpEpD/lwpcC6cHysSyLjnGo4MI7SbAfpzXowsDJvw9j+5UG6Im2opeHHVcT/gC
         0xxR5yZULE+4fPvp7jtguEXI3Sjm9qwh50XWja3Tr2yvWR6Sq+ZXHJ4OyJ6Y4RipGmgM
         nl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IDjFBmgKDqg9nqXkFulzVe09hEu6HLAuDIHiVBMT/Zw=;
        b=s3vMhInZ/pCwITACjl+r8G70cIHjBi4yX5n4oumU46f0eHj3eZRbyDOdvt2vnnl+3/
         c5/9T0Uf45zSCAQWS6cfqBWFDWq+hP0cnlg17oaFKgTryqpgD/fC6p8aVk/YSMoMog4Z
         W1tg6EvIt+yMo6VRGbvr84Nr1JnW21/6o/cG1ClI+30qK/6ZOAqRACN9oTOGQ8bGWsWn
         mnn9hRjLJDSCdfCZ75L4cQcGEPcONuSJRK40ZGiUyEUuNhE1Iqd7tPyUOS83PxyX2PRb
         j0FkQoBXb5z23KfmuEElshi9waPKkGF3ZfNlJd2krpkeYwPDz7CreXHeYN2BBvNtCUyK
         S+sA==
X-Gm-Message-State: AOAM531JU3Ey/BButKMdYFqhuE8PChdDFH6pWPjfK5UDBtw5Lwv0Mlck
        F7k05AbvfiXuUTtFGkPrz2Grdg==
X-Google-Smtp-Source: ABdhPJwpVjki/jrXccd89NnEJJJutA4qXJig2sQXJcg0I2OZDBvvwYCKoU8ARO4ouiTTQ5Sldk8Jrg==
X-Received: by 2002:a05:6512:2034:: with SMTP id s20mr26866973lfs.259.1625874627694;
        Fri, 09 Jul 2021 16:50:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 16:50:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/msm/dsi: add two helper functions
Date:   Sat, 10 Jul 2021 02:50:19 +0300
Message-Id: <20210709235024.1077888-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add two helper functions to be used by display drivers for setting up
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  7 +++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 14 ++++++--------
 drivers/gpu/drm/msm/msm_drv.h         | 12 ++++++++++--
 3 files changed, 23 insertions(+), 10 deletions(-)

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
index 1173663c6d5d..a81105633d3c 100644
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
@@ -839,3 +833,7 @@ void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi)
 		msm_dsim->dsi[msm_dsi->id] = NULL;
 }
 
+bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
+{
+	return IS_BONDED_DSI();
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1a48a709ffb3..e0528dfd965e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -350,7 +350,8 @@ void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
-
+bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
+bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -367,7 +368,14 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
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
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
-- 
2.30.2

