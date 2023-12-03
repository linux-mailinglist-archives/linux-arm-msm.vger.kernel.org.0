Return-Path: <linux-arm-msm+bounces-3140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B2802384
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7E91F21109
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DC7CA49;
	Sun,  3 Dec 2023 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aICzr0cp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CDBDF
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:53:20 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9fe0ef02aso2325501fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701604398; x=1702209198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UCdMNWs57/LLtlNDuSVwj1QQKxWwJWHckRoUFyfJo8=;
        b=aICzr0cplU8SMiKJtrdjP3xdLl6kRW9RG1RDNecwI1yWEV9Sqb6FYobnK98vE7DKG/
         LHSGMBwCZS4SO2r4oLuikMGZwVTp5CjAdHCNVxPHK1p/RBtb4P+BdmnPoeo40N9d4UqJ
         BwUsQ3Op80Zdl+AOCFD2wehsiMXJkPIHptZQSPVpj5i1oP8KNJhfx0NYjrwQnajkSGXT
         5NGX5z/HHPmFlm2IBQiyWmDkUS7i272Ayts+EzAz3H7AuHnjSVDerco4sEykrbU5QCFN
         utL95QEA2RPc/DooPCW/orsva4CkFtTF7gTDhXpXtzuRSjJdq482YO5W6n7FX5Xbb0Q3
         lXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701604398; x=1702209198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UCdMNWs57/LLtlNDuSVwj1QQKxWwJWHckRoUFyfJo8=;
        b=qhCM+rqptR/FceAwOqujIEUZiR4yku5lky4/TOL5gEdnOhxMOMomUTj34fzMoeUmLg
         YYxM24CVjkdT3pBqN/GMPyJNOdY4aFA8IQZS24zy3LJ42lWxM15PM7ZyNMhMlPdRUafo
         pt8RVJNfyz79oDq5O17C7+YrbN1lp/9GcVkVS/RPhGeIrl4nhatTap91P92XNg7gcCiy
         NpxBMwHY1mZ4q7ihfPcGFB6x+dM03+S1LiAGHq8y5cY4rS6jhfc3+qMWbRaHFHej+zeb
         01pP41mtqy98472yekYBVMgJYRsBHLK7iv1eAJkinNbhx4B3JSMw9expMFK5JqX2PBbx
         /rEw==
X-Gm-Message-State: AOJu0YwpcFjsEZyUw/euhr/rToBSFaqKEY6KptkER4b8Tmr38lyYMQ0l
	DVDw7t55ZtPObWbJtQDRGKFGKf8jfbTJ6q5dFjc=
X-Google-Smtp-Source: AGHT+IH3j5uuStP88OXUP9MyXu2+6v0HF+6Oh5Cwp1nrxWa8RZL/Nv1GjH5KL+wYABmLrHaIkXIOKQ==
X-Received: by 2002:a2e:7a14:0:b0:2ca:135:2204 with SMTP id v20-20020a2e7a14000000b002ca01352204mr208688ljc.16.1701604398348;
        Sun, 03 Dec 2023 03:53:18 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z5-20020a2e9645000000b002c9c21d01c2sm900437ljh.101.2023.12.03.03.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:53:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH RESEND v2 2/3] drm/bridge: migrate bridge_chains to per-encoder file
Date: Sun,  3 Dec 2023 14:53:14 +0300
Message-Id: <20231203115315.1306124-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having a single file with all bridge chains, list bridges
under a corresponding per-encoder debugfs directory.

While we are at it, also slightly improve the formatting of the bridge
data: split a single line entry into multiple lines, include the symbol
name of the bridge funcs and add the textual representation of the
bridge ops.

Example of the listing:

$ cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dsi_mgr_bridge_funcs
	type: [0] Unknown
	ops: [0]
