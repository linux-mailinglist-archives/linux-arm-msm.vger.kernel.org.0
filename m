Return-Path: <linux-arm-msm+bounces-3042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0194801EBD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A871F21017
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FA22233A;
	Sat,  2 Dec 2023 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdAPREwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEBEFB
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:25 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so3192411fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553224; x=1702158024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHatgnJPeA0diZnV0a/BRbKVR8h8NfDCjQRevj5jKG8=;
        b=HdAPREwcYmHJd7claiMRA3jSWB7vACqLPv/2lj+KVtXuW+OsRr4BfbJ2FFut7VJAmK
         Xx9+0MNWRlHULoamSPk2TlNKW2T6gtgVM+4gpYrei0qyJCZv8PGwvX/8fYzFOxCAwweN
         iRaP5VLgMtyird5InxpyH2FucG1W+5QrCbFpXGRcHsQcsHaOV7XK63VJAJvF6oEqexNS
         XanAQJihVsqRJgwLLYsJCVyTtWn6YaylVemj78lFfpun7kNPsAK0StcN18td/9D5Qmzr
         vlMq+sxN6Ph6YizZ2l8G7OKASv2Vo0sHOETsza0tiwlCJJc7MkwS9lS10ounRJ/EhlMG
         xrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553224; x=1702158024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHatgnJPeA0diZnV0a/BRbKVR8h8NfDCjQRevj5jKG8=;
        b=WWBGHD7PF4EkBP1tZCLCh91ya4hX5TS5n5xxVF+8nTUj/8BqPY9gT8CXZyEzYNMrUr
         H2Y53pMHyCra54uCjpg88NKidIs6EJ7QSVl0pX50t5sfEsmwi7gjS1xPnhGNUiZMchls
         gXqibBEFV40nvdf7JeyR8WuHtrLQEK4Sqtz4CSttQ//IM0MFDq7xDFzxZ3noHcZ4prl1
         aHJ1WzK8MkgI5V08AbndT88qAsMdl6xm9Yl6j9YDelTKz75+iycxYrrrPg7ezPRhq9mg
         WNIFcBoOnvK2JMUTwElR4HjSvpjQK9s+Qfvh2UisI1nEiEJ2D3tUXwPTIsiDl7e0QxCa
         G1yw==
X-Gm-Message-State: AOJu0YyIyhYyJsEquwY27mTZZnOClK4pLMcE/ryhITeBFEfUQWebzIO0
	FQ8vc9OT7zw3yYr4mJfv0urBEA==
X-Google-Smtp-Source: AGHT+IFVw2ow2whBkXCo1o2l7jBCVayaet3dz0cjxX0Gl0GCiuwslJFgUv7by+smBB7bY8WGUNbOVw==
X-Received: by 2002:a05:6512:214c:b0:50b:e056:8b20 with SMTP id s12-20020a056512214c00b0050be0568b20mr636398lfr.168.1701553224157;
        Sat, 02 Dec 2023 13:40:24 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:23 -0800 (PST)
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
Subject: [PATCH 08/12] drm/msm: convert msm_format::unpack_tight to the flag
Date: Sun,  3 Dec 2023 00:40:12 +0300
Message-Id: <20231202214016.1257621-9-dmitry.baryshkov@linaro.org>
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

Instead of having a u8 or bool field unpack_tight, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 22 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 +-
 drivers/gpu/drm/msm/disp/mdp_format.c       | 52 ++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h               |  4 +-
 7 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index ea9d5fb01000..419400311837 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -44,11 +44,10 @@ bp, flg, fm, np)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -66,11 +65,10 @@ alpha, bp, flg, fm, np, th)                                               \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -89,11 +87,10 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -110,11 +107,10 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -132,11 +128,10 @@ flg, fm, np, th)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -153,7 +148,6 @@ flg, fm, np, th)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 1,                                            \
