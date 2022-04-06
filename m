Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25CC74F5F0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 15:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbiDFNYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 09:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbiDFNWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 09:22:40 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C62B63E02D
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 03:13:33 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id c15so2504462ljr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=diKijHPQ7w3gdeTbXE9/TYW2r2t2O1HLm+7iYSPSNXI=;
        b=JS0hHLBPj5kE5JX8gAJTZ37DMJJvQ0o6lJGLh/3FKIAH9OTkKr5C1usNq3cc10VUk3
         VThm74tKhUvfbac+lgZ4xxJzTXIhcpQmnvAy2kSZC0TCkcG7F4Q+CWUNaUuIXA+kZjOq
         y/JaIOhmxlYUDJiM3dYP/yMMQnsyVi6pu4OnZXEIaOoBbjPAF/Nf4DLFj40peZ24fLc2
         +wO6r//E9yKjMwV0HIIpW24LjdAhVh2iJ0s7gQOtbpI31YUFfoNCjuERZuM5+Avamg/0
         QMxFeU1/mNHMmxFRY8EJ1RYCQcxd2BSkf/B8DnHYEdX9NGG6hzgg9r4fQ0HsENpQOUxh
         2i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=diKijHPQ7w3gdeTbXE9/TYW2r2t2O1HLm+7iYSPSNXI=;
        b=n+lGFAp7cgpch3wQm2FgxY04iiOco8s7+sAZ7WvTL9HCXwuw8DiemULFJLnk3iiFOS
         8vmnU7cFsNCHY5z4/VUesp1niX6+760OxNVRtANHHLY9Fp+yuArPkYwZJYofARZcFiie
         HFU64NYIDFnpwU7w6hXPA+Q4zjxZsNKaD4uut6UADyZ0ce0A9Dzj07uYCNe9wKKlIH7h
         mdxDuajKznp2bIhBT1Qhm0s7/7bnBHjsfqbr0eirfVGCGYH08vg1FMcoV0U1/DzZL6rZ
         mpO4AIVcDPnEyvzkognWMdRNLH254VjedUWlib9qA7rtisn0RH50frJ1oTMUnjRP80YP
         Xn+g==
X-Gm-Message-State: AOAM532BpSID6q6Oz4tKHZ4HJCnfHFoDYEiYjqynFMorY53SIJBdnUmX
        fgTp9H5Fj0agVOtpyXa87dGY3g==
X-Google-Smtp-Source: ABdhPJwFB4is/m74CC69A/xxyhPnpR4gPFnZlz4nh6yHIIqDKOODoEqjTrlicdov58Fw0sLz0eX9zg==
X-Received: by 2002:a05:651c:893:b0:249:4023:3818 with SMTP id d19-20020a05651c089300b0024940233818mr4964411ljq.44.1649239972263;
        Wed, 06 Apr 2022 03:12:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 03:12:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm: don't store created planes, connectors and encoders
Date:   Wed,  6 Apr 2022 13:12:47 +0300
Message-Id: <20220406101247.483649-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
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

There is no point now in storing arrays of creates planes, connectors
and encoders. Remove them from struct msm_drm_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 13 +++++++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 ++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 --
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            | 12 ------------
 7 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0bc33243dae8..ecdc7cdae71d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -565,8 +565,6 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-
 		memset(&info, 0, sizeof(info));
 		info.intf_type = encoder->encoder_type;
 
@@ -629,8 +627,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			return rc;
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-
 		info.num_of_h_tiles = 1;
 		info.h_tile_instance[0] = i;
 		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
@@ -675,6 +671,7 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	return rc;
 }
 
+#define MAX_PLANES 20
 static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_device *dev;
@@ -682,6 +679,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
+	unsigned int num_encoders;
 
 	struct msm_drm_private *priv;
 	struct dpu_mdss_cfg *catalog;
@@ -700,7 +698,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	if (ret)
 		return ret;
 
-	max_crtc_count = min(catalog->mixer_count, priv->num_encoders);
+	num_encoders = 0;
+	drm_for_each_encoder(encoder, dev)
+		num_encoders++;
+
+	max_crtc_count = min(catalog->mixer_count, num_encoders);
 
 	/* Create the planes, keeping track of one primary/cursor per crtc */
 	for (i = 0; i < catalog->sspp_count; i++) {
@@ -725,7 +727,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(plane);
 			return ret;
 		}
