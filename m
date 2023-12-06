Return-Path: <linux-arm-msm+bounces-3525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D1806BA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C02761C2096B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E59D2D029;
	Wed,  6 Dec 2023 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNnfg+ZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6507120
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 02:14:59 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso7253711fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701857698; x=1702462498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRXp7Tk+V86C1yaIiO+GTt7udFDOuzNm3PPg635Y8sk=;
        b=aNnfg+ZItEyxFgO65RKQT/J7BYG9cg2hzWcj5M7dyr5rMieQijPgaRba/LnqV8Tv27
         pmr6y164wlZMfXtKq0ZhuxkPak5SRKsIVZWiUL80dkEYuvaQLCuKn47SfC04kiOH69ET
         3+F0h7fVjzBcZtrDuvwXkTKhwE06rU6xErviZqdfDQ9DFRpgWMQeE9xKXcGtXPSNSjxL
         0bpnofLogKzchMQFpTkkLdS0lfDFmOpJgzsYaATg5wk7Vb/6xIdahjbRKaoraePrzU3G
         Pd9RkRVf+nznQY8l5bUeuwtBqgZpljAug8Ixv6meE9uZDydZ5eunW+xMqpxhsXVi4DKx
         /VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857698; x=1702462498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRXp7Tk+V86C1yaIiO+GTt7udFDOuzNm3PPg635Y8sk=;
        b=OJVI6S86SwZ6CYevM8U8wCuk2TSBrHA+wItn9OLNJ5GWXVSCra93GkWcK28KQWoHQ9
         AbrtJuDg7JSG+2AAolHLhkfEYK7dHfdHdNlKI5hHnmQGLVRmi+8RrWTKR6YaCBnRyk82
         IztBOCPd+VhFcVYx4c9F8hyaJ6EjmFrpKliMtNcItemIyCbyFIRK/qwhcxc82TNSjJuB
         Vb8aDjQRMMfw5afhMoRe3Pba+NOT02evyYoiR6/eO7DU+FRHgaLDNn08jSo5OVfpiuXT
         euFA09FXOEWUOYF5hMdbzm9iXOvmWS32Xpo9vRAZl4PfYrgoqQ5ANwmAxUPFzpxFifvo
         Kr6A==
X-Gm-Message-State: AOJu0Yx5/WrYcM4ug7u0QKpsNXZbF5yonApD7ws4UimykyNTWj1SIxiy
	Kl6MkK4t1mOrZkU/KSphmIMrAg==
X-Google-Smtp-Source: AGHT+IGMbYMSqyqDdJKBk/0nGjgxdwMTkaGVRTb1v+YfO6mN8GKGOSE5+h1FhJ1u/6em+Ea/fawNTA==
X-Received: by 2002:a2e:6a10:0:b0:2c9:f3d6:e1d with SMTP id f16-20020a2e6a10000000b002c9f3d60e1dmr576604ljc.15.1701857698158;
        Wed, 06 Dec 2023 02:14:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c03c100b002c9e6cbf78esm1519012ljp.19.2023.12.06.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 02:14:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/2] drm/vkms: move wb's atomic_check from encoder to connector
Date: Wed,  6 Dec 2023 13:14:55 +0300
Message-Id: <20231206101455.1664463-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
References: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the renamed drm_atomic_helper_check_wb_connector_state() now accepts
drm_writeback_connector as the first argument (instead of drm_encoder),
move the VKMS writeback atomic_check from drm_encoder_helper_funcs to
drm_connector_helper_funcs. Also drop the vkms_wb_encoder_helper_funcs,
which have become empty now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 28 ++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 23c4f7b61cb6..bc724cbd5e3a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -30,20 +30,25 @@ static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+static int vkms_wb_atomic_check(struct drm_connector *connector,
+				struct drm_atomic_state *state)
 {
-	struct drm_connector *connector = conn_state->connector;
-	struct drm_writeback_connector *wb_conn =
-		drm_connector_to_writeback(connector);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state;
 	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
+	const struct drm_display_mode *mode;
 	int ret;
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
 
+	if (!conn_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->mode;
+
 	fb = conn_state->writeback_job->fb;
 	if (fb->width != mode->hdisplay || fb->height != mode->vdisplay) {
 		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
@@ -51,17 +56,13 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
+	ret = drm_atomic_helper_check_wb_connector_state(connector, state);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs = {
-	.atomic_check = vkms_wb_encoder_atomic_check,
-};
-
 static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -164,6 +165,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.prepare_writeback_job = vkms_wb_prepare_job,
 	.cleanup_writeback_job = vkms_wb_cleanup_job,
 	.atomic_commit = vkms_wb_atomic_commit,
+	.atomic_check = vkms_wb_atomic_check,
 };
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
@@ -174,7 +176,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-					    &vkms_wb_encoder_helper_funcs,
+					    NULL,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
 					    1);
-- 
2.39.2


