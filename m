Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050C6790FBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 03:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243569AbjIDBxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 21:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbjIDBxq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 21:53:46 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103CDFE
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 18:53:43 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so14737141fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 18:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693792421; x=1694397221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKurKpJO/W/lSqK2A4xu4KLR2HBC73PbdygNPCFcKNM=;
        b=mdFxTzu9p5QRBczy3C8iqh58U4T/7NcE4bA1joMVGLSbTlkuJN9sBCBxcyG04e7S1c
         wIpliAiuxY+iFEaQpqLQ2g32pzrPeqIwWOvabrh/vViMssC2UphcNsgbgwEe+kyzQVS9
         lrmaeIYtg6pckC03aAfFP5I+ke0X2yRxk0xTpWA+NDTXX/fMl12SJHaDTbJn7SW3EvYS
         Cr7KYk7WaEpEVKxaSLVEz7okZm1vaZpfPrvbSM4XlrR+O2HOy69arle7bMzE/XfCO+S3
         Tups1mfa8nFlaiAoyHMRjCJMNG1hyAnmm6T6MVYMLrHcUpmT7Uu+aggUq7vuVCE/+KFS
         6ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693792421; x=1694397221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKurKpJO/W/lSqK2A4xu4KLR2HBC73PbdygNPCFcKNM=;
        b=KrKOIly9o3N+ipzH2OuM5jdOiRhLZYyMrZh7hi6Cl1H911q/m87TY0uG+d5TzwIKBM
         w6mvUgVGL4jqJt/5wRrDd0WuxxiSbqVbjOZnCfALM6/hIAlBE63fm1u7+4p4uivt2g7f
         7qojy3fkqCNk1uWEjivr3c6HMPloirjqFgNkKLdTQV+rKApT07g0j5NGCF259ih2W4fv
         g5rFLNRnw+6aWqyQdyREDar0iv/OXMNDBLsh1p2paSCO5SV0TkDd8fS+BPo3RvObdNmt
         xC/Ac5bcD+hndPS+eQaz2umT9g/Z5nixRGGnFAkHUaNudmc6fur/TPCQeQWyE745hPQS
         Rc9g==
X-Gm-Message-State: AOJu0YyfXNJjTYDFpO/IJdRgjLVo2mdHGPhDFLJf7s23q4OOnYVTVoiW
        4ZWfW0XFzmMLP9eKLTJHp2YNGQ==
X-Google-Smtp-Source: AGHT+IHK7V5Wxko/8bijdyJiXwTGU5SnRprshL8y7Mp97WHLUrMh/qbHHYt66uKeIOB5JA50D7k0pQ==
X-Received: by 2002:a2e:9e8d:0:b0:2b6:eb5a:d377 with SMTP id f13-20020a2e9e8d000000b002b6eb5ad377mr5044166ljk.5.1693792421365;
        Sun, 03 Sep 2023 18:53:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o14-20020a2e9b4e000000b002b6d68b520esm1736657ljj.65.2023.09.03.18.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 18:53:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/bridge: migrate bridge_chains to per-encoder file
Date:   Mon,  4 Sep 2023 04:53:37 +0300
Message-Id: <20230904015338.2941417-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of having a single file with all bridge chains, list bridges
under a corresponding per-encoder debugfs directory.

Example of the listing:

$ cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dsi_mgr_bridge_funcs
	type: [0] Unknown
	ops: [0]
bridge[1]: lt9611uxc_bridge_funcs
	type: [11] HDMI-A
	OF: /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b:lontium,lt9611uxc
	ops: [7] detect edid hpd

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge.c  | 44 -----------------------------------
 drivers/gpu/drm/drm_debugfs.c | 39 ++++++++++++++++++++++++++++---
 include/drm/drm_bridge.h      |  2 --
 3 files changed, 36 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 39e68e45bb12..cee3188adf3d 100644
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
-void drm_bridge_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
-			      ARRAY_SIZE(drm_bridge_debugfs_list));
-}
-#endif
-
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
 MODULE_DESCRIPTION("DRM bridge infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index cf7f33bdc963..70913067406d 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -273,10 +273,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 
 	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
 
-	if (drm_drv_uses_atomic_modeset(dev)) {
+	if (drm_drv_uses_atomic_modeset(dev))
 		drm_atomic_debugfs_init(minor);
-		drm_bridge_debugfs_init(minor);
-	}
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		drm_framebuffer_debugfs_init(minor);
@@ -603,6 +601,37 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+static int bridges_show(struct seq_file *m, void *data)
+{
+	struct drm_encoder *encoder = m->private;
+	struct drm_bridge *bridge;
+	unsigned int idx = 0;
+
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		seq_printf(m, "bridge[%d]: %ps\n", idx++, bridge->funcs);
+		seq_printf(m, "\ttype: [%d] %s\n",
+			   bridge->type,
+			   drm_get_connector_type_name(bridge->type));
+#ifdef CONFIG_OF
+		if (bridge->of_node)
+			seq_printf(m, "\tOF: %pOFfc\n", bridge->of_node);
+#endif
+		seq_printf(m, "\tops: [0x%x]", bridge->ops);
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			seq_puts(m, " detect");
+		if (bridge->ops & DRM_BRIDGE_OP_EDID)
+			seq_puts(m, " edid");
+		if (bridge->ops & DRM_BRIDGE_OP_HPD)
+			seq_puts(m, " hpd");
+		if (bridge->ops & DRM_BRIDGE_OP_MODES)
+			seq_puts(m, " modes");
+		seq_puts(m, "\n");
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(bridges);
+
 void drm_debugfs_encoder_add(struct drm_encoder *encoder)
 {
 	struct drm_minor *minor = encoder->dev->primary;
@@ -618,6 +647,10 @@ void drm_debugfs_encoder_add(struct drm_encoder *encoder)
 
 	encoder->debugfs_entry = root;
 
+	/* bridges list */
+	debugfs_create_file("bridges", 0444, root, encoder,
+			    &bridges_fops);
+
 	if (encoder->funcs->debugfs_init)
 		encoder->funcs->debugfs_init(encoder, root);
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c339fc85fd07..902bc3f99c2a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -950,6 +950,4 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
-void drm_bridge_debugfs_init(struct drm_minor *minor);
-
 #endif
-- 
2.39.2

