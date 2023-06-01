Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC2971F096
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjFARWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbjFARWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:22:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DE7D1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:22:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so1485503e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640159; x=1688232159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmnoMGDMgMIsXZ7B+vxs0uT+taCJmwO7yjnPSnMVJ0E=;
        b=HHgEiJSsPjBjlJV43HfOWibGsXfjM0LPkg+wZZcpJyMZAkCd2mokl7QLKjziYrqI8Q
         yJ07S4u4Bn1y9caBw+JanuFCvY8/b2r8AevOLtT5yPAkSolGaC5hEWgJcpyyf6vO8ByK
         FHQxoaKmQWlcfv8Mr7lbGE9Nrh3P0ssgXffprZuZNU16KaBLHIjSfs+NvtTVYcRDa4Qk
         dA2eoycbCsMoLpL1H3l8AsWE8fzBfRGygfgblofRlfMSVZiSHlU+nyjLq5AAKSOVrAAi
         KisbVKCDZcLcDtDcoeqK6+xHWRGT906hE/y1EBhlCWuBzVSc/jmjbEpt1vTQ/VZvh/xp
         M7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640159; x=1688232159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmnoMGDMgMIsXZ7B+vxs0uT+taCJmwO7yjnPSnMVJ0E=;
        b=kKbn6mxZ+Xwv3zafmd9h0XTDxa9mdHhvRsg6MizL05lbjSgQtrYndwB1bhSPtVb8XZ
         9VlsFoX3ytThbdyt0U6b/pBomhzReZNyJvd0wT5WMI1Z04WQV8CIksgwXK9yVxEqAngy
         ow0me672Ry1HQKTqARRpaE/SPVP15uMyVjDrtqmijn3JgS9GDOd8ByFn0T9VEBnFXLUM
         hg8HM6wM8EX4i5pBmWXMYH3Y2iaNLifNUlFFPv3ia/W3tL5qD4bDuPGHi6M396bAha5n
         5rmZPw7lVKVjhTeIK61Cjy7WAl0tjwi8qioExpIEYgUnj5GYyCYJO/cj+wdKjoY8KEJI
         mwyA==
X-Gm-Message-State: AC+VfDwxHjh2pk2MXjWP6YRzj9RGEgI3AtgNEAjOSytKyPAmUX+rm4vK
        v/XQDTq+LP9gTKXSoCcox0zYDQ==
X-Google-Smtp-Source: ACHHUZ71WOJLZeTl1xr4h+UFupaxeENCUFd2eHCkbzpgv5QyxF0qnPsuyEO77Rk3pADLuOOTVXKGBg==
X-Received: by 2002:a19:7609:0:b0:4f1:45f1:e934 with SMTP id c9-20020a197609000000b004f145f1e934mr356094lff.66.1685640158978;
        Thu, 01 Jun 2023 10:22:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:22:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
Date:   Thu,  1 Jun 2023 20:22:30 +0300
Message-Id: <20230601172236.564445-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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

There is no reason to split the dpu_encoder interface into separate
_init() and _setup() phases. Merge them into a single function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 55 +++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 14 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 87 ++++++++-------------
 3 files changed, 56 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d7cd4734dc7d..d4b759e8f2ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2388,7 +2388,8 @@ static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.early_unregister = dpu_encoder_early_unregister,
 };
 
-int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
+struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
+		int drm_enc_mode,
 		struct msm_display_info *disp_info)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -2397,7 +2398,23 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 
-	dpu_enc = to_dpu_encoder_virt(enc);
+	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
+	if (!dpu_enc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
+			       drm_enc_mode, NULL);
+	if (ret) {
+		devm_kfree(dev->dev, dpu_enc);
+		return ERR_PTR(ret);
+	}
+
+	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
+
+	spin_lock_init(&dpu_enc->enc_spinlock);
+	dpu_enc->enabled = false;
+	mutex_init(&dpu_enc->enc_lock);
+	mutex_init(&dpu_enc->rc_lock);
 
 	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
 	if (ret)
@@ -2426,44 +2443,14 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 
 	DPU_DEBUG_ENC(dpu_enc, "created\n");
 
-	return ret;
+	return &dpu_enc->base;
 
 fail:
 	DPU_ERROR("failed to create encoder\n");
 	if (drm_enc)
 		dpu_encoder_destroy(drm_enc);
 
-	return ret;
-
-
-}
-
-struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-		int drm_enc_mode)
-{
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int rc = 0;
-
-	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
-	if (!dpu_enc)
-		return ERR_PTR(-ENOMEM);
-
-
-	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-							  drm_enc_mode, NULL);
-	if (rc) {
-		devm_kfree(dev->dev, dpu_enc);
-		return ERR_PTR(rc);
-	}
-
-	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
-
-	spin_lock_init(&dpu_enc->enc_spinlock);
-	dpu_enc->enabled = false;
-	mutex_init(&dpu_enc->enc_lock);
-	mutex_init(&dpu_enc->rc_lock);
-
-	return &dpu_enc->base;
+	return ERR_PTR(ret);
 }
 
 int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 6d14f84dd43f..90e1925d7770 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -130,20 +130,12 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
 /**
  * dpu_encoder_init - initialize virtual encoder object
  * @dev:        Pointer to drm device structure
+ * @drm_enc_mode: corresponding DRM_MODE_ENCODER_* constant
  * @disp_info:  Pointer to display information structure
  * Returns:     Pointer to newly created drm encoder
  */
