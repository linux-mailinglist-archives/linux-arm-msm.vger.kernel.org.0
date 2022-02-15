Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99E64B6E8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 15:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238525AbiBOORE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:17:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238516AbiBOORD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:17:03 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F122FFE0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:53 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f37so10857982lfv.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gtiG9f3vBEbA3zEJOCrF6gFQgRVBwFpMr8tPeKm1boQ=;
        b=TPcdFDUTwesaeJUPV1oYjukpccN5/s5hjYmWgbT/b11HKIw1OLQP10PbBLwglaWm91
         vjaH64G9u457OyP081Hu8GcSpTaYDxwdSwAYVss27WAOpOMQ/kO8h+gxJECwFxcI4AHp
         Cv2pqkPHID8lvwmyTdg1tfkClYmP/9NePpU4iyYc9G5bgkmtEitogV1Kqsyl0LDdo9Pk
         zEhhToWJ9ufjNEwTRjO9l9zb8QSOgNaOAN/3N+KWq0VUjnJtgU++0++yRqJbCAcSLfAA
         X+gA0/4FQQKuqPyRpFvLdD+rbilRRwbC2wTxpX7rmiAgj29YKlfNV0Y2dcQDRtZBFed1
         G97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gtiG9f3vBEbA3zEJOCrF6gFQgRVBwFpMr8tPeKm1boQ=;
        b=dEee5lU3YMSL0wmqcDXsAxA/Fq9OBwyWK0WSCh9ftRymMzz4FEsk1MSVBG7/jJv/mq
         9arRrc/LbRAWLsNiaWXuxdeKHcO6IX+01/qIwMT684Jl5eZB4SvRpSx7v+1bKQAWOIiF
         TyfunI4Hz86skiPp9BHW8vNT+pF1/R3DE8wrBTLwWtSYTWujscr2B8KOXghJQ3VkMZbY
         WoOj4XACwD8t1mlS9BLL/hJNIjrXu2A02hfYL2NopTKpdFS9jiWn5E3YJ2qAexa8N6kJ
         Hcph1PqSEowohNY1Xm27spb/KyeDfJVDXxoPgA/EGzN5J3EzId6xJMoeSlwDbw89T1hK
         A1eg==
X-Gm-Message-State: AOAM531uJiMLXX2DNWobIFgm6dRaqA0CMI5bYdWC7nx+DVL2rFdSDXhL
        2Y3+BWuJDdL6dMYi4UqFF8WSIg==
X-Google-Smtp-Source: ABdhPJyxMLHFqCJpYDURbi0vg8hklxWXQTo/mzDUwsY3Qx4aWBTuCPUvuUGXiEUECVS2pstWXLfg9A==
X-Received: by 2002:a05:6512:168f:: with SMTP id bu15mr3318714lfb.634.1644934611563;
        Tue, 15 Feb 2022 06:16:51 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:16:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/msm/dpu: simplify intf allocation code
Date:   Tue, 15 Feb 2022 17:16:43 +0300
Message-Id: <20220215141643.3444941-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
which intf type we mean, pass INTF_DSI/INTF_DP directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 26 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 ++--
 3 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index fa1dc088a672..597d40f78d38 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -490,7 +490,7 @@ void dpu_encoder_helper_split_config(
 	hw_mdptop = phys_enc->hw_mdptop;
 	disp_info = &dpu_enc->disp_info;
 
-	if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
+	if (disp_info->intf_type != INTF_DSI)
 		return;
 
 	/**
@@ -552,7 +552,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+	if (dpu_enc->disp_info.intf_type == INTF_DSI) {
 		if (dpu_kms->catalog->dspp &&
 			(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
@@ -1074,7 +1074,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
+	if (dpu_enc->disp_info.intf_type == INTF_DP &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
@@ -1082,7 +1082,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
+	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
 		unsigned bpc = dpu_enc->connector->display_info.bpc;
 		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
@@ -1949,7 +1949,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 {
 	int ret = 0;
 	int i = 0;
-	enum dpu_intf_type intf_type = INTF_NONE;
 	struct dpu_enc_phys_init_params phys_params;
 
 	if (!dpu_enc) {
@@ -1965,15 +1964,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	phys_params.parent_ops = &dpu_encoder_parent_ops;
 	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
 
-	switch (disp_info->intf_type) {
-	case DRM_MODE_ENCODER_DSI:
-		intf_type = INTF_DSI;
-		break;
-	case DRM_MODE_ENCODER_TMDS:
-		intf_type = INTF_DP;
-		break;
-	}
-
 	WARN_ON(disp_info->num_of_h_tiles < 1);
 
 	DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", disp_info->num_of_h_tiles);
@@ -2005,11 +1995,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
-													intf_type,
-													controller_id);
+				disp_info->intf_type,
+				controller_id);
 		if (phys_params.intf_idx == INTF_MAX) {
 			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
-						  intf_type, controller_id);
+						  disp_info->intf_type, controller_id);
 			ret = -EINVAL;
 		}
 
@@ -2092,7 +2082,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
+	if (disp_info->intf_type == INTF_DSI)
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ebe3944355bb..3891bcbbe5a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -36,7 +36,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
 
 /**
  * struct msm_display_info - defines display properties
- * @intf_type:          DRM_MODE_ENCODER_ type
+ * @intf_type:          INTF_ type
  * @capabilities:       Bitmask of display flags
  * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
@@ -45,7 +45,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
  *				 used instead of panel TE in cmd mode panels
  */
 struct msm_display_info {
-	int intf_type;
+	enum dpu_intf_type intf_type;
 	uint32_t capabilities;
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5f0dc44119c9..bca4f05a5782 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -564,7 +564,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		priv->encoders[priv->num_encoders++] = encoder;
 
 		memset(&info, 0, sizeof(info));
-		info.intf_type = encoder->encoder_type;
+		info.intf_type = INTF_DSI;
 
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
@@ -630,7 +630,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		info.num_of_h_tiles = 1;
 		info.h_tile_instance[0] = i;
 		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
-		info.intf_type = encoder->encoder_type;
+		/* FIXME: HW catalog treats both DP and eDP interfaces as INTF_DP */
+		info.intf_type = INTF_DP;
 		rc = dpu_encoder_setup(dev, encoder, &info);
 		if (rc) {
 			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-- 
2.34.1

