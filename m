Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E77790FBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 03:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237008AbjIDBxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 21:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbjIDBxq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 21:53:46 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46127F4
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 18:53:42 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so14765031fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 18:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693792420; x=1694397220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E45yW3bifAp1XkPk7OUkfMOU/+n3vxTZLRpPxdzCeYo=;
        b=fFm30pUywPkq4oaMwfI8wqX/J58ICHh5idf/Vwnf6i/nbchXyn9lLHzGnlWVlGhcGE
         QBOMiZuYAeSAkumgS26t8DsQYUUq2pt1vx6f98OvybhnbaW37XclFg16VysFekcCqBnY
         y0SCanAQOfRDW/WBddHfjAT3qvgoGR9j3Qn3n0B4EBtv5odO6/t5oa4m1D14Xdoxvo6Z
         MItEqsC2KkQvvEbfAvlO6FF5ZXhQWB9vJqNDe3KHhhc3WjRs22zzkSeAjhvlGsdB1klA
         MJFwkMbrunvLVsUmT0JtO63TPN4fpnX9S0/GdLB8hCCpVFxe3gRxoxiyojRQAAwigDoI
         avqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693792420; x=1694397220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E45yW3bifAp1XkPk7OUkfMOU/+n3vxTZLRpPxdzCeYo=;
        b=lPHiTp9wbZQlS/Wn5XSZfVhxeAfLIzlS1PmS6Xg81+au6jBx7DnjAbHJ3sQoZxzqHg
         P9bTXdJbDUcb85gIKNPXnhz1ORuMGgO/RRnAb5X2o1stLMap4/Fra6lKOKIF6R+DYLw8
         5Hz7m65oAcAal5M54/dEhcEMTk1hhUzrizJBv1sBYV5ySH9UAOh+RUPCs7s+MUCXLGmm
         1g+g7edqswczqY64M3Lx/p/d+9Dr6V6+ph1/UmmLenX5gvvgOxAmPM9XMHaOsSvNGEnQ
         U76yLijgTRjq6OsdbQrbQF7Ev+lquAd0v7G1a/dsszSjNA3xn/Vx6Ko+IGDOk0ioVq4X
         vW5w==
X-Gm-Message-State: AOJu0YywdAXTNzBkvj8ZanW/KrQhOGWncZ2aKg4GN0sU+bj9432qPQ1t
        OLba1/9OM+eQDzZT/1aizK1VYw==
X-Google-Smtp-Source: AGHT+IGCJaqpDmf5lr933nTijKI5ERWTsczglSsdM7jFhGnB9wm95p8OlVpF34wTmwoq36T1Ul3ZIw==
X-Received: by 2002:a2e:b16b:0:b0:2bc:da3e:3bd2 with SMTP id a11-20020a2eb16b000000b002bcda3e3bd2mr6125416ljm.29.1693792420425;
        Sun, 03 Sep 2023 18:53:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o14-20020a2e9b4e000000b002b6d68b520esm1736657ljj.65.2023.09.03.18.53.39
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
Subject: [PATCH 1/3] drm/encoder: register per-encoder debugfs dir
Date:   Mon,  4 Sep 2023 04:53:36 +0300
Message-Id: <20230904015338.2941417-2-dmitry.baryshkov@linaro.org>
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

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_encoder.c  |  4 ++++
 drivers/gpu/drm/drm_internal.h |  9 +++++++++
 include/drm/drm_encoder.h      | 16 +++++++++++++++-
 4 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2de43ff3ce0a..cf7f33bdc963 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -603,4 +603,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+void drm_debugfs_encoder_add(struct drm_encoder *encoder)
+{
+	struct drm_minor *minor = encoder->dev->primary;
+	struct dentry *root;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "encoder-%d", encoder->index);
+	if (!name)
+		return;
+
+	root = debugfs_create_dir(name, minor->debugfs_root);
+	kfree(name);
+
+	encoder->debugfs_entry = root;
+
+	if (encoder->funcs->debugfs_init)
+		encoder->funcs->debugfs_init(encoder, root);
+}
+
+void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
+{
+	debugfs_remove_recursive(encoder->debugfs_entry);
+	encoder->debugfs_entry = NULL;
+}
+
 #endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 1143bc7f3252..8f2bc6a28482 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -30,6 +30,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -74,6 +75,8 @@ int drm_encoder_register_all(struct drm_device *dev)
 	int ret = 0;
 
 	drm_for_each_encoder(encoder, dev) {
+		drm_debugfs_encoder_add(encoder);
+
 		if (encoder->funcs && encoder->funcs->late_register)
 			ret = encoder->funcs->late_register(encoder);
 		if (ret)
@@ -90,6 +93,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
 	drm_for_each_encoder(encoder, dev) {
 		if (encoder->funcs && encoder->funcs->early_unregister)
 			encoder->funcs->early_unregister(encoder);
+		drm_debugfs_encoder_remove(encoder);
 	}
 }
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ba12acd55139..173b4d872431 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -189,6 +189,8 @@ void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
 void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
+void drm_debugfs_encoder_add(struct drm_encoder *encoder);
+void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
 #else
 static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 				   struct dentry *root)
@@ -222,6 +224,13 @@ static inline void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc)
 {
 }
 
+static inline void drm_debugfs_encoder_add(struct drm_encoder *encoder)
+{
+}
+static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
+{
+}
+
 #endif
 
 drm_ioctl_t drm_version;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 3a09682af685..977a9381c8ba 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -60,7 +60,7 @@ struct drm_encoder_funcs {
 	 * @late_register:
 	 *
 	 * This optional hook can be used to register additional userspace
-	 * interfaces attached to the encoder like debugfs interfaces.
+	 * interfaces attached to the encoder.
 	 * It is called late in the driver load sequence from drm_dev_register().
 	 * Everything added from this callback should be unregistered in
 	 * the early_unregister callback.
@@ -81,6 +81,13 @@ struct drm_encoder_funcs {
 	 * before data structures are torndown.
 	 */
 	void (*early_unregister)(struct drm_encoder *encoder);
+
+	/**
+	 * @debugfs_init:
+	 *
+	 * Allows encoders to create encoder-specific debugfs files.
+	 */
+	void (*debugfs_init)(struct drm_encoder *encoder, struct dentry *root);
 };
 
 /**
@@ -184,6 +191,13 @@ struct drm_encoder {
 
 	const struct drm_encoder_funcs *funcs;
 	const struct drm_encoder_helper_funcs *helper_private;
+
+	/**
+	 * @debugfs_entry:
+	 *
+	 * Debugfs directory for this CRTC.
+	 */
+	struct dentry *debugfs_entry;
 };
 
 #define obj_to_encoder(x) container_of(x, struct drm_encoder, base)
-- 
2.39.2

