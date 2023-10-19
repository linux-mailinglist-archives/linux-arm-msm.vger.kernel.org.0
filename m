Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CBE7CF589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 12:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjJSKoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 06:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjJSKoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 06:44:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2FF121
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 03:44:21 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so91673511fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697712260; x=1698317060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hr6WWGCOnU5OOyBRJIL4zR+VSwMJH9fJbH29Qp3trc=;
        b=ifrrldX85g6/EeIR16ZZHCi53mnsGeuvhiBie9w0MDrkYkhBvvTf1svVf9zD7yiFOM
         UrB423ZTcZ7myNnniw97zLQcFBpeoj6Mrv6bGUxuwiaRqA8c+OiVzIy3TD8EjaT9kXiD
         S41iqcNQXXEJMgyYDb9q/t0ckxHD1lj3/Ze8SKrrizhCfJtz6YOEjjFJ5xHlfagIxMCH
         TsE26oySnMwqiqR5Bvz2F7OfygH/1899eFGEQUkENZ/oxVeCyaUfvkhxeOwxA4u4ZtTm
         MDMEuBVmff6dh5PMCsomBGTm8rz5Ai890dHE4/eK+ct6k9D5Jban3u0hPzsrWiOrW+Wm
         7d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697712260; x=1698317060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hr6WWGCOnU5OOyBRJIL4zR+VSwMJH9fJbH29Qp3trc=;
        b=QwGib3hIn8Sv2UsfGLwRJEHORjAHfZJfAjiiDoXR40dlirOKN54PHR6qT9Q/12/W8h
         ojUOBbmtwwIea581XmRb5gwnECXee16IG6GxcMd6GSqrbrt3a/uVT0MrBszKL104yK7M
         c4Le3cdsoogpf8RkpPwUWKbffqFiNJgtQa3u0r5boTh3NBpN37p4+qhMcZpdT77xsifA
         n5qZftXePqAGYnTrHMbHZ9vAzHIVwFzbUDf6f56LbaTdLQUnkh758o9rLAFFI0M7/Byz
         AR2WcEHviTe8z5dV/LgxcthjYpMRSn+GDNMzL+Z8Kb09k1qWxoAEeOpfPQwVEjh7+fP9
         hHAQ==
X-Gm-Message-State: AOJu0YytGSGKLLo5kKXyEmxjPM/Edt0XD45SlrfbvCTaZINwxwci0P+m
        37h/fwHMWJ3ev9wkLRYD+mLIAw==
X-Google-Smtp-Source: AGHT+IFVQ+0BPvBEBmWKKcMQP9i6PpzV3zXuH9UYur/k/neZ8H3KpxBnnmn2oD7dkTCIZGoigoSFzA==
X-Received: by 2002:a05:651c:2222:b0:2c5:a21:8388 with SMTP id y34-20020a05651c222200b002c50a218388mr1368794ljq.29.1697712260080;
        Thu, 19 Oct 2023 03:44:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 13-20020a2e164d000000b002b6d68b520esm1064583ljw.65.2023.10.19.03.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:44:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dp: cleanup debugfs handling
Date:   Thu, 19 Oct 2023 13:44:19 +0300
Message-Id: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently there are two subdirs for DP debugfs files, e.g. DP-1, created
by the drm core for the connector, and the msm_dp-DP-1, created by the
DP driver itself. Merge those two, so that there are no extraneous
connector-related subdirs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  8 ---
 drivers/gpu/drm/msm/dp/dp_debug.c       | 69 ++++++-------------------
 drivers/gpu/drm/msm/dp/dp_debug.h       | 23 +++------
 drivers/gpu/drm/msm/dp/dp_display.c     |  5 +-
 drivers/gpu/drm/msm/dp/dp_display.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c         | 16 ++++++
 drivers/gpu/drm/msm/msm_drv.h           |  6 ---
 7 files changed, 42 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fe7267b3bff5..f15cf7592212 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -275,8 +275,6 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	void *p = dpu_hw_util_get_log_mask_ptr();
 	struct dentry *entry;
 	struct drm_device *dev;