bridge[1]: lt9611uxc_bridge_funcs
	type: [11] HDMI-A
	OF: /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b:lontium,lt9611uxc
	ops: [7] detect edid hpd

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge.c  | 44 -----------------------------------
 drivers/gpu/drm/drm_debugfs.c | 40 ++++++++++++++++++++++++++++---
 include/drm/drm_bridge.h      |  2 --
 3 files changed, 37 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 30d66bee0ec6..cee3188adf3d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1347,50 +1347,6 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
-#ifdef CONFIG_DEBUG_FS
-static int drm_bridge_chains_info(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-	struct drm_mode_config *config = &dev->mode_config;
-	struct drm_encoder *encoder;
-	unsigned int bridge_idx = 0;
-
-	list_for_each_entry(encoder, &config->encoder_list, head) {
-		struct drm_bridge *bridge;
-
-		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
-
-		drm_for_each_bridge_in_chain(encoder, bridge) {
-			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
-				   bridge_idx, bridge->type, bridge->ops);
-
-#ifdef CONFIG_OF
-			if (bridge->of_node)
-				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
-#endif
-
-			drm_printf(&p, "\n");
-
-			bridge_idx++;
-		}
-	}
-
-	return 0;
-}
-
-static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
-	{ "bridge_chains", drm_bridge_chains_info, 0 },
-};
-
-void drm_bridge_debugfs_init(struct drm_device *dev)
-{
-	drm_debugfs_add_files(dev, drm_bridge_debugfs_list,
-			      ARRAY_SIZE(drm_bridge_debugfs_list));
-}
-#endif
-
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
 MODULE_DESCRIPTION("DRM bridge infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 00406b4f3235..02e7481758c0 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -314,10 +314,8 @@ void drm_debugfs_dev_register(struct drm_device *dev)
 		drm_framebuffer_debugfs_init(dev);
 		drm_client_debugfs_init(dev);
 	}
-	if (drm_drv_uses_atomic_modeset(dev)) {
+	if (drm_drv_uses_atomic_modeset(dev))
 		drm_atomic_debugfs_init(dev);
-		drm_bridge_debugfs_init(dev);
-	}
 }
 
 int drm_debugfs_register(struct drm_minor *minor, int minor_id,
@@ -589,6 +587,38 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+static int bridges_show(struct seq_file *m, void *data)
+{
+	struct drm_encoder *encoder = m->private;
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_bridge *bridge;
+	unsigned int idx = 0;
+
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		drm_printf(&p, "bridge[%d]: %ps\n", idx++, bridge->funcs);
+		drm_printf(&p, "\ttype: [%d] %s\n",
+			   bridge->type,
+			   drm_get_connector_type_name(bridge->type));
+#ifdef CONFIG_OF
+		if (bridge->of_node)
+			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
+#endif
+		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			drm_puts(&p, " detect");
+		if (bridge->ops & DRM_BRIDGE_OP_EDID)
+			drm_puts(&p, " edid");
+		if (bridge->ops & DRM_BRIDGE_OP_HPD)
+			drm_puts(&p, " hpd");
+		if (bridge->ops & DRM_BRIDGE_OP_MODES)
+			drm_puts(&p, " modes");
+		drm_puts(&p, "\n");
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(bridges);
+
 void drm_debugfs_encoder_add(struct drm_encoder *encoder)
 {
 	struct drm_minor *minor = encoder->dev->primary;
@@ -604,6 +634,10 @@ void drm_debugfs_encoder_add(struct drm_encoder *encoder)
 
 	encoder->debugfs_entry = root;
 
+	/* bridges list */
+	debugfs_create_file("bridges", 0444, root, encoder,
+			    &bridges_fops);
+
 	if (encoder->funcs->debugfs_init)
 		encoder->funcs->debugfs_init(encoder, root);
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9ef461aa9b9e..e39da5807ba7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -950,6 +950,4 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
-void drm_bridge_debugfs_init(struct drm_device *dev);
-
 #endif
-- 
2.39.2


