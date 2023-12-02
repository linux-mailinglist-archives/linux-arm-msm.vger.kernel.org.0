Return-Path: <linux-arm-msm+bounces-3037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C6B801EB8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECC631F21035
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EDD22313;
	Sat,  2 Dec 2023 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icP97s82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91987125
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:22 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bba815f30so4456481e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553221; x=1702158021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpxUb5xms8fDLqquF2ESZjqnZ9nPl+Oy3tudzwyKY9U=;
        b=icP97s82OJD6oi/WOhn1ZqgiahvMBi34IbNaM+OQKupTk/yZzpe67VfM8dkEApe18v
         8Gu1NQG8MyXYOrX3Qs9/I+A/Yw63kAEM/VqJOuLWLgeX+ouy+93ixT7hjvXaJFsFxHlb
         Mb6Tvya5Y3BpnxX3NXfKDlXJmxbGddZ67W8YKfgdEDfd4uOb2WfWV8LOazF3Q7/d4KRo
         14DptpEO2wq3Igsz9QsfLJAJo/YidD3fMl9a+xk5UaIXbrYOWh6hi+/e21OKswXrFPfS
         7+gsMJS6bOdAryGFHVk+XsC40RrwaFw0RVmBbGPC58qMBfahhrq53M8/5jy1KXPXblkM
         EA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553221; x=1702158021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpxUb5xms8fDLqquF2ESZjqnZ9nPl+Oy3tudzwyKY9U=;
        b=pXO6Ei2M5QBwrIu7lb/NioQfBKdXghQjQb+0Yte34gYc5thOLLbbFCDn/HU5JCd5F4
         Bzn5v/EaJNEDRE6YCapfzO8fJ5gMrabJsDsrHYDHt0/+DPxgDBlkHCLj3d0GBwm/4Uyg
         FEjxp2Fxi5lKi8T7dhYEDnwViZqzfmUMfHrhfu7j2L81xMPRlB1qb5/msZtjjvIXj78+
         lFZiTCnYJtQchLRoDtA0jeTR8K3yvq+vKdbjdfqxfQ9fQwA08cFoHb7ojdc2XSipvVQc
         XlBNmt02XeZIe5WK6358hcomsavzGZlSpkaM3n9SjY3ad08IJ2+Piwjm9BHhGgJj9dVB
         8Pmg==
X-Gm-Message-State: AOJu0YzDGhsF3IqE8mO6nbDaBwvRuNz6ISt+XYDp7z63ecWzdfkDZg1p
	nQIkxOBA/kivNDCtT1h/GLO7Yg==
X-Google-Smtp-Source: AGHT+IHaa3oRQLnBH/XXw4/9XJeJ4m4RkeUTocjNGP6XoRcOZlD5HxE6dpPpH52LhkbNBVocvgVdBg==
X-Received: by 2002:a05:6512:104f:b0:50b:e20c:2042 with SMTP id c15-20020a056512104f00b0050be20c2042mr485199lfb.169.1701553220863;
        Sat, 02 Dec 2023 13:40:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 04/12] drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
Date: Sun,  3 Dec 2023 00:40:08 +0300
Message-Id: <20231202214016.1257621-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MDP4 and MDP5 drivers enumerate supported formats each time the plane is
created. In preparation to merger of MDP DPU format databases, define
precise formats list, so that changes to the database do not cause the
driver to add unsupported format to the list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 57 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 36 +++++++++++---
 drivers/gpu/drm/msm/disp/mdp_format.c      | 28 -----------
 drivers/gpu/drm/msm/disp/mdp_kms.h         |  1 -
 4 files changed, 80 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index b689b618da78..cebe20c82a54 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -371,6 +371,47 @@ static const uint64_t supported_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+const uint32_t mdp4_rgb_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+};
+
+const uint32_t mdp4_rgb_yuv_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+};
+
 /* initialize plane */
 struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 		enum mdp4_pipe pipe_id, bool private_plane)
@@ -379,6 +420,8 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 	struct mdp4_plane *mdp4_plane;
 	int ret;
 	enum drm_plane_type type;
+	const uint32_t *formats;
+	unsigned int nformats;
 
 	mdp4_plane = kzalloc(sizeof(*mdp4_plane), GFP_KERNEL);
 	if (!mdp4_plane) {
@@ -392,13 +435,17 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 	mdp4_plane->name = pipe_names[pipe_id];
 	mdp4_plane->caps = mdp4_pipe_caps(pipe_id);
 
-	mdp4_plane->nformats = mdp_get_formats(mdp4_plane->formats,
-			ARRAY_SIZE(mdp4_plane->formats),
-			!pipe_supports_yuv(mdp4_plane->caps));
-
 	type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+
+	if (pipe_supports_yuv(mdp4_plane->caps)) {
+		formats = mdp4_rgb_yuv_formats;
+		nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
+	} else {
+		formats = mdp4_rgb_formats;
+		nformats = ARRAY_SIZE(mdp4_rgb_formats);
+	}
 	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
-				 mdp4_plane->formats, mdp4_plane->nformats,
+				 formats, nformats,
 				 supported_format_modifiers, type, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 0d5ff03cb091..aa8342d93393 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -17,9 +17,6 @@
 
 struct mdp5_plane {
 	struct drm_plane base;
-
-	uint32_t nformats;
-	uint32_t formats[32];
 };
 #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
 
@@ -1007,6 +1004,32 @@ uint32_t mdp5_plane_get_flush(struct drm_plane *plane)
 	return mask;
 }
 
+const uint32_t mdp5_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+};
+
 /* initialize plane */
 struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 				  enum drm_plane_type type)
@@ -1023,12 +1046,9 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 
 	plane = &mdp5_plane->base;
 
-	mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
-		ARRAY_SIZE(mdp5_plane->formats), false);
-
 	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
-			mdp5_plane->formats, mdp5_plane->nformats,
-			NULL, type, NULL);
+				       mdp5_plane_formats, ARRAY_SIZE(mdp5_plane_formats),
+				       NULL, type, NULL);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 025595336f26..69ab5bcff1a9 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -80,10 +80,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 
 #define BPC0A 0
 
-/*
- * Note: Keep RGB formats 1st, followed by YUV formats to avoid breaking
- * mdp_get_rgb_formats()'s implementation.
- */
 static const struct mdp_format formats[] = {
 	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
 	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   true,  4,  4,
@@ -138,30 +134,6 @@ static const struct mdp_format formats[] = {
 			MDP_PLANE_PLANAR, CHROMA_420, true),
 };
 
-/*
- * Note:
- * @rgb_only must be set to true, when requesting
- * supported formats for RGB pipes.
- */
-uint32_t mdp_get_formats(uint32_t *pixel_formats, uint32_t max_formats,
-		bool rgb_only)
-{
-	uint32_t i;
-	for (i = 0; i < ARRAY_SIZE(formats); i++) {
-		const struct mdp_format *f = &formats[i];
-
-		if (i == max_formats)
-			break;
-
-		if (rgb_only && MDP_FORMAT_IS_YUV(f))
-			break;
-
-		pixel_formats[i] = f->base.pixel_format;
-	}
-
-	return i;
-}
-
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 		uint64_t modifier)
 {
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index b0286d5d5130..d0718c16de3e 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -91,7 +91,6 @@ struct mdp_format {
 #define to_mdp_format(x) container_of(x, struct mdp_format, base)
 #define MDP_FORMAT_IS_YUV(mdp_format) ((mdp_format)->is_yuv)
 
-uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
 /* MDP capabilities */
-- 
2.39.2


