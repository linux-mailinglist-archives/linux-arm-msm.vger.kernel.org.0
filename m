Return-Path: <linux-arm-msm+bounces-37298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B72CF9C1316
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 01:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C581F22BDF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 00:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819AE1BD9E3;
	Fri,  8 Nov 2024 00:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGGE6gO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E769DF51
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731025310; cv=none; b=GbjNLEN1T5vKHYBz9MT3C5gEC+Rug/XmrUGd3Ha88OZF+SopUlTXkrj2a1Fnrjf1fZpjRB5Bs4DzByf6PIl1DR6EciyCSYZf9oSkTflW2R/wY4BWY/Flt6DMOUw/8/f1WpO8n/TjkT+0ag92p4i/gaNASh99cEqafAMItwzW/Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731025310; c=relaxed/simple;
	bh=qJsME0Fo5L5iyM9tsigPZZ2P8Br4moecQIo8oDmWM5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnJr4QhAdjNAezbdurPHA92C1xIRPUvVhJUIBOx+DAvwvkgFQPDWK3L32ZFki/XWG8X5ldR0QuEROfMYwXbNi6W8PLOwYWX/6UmTEtRKjm1HHdQZem14O7XO+C055ZI0fZQ2rSVvn7yL86zQU4/e6o14hTTc2Xw7uNUBY4cchGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGGE6gO+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso17380021fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 16:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731025306; x=1731630106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcVfCSPL838ZxLP2q8qZhtVMfrzXK5JoNMbGh5eDF34=;
        b=JGGE6gO+e8eOyDEjICHtLZ2I168FvEGUd6v45kfccc33Xm/MTJzxYnGOpqe4gi/nMg
         w/zBpUn0HZ2mH1OjlnR8KJaBHTfoJNwpsubddeaWvTweJ1u0Ss/sAIBmdPZVelM9hrci
         I+N2rvAVYqmQizKH8YMy25t5E27bC6gHgXXFMLNGa0SdCZlbMltILm1KYMm7DI5q4FBc
         7i5fhmYup1xI7CpwxjlUyu+KQE+P/erBni0gDkJ5PBSc2c72wzn49K8XdS1vsgO+wp5T
         plSZetYiWD0WAS6WA8l9u7YTxM9J5ycDiFemOj13r+uctdBxRAAajaQosTvvkqjESNZ5
         s1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731025306; x=1731630106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcVfCSPL838ZxLP2q8qZhtVMfrzXK5JoNMbGh5eDF34=;
        b=gkUXphDDrZxal3NytU8H3kpGt4hPWswYb9NMWZxViBauY9MaUcwRp7GRTyWoYHUeGJ
         BNiFCMxEzrJFRXHUokF8mCBtIBoftwEs+fOn8EiIFqzhdu5OHBYm7TpycyR3bG6B2snV
         mAoWgXQ4hsuQqm7RLRMaF3t6NPjVA+TMjiOB+KU2Ge1ft6QB1vT9KYnJ8LTDvzk/1p4u
         DupwKbcwyfq1TAvVTNbxo+PEX23sBzlcyJqsmBQIgVfH2bnWkgmz8p9RXIKg8Lhxs3w1
         EsfXF/jMMTFAvi2tbhw8mA2jMwnSbQmWT+0Hso1kpg0OZCpU41NRvo1ulCMcoejlkIKM
         UnZA==
X-Forwarded-Encrypted: i=1; AJvYcCU5O/i+y8nfaIi3HkLvZlHgdl6Vv6zCEbr8Iiw7xvkWgp1tIukBgazPDCjmPn+2RXnm0RJ5dxqrxtQGm4Gl@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYSV6RL94h1kLB9hW9nTEtb+xzuKu9Pp7oDekAA/NM0cHlgcT
	nFkKmThkcsPD3ZcAvoWHiL63RhMr8nUWr4cGlpiIfwSYtVAt5A/2ZCHMOojurl4=
X-Google-Smtp-Source: AGHT+IHHTp9wTOlz+hT4Gxl7MjcjmwCERUW6/tzHV3ggfDOCTqN3QYu7YCEAeaGxrwLqIaHASdUvlw==
X-Received: by 2002:a05:651c:158f:b0:2f9:e1ce:1276 with SMTP id 38308e7fff4ca-2ff1f447a1amr4482901fa.11.1731025306478;
        Thu, 07 Nov 2024 16:21:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 16:21:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:34 +0200