-	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -175,7 +169,6 @@ flg, fm, np, th)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 1,                                            \
-	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -198,11 +191,10 @@ flg, fm, np)                                                      \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -636,7 +628,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 	if (fmt->pixel_format == DRM_FORMAT_NV12 ||
 	    fmt->pixel_format == DRM_FORMAT_P010) {
 		if (MSM_FORMAT_IS_DX(fmt)) {
-			if (fmt->unpack_tight)
+			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT)
 				color_fmt = COLOR_FMT_NV12_BPP10_UBWC;
 			else
 				color_fmt = COLOR_FMT_P010_UBWC;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 46b7b00e6701..f6c772df048b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -262,7 +262,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	unpack = (fmt->element[3] << 24) | (fmt->element[2] << 16) |
 		(fmt->element[1] << 8) | (fmt->element[0] << 0);
 	src_format |= ((fmt->unpack_count - 1) << 12) |
-		(fmt->unpack_tight << 17) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		(fmt->unpack_align_msb << 18) |
 		((fmt->bpp - 1) << 9);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 36dc57465958..12418256326d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -93,7 +93,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		(fmt->element[0] << 0);
 
 	dst_format |= (fmt->unpack_align_msb << 18) |
-		(fmt->unpack_tight << 17) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		((fmt->unpack_count - 1) << 12) |
 		((fmt->bpp - 1) << 9);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 0bae90d3f21e..ef7e525c3bd2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -325,7 +325,8 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 			MDP4_PIPE_SRC_FORMAT_FETCH_PLANES(format->fetch_type) |
 			MDP4_PIPE_SRC_FORMAT_CHROMA_SAMP(format->chroma_sample) |
 			MDP4_PIPE_SRC_FORMAT_FRAME_FORMAT(frame_type) |
-			COND(format->unpack_tight, MDP4_PIPE_SRC_FORMAT_UNPACK_TIGHT));
+			COND(format->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT,
+			     MDP4_PIPE_SRC_FORMAT_UNPACK_TIGHT));
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRC_UNPACK(pipe),
 			MDP4_PIPE_SRC_UNPACK_ELEM0(format->element[0]) |
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 3b7c3eac8eda..cc0dc451dc2e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -801,7 +801,8 @@ static void mdp5_hwpipe_mode_set(struct mdp5_kms *mdp5_kms,
 			COND(format->alpha_enable, MDP5_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
 			MDP5_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP5_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
-			COND(format->unpack_tight, MDP5_PIPE_SRC_FORMAT_UNPACK_TIGHT) |
+			COND(format->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT,
+			     MDP5_PIPE_SRC_FORMAT_UNPACK_TIGHT) |
 			MDP5_PIPE_SRC_FORMAT_FETCH_TYPE(format->fetch_type) |
 			MDP5_PIPE_SRC_FORMAT_CHROMA_SAMP(format->chroma_sample));
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 5fc55f41e74f..b9f0b13d25d5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -62,7 +62,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	},
 };
 
-#define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
+#define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, c, cnt, fp, cs, yuv) { \
 		.pixel_format = DRM_FORMAT_ ## name,             \
 		.bpc_a = BPC ## a ## A,                          \
 		.bpc_r_cr = BPC ## r,                            \
@@ -72,65 +72,65 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 		.fetch_type = fp,                                \
 		.chroma_sample = cs,                             \
 		.alpha_enable = alpha,                           \
-		.unpack_tight = tight,                           \
 		.unpack_count = cnt,                             \
 		.bpp = c,                                        \