-struct drm_encoder *dpu_encoder_init(
-		struct drm_device *dev,
-		int drm_enc_mode);
-
-/**
- * dpu_encoder_setup - setup dpu_encoder for the display probed
- * @dev:		Pointer to drm device structure
- * @enc:		Pointer to the drm_encoder
- * @disp_info:	Pointer to the display info
- */
-int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
+struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
+		int drm_enc_mode,
 		struct msm_display_info *disp_info);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8ce057cc9374..70a17ef8281f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -535,15 +535,23 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		    !msm_dsi_is_master_dsi(priv->dsi[i]))
 			continue;
 
-		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
+		memset(&info, 0, sizeof(info));
+		info.intf_type = INTF_DSI;
+
+		info.h_tile_instance[info.num_of_h_tiles++] = i;
+		if (msm_dsi_is_bonded_dsi(priv->dsi[i]))
+			info.h_tile_instance[info.num_of_h_tiles++] = other;
+
+		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
+
+		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
+
+		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {
 			DPU_ERROR("encoder init failed for dsi display\n");
 			return PTR_ERR(encoder);
 		}
 
-		memset(&info, 0, sizeof(info));
-		info.intf_type = INTF_DSI;
-
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
@@ -551,11 +559,6 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			break;
 		}
 
-		info.h_tile_instance[info.num_of_h_tiles++] = i;
-		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
-
-		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
-
 		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
 			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
 			if (rc) {
@@ -563,14 +566,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 					other, rc);
 				break;
 			}
-
-			info.h_tile_instance[info.num_of_h_tiles++] = other;
 		}
-
-		rc = dpu_encoder_setup(dev, encoder, &info);
-		if (rc)
-			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-				  encoder->base.id, rc);
 	}
 
 	return rc;
@@ -589,29 +585,23 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		if (!priv->dp[i])
 			continue;
 
-		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+		memset(&info, 0, sizeof(info));
+		info.num_of_h_tiles = 1;
+		info.h_tile_instance[0] = i;
+		info.intf_type = INTF_DP;
+
+		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
 		if (IS_ERR(encoder)) {
 			DPU_ERROR("encoder init failed for dsi display\n");
 			return PTR_ERR(encoder);
 		}
 
-		memset(&info, 0, sizeof(info));
 		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			drm_encoder_cleanup(encoder);
 			return rc;
 		}
-
-		info.num_of_h_tiles = 1;
-		info.h_tile_instance[0] = i;
-		info.intf_type = INTF_DP;
-		rc = dpu_encoder_setup(dev, encoder, &info);
-		if (rc) {
-			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-				  encoder->base.id, rc);
-			return rc;
-		}
 	}
 
 	return 0;
@@ -628,13 +618,17 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	if (!priv->hdmi)
 		return 0;
 
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	memset(&info, 0, sizeof(info));
+	info.num_of_h_tiles = 1;
+	info.h_tile_instance[0] = 0;
+	info.intf_type = INTF_HDMI;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for HDMI display\n");
 		return PTR_ERR(encoder);
 	}
 
-	memset(&info, 0, sizeof(info));
 	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
@@ -642,16 +636,6 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 		return rc;
 	}
 
-	info.num_of_h_tiles = 1;
-	info.h_tile_instance[0] = 0;
-	info.intf_type = INTF_HDMI;
-	rc = dpu_encoder_setup(dev, encoder, &info);
-	if (rc) {
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			  encoder->base.id, rc);
-		return rc;
-	}
-
 	return 0;
 }
 
@@ -663,14 +647,19 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	struct msm_display_info info;
 	int rc;
 
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
+	memset(&info, 0, sizeof(info));
+
+	info.num_of_h_tiles = 1;
+	/* use only WB idx 2 instance for DPU */
+	info.h_tile_instance[0] = WB_2;
+	info.intf_type = INTF_WB;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for dsi display\n");
 		return PTR_ERR(encoder);
 	}
 
-	memset(&info, 0, sizeof(info));
-
 	rc = dpu_writeback_init(dev, encoder, wb_formats,
 			n_formats);
 	if (rc) {
@@ -679,18 +668,6 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 		return rc;
 	}
 
-	info.num_of_h_tiles = 1;
-	/* use only WB idx 2 instance for DPU */
-	info.h_tile_instance[0] = WB_2;
-	info.intf_type = INTF_WB;
-
-	rc = dpu_encoder_setup(dev, encoder, &info);
-	if (rc) {
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-				  encoder->base.id, rc);
-		return rc;
-	}
-
 	return 0;
 }
 
-- 
2.39.2

