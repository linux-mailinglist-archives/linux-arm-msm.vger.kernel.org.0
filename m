Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F77F7BEA10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378183AbjJISuz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377520AbjJISuy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:50:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0FEAC
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:50:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50481a0eee7so7277220e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696877450; x=1697482250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0wQOwiB9NCSVYuDd7khOSW/JUI9IzS3SY0x5RnOaBQ=;
        b=aiZzHYxFEYPEjF/Xy5Koc/1rvVDvO53pM6ZNTGarPMbGLrnOv0bNYQ3Ps7RnnAmqfu
         r7I5GiN6fuofLXmQHoZe35jbovp33mUNGFjEhu3pe0gWQoV/YVzP9IDcOvshBvaKdBxA
         CPBTLG4yCoJXxoF+AGmUraXwz0cOkH4fwqbeioG831F6hVrOjxVxXNW56AZSpQPGlwpT
         /Q6eTMEDZkZT5yooX+AyJMjDx6Xe8dqlKK3DRO2mK8stEonEVKz5TO/OoIGRvdPNtq5u
         3hme/K0emKHaDZLqpgUbyNGH4d3IS+2oKYI0fZCEgWsAiVsGZPQtLhd77+c4gKVyA9kX
         DvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696877450; x=1697482250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0wQOwiB9NCSVYuDd7khOSW/JUI9IzS3SY0x5RnOaBQ=;
        b=WU+nKv470PqaAGXcTHfXJPrA2/qwz6/oD+ms3U3DbZpauMBDHmw/O93KeTUxpaWjEK
         kkDWAxv86aOzlk/pmguPEod0dpT2Tqf65GRNaH/KPcfn+yZb/Q/TH48D1mdEmwASzres
         5z1UJLwhGVMWgztjOeAxZ50W2A9SOFPQQHUZ0rtis8yNYvi8JEglMPgG9TfSJkkiumdv
         NErpXCfwjPynezHgUKMwTiwGBro22pgX5HYiWQQMlBA5CId9z/mG6LSPf+dxqWWXXUPY
         SGr1qcK4R1UrJ5FlOkyXY0yV5CvfvFkcobeoadSKH38Rvorc2FRNebD1mk9jX+Eqov+D
         1GiA==
X-Gm-Message-State: AOJu0Yy4XQgliy+A95OrpM2x262z7yxNqO4jUnYsJUDbgNcYD2VQduQg
        lvAqdqHkq+MYjU72AqG+a/T6dQ==
X-Google-Smtp-Source: AGHT+IH3v1V3dc1R79cq/ftCArUbHg6jgqEjM7by8BuWJlRTqWUG0GfLxHeClQVGGmGDVuaj8OT62Q==
X-Received: by 2002:a05:6512:3414:b0:506:8b41:7e31 with SMTP id i20-20020a056512341400b005068b417e31mr6316412lfr.6.1696877450654;
        Mon, 09 Oct 2023 11:50:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u7-20020a056512040700b00501ce0cacb6sm1529262lfk.188.2023.10.09.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:50:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/encoder: register per-encoder debugfs dir
Date:   Mon,  9 Oct 2023 21:50:46 +0300
Message-Id: <20231009185048.2758954-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
References: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_encoder.c  |  4 ++++
 drivers/gpu/drm/drm_internal.h |  9 +++++++++
 include/drm/drm_encoder.h      | 16 +++++++++++++++-
 4 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index f291fb4b359f..00406b4f3235 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -589,4 +589,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
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
index 8462b657c375..6ced610e5b6a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -192,6 +192,8 @@ void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
 void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
+void drm_debugfs_encoder_add(struct drm_encoder *encoder);
+void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
 #else
 static inline void drm_debugfs_dev_fini(struct drm_device *dev)
 {
@@ -229,6 +231,13 @@ static inline void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc)
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

