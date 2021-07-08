Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E543BFA21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhGHMba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhGHMba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:31:30 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C23C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:28:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t17so15062496lfq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l6Tvwf3xoH7/sKW24x0WPLkLwsCoiC0JQXnDLfOYpx0=;
        b=Ym8xdd0zpaLdtDLGsapS7LnNKFLzjlmG6IYY99Z8LohDO3ARlw6HeJzepsMdNsgKhJ
         QkVjytKfbklVhQr6/sBDWQcZvuBllIBbDgWc+QTfu5zBb8ZdF1G+mX8/65AEF7+fyyBs
         zUoC1heVYRXt3PpAswnbryyXtTomO2s1dt7xNs6q3SEFuIqQiQf8P76R06SzXCwaeUjY
         M9s2K3CtGNxoDlVCBf76mNZfvlxtLqAoLq/hQ3MalxdSKwjX/JNO3h78VdUgvDV0Svmr
         Bj5Spm9Pk4PtEEuqtxHe9EBTdRiex4X3yLbLQj3EqECxX++veudA7OZRO8LFooMTImf7
         xLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l6Tvwf3xoH7/sKW24x0WPLkLwsCoiC0JQXnDLfOYpx0=;
        b=UIWA9CgqwJnKUHyAJZTho73oEHabUoQUaqPahZzbBBCIBbFBik4U7G42RuuO9aVfYt
         2pu9x55pAfv16dSDSQA87padilygae++/8PM3ces5+1CVzaOdf6bYqQk4Wwa8if8sNlf
         pMJfJcQ35N8sZY1NK3X/zfTfzY73ZvZQ/XrUdYfhTgum8GK2P+ngoqipZ0DNka6fXNt2
         s8Mlx0zvHQcVU03C+2EqHA/HxTjSB2tqUUzSB+PCeyxb+QBKm+4c/Au9kgFJPlcdmwIg
         EVvcy5QTG8R552Kch/0jAZi8nLO+Pg0l4a7k5xudyfkgy0MOzjC0iiUuI/WhUXUFI2Ge
         z2Tg==
X-Gm-Message-State: AOAM531Bf/deqhtc5rM98AqjBaiQ2yV8qun0k8pBi9cgyWLPovT7j658
        RQsQdT6AI7ueS2sBuvsOx6Nolg==
X-Google-Smtp-Source: ABdhPJzEfOJVq5A5kdg951Le/yAMr86nnWrbCz4Ib4qUGNqL9G4n/hWpYIVfcPH/gHNDTI8EzYSTTg==
X-Received: by 2002:a05:6512:34c3:: with SMTP id w3mr6804851lfr.615.1625747327054;
        Thu, 08 Jul 2021 05:28:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:28:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 2/7] drm/msm/dsi: add two helper functions
Date:   Thu,  8 Jul 2021 15:28:28 +0300
Message-Id: <20210708122833.363451-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add two helper functions to be used by display drivers for setting up
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

