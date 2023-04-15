Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DF06E32DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Apr 2023 19:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjDORTd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Apr 2023 13:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjDORTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Apr 2023 13:19:32 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC062127
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a7970aae6dso4455801fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681579168; x=1684171168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQnFjKYQY+tTngZi7vMv/+IU+UckqfOg/vv6GMIWkwA=;
        b=qThJ50lYeiyyyIPyz7a3Fsx+ZLMspR24icwXh3XzLRSRVieuFmQOGtcF3Yfz3tgn+A
         wbgUjqm8k7mYAA+KEzTMZiA2ZM+871upOETNlBI8u3vodGmXVOgL/DI551WubZiKW4LS
         Hx8po7nFGtDL9TDiN/cDfaHNJ2PQB0N6oeR4PDTsDu6d1XzZJTRF8aYSFK86cDqiTk/y
         u10pcs2N4RIseEvmwb2uqAezb7SJcU1cz37IrAlHfk8u40+ptwFPQEXQURYCgfR4WbEQ
         8oEOe2arVflxJP1pZyZAO8UI4In0/4xBSvOmezIi1A6yJm6ZYtRgkDxCizRUXTUj/d09
         fBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681579168; x=1684171168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQnFjKYQY+tTngZi7vMv/+IU+UckqfOg/vv6GMIWkwA=;
        b=e0dTSybwflxuv+TMbFSgp6AcEAYf7McMxriUopqgQtwIFA4ctGbviKjH3AexAvzMhP
         sW+1rPtk/K+3cREmFQ3iFUtexR/0+fW+rYbvzrOYwbRE4znrmgyAlmtcCm72M13sX6XN
         lRXqgBKjGhAuzBRv5AcgdpVy/bgOb+l73Wa/fZFW2X8rSRLLxNXeukAArpZQSJSENYYS
         +Y8vVOdX0MsieSza3nqwPnQT1p/qbbwMD5rtYjgEjtmIlhHtC3FP9JsIL9xLC7pz655B
         VDdLinGnnnw7qU9exl+XV0IN7YdleNdNsui1UC7f3WnpizLwsnpi82TCbjdMkkSgCYzD
         y9Sg==
X-Gm-Message-State: AAQBX9dewMKPQVl0Pk14dQbzMQ2tMT56GkmiypElS0/xSPZKTtEN/L5P
        7t6BPK1AiNSwemj+CjJwUGRbww==
X-Google-Smtp-Source: AKy350a059ApwQ/L913vT2zvuSHRA0tJAfY0ZDS3ngIGnX8qoYPEV3rQY3FBUhvpdEPscVQJ5an+YQ==
X-Received: by 2002:ac2:5598:0:b0:4ea:e799:59f9 with SMTP id v24-20020ac25598000000b004eae79959f9mr618475lfg.66.1681579168206;
        Sat, 15 Apr 2023 10:19:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512096400b004ebae99cc1dsm1355834lft.159.2023.04.15.10.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 10:19:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/2] drm/msm/dpu: simplify intf allocation code