-	struct msm_drm_private *priv;
-	int i;
 
 	if (!p)
 		return -EINVAL;
@@ -286,7 +284,6 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 		return 0;
 
 	dev = dpu_kms->dev;
-	priv = dev->dev_private;
 
 	entry = debugfs_create_dir("debug", minor->debugfs_root);
 
@@ -297,11 +294,6 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dpu_debugfs_core_irq_init(dpu_kms, entry);
 	dpu_debugfs_sspp_init(dpu_kms, entry);
 
-	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
-		if (priv->dp[i])
-			msm_dp_debugfs_init(priv->dp[i], minor);
-	}
-
 	return dpu_core_perf_debugfs_init(dpu_kms, entry);
 }
 #endif
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 3bba901afe33..6c281dc095b9 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -19,13 +19,9 @@
 #define DEBUG_NAME "msm_dp"
 
 struct dp_debug_private {
-	struct dentry *root;
-
 	struct dp_link *link;
 	struct dp_panel *panel;
 	struct drm_connector *connector;
-	struct device *dev;
-	struct drm_device *drm_dev;
 
 	struct dp_debug dp_debug;
 };
@@ -204,35 +200,33 @@ static const struct file_operations test_active_fops = {
 	.write = dp_test_active_write
 };
 
-static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
+static void dp_debug_init(struct dp_debug *dp_debug, struct dentry *root, bool is_edp)
 {
-	char path[64];
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
 
-	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
-
-	debug->root = debugfs_create_dir(path, minor->debugfs_root);
-
-	debugfs_create_file("dp_debug", 0444, debug->root,
+	debugfs_create_file("dp_debug", 0444, root,
 			debug, &dp_debug_fops);
 
-	debugfs_create_file("msm_dp_test_active", 0444,
-			debug->root,
-			debug, &test_active_fops);
+	if (!is_edp) {
+		debugfs_create_file("msm_dp_test_active", 0444,
+				    root,
+				    debug, &test_active_fops);
 
-	debugfs_create_file("msm_dp_test_data", 0444,
-			debug->root,
-			debug, &dp_test_data_fops);
+		debugfs_create_file("msm_dp_test_data", 0444,
+				    root,
+				    debug, &dp_test_data_fops);
 
-	debugfs_create_file("msm_dp_test_type", 0444,
-			debug->root,
-			debug, &dp_test_type_fops);
+		debugfs_create_file("msm_dp_test_type", 0444,
+				    root,
+				    debug, &dp_test_type_fops);
+	}
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_link *link,
-		struct drm_connector *connector, struct drm_minor *minor)
+		struct drm_connector *connector,
+		struct dentry *root, bool is_edp)
 {
 	struct dp_debug_private *debug;
 	struct dp_debug *dp_debug;
@@ -253,46 +247,15 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	debug->dp_debug.debug_en = false;
 	debug->link = link;
 	debug->panel = panel;
-	debug->dev = dev;
-	debug->drm_dev = minor->dev;
-	debug->connector = connector;
 
 	dp_debug = &debug->dp_debug;
 	dp_debug->vdisplay = 0;
 	dp_debug->hdisplay = 0;
 	dp_debug->vrefresh = 0;
 
-	dp_debug_init(dp_debug, minor);
+	dp_debug_init(dp_debug, root, is_edp);
 
 	return dp_debug;
  error:
 	return ERR_PTR(rc);
 }