-		priv->planes[priv->num_planes++] = plane;
 
 		if (type == DRM_PLANE_TYPE_CURSOR)
 			cursor_planes[cursor_planes_idx++] = plane;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3cf476c55158..1862eba51bbb 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -229,9 +229,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 			return PTR_ERR(connector);
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-		priv->connectors[priv->num_connectors++] = connector;
-
 		break;
 	case DRM_MODE_ENCODER_TMDS:
 		encoder = mdp4_dtv_encoder_init(dev);
@@ -252,8 +249,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 			}
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-
 		break;
 	case DRM_MODE_ENCODER_DSI:
 		/* only DSI1 supported for now */
@@ -272,7 +267,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 
 		/* TODO: Add DMA_S later? */
 		encoder->possible_crtcs = 1 << DMA_P;
-		priv->encoders[priv->num_encoders++] = encoder;
 
 		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
 		if (ret) {
@@ -324,7 +318,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(plane);
 			goto fail;
 		}
-		priv->planes[priv->num_planes++] = plane;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(mdp4_crtcs); i++) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 2ba06f979f72..dbfe54de975c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -319,7 +319,6 @@ static struct drm_encoder *construct_encoder(struct mdp5_kms *mdp5_kms,
 					     struct mdp5_ctl *ctl)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_encoder *encoder;
 
 	encoder = mdp5_encoder_init(dev, intf, ctl);
@@ -328,8 +327,6 @@ static struct drm_encoder *construct_encoder(struct mdp5_kms *mdp5_kms,
 		return encoder;
 	}
 
-	priv->encoders[priv->num_encoders++] = encoder;
-
 	return encoder;
 }
 
@@ -435,6 +432,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	struct drm_plane *primary[MAX_BASES] = { NULL };
 	struct drm_plane *cursor[MAX_BASES] = { NULL };
 	struct drm_encoder *encoder;
+	unsigned int num_encoders;
 
 	/*
 	 * Construct encoders and modeset initialize connector devices
@@ -446,12 +444,16 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			goto fail;
 	}
 
+	num_encoders = 0;
+	drm_for_each_encoder(encoder, dev)
+		num_encoders++;
+
 	/*
 	 * We should ideally have less number of encoders (set up by parsing
 	 * the MDP5 interfaces) than the number of layer mixers present in HW,
 	 * but let's be safe here anyway
 	 */
-	num_crtcs = min(priv->num_encoders, mdp5_kms->num_hwmixers);
+	num_crtcs = min(num_encoders, mdp5_kms->num_hwmixers);
 
 	/*
 	 * Construct planes equaling the number of hw pipes, and CRTCs for the
@@ -476,7 +478,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct plane %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->planes[priv->num_planes++] = plane;
 
 		if (type == DRM_PLANE_TYPE_PRIMARY)
 			primary[pi++] = plane;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774a5fbd..ad7a18a0dece 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,8 +1541,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv->panel->connector = dp_display->connector;
 
-	priv->connectors[priv->num_connectors++] = dp_display->connector;
-
 	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
 	if (IS_ERR(dp_display->bridge)) {
 		ret = PTR_ERR(dp_display->bridge);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index c12e66aa42a3..1fe020ee1018 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -273,7 +273,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	}
 
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
-	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
 	return 0;
 fail:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ec324352e862..baa6f1aaadf6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -322,7 +322,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	}
 
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
-	priv->connectors[priv->num_connectors++] = hdmi->connector;
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d661debb50f1..7d4373ba6218 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -46,10 +46,7 @@ struct msm_gem_vma;
 struct msm_disp_state;
 
 #define MAX_CRTCS      8
-#define MAX_PLANES     20
-#define MAX_ENCODERS   8
 #define MAX_BRIDGES    8
-#define MAX_CONNECTORS 8
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
@@ -184,23 +181,14 @@ struct msm_drm_private {
 
 	struct workqueue_struct *wq;
 
-	unsigned int num_planes;
-	struct drm_plane *planes[MAX_PLANES];
-
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[MAX_CRTCS];
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	unsigned int num_encoders;
-	struct drm_encoder *encoders[MAX_ENCODERS];
-
 	unsigned int num_bridges;
 	struct drm_bridge *bridges[MAX_BRIDGES];
 
-	unsigned int num_connectors;
-	struct drm_connector *connectors[MAX_CONNECTORS];
-
 	/* Properties */
 	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
 
-- 
2.35.1