Date:   Sat, 15 Apr 2023 20:19:25 +0300
Message-Id: <20230415171926.85774-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
which intf type we mean, pass INTF_DSI/INTF_DP directly. This is
required to support HDMI output in DPU, as both DP and HDMI encoders are
DRM_MODE_ENCODER_TMDS. Thus dpu_encoder code can not make a difference
between HDMI and DP outputs.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  6 ++--
 3 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1dc5dbe58572..b34416cbd0f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -495,7 +495,7 @@ void dpu_encoder_helper_split_config(
 	hw_mdptop = phys_enc->hw_mdptop;
 	disp_info = &dpu_enc->disp_info;
 
-	if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
+	if (disp_info->intf_type != INTF_DSI)
 		return;
 
 	/**
@@ -1127,7 +1127,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
+	if (dpu_enc->disp_info.intf_type == INTF_DP &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
@@ -1135,7 +1135,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
+	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
 		unsigned bpc = dpu_enc->connector->display_info.bpc;
 		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
@@ -1977,7 +1977,7 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 			phys->ops.handle_post_kickoff(phys);
 	}
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
+	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!dpu_encoder_vsync_time(drm_enc, &wakeup_time)) {
 		trace_dpu_enc_early_kickoff(DRMID(drm_enc),
 					    ktime_to_ms(wakeup_time));
@@ -2182,7 +2182,7 @@ static int dpu_encoder_virt_add_phys_encs(
 	}
 
 
-	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
+	if (disp_info->intf_type == INTF_WB) {
 		enc = dpu_encoder_phys_wb_init(params);
 
 		if (IS_ERR(enc)) {
@@ -2231,7 +2231,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 {
 	int ret = 0;
 	int i = 0;
-	enum dpu_intf_type intf_type = INTF_NONE;
 	struct dpu_enc_phys_init_params phys_params;
 
 	if (!dpu_enc) {
@@ -2246,23 +2245,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	phys_params.parent = &dpu_enc->base;
 	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
 
-	switch (disp_info->intf_type) {
-	case DRM_MODE_ENCODER_DSI:
-		intf_type = INTF_DSI;
-		break;
-	case DRM_MODE_ENCODER_TMDS:
-		intf_type = INTF_DP;
-		break;
-	case DRM_MODE_ENCODER_VIRTUAL:
-		intf_type = INTF_WB;
-		break;
-	}
-
 	WARN_ON(disp_info->num_of_h_tiles < 1);
 
 	DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", disp_info->num_of_h_tiles);
 
-	if (disp_info->intf_type != DRM_MODE_ENCODER_VIRTUAL)
+	if (disp_info->intf_type != INTF_WB)
 		dpu_enc->idle_pc_supported =
 				dpu_kms->catalog->caps->has_idle_pc;
 
@@ -2290,11 +2277,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
-													intf_type,
-													controller_id);
+							    disp_info->intf_type,
+							    controller_id);
 
 		phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
-				intf_type, controller_id);
+				disp_info->intf_type, controller_id);
 		/*
 		 * The phys_params might represent either an INTF or a WB unit, but not
 		 * both of them at the same time.
@@ -2302,14 +2289,14 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		if ((phys_params.intf_idx == INTF_MAX) &&
 				(phys_params.wb_idx == WB_MAX)) {
 			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
-						  intf_type, controller_id);
+						  disp_info->intf_type, controller_id);
 			ret = -EINVAL;
 		}
 
 		if ((phys_params.intf_idx != INTF_MAX) &&
 				(phys_params.wb_idx != WB_MAX)) {
 			DPU_ERROR_ENC(dpu_enc, "both intf and wb present: type %d, id %d\n",
-						  intf_type, controller_id);
+						  disp_info->intf_type, controller_id);
 			ret = -EINVAL;
 		}
 
@@ -2409,11 +2396,11 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
+	if (disp_info->intf_type == INTF_DSI)
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+	else if (disp_info->intf_type == INTF_DP)
 		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
 				priv->dp[disp_info->h_tile_instance[0]]);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 2c9ef8d1b877..6d14f84dd43f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -21,7 +21,7 @@
 
 /**
  * struct msm_display_info - defines display properties
- * @intf_type:          DRM_MODE_ENCODER_ type
+ * @intf_type:          INTF_ type
  * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
@@ -31,7 +31,7 @@
  * @dsc:		DSC configuration data for DSC-enabled displays
  */
 struct msm_display_info {
-	int intf_type;
+	enum dpu_intf_type intf_type;
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..e85e3721d2c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -542,7 +542,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		}
 
 		memset(&info, 0, sizeof(info));
-		info.intf_type = encoder->encoder_type;
+		info.intf_type = INTF_DSI;
 
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
@@ -605,7 +605,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 
 		info.num_of_h_tiles = 1;
 		info.h_tile_instance[0] = i;
-		info.intf_type = encoder->encoder_type;
+		info.intf_type = INTF_DP;
 		rc = dpu_encoder_setup(dev, encoder, &info);
 		if (rc) {
 			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
@@ -644,7 +644,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	info.num_of_h_tiles = 1;
 	/* use only WB idx 2 instance for DPU */
 	info.h_tile_instance[0] = WB_2;
-	info.intf_type = encoder->encoder_type;
+	info.intf_type = INTF_WB;
 
 	rc = dpu_encoder_setup(dev, encoder, &info);
 	if (rc) {
-- 
2.30.2

