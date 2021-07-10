Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21E03C3709
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jul 2021 00:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhGJWW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 18:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhGJWW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 18:22:57 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B37C0613DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:11 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a18so15218697ljk.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wIrEQ/a/ZDjuvpPBXCzjielb0wGCcHqw0GIFindEVk=;
        b=zYYChofoXtmdsDpiClt02ZxCl0VDL4vPaotxf6rJL617xAdo9r7fnaEtO1X0mdFsyK
         Ni7Iv6VwWKIJ7mm+8aHunFln9iM32xFdFjK5E3ZVe2oNRtVtg5VTvPxA21nwK5n8aSfH
         i2wF6ySIENZjfYilOgcF5ew9qViFkfwC7ZvAVnY4sfAozPpUEJW5cnuf6eW4HENEwrXZ
         scmxX33k8Jk4XTdLq/Mbt0D2hMI20KZmeo16maAyao/u7tomP8Rjxx0/RQPjHtUP+lfE
         U5AFIKdhf9VknWBlXdgx85Xy2iCycI5OwoTRHJHWjA6P1xlcxupF2gE/WcCrBfmPP+TQ
         0Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wIrEQ/a/ZDjuvpPBXCzjielb0wGCcHqw0GIFindEVk=;
        b=DkZ3L5L6TTkvNuVcPtBlRfQ14ShvotFD/ySnvYi9F+ofcSpTcTJ18U6CMgQ/20sWCe
         YL+792cBSr7dd0feMxt1LGNi7UYoicx4rtklr18prntEPWCULyfPXoVZKXhsarDR1hq1
         EC/HLDRMkbLPfI02NWwHyWq+ohzVEuKX/m7UZN/9TuyfS9e66twa9I+X8j0aMdRtdSkj
         gfOdA9Tgq2mIimVzY2YXg1Pp1ugi8TEIrQHLMtGODTSw6TKNS3Q4+R2+ibbWeS/k8w9+
         Wi/PzPVyDkiQQCY62PtrruLufylS24ZFBQkXrD1emF4NVqFaCYfCv8lLGO88GA1ISiJn
         a2XA==
X-Gm-Message-State: AOAM5313dsveaid2jnsfQCFGBVLIrgcTv7HTW5eXHW8YC2cV0tu8bb+B
        pPrSew6VZ+cfb/Oi+ap3BUgfmg==
X-Google-Smtp-Source: ABdhPJy1XMXBJJUynvBe2fEjtUnM/k0ik4H55yFpH/ehOXeGEFGldvv+JEhkrlIsCxEndtdLw0jQPQ==
X-Received: by 2002:a2e:93d0:: with SMTP id p16mr3133059ljh.462.1625955610075;
        Sat, 10 Jul 2021 15:20:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:20:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/msm/dsi: add three helper functions
Date:   Sun, 11 Jul 2021 01:20:00 +0300
Message-Id: <20210710222005.1334734-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add three helper functions to be used by display drivers for setting up
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index 1a48a709ffb3..3d331acbc94a 100644
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
+	return false
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
-- 
2.30.2

