Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D724E4F47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 10:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239666AbiCWJ1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 05:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241175AbiCWJ1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 05:27:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E951B7B4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 02:25:46 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p15so1641903lfk.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6lQQa1WdL38Bk6REYTSkjB6pKip7mwO/UqnXWcQJ5dw=;
        b=kDaOH5He/gAQCjKK/mgnKdR4YWnqTL8FdPuotrhAjipakryKAPvy8RcSd5S9fpTr/e
         ngTc++Isdt5nowWj0X6BUGMw3vY4LehrjrdaD3uJoX3s2DreUzjjv0r+gHHrSYSMU/yz
         5XVz6hnDgc+8FIMgHRR5ZqnxakDFc86SPBRrtqXe5zIVi44Vdaut9aU7Wx9c97+Z4kVf
         1/EHXwEZLTN0DoPGmXDCtStP8FW6PqqeJu9ot2Uiqv2vxauLwbmwupLmFCnlrm9yoOfq
         c/1kUgz/1l4yA3FI0/Q5BuW5ZPyGcSfWo/v6eLsuf+FSU5lL0GPq+9dnEr1c5ztXbLeO
         cgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lQQa1WdL38Bk6REYTSkjB6pKip7mwO/UqnXWcQJ5dw=;
        b=2ygOECKP6QRSMrG0G/90E5SfoQKT7FMFccY8Qy7zvgcTPfuGVHEwg5Hs7o9r9tJ+4j
         mFbyKjKBA4o7zuq/7It52NF2fbATA61KI4qIEamuVFpTin9Xh5YR4l0QzbjjxQQdxEDR
         djveRWdLXv7bPAyBbZvPXZL87A3fHvo1S3a1sDh2gatRkAdFqp2qkxBIBwWbq85nqx9V
         5D0WLnRvZXjzs05t6aCkvwRw+OJwUPlSGnVJnGvuuGWV4PRoBD29io1jAG3/XIXIsVgy
         ANax3JedtPOPhNG47r3SuqxL4HW+Io8z9L6sq/SP53PLpicr1Bn5tXqm5ZFoffZ3V9w4
         C72g==
X-Gm-Message-State: AOAM531Z0ibCMX1C47U8Q6sstXQJBzEfIYucc7IyrJK1xXQB3e/eQE2/
        R0kCOnNgGAeyCk/EYCNT92tdEw==
X-Google-Smtp-Source: ABdhPJwwqGxOFrEAX8/ObJmEBiVgyx/cWUNrmz43D6cJrBNRdhwM8jlWf4TJsx8cNqTag6FRHQxHnA==
X-Received: by 2002:a05:6512:6d:b0:44a:42b7:e775 with SMTP id i13-20020a056512006d00b0044a42b7e775mr4212980lfo.33.1648027544510;
        Wed, 23 Mar 2022 02:25:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id br12-20020a056512400c00b0044a2c454ebcsm986026lfb.27.2022.03.23.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 02:25:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/msm: allow compile time selection of driver components
Date:   Wed, 23 Mar 2022 12:25:37 +0300
Message-Id: <20220323092538.1757880-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
References: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
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

MSM DRM driver already allows one to compile out the DP or DSI support.
Add support for disabling other features like MDP4/MDP5/DPU drivers or
direct HDMI output support.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig                   | 50 +++++++++++++++++--
 drivers/gpu/drm/msm/Makefile                  | 24 ++++++---
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |  3 ++
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |  3 ++
 drivers/gpu/drm/msm/msm_drv.h                 | 33 ++++++++++++
 drivers/gpu/drm/msm/msm_mdss.c                | 13 ++++-
 6 files changed, 115 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 9b019598e042..96b01873ce36 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -46,12 +46,39 @@ config DRM_MSM_GPU_SUDO
 	  Only use this if you are a driver developer.  This should *not*
 	  be enabled for production kernels.  If unsure, say N.
 