-
-static int dp_debug_deinit(struct dp_debug *dp_debug)
-{
-	struct dp_debug_private *debug;
-
-	if (!dp_debug)
-		return -EINVAL;
-
-	debug = container_of(dp_debug, struct dp_debug_private, dp_debug);
-
-	debugfs_remove_recursive(debug->root);
-
-	return 0;
-}
-
-void dp_debug_put(struct dp_debug *dp_debug)
-{
-	struct dp_debug_private *debug;
-
-	if (!dp_debug)
-		return;
-
-	debug = container_of(dp_debug, struct dp_debug_private, dp_debug);
-
-	dp_debug_deinit(dp_debug);
-
-	devm_kfree(debug->dev, debug);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 124227873d58..9b3b2e702f65 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -34,7 +34,8 @@ struct dp_debug {
  * @panel: instance of panel module
  * @link: instance of link module
  * @connector: double pointer to display connector
- * @minor: pointer to drm minor number after device registration
+ * @root: connector's debugfs root
+ * @is_edp: set for eDP connectors / panels
  * return: pointer to allocated debug module data
  *
  * This function sets up the debug module and provides a way
@@ -43,31 +44,21 @@ struct dp_debug {
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_link *link,
 		struct drm_connector *connector,
-		struct drm_minor *minor);
-
-/**
- * dp_debug_put()
- *
- * Cleans up dp_debug instance
- *
- * @dp_debug: instance of dp_debug
- */
-void dp_debug_put(struct dp_debug *dp_debug);
+		struct dentry *root,
+		bool is_edp);
 
 #else
 
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_link *link,
-		struct drm_connector *connector, struct drm_minor *minor)
+		struct drm_connector *connector,
+		struct dentry *root,
+		bool is_edp)
 {
 	return ERR_PTR(-EINVAL);
 }
 
-static inline void dp_debug_put(struct dp_debug *dp_debug)
-{
-}
-
 #endif /* defined(CONFIG_DEBUG_FS) */
 
 #endif /* _DP_DEBUG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e329e03e068d..2ac9d61501c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -715,7 +715,6 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
-	dp_debug_put(dp->debug);
 	dp_audio_put(dp->audio);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
@@ -1451,7 +1450,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return dp->wide_bus_en;
 }
 
-void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
+void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, bool is_edp)
 {
 	struct dp_display_private *dp;
 	struct device *dev;
@@ -1462,7 +1461,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 
 	dp->debug = dp_debug_get(dev, dp->panel,
 					dp->link, dp->dp_display.connector,
-					minor);
+					root, is_edp);
 	if (IS_ERR(dp->debug)) {
 		rc = PTR_ERR(dp->debug);
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index f66cdbc35785..5e2fbd8318e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -42,5 +42,6 @@ int dp_display_get_test_bpp(struct msm_dp *dp_display);
 void dp_display_signal_audio_start(struct msm_dp *dp_display);
 void dp_display_signal_audio_complete(struct msm_dp *dp_display);
 void dp_display_set_psr(struct msm_dp *dp, bool enter);
+void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *dentry, bool is_edp);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 284ff7df058a..7e34715bdd82 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -90,6 +90,13 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	return rc;
 }
 
+static void dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+{
+	struct msm_dp *dp = to_dp_bridge(bridge)->dp_display;
+
+	dp_display_debugfs_init(dp, root, false);
+}
+
 static const struct drm_bridge_funcs dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
@@ -105,6 +112,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.hpd_enable   = dp_bridge_hpd_enable,
 	.hpd_disable  = dp_bridge_hpd_disable,
 	.hpd_notify   = dp_bridge_hpd_notify,
+	.debugfs_init = dp_bridge_debugfs_init,
 };
 
 static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
@@ -260,6 +268,13 @@ static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static void edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+{
+	struct msm_dp *dp = to_dp_bridge(bridge)->dp_display;
+
+	dp_display_debugfs_init(dp, root, true);
+}
+
 static const struct drm_bridge_funcs edp_bridge_ops = {
 	.atomic_enable = edp_bridge_atomic_enable,
 	.atomic_disable = edp_bridge_atomic_disable,
@@ -270,6 +285,7 @@ static const struct drm_bridge_funcs edp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_check = edp_bridge_atomic_check,
+	.debugfs_init = edp_bridge_debugfs_init,
 };
 
 int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index cd5bf658df66..628ef3e663ea 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -389,7 +389,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
-void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 #else
@@ -415,11 +414,6 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
 {
 }
 
-static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
-		struct drm_minor *minor)
-{
-}
-
 static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 {
 	return false;
-- 
2.39.2

