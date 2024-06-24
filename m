Return-Path: <linux-arm-msm+bounces-23985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF309150E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1FF2B20CEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43541A01C0;
	Mon, 24 Jun 2024 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0iBM/Cp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30E19FA82
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240443; cv=none; b=mcEmiOt732Zx4tteg2Zv8hVhfXweznOraVirRKkZcs9beOBgf6AdnoeAXZbukccfrfH1jc2A6WiOI467V9LI+8QHY1FxVpzQIC/fXOBDfSEH1lrNtcT9xGsbl5KMKou04cJEA/MGxR7RN+JyR5XNZ5IJam76+k9yCFtV9tkiYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240443; c=relaxed/simple;
	bh=bp6A68kJPDBcsi8eZULofLfrBBdJDRmZZyWTdQOEhY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDzIWOvQmDFiAlpxSp39uaxXhLdTCvWtbxonu35IVDUcG31fAcksBZU9SoJ1H/exgHp6arCUpqKMDM8p47USXhABnHRMHV1bDgCzzsGYJhGyyJVTp7wLqPTz1iacZUhtG+32C88sYHgH6g2NXuL7ZKAYZA0UDiuBkBJ6LtjrrEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0iBM/Cp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cd80e55efso5045106e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240440; x=1719845240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXiVV87C7egKKo/oKQCbPR7p6Dyhi+8Wd+RPKOL1+cA=;
        b=t0iBM/CpFT8WVZPZJED2TJ5iK1gXVgDt5ilJKwRd/Gmu3C85T+gjCqPOrWBbfqKrwg
         MUX8CeYgu19JNUiAeypw5DoJUXkGd9Cszn1oMlyot4PRGsY0GF+KB0ewG/K/URQqgKkA
         Igssj2wSdMI/0GGSaAvhKDCmKpljGdCr6rf024CM4RGX1hu37FAeb7diFONugtGwuyaS
         QGcyTiZ3kVa79pSf3ppfXPBgmY8jDMw3aCk9rB4oLRPlQf+lkGQZ8KO8kmy7+WzFSVfK
         xrpJ+PB9HBpWzlckCKbySfLtigtHaKoq7T7+BsTszkL9BCgHKX/uSO9tFhyLRJVd8Gm5
         KdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240440; x=1719845240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXiVV87C7egKKo/oKQCbPR7p6Dyhi+8Wd+RPKOL1+cA=;
        b=ZlSIU4FotXeQBTDHdBXKUxbkGmxo5ZFVo8AUvQCRSKM2C0hev+f3U1lRB6QAKu8QOd
         9UlwTy6ciS0Jhk+U+TPO9MkIz6asOqNotcxVBd6tmSuhv8ctIzKY3Sj2mVEchOspu0uR
         EH5N1kkZhWaKtGvq/DM2tayUHaStx1O2NIaZDMb93/Xcr5RVeN9kr3iC1idmYH6ebK2G
         wljBk8K14fQhtmtG3/vdLDUuTnMfx9hmjT9+Ux6II9Fd+4TxEqLckJ0VmEYdPkvT63k7
         TOBHaiyOYHwPODuEg6NyXvPzoqVxq72fuT7jSVnGj4u8/edNnCpevHVcvLXuKX5Wo0yK
         quNg==
X-Forwarded-Encrypted: i=1; AJvYcCW64bwzUYCwMGM33LIz8bSQKvvz/tC9ThyIo3TIy33Tu9DqR1UkAdV3Lbk7J5DpXjCNa+bBkpOZtIQdul45oRxmEVecXKJWzd9dmWIWDA==
X-Gm-Message-State: AOJu0Yxdi/96R+WUU4kN9rXmdml6Njr5JlscUnR4j25IRuI7UONyaytU
	euHwFEra6PEaBmLBKX7y7GW5gU97HfY+daZ8h9XieuyFMg//faYie2ZE/2lhenc=
X-Google-Smtp-Source: AGHT+IGTxBcoHd7DNv/2AA/tt4TDriG718Qkr4irYi2DtC/ykenFbXCOlNxW/Uutwb9xNdWMv1KiDg==
X-Received: by 2002:a05:6512:360f:b0:52c:df55:e110 with SMTP id 2adb3069b0e04-52ce182bc79mr2964259e87.12.1719240440011;
        Mon, 24 Jun 2024 07:47:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:15 +0300
Subject: [PATCH v4 09/16] drm/msm/dpu: pass drm_framebuffer to
 _dpu_format_get_plane_sizes()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-9-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pl24fvyu4akw/UT8q//WNf7ZEvz73rt3D8aWbOPXgpN
 oIr4VZSJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8n0T+/+Qyw27WgtOP7aY
 KZw8lefdqupELdXYwkJrro6tAapK6rsFfskdFQq3jn/EaVL8zkZO5Wufq/ty1hj5biuf98zbj4d
 ctBCa/cioxULkh3m3sVZbhc0S5a/yRyKPrU3WcDV8Xbwx4pJ4cezHtORvz97P9zDaeWm/hcLsp0
 w1y94KSweUPfM8c0tq2fLTE2vPXm23V31vnJq05J747PeR2QHPi6/O0xYxWDBry4HkmJzXIlHt/
 KtnWzsI9t01CJX9sHZbUMKfNY8+b7lS+Hm/SLZ6HnOt63v2zE9Pf/On1zvanH/bxPE4Wzt4lkNj
 hxz/RsaoyW7zH7qdLtHi4ug83/pN/ayoAbdT+E/fFFNPAA==
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