-config DRM_MSM_HDMI_HDCP
-	bool "Enable HDMI HDCP support in MSM DRM driver"
+config DRM_MSM_MDSS
+	bool
+	depends on DRM_MSM
+	default n
+
+config DRM_MSM_MDP4
+	bool "Enable MDP4 support in MSM DRM driver"
 	depends on DRM_MSM
 	default y
 	help
-	  Choose this option to enable HDCP state machine
+	  Compile in support for the Mobile Display Processor v4 (MDP4) in
+	  the MSM DRM driver. It is the older display controller found in
+	  devices using APQ8064/MSM8960/MSM8x60 platforms.
+
+config DRM_MSM_MDP5
+	bool "Enable MDP5 support in MSM DRM driver"
+	depends on DRM_MSM
+	select DRM_MSM_MDSS
+	default y
+	help
+	  Compile in support for the Mobile Display Processor v5 (MDP5) in
+	  the MSM DRM driver. It is the display controller found in devices
+	  using e.g. APQ8016/MSM8916/APQ8096/MSM8996/MSM8974/SDM6x0 platforms.
+
+config DRM_MSM_DPU
+	bool "Enable DPU support in MSM DRM driver"
+	depends on DRM_MSM
+	select DRM_MSM_MDSS
+	default y
+	help
+	  Compile in support for the Display Processing Unit in
+	  the MSM DRM driver. It is the display controller found in devices
+	  using e.g. SDM845 and newer platforms.
 
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
@@ -116,3 +143,20 @@ config DRM_MSM_DSI_7NM_PHY
 	help
 	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
 	  the platform.
+
+config DRM_MSM_HDMI
+	bool "Enable HDMI support in MSM DRM driver"
+	depends on DRM_MSM
+	default y
+	help
+	  Compile in support for the HDMI output MSM DRM driver. It can
+	  be a primary or a secondary display on device. Note that this is used
+	  only for the direct HDMI output. If the device outputs HDMI data
+	  throught some kind of DSI-to-HDMI bridge, this option can be disabled.
+
+config DRM_MSM_HDMI_HDCP
+	bool "Enable HDMI HDCP support in MSM DRM driver"
+	depends on DRM_MSM && DRM_MSM_HDMI
+	default y
+	help
+	  Choose this option to enable HDCP state machine
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index e76927b42033..3dc576309255 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -16,6 +16,8 @@ msm-y := \
 	adreno/a6xx_gpu.o \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
+
+msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi.o \
 	hdmi/hdmi_audio.o \
 	hdmi/hdmi_bridge.o \
@@ -27,9 +29,10 @@ msm-y := \
 	hdmi/hdmi_phy_8x60.o \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
-	disp/mdp_format.o \
-	disp/mdp_kms.o \
+
+msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
+	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
 	disp/mdp4/mdp4_lcdc_encoder.o \
 	disp/mdp4/mdp4_lvds_connector.o \
@@ -37,7 +40,10 @@ msm-y := \
 	disp/mdp4/mdp4_irq.o \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
+
+msm-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_cfg.o \
+	disp/mdp5/mdp5_cmd_encoder.o \
 	disp/mdp5/mdp5_ctl.o \
 	disp/mdp5/mdp5_crtc.o \
 	disp/mdp5/mdp5_encoder.o \
@@ -47,6 +53,8 @@ msm-y := \
 	disp/mdp5/mdp5_mixer.o \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
+
+msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
 	disp/dpu1/dpu_encoder.o \
@@ -69,6 +77,13 @@ msm-y := \
 	disp/dpu1/dpu_plane.o \
 	disp/dpu1/dpu_rm.o \
 	disp/dpu1/dpu_vbif.o \
+
+msm-$(CONFIG_DRM_MSM_MDSS) += \
+	msm_mdss.o \
+
+msm-y += \
+	disp/mdp_format.o \
+	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
 	msm_atomic.o \
