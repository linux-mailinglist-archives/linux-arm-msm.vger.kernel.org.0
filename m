Return-Path: <linux-arm-msm+bounces-24036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C37915895
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF981F24696
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999121A08DF;
	Mon, 24 Jun 2024 21:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pk48JVwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAB1A08DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263636; cv=none; b=hTtW4YER9dNT5opZyl4FH18SpPxqAWKgjVa1ztQo1itHQsVtHanOYjc5X0O0wZBb2QF0lU3YelHpMVCw/fqHqwbYuWW+ppC77v0xPTLl3k+OErIvNU0J+i9WEUg/xIGFcVwNEeythVSDFVFT8anNnTx+W4JcTmAqMm8R2ltQjcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263636; c=relaxed/simple;
	bh=bp6A68kJPDBcsi8eZULofLfrBBdJDRmZZyWTdQOEhY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdhgCEnroSOTOgBsAgGU+HSEefwn67F8BIuQ61fjAsUq+R7e+vyPBbpAhfL6YC0BdmLkrakSS9HWedpGJL8cJRcW7GVLeZCFR5oEOopJROfiO1nXvTbFegiNsY0OGxDPr0gnY9pO+o7eocR+63vL7+eqKhqBnJpVnjptStYPLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pk48JVwq; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ce6a9fd5cso1335946e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263633; x=1719868433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXiVV87C7egKKo/oKQCbPR7p6Dyhi+8Wd+RPKOL1+cA=;
        b=pk48JVwqOS/TWz8+Lf78j9Y6KfHt8yRXTqyPfiWzXBo+ZDEcS6i/K5uZITz2FgDm1+
         YNEL6nPlEBbczRGh/ij067532tQBVa94aIQMbshWWW+Z4xivE41CtbUMc2JqRVxgidqo
         kE7Cj/azWWRnzyRhVgE1Cj4XecNw2D1rAsTUiMtxEXfYAC0tTSDx5fuOA5XNVRilleYe
         VxK5dpXS590242hwfcAxRmksvw3HZiUff3Ni9eC1KBbgmY2mQJZOOMXzcuiHJ4DuqUy/
         xc/F3C7hWp7Mjr4GrNcvQlYUxuFvsO632eoO0BMk9bJTYGhbshfsRZop76pZnZHYMWyv
         rjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263633; x=1719868433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXiVV87C7egKKo/oKQCbPR7p6Dyhi+8Wd+RPKOL1+cA=;
        b=KU9EEND6b2+rtXKYK3gqeX1N8gxtAVdo71u1iWGl90zmOMtaozZqukLiSpdWhWhcKa
         4YN8Xb0tPon75GEZBnSvQy2c4RmOVgWP7p9GMrNXGRD1WfEC+Z+0QnDeIegxO0ba80lH
         cUdni/sgRxqpHFdjhbNnpt+qmYh8tp+H1XCPSqBPZMQmMniOGW9QEDjY3rDeMaz3PGCt
         n1tNiz7EygNEvIhvf186Uo0kPjb2xzGwIs0QLgvZkMxnX95I0y1LLQMejk7IhVwL9CQD
         WGYyjONV1FbPDxc8CmMBMJATjROucV523lslLu0SAoC9uVxOIUsBYDk5LlwHM08vxRzk
         lmag==
X-Forwarded-Encrypted: i=1; AJvYcCUSl97H4cUxQrzf/sCx0ooY/3i/dC8ScUIaIsMaTF5jC0KkpFZKSEAucr6WogV1Kv7/LWKxfOpQ/QiqsFJC/ITUFZ37ABKLCgDboelLhQ==
X-Gm-Message-State: AOJu0YzOnhULpnu/3mNS96Yloe+DW58UK0unQUnGoxUgggGc9Lf0vuBe
	bMk5pFNdh/Ivve7VyUbyfRYEgSnbDOze3fi9NJELv0dkJU4suK0grEmpkwbKYgE=
X-Google-Smtp-Source: AGHT+IFrnIpDZgkP7y6H7BTVxwu85K6IvesChUCQcKOzhKixAVLyJck212RPQw7QISbMxyYtgL49dQ==
X-Received: by 2002:a05:6512:e95:b0:52c:8a3a:fe2c with SMTP id 2adb3069b0e04-52ce185d049mr3843315e87.45.1719263632882;
        Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:49 +0300
Subject: [PATCH v5 09/16] drm/msm/dpu: pass drm_framebuffer to
 _dpu_format_get_plane_sizes()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-9-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bp6A68kJPDBcsi8eZULofLfrBBdJDRmZZyWTdQOEhY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGIwzbLTAsfFmiI2P6P05NPGjUe5AyrxDACr
 LjvmxiGqb2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1ZjSB/9AcpvZqbp20Zhiaj9faz2xHE4Rc5/tsrtW2/LViAcvxgE2XdLNDDUBbHRjtMC5EJJ3fv0
 XLbktIMqOJxHlcBKIpninS1Wb8Sh3ptrMlxEcbsvTMbyMJ3tzwVUwWRG5B+uZyq2IMUPanquN4U
 FMWEXWx2+A0YONhroJmAMFeWHYA8j0BRimPxKxyh3lob8Q3/IhOcmMIftSOrQ9H+CvNBueAcbVA
 rco2swrmq4it38bLqQRKdpnmTv3G+9ZMZKkAKhY/Ceel/omcPHIl/GUFsXEnDMHJxRa/edGBpUR
 oNyHrn6n9Ug9Yz1WmAh1Orbr5AMiu944UNwuaYAWAY1ES6Y+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of passing width / height / pitches, pass drm_framebuffer