Subject: [PATCH 03/14] drm/msm/dp: drop msm_dp_panel_tpg_config()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-3-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7080;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qJsME0Fo5L5iyM9tsigPZZ2P8Br4moecQIo8oDmWM5I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmOC1DlinBaaguDpNckaxOnzamc/glKEulQn
 sa/tY57UNeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZjgAKCRCLPIo+Aiko
 1VlDB/4g4FRBCMJeMiW97AqpLD+5jBr8423/riiTyLoPtxvMhBTvyc1rcOHxy5clOJng2yGe3FY
 GcST+jUxzeNprxENm5uuBNXyM7+z0T6Xr2Wz/KKvaFETJdU+o4hBi2PIsJBdLmzl2Tg8NGcwplr
 SjJ0F1I78D674PDTK0UOoF/qbnHSFuWyKoLHQIMZpeKldBGAfUuG4jQjzqeo7boDt0uzfytQm2O
 TRGXKz2oqcjX4SxmWmXF24Wj4LBscdJJc2Wc4SRT2CTk1fu7fzLHbxXx5DPD/SuRVFTIGiJbiJ0
 EOo6cFh98aueCjTPQ9y/Vedg48XUx42Sw1ictpk5qS7OfymQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop even more dead code. The msm_dp_panel_tpg_config() has never been
called. Drop it and the implementation inside dp_catalog.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 78 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  3 --
 drivers/gpu/drm/msm/dp/dp_panel.c   | 28 -------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 4 files changed, 110 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 0357dec1acd5773f25707e7ebdfca4b1d2b1bb4e..9ca2a4ab251106d72219b11c2be7049b4a2611d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -963,84 +963,6 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
 }
 
-void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-	u32 hsync_period, vsync_period;
-	u32 display_v_start, display_v_end;
-	u32 hsync_start_x, hsync_end_x;
-	u32 v_sync_width;
-	u32 hsync_ctl;
-	u32 display_hctl;
-
-	/* TPG config parameters*/
-	hsync_period = drm_mode->htotal;
-	vsync_period = drm_mode->vtotal;
-
-	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
-					hsync_period);
-	display_v_end = ((vsync_period - (drm_mode->vsync_start -
-					drm_mode->vdisplay))
-					* hsync_period) - 1;
-
-	display_v_start += drm_mode->htotal - drm_mode->hsync_start;
-	display_v_end -= (drm_mode->hsync_start - drm_mode->hdisplay);
-
-	hsync_start_x = drm_mode->htotal - drm_mode->hsync_start;
-	hsync_end_x = hsync_period - (drm_mode->hsync_start -
-					drm_mode->hdisplay) - 1;
-
-	v_sync_width = drm_mode->vsync_end - drm_mode->vsync_start;
-
-	hsync_ctl = (hsync_period << 16) |
-			(drm_mode->hsync_end - drm_mode->hsync_start);
-	display_hctl = (hsync_end_x << 16) | hsync_start_x;
-
-
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
-			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
-			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
-				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
-				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
-				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
-				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
-				DP_TIMING_ENGINE_EN_EN);
-	drm_dbg_dp(catalog->drm_dev, "%s: enabled tpg\n", __func__);
-}
-
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 62a401d8f75a6af06445a42af657d65e3fe542c5..ebac3e6aa6b3d51c7a74fd4318ae7c595b3bf2e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -104,9 +104,6 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
 void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
 void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode);
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7d122496723a32fd591d094269397a9fdd51fe44..7a5656d8702e4f9c6f8e13d00788a5bdbbe3729f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -242,34 +242,6 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 	}
 }
 
-void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
-{
-	struct msm_dp_catalog *catalog;
-	struct msm_dp_panel_private *panel;
-
-	if (!msm_dp_panel) {
-		DRM_ERROR("invalid input\n");
-		return;
-	}
-
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
-
-	if (!panel->panel_on) {
-		drm_dbg_dp(panel->drm_dev,
-				"DP panel not enabled, handle TPG on next on\n");
-		return;
-	}
-
-	if (!enable) {
-		msm_dp_catalog_panel_tpg_disable(catalog);
-		return;
-	}
-
-	drm_dbg_dp(panel->drm_dev, "calling catalog tpg_enable\n");
-	msm_dp_catalog_panel_tpg_enable(catalog, &panel->msm_dp_panel.msm_dp_mode.drm_mode);
-}
-
 static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_catalog *catalog;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 47c1d349be470b60596b64a7bc8c7c39d2e8fdd1..317e2a13d7e917acd78edd2f1c99c4be3de902bd 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -62,7 +62,6 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bp
 int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
-void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 /**
  * is_link_rate_valid() - validates the link rate

-- 
2.39.5