@@ -86,7 +101,6 @@ msm-y := \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
-	msm_mdss.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
@@ -117,12 +131,10 @@ msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
 msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
-			disp/mdp4/mdp4_dsi_encoder.o \
 			dsi/dsi_cfg.o \
 			dsi/dsi_host.o \
 			dsi/dsi_manager.o \
-			dsi/phy/dsi_phy.o \
-			disp/mdp5/mdp5_cmd_encoder.o
+			dsi/phy/dsi_phy.o
 
 msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
 msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index aaf2f26f8505..39b8fe53c29d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -11,6 +11,8 @@
 
 #include "mdp4_kms.h"
 
+#ifdef CONFIG_DRM_MSM_DSI
+
 struct mdp4_dsi_encoder {
 	struct drm_encoder base;
 	struct drm_panel *panel;
@@ -170,3 +172,4 @@ struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+#endif /* CONFIG_DRM_MSM_DSI */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index ec6c7b09865e..a640af22eafc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -8,6 +8,8 @@
 
 #include "mdp5_kms.h"
 
+#ifdef CONFIG_DRM_MSM_DSI
+
 static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 {
 	struct msm_drm_private *priv = encoder->dev->dev_private;
@@ -198,3 +200,4 @@ int mdp5_cmd_encoder_set_split_display(struct drm_encoder *encoder,
 
 	return 0;
 }
+#endif /* CONFIG_DRM_MSM_DSI */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c1aaadfbea34..6bad7e7b479d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -314,10 +314,20 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev);
 void msm_fbdev_free(struct drm_device *dev);
 
 struct hdmi;
+#ifdef CONFIG_DRM_MSM_HDMI
 int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
 		struct drm_encoder *encoder);
 void __init msm_hdmi_register(void);
 void __exit msm_hdmi_unregister(void);
+#else
+static inline int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
+		struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+static inline void __init msm_hdmi_register(void) {}
+static inline void __exit msm_hdmi_unregister(void) {}
+#endif
 
 struct msm_dsi;
 #ifdef CONFIG_DRM_MSM_DSI
@@ -432,14 +442,37 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 
 #endif
 
+#ifdef CONFIG_DRM_MSM_MDP4
 void msm_mdp4_register(void);
 void msm_mdp4_unregister(void);
+#else
+static inline void msm_mdp4_register(void) {}
+static inline void msm_mdp4_unregister(void) {}
+#endif
+
+#ifdef CONFIG_DRM_MSM_MDP5
 void msm_mdp_register(void);
 void msm_mdp_unregister(void);
+#else
+static inline void msm_mdp_register(void) {}
+static inline void msm_mdp_unregister(void) {}
+#endif
+
+#ifdef CONFIG_DRM_MSM_DPU
 void msm_dpu_register(void);
 void msm_dpu_unregister(void);
+#else
+static inline void msm_dpu_register(void) {}
+static inline void msm_dpu_unregister(void) {}
+#endif
+
+#ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);
+#else
+static inline void msm_mdss_register(void) {}
+static inline void msm_mdss_unregister(void) {}
+#endif
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index cd05f92bee15..7451105cbf01 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -303,8 +303,17 @@ static const struct dev_pm_ops mdss_pm_ops = {
 
 static int find_mdp_node(struct device *dev, void *data)
 {
-	return of_match_node(dpu_dt_match, dev->of_node) ||
-		of_match_node(mdp5_dt_match, dev->of_node);
+#ifdef CONFIG_DRM_MSM_DPU
+	if (of_match_node(dpu_dt_match, dev->of_node))
+		return true;
+#endif
+
+#ifdef CONFIG_DRM_MSM_MDP5
+	if (of_match_node(mdp5_dt_match, dev->of_node))
+		return true;
+#endif
+
+	return false;
 }
 
 static int mdss_probe(struct platform_device *pdev)
-- 
2.35.1

