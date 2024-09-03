Return-Path: <linux-arm-msm+bounces-30446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC279691F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A19282C28
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E621CE6E6;
	Tue,  3 Sep 2024 03:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3FXFnZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879721CE6F0
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333784; cv=none; b=fw3eGENo8lSLu7MxLUKuyMWMtjO4A2qBIklUcPIiCpYr6dluSwlMzRKdTDOoRH3IDFFXspRLbI58MFpZ1zeX3D2rQFe7PoT10WCPUUvp/XclhdHFyoFVF4jxYnyMlhkR6cUpNjTr5ApoRz0LRz4nibQxJHBlVnbfaGuNTn6vpY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333784; c=relaxed/simple;
	bh=uzEkRjLwqwwp8yGM+VEKUZT5JztSQ+D7q1qSN8x5gD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tK/arkvr7EI+RM5fwaKmNikaITh6N8Pvq64XQLK5uoIvj+mmoVyUSeSETHatMGoLBWBLLiNnBxIlX7mdZXWhn3eGh4a1k2hfm3Y6gaVm8Gs4BiEIfVuCe4C+gJPm2JfcpPcTJ4fleAl08klBu2cYB6HkDl38OGhpg7/E9kw1bCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u3FXFnZx; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f4f24263acso71670131fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333780; x=1725938580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vn4y0gVtwJEmmSUaMDUfTbNnv5xg0I2o5qI5Lo6C+nI=;
        b=u3FXFnZxqAJV7i8tRgydiIrHlsT971yfxqF43N2I4oL+H76EkLutgz3rQbAkDvQ1Am
         O4fYrq8H3UwbTaLcHO9VTdqBYsNqH9z7P+HNvTf+G4GfNfwSEfONvu8fyZZIwmmjVifF
         yaW/s3/7g6M2jNAOr/d749GOqTxZcUdLIWdzs53/DHdFAlMN3DUxe4mMQDf/KiGmyuAT
         /wOrvcoQOO1O+4jPGRR+MjE4+1X/+NQfYGJXJ+Gmaz5qt3EVmse/oDxdpUCxEu6AdgBu
         DHUTmluF6kyoeVuuhWQB/cQL8m+/wqqX+ePNbV80vyrAdUq8I9wP/BFhbXTqGwVrke+W
         8a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333780; x=1725938580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn4y0gVtwJEmmSUaMDUfTbNnv5xg0I2o5qI5Lo6C+nI=;
        b=wyPrLr696lvope9HeOlbhmL9jgQq+57VagQq6+p3+Gl/v+4ZBYST6xx6KRGodlKBjr
         XvaN+vIYaJeNPOgml94VpBFLYnNCx5en0PpXr9RZ9jc82mImFwPwDAkc67ubwo14QbNQ
         sPJKZFFFmNDEJHc6jUOaIdfSuEqPF8B7NRLv51Q428cz57Sgb+fx8OUtzp6+4vvgYvSy
         P3w81IR9rQLAUoFNzW50LVjTn/Ald769rRIQDFj6+rrJ0LlQ1N7I5CNP8vHXv4qwj8ES
         aofBZAiCV35oLXS7jQRLtgzDvjUEWKxQp978olEa+ibXyAb43GVnNSNEpo+skuzAv8la
         sZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr39irysxmoWmdGMeJG2UnHuxWaAjLlsG19a+rsPC7LHZBKERSWd5OK5IIVP8owh1gtM6fXmXm0UVepb9B@vger.kernel.org
X-Gm-Message-State: AOJu0YwIG3LUAzaaztdhkz3OYohvz52+djRHEJNZXmq50dBm2AVj1vUH
	xMcmOoGXnoMHjcqbTjSHNqPaILQrwuouMgG1P+K9rpyS2fkIE5zxWVPSN0VdONspsj79w88bZY7
	D
X-Google-Smtp-Source: AGHT+IFfakhBSUwZNYaA3irBZwqBs+aaq4Y/jhBv4IZq4oAeR4GFjy3SZe2fV1GmZjkCukypIR7QwA==
X-Received: by 2002:a2e:6111:0:b0:2f1:5d61:937e with SMTP id 38308e7fff4ca-2f610707e55mr118590661fa.29.1725333779948;
        Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:51 +0300
Subject: [PATCH v6 08/15] drm/msm/dpu: pass drm_framebuffer to
 _dpu_format_get_plane_sizes()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-8-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7845;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uzEkRjLwqwwp8yGM+VEKUZT5JztSQ+D7q1qSN8x5gD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEL4EqkTVoZURQsdHu0HPZpMLH5nnPI7gs8y
 ZpQEwcCCkqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1akJCACmn37pXxD9pwZuDOcGc+duqzqFr8K5flqii/yMdCHu1+cRKVln0KfCVH6zGf0N8/n57eA
 WgcH9MC3Af8Bms2Gx8VkZEMIVQRNmiujKj6NBwu8eVwEyfSd2JwuwCX8MdBnuMiEC59B6Cm3zwW
 clxSax+AFGleQx4tjAGp2wCKPYpeBkvbCPlMtbYuJ86vfpCASfeOtl9+zge6B6wvVmYADpwu543
 aH9UXzjZSyyCAkgy4VuG8H8lGRioWckgvk5zVHMgP31ANUmMySmUrCya+hfND2AX7Vx/jxac+1F
 H8B3kG9QdcelrtVQmU8aQJ3SAfm9Zb6/LbJSl/g80AihXQiR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of passing width / height / pitches, pass drm_framebuffer
directly. This allows us to drop the useless check for !pitches, since
an array can not be NULL.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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