-		.flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,          \
+		.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |          \
+			(yuv ? MSM_FORMAT_FLAG_YUV : 0),         \
 }
 
 #define BPC0A 0
 
 static const struct msm_format formats[] = {
-	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
-	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   true,  4,  4,
+	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   cpp cnt ... */
+	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(ABGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  true,   true,  4,  4,
+	FMT(ABGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGBA8888, 8, 8, 8, 8,  3, 1, 0, 2,  true,   true,  4,  4,
+	FMT(RGBA8888, 8, 8, 8, 8,  3, 1, 0, 2,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGRA8888, 8, 8, 8, 8,  3, 2, 0, 1,  true,   true,  4,  4,
+	FMT(BGRA8888, 8, 8, 8, 8,  3, 2, 0, 1,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(XRGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  false,  true,  4,  4,
+	FMT(XRGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(XBGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  false,   true,  4,  4,
+	FMT(XBGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGBX8888, 8, 8, 8, 8,  3, 1, 0, 2,  false,   true,  4,  4,
+	FMT(RGBX8888, 8, 8, 8, 8,  3, 1, 0, 2,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGRX8888, 8, 8, 8, 8,  3, 2, 0, 1,  false,   true,  4,  4,
+	FMT(BGRX8888, 8, 8, 8, 8,  3, 2, 0, 1,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGB888,   0, 8, 8, 8,  1, 0, 2, 0,  false,  true,  3,  3,
+	FMT(RGB888,   0, 8, 8, 8,  1, 0, 2, 0,  false,  3,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGR888,   0, 8, 8, 8,  2, 0, 1, 0,  false,  true,  3,  3,
+	FMT(BGR888,   0, 8, 8, 8,  2, 0, 1, 0,  false,  3,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGB565,   0, 5, 6, 5,  1, 0, 2, 0,  false,  true,  2,  3,
+	FMT(RGB565,   0, 5, 6, 5,  1, 0, 2, 0,  false,  2,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGR565,   0, 5, 6, 5,  2, 0, 1, 0,  false,  true,  2,  3,
+	FMT(BGR565,   0, 5, 6, 5,  2, 0, 1, 0,  false,  2,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 
 	/* 2 plane YUV */
-	FMT(NV12,     0, 8, 8, 8,  1, 2, 0, 0,  false,  true,  2, 2,
+	FMT(NV12,     0, 8, 8, 8,  1, 2, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_420, true),
-	FMT(NV21,     0, 8, 8, 8,  2, 1, 0, 0,  false,  true,  2, 2,
+	FMT(NV21,     0, 8, 8, 8,  2, 1, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_420, true),
-	FMT(NV16,     0, 8, 8, 8,  1, 2, 0, 0,  false,  true,  2, 2,
+	FMT(NV16,     0, 8, 8, 8,  1, 2, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_H2V1, true),
-	FMT(NV61,     0, 8, 8, 8,  2, 1, 0, 0,  false,  true,  2, 2,
+	FMT(NV61,     0, 8, 8, 8,  2, 1, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_H2V1, true),
 	/* 1 plane YUV */
-	FMT(VYUY,     0, 8, 8, 8,  2, 0, 1, 0,  false,  true,  2, 4,
+	FMT(VYUY,     0, 8, 8, 8,  2, 0, 1, 0,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(UYVY,     0, 8, 8, 8,  1, 0, 2, 0,  false,  true,  2, 4,
+	FMT(UYVY,     0, 8, 8, 8,  1, 0, 2, 0,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(YUYV,     0, 8, 8, 8,  0, 1, 0, 2,  false,  true,  2, 4,
+	FMT(YUYV,     0, 8, 8, 8,  0, 1, 0, 2,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(YVYU,     0, 8, 8, 8,  0, 2, 0, 1,  false,  true,  2, 4,
+	FMT(YVYU,     0, 8, 8, 8,  0, 2, 0, 1,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
 	/* 3 plane YUV */
-	FMT(YUV420,   0, 8, 8, 8,  2, 1, 0, 0,  false,  true,  1, 1,
+	FMT(YUV420,   0, 8, 8, 8,  2, 1, 0, 0,  false,  1, 1,
 			MDP_PLANE_PLANAR, CHROMA_420, true),
-	FMT(YVU420,   0, 8, 8, 8,  1, 2, 0, 0,  false,  true,  1, 1,
+	FMT(YVU420,   0, 8, 8, 8,  1, 2, 0, 0,  false,  1, 1,
 			MDP_PLANE_PLANAR, CHROMA_420, true),
 };
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c8c465c36487..61a4587382b5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -255,11 +255,13 @@ enum msm_format_flags {
 	MSM_FORMAT_FLAG_YUV_BIT,
 	MSM_FORMAT_FLAG_DX_BIT,
 	MSM_FORMAT_FLAG_COMPRESSED_BIT,
+	MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT,
 };
 
 #define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
 #define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
+#define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
 
 /**
  * struct msm_format: defines the format configuration
@@ -268,7 +270,6 @@ enum msm_format_flags {
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
  * @alpha_enable: whether the format has an alpha channel
- * @unpack_tight: whether to use tight or loose unpack
  * @unpack_align_msb: unpack aligned to LSB or MSB
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
@@ -285,7 +286,6 @@ struct msm_format {
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
 	bool alpha_enable;
-	u8 unpack_tight;
 	u8 unpack_align_msb;
 	u8 unpack_count;
 	u8 bpp;
-- 
2.39.2