directly. This allows us to drop the useless check for !pitches, since
an array can not be NULL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 73 ++++++++++++++---------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 46237a1ca6a5..df046bc88715 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,8 +95,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 
 static int _dpu_format_get_plane_sizes_ubwc(
 		const struct msm_format *fmt,
-		const uint32_t width,
-		const uint32_t height,
+		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
 	int i;
@@ -104,8 +103,8 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = width;
-	layout->height = height;
+	layout->width = fb->width;
+	layout->height = fb->height;
 	layout->num_planes = fmt->num_planes;
 
 	color = _dpu_format_get_media_color_ubwc(fmt);
@@ -121,13 +120,13 @@ static int _dpu_format_get_plane_sizes_ubwc(
 		uint32_t uv_meta_scanlines = 0;
 
 		layout->num_planes = 2;
-		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, width);
-		y_sclines = VENUS_Y_SCANLINES(color, height);
+		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
+		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
 			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, width);
-		uv_sclines = VENUS_UV_SCANLINES(color, height);
+		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, fb->width);
+		uv_sclines = VENUS_UV_SCANLINES(color, fb->height);
 		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
@@ -135,13 +134,13 @@ static int _dpu_format_get_plane_sizes_ubwc(
 			goto done;
 
 		layout->num_planes += 2;
-		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, width);
-		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, height);
+		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
+		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, width);
-		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, height);
+		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, fb->width);
+		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, fb->height);
 		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
 			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
@@ -150,16 +149,16 @@ static int _dpu_format_get_plane_sizes_ubwc(
 
 		layout->num_planes = 1;
 
-		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, width);
-		rgb_scanlines = VENUS_RGB_SCANLINES(color, height);
+		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
+		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			goto done;
 		layout->num_planes += 2;
-		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, width);
-		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, height);
+		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
+		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
@@ -173,23 +172,21 @@ static int _dpu_format_get_plane_sizes_ubwc(
 
 static int _dpu_format_get_plane_sizes_linear(
 		const struct msm_format *fmt,
-		const uint32_t width,
-		const uint32_t height,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
 	int i;
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = width;
-	layout->height = height;
+	layout->width = fb->width;
+	layout->height = fb->height;
 	layout->num_planes = fmt->num_planes;
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
-		layout->plane_size[0] = width * height * fmt->bpp;
-		layout->plane_pitch[0] = width * fmt->bpp;
+		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
+		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
 		uint32_t v_subsample, h_subsample;
 		uint32_t chroma_samp;
@@ -199,7 +196,7 @@ static int _dpu_format_get_plane_sizes_linear(
 		_dpu_get_v_h_subsample_rate(chroma_samp, &v_subsample,
 				&h_subsample);
 
-		if (width % h_subsample || height % v_subsample) {
+		if (fb->width % h_subsample || fb->height % v_subsample) {
 			DRM_ERROR("mismatch in subsample vs dimensions\n");
 			return -EINVAL;
 		}
@@ -207,11 +204,11 @@ static int _dpu_format_get_plane_sizes_linear(
 		if ((fmt->pixel_format == DRM_FORMAT_NV12) &&
 			(MSM_FORMAT_IS_DX(fmt)))
 			bpp = 2;
-		layout->plane_pitch[0] = width * bpp;
+		layout->plane_pitch[0] = fb->width * bpp;
 		layout->plane_pitch[1] = layout->plane_pitch[0] / h_subsample;
-		layout->plane_size[0] = layout->plane_pitch[0] * height;
+		layout->plane_size[0] = layout->plane_pitch[0] * fb->height;
 		layout->plane_size[1] = layout->plane_pitch[1] *
-				(height / v_subsample);
+				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
 			layout->num_planes = 2;
@@ -232,8 +229,8 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (pitches && layout->plane_pitch[i] < pitches[i])
-			layout->plane_pitch[i] = pitches[i];
+		if (layout->plane_pitch[i] < fb->pitches[i])
+			layout->plane_pitch[i] = fb->pitches[i];
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -244,25 +241,24 @@ static int _dpu_format_get_plane_sizes_linear(
 
 static int dpu_format_get_plane_sizes(
 		const struct msm_format *fmt,
-		const uint32_t w,
-		const uint32_t h,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
 	if (!layout || !fmt) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
 
-	if ((w > DPU_MAX_IMG_WIDTH) || (h > DPU_MAX_IMG_HEIGHT)) {
+	if (fb->width > DPU_MAX_IMG_WIDTH ||
+	    fb->height > DPU_MAX_IMG_HEIGHT) {
 		DRM_ERROR("image dimensions outside max range\n");
 		return -ERANGE;
 	}
 
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, w, h, layout);
+		return _dpu_format_get_plane_sizes_ubwc(fmt, fb, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, w, h, layout, pitches);
+	return _dpu_format_get_plane_sizes_linear(fmt, fb, layout);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -407,8 +403,7 @@ int dpu_format_populate_layout(
 	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(fmt, fb->width, fb->height,
-			layout, fb->pitches);
+	ret = dpu_format_get_plane_sizes(fmt, fb, layout);
 	if (ret)
 		return ret;
 

-- 
2.39.2


