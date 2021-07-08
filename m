Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E233BFA24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhGHMbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbhGHMbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:31:31 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2C2C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:28:49 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f13so14849882lfh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DI9Ts9dnxWaDfjxioQ9DRLR5i4GIHC8m37WULWm3o7s=;
        b=kdkdVBUJhLeNVm29nmbQt7loys4OXtPPNVmWKhYsDMIa4jiGf2nnaZcGdu73I6wG+P
         nHcIaYoRVVb5jcLKb323eig6XEhQTVf6wU9Q5IDI3xuAgzV9VvXOFBny8Hbk8CRoKp/n
         4Da6WsGRyVHx2sZ37C6rZWOyBJs1I7t0dlWOHyF7J/3YZC3u2orlACTokxwE4W8wvG46
         2HSMhRNDQo+UVQegAgEQAHtVud9QmJ+BgBhB4Ku9cGGydDOU+up1D9T5FWT/cC6+UCxC
         46tVJfZFWeDTHwqW1HADhOUSEXiE2q29JnXYZad7D7fer04Y6B4TkfFUAD3T/ETjiGan
         pKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DI9Ts9dnxWaDfjxioQ9DRLR5i4GIHC8m37WULWm3o7s=;
        b=RP5xlOYnygtU4EgGv9a0fOGdOxnqqYOIvouAYJgKIDC2nVxZb+9uq3Gf11jcbEAVc3
         Zp6TElFE3v8JTgwkWsJhJr5zRgXSv2JdwTxFEA4L2Q03O4mzPk69EdjsDF3ItLx/QaQ+
         2X+TApCCrtr0Ij87VUm3SCxaPHZf6uhmvQipbi5LdzrPi5MGdR5kWdz+Lz5CZpjlz0y7
         PtbJkUuZzyFcEjfQ1gI2aTZfBKIk5Vly1P0jt9VcCyT3BUtpkTcKKIwJksFe2/r7YtX6
         f8RIeUUFTvtFFK3/7qPTx3+obM1pB/gdUvRQ9io1jIL50rKzI3bapZr4EFPqbYTevKrc
         8UBg==
X-Gm-Message-State: AOAM530K1QJgdVZ+amAcILBX7uuF9b984SVxfU+/KNFwrtdWcNUxl4Do
        bBBHPn2dU5zGqaPt9PzWiQ4VhgvH+LaC2A==
X-Google-Smtp-Source: ABdhPJwtCLthbTkR3mdujhpzVq0xefLxRzVvMRl30C4u5ewmA/rZGTbcP9afiDgJ3NfijzPxCvTKLQ==
X-Received: by 2002:a05:6512:1315:: with SMTP id x21mr23652460lfu.87.1625747327892;
        Thu, 08 Jul 2021 05:28:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:28:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 3/7] drm/msm/dpu: support setting up two independent DSI connectors
Date:   Thu,  8 Jul 2021 15:28:29 +0300
Message-Id: <20210708122833.363451-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move setting up encoders from set_encoder_mode to
_dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
allows us to support not only "single DSI" and "bonded DSI" but also "two
independent DSI" configurations. In future this would also help adding
support for multiple DP connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
 1 file changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..8459da36174e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -471,30 +471,68 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct dpu_kms *dpu_kms)
 {
 	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
 	int i, rc = 0;
 
 	if (!(priv->dsi[0] || priv->dsi[1]))
 		return rc;
 
-	/*TODO: Support two independent DSI connectors */
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
-	if (IS_ERR(encoder)) {
-		DPU_ERROR("encoder init failed for dsi display\n");
-		return PTR_ERR(encoder);
-	}
-
-	priv->encoders[priv->num_encoders++] = encoder;
-
+	/*
+	 * We support following confiurations:
+	 * - Single DSI host (dsi0 or dsi1)
+	 * - Two independent DSI hosts
+	 * - Bonded DSI0 and DSI1 hosts
+	 *
+	 *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
+	 */
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
 		if (!priv->dsi[i])
 			continue;
 
+		if (!encoder) {
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dsi display\n");
+				return PTR_ERR(encoder);
+			}
+
+			priv->encoders[priv->num_encoders++] = encoder;
+
+			memset(&info, 0, sizeof(info));
+			info.intf_type = encoder->encoder_type;
+			info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
+				MSM_DISPLAY_CAP_CMD_MODE :
+				MSM_DISPLAY_CAP_VID_MODE;
+		}
+
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 				i, rc);
 			break;
 		}
+
+		info.h_tile_instance[info.num_of_h_tiles++] = i;
+
+		/* Register non-bonded encoder here. If the encoder is bonded,
+		 * it will be registered later, when both DSI hosts are
+		 * initialized.
+		 */
+		if (!msm_dsi_is_bonded_dsi(priv->dsi[i])) {
+			rc = dpu_encoder_setup(dev, encoder, &info);
+			if (rc)
+				DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+					  encoder->base.id, rc);
+			encoder = NULL;
+		}
+	}
+
+	/* Register bonded encoder here, when both DSI hosts are initialized */
+	if (encoder) {
+		rc = dpu_encoder_setup(dev, encoder, &info);
+		if (rc)
+			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+				  encoder->base.id, rc);
 	}
 
 	return rc;
@@ -505,6 +543,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					    struct dpu_kms *dpu_kms)
 {
 	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
 	int rc = 0;
 
 	if (!priv->dp)
@@ -516,6 +555,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
+	memset(&info, 0, sizeof(info));
 	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
@@ -524,6 +564,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	}
 
 	priv->encoders[priv->num_encoders++] = encoder;
+
+	info.num_of_h_tiles = 1;
+	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
+	info.intf_type = encoder->encoder_type;
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc)
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+			  encoder->base.id, rc);
 	return rc;
 }
 
@@ -726,41 +774,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	msm_kms_destroy(&dpu_kms->base);
 }
 
-static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode)
-{
-	struct msm_display_info info;
-	struct msm_drm_private *priv = encoder->dev->dev_private;
-	int i, rc = 0;
-
-	memset(&info, 0, sizeof(info));
-
-	info.intf_type = encoder->encoder_type;
-	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
-			MSM_DISPLAY_CAP_VID_MODE;
-
-	switch (info.intf_type) {
-	case DRM_MODE_ENCODER_DSI:
-		/* TODO: No support for DSI swap */
-		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-			if (priv->dsi[i]) {
-				info.h_tile_instance[info.num_of_h_tiles] = i;
-				info.num_of_h_tiles++;
-			}
-		}
-		break;
-	case DRM_MODE_ENCODER_TMDS:
-		info.num_of_h_tiles = 1;
-		break;
-	}
-
-	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
-	if (rc)
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			encoder->base.id, rc);
-}
-
 static irqreturn_t dpu_irq(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -863,7 +876,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.get_format      = dpu_get_msm_format,
 	.round_pixclk    = dpu_kms_round_pixclk,
 	.destroy         = dpu_kms_destroy,
-	.set_encoder_mode = _dpu_kms_set_encoder_mode,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
-- 
2.30.2

