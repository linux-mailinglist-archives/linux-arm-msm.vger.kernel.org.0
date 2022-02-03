Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C999F4A8067
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349513AbiBCI0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349577AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9245FC061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:16 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id t9so2730297lji.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+wSU34yraQ2ZRR8Er/D8D7vbjQgPnuIKReJWue9YfHY=;
        b=CQ0U8lKxjH+YkU6Gnm+dNpAkAshCvyFDbKS4lBSveqTyjfUKsfZLnoW7smfSFdS91I
         uSWTVCAJsIbLOqJKThsrJrU1Sid+FsD9sjZ4ELg/BfHBBR6OFr1PdagdhgLXGOGJEXh7
         ZBjRTovS6CICayZ4TzLwUeBAiblg2zzL2PQ30/yZvgu3vZCrB8lw29G25TD+a7EIVIaz
         CWo5kQBG+p2NwmU8R3yQZdDHtERpcQSz5mxmYaL93Jw96cDGGOZ9HpTVJWmS8zUyN5FK
         oZn0b7tSak7olXckVTeLIJH8pA5tLNWlIBt7Ib4gK7dn+KUbCKRSFUVYdy9dUy3nHhSX
         IjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+wSU34yraQ2ZRR8Er/D8D7vbjQgPnuIKReJWue9YfHY=;
        b=2iDN7jITZrKk8bJrKwZU1+FLxXSsDoUEPiQDHgrWJCNmhHhz8qRdEwDdQKeRMZuWbC
         sIT/2QJCnQNN7g5ivFsqXpjqhP8nwMuqLy/ifmJAL1dN+lEFis+X/5iCLxy0Sob9NMcc
         UDACKBrsdi2Y5si3zrOhvRNUGuFfqsQnw2OViylRwqrqu/1HqZCg0OqdLuLn4ly8Q90x
         7t0OXDwyD2qDv+JivKe2UIj1wAm+C9nGllvpeWtgUQ06kaJfdEf0EkOmjOfUuzNbkQ7e
         B8aiIAJV1HezO7ZRUuFSLC041hvNb9yUydx8rJiHo8kptT9Tvg9KSGBCtTF4lH5i5Va+
         yvCQ==
X-Gm-Message-State: AOAM532nSeKV2blD6wNPb5gxSv8wstsICAbazOJPKcTcvjAkpA44MLd4
        Eud8rJQCwjoPixqytmsymYDM3Q==
X-Google-Smtp-Source: ABdhPJxWjc1zb0X42/026nPtgv8Dmtm0ngQ5dn+MKclju1BNzlCraV00zcnpv+wKLhZ4G501HAY8/Q==
X-Received: by 2002:a2e:b8d6:: with SMTP id s22mr22758251ljp.218.1643876774942;
        Thu, 03 Feb 2022 00:26:14 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/7] drm/msm/dpu: simplify intf allocation code
Date:   Thu,  3 Feb 2022 11:26:06 +0300
Message-Id: <20220203082611.2654810-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
which intf type we mean, pass INTF_DSI/INTF_DP directly.

While we are at it, fix the DP audio enablement code which was comparing
intf_type, DRM_MODE_ENCODER_TMDS (= 2) with
DRM_MODE_CONNECTOR_DisplayPort (= 10).
Which would never succeed.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 28 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 +--
 3 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..e8fc029ad607 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -493,7 +493,7 @@ void dpu_encoder_helper_split_config(
 	hw_mdptop = phys_enc->hw_mdptop;
 	disp_info = &dpu_enc->disp_info;
 
-	if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
+	if (disp_info->intf_type != INTF_DSI)
 		return;
 
 	/**
@@ -555,7 +555,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+	if (dpu_enc->disp_info.intf_type == INTF_DSI) {
 		if (dpu_kms->catalog->dspp &&
 			(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
@@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	if (dpu_enc->disp_info.intf_type == INTF_DP &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
@@ -1107,7 +1107,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
+	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
 		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
 		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
@@ -1981,7 +1981,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 {
 	int ret = 0;
 	int i = 0;
-	enum dpu_intf_type intf_type = INTF_NONE;
 	struct dpu_enc_phys_init_params phys_params;
 
 	if (!dpu_enc) {
@@ -1997,15 +1996,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
@@ -2037,11 +2027,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
 
@@ -2124,11 +2114,11 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
+	if (disp_info->intf_type == INTF_DSI)
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+	else if (disp_info->intf_type == INTF_DP || disp_info->intf_type == INTF_EDP)
 		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
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
index 47fe11a84a77..f4028be9e2e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -564,7 +564,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		priv->encoders[priv->num_encoders++] = encoder;
 
 		memset(&info, 0, sizeof(info));
-		info.intf_type = encoder->encoder_type;
+		info.intf_type = INTF_DSI;
 
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
@@ -630,7 +630,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		info.num_of_h_tiles = 1;
 		info.h_tile_instance[0] = i;
 		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
-		info.intf_type = encoder->encoder_type;
+		info.intf_type = INTF_DP; /* FIXME: support eDP too */
 		rc = dpu_encoder_setup(dev, encoder, &info);
 		if (rc) {
 			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-- 
2.34.1

