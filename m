Return-Path: <linux-arm-msm+bounces-35756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5598C9AF61A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 02:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44B1F1C2131D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 00:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ADC84D13;
	Fri, 25 Oct 2024 00:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vl4+xCx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8C64879B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815625; cv=none; b=iXUrKz2j3vPSAwnZ8lEWb6zg4QlyW3LPDxHw6xWYZuWzEY/eljcPVzz5s0Upvm8zsvazSFjuQ2OZVEqJZmZBPHEXBvk1AK1ZGptavmwI3Bvx4mDJyRLYalZ0T9/wTH2zMm0sFjN+g4nDKIWjmztj7TwZ2jWDPBydj3u9f8Nl8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815625; c=relaxed/simple;
	bh=R4+qo2hxkpeB4OSRUiIWsRuC1ZKiHOHSAdxEdLPwhTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fy9Oli2x7R8/OevVZK7kj4rlWA//uiSR4gyGUVaUpxurhtyDRg8Y+qBh3mgfWa4t7fj9odTPmFdZrVJU4mWKi5Hrq/MwTKxEoGeL6v2tiLOpMKN2KpGm9g/HVQ7GKBnlJ0E3+MC3SUHWw55AD5UUlYj6nE29NGBEpOR8E7WyOa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vl4+xCx0; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so1914486e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729815620; x=1730420420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LakdxDF/9cPRQ3n9hrQ/Z/yNSX8nKO7B7BhK4ZShkSs=;
        b=Vl4+xCx0Pp1HSaSwfCfxutFDOYsw0BMx+9fT5cPn5r2zfUXa71NUMozqraBtIFM94G
         llhBmuY/EQj0OFXlYN8AmVusKtm0aiZYLMa4pOrfKDziS5bOlzh+RxvT5sIzbEYiQVwK
         ch4e2OQK2d08BwRqZrXCgmD+apgGYSq+e9du+QEdd2ES5nwT5EcYA+z3kD2/iVd2ABvJ
         ZtQerrCnmWgpId97aQ1wg4TlxZX79fAnM1sxvrtxxKiv3LpY8XhIXgA1p2Ol+GjJfV+A
         1M2Bd2DJkbwOP60DAissrdCf2b0rsed56VFzouiNRVihJXC8LD7RAIE8VGpMODJYi3+t
         8uxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815620; x=1730420420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LakdxDF/9cPRQ3n9hrQ/Z/yNSX8nKO7B7BhK4ZShkSs=;
        b=Wqmmk4yFdmQdaIsMNxE5XHlk2Yp4OagnmPLag9ii0ggFT/c+TwezJ911xWvesohsuU
         3ukuwOQEIEzBSuielHsNKJYVGXO7NJG1OuIjSH/IFS384ZcitinPvsOhHwSQRYhEXHvZ
         uVApu2efnNf+rHk9mRkxZzuWlqeoUsZgQzqMIUx/3Og6JmbFMulW+yOWa6TclO13LsvU
         csOvQ6KNt8cAwq+0UNzE0f5N+m5ETK6QLy0xMR2bNEoo6jUCYOrB9YgBNLM+dPpu5VYV
         JU8lJJznKaMPbGxfncQZ/SIKOk6hkPf/ReKVz7vhT+QMYyJdU/Qj+yncJdfUhd4iLfot
         VWyg==
X-Gm-Message-State: AOJu0Yze0RJPSPxWLNidLqR/iYWKccVdqTVomE3rN7qABOC8o3oQpMH6
	n6zFcOLvUzHrPEQa1jv3snuizJXDLqfxVzlUrtYj0YnJV9TC/CsGnrUSanuE35Y=
X-Google-Smtp-Source: AGHT+IHHDGPFm+5LaGcGfwqv0XOoCyurtL60nKuQZ8HiBDCcMvQ+kw9uoSYdjQwWsN9h/nwfrjWhSQ==
X-Received: by 2002:a05:6512:401a:b0:539:f953:2da7 with SMTP id 2adb3069b0e04-53b1a3a70a5mr4593047e87.50.1729815620241;
        Thu, 24 Oct 2024 17:20:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:20:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:11 +0300
Subject: [PATCH v6 4/9] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-4-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5438;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=R4+qo2hxkpeB4OSRUiIWsRuC1ZKiHOHSAdxEdLPwhTE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ6BE//45YOkNrdVtFe+/Zedx36x7cWQcWtt
 TIBXFdinJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOgAKCRCLPIo+Aiko
 1TK5B/98g0apE2NIT7PhToAg5Nxczdewc05BTIKNanzWzFP+vTPAEePxlOfEHZ/y79Z9DbfiJBT
 3+lIFxnjxiImvtNcIsEpvj93z8ckZ8MysxSd01Z+LiW/gil91HTaXMagrXA9BHDAeX/Y09X+6WN
 YR/Zby33tCmt4o7p46N94UcRVItHhf2aHmBlB3oIRz0Gt8NQjMXh3UpSEAjMHC7qvHS35ctGSDK
 vDI9HiLeMYoZguzN+SRUnGMLa86QMxH5qm7VS9HpUarhyHWohqh9Wf6UJQc/f9Pw+RFjEWeJtcG
 1l9PspOjteJE/t4Aih7UY7qoQ7F0ibqQvp0gHox8h1/U6HRd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Max upscale / downscale factors are constant between platforms. In
preparation to adding support for virtual planes and allocating SSPP
blocks on demand move max scaling factors out of the HW catalog and
handle them in the dpu_plane directly. If any of the scaling blocks gets
different limitations, this will have to be handled separately, after
the plane refactoring.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 16 ----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
 3 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index bfca993deb70..2cbf41f33cc0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -147,10 +147,6 @@
 #define MAX_HORZ_DECIMATION	4
 #define MAX_VERT_DECIMATION	4
 
-#define MAX_UPSCALE_RATIO	20
-#define MAX_DOWNSCALE_RATIO	4
-#define SSPP_UNITY_SCALE	1
-
 #define STRCAT(X, Y) (X Y)
 
 static const uint32_t plane_formats[] = {
@@ -308,8 +304,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 /* SSPP common configuration */
 #define _VIG_SBLK(scaler_ver) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -322,8 +316,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -336,8 +328,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_NOSCALE() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
@@ -345,8 +335,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 /* qseed2 is not supported, so disabled scaling */
 #define _VIG_SBLK_QSEED2() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.scaler_blk = {.name = "scaler", \
 		/* no version for qseed2 */ \
 		.base = 0x200, .len = 0xa0,}, \
@@ -359,8 +347,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _RGB_SBLK() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.scaler_blk = {.name = "scaler", \
 		.base = 0x200, .len = 0x28,}, \
 	.format_list = plane_formats, \
@@ -369,8 +355,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _DMA_SBLK() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 78ae3a9f22f9..c701d18c3522 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -364,8 +364,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @maxdwnscale: max downscale ratio supported(without DECIMATION)
- * @maxupscale:  maxupscale ratio supported
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -375,8 +373,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 maxdwnscale;
-	u32 maxupscale;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 725c9a5826fd..8a9e8a430da7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -777,12 +777,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	return 0;
 }
 
+#define MAX_UPSCALE_RATIO	20
+#define MAX_DOWNSCALE_RATIO	4
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int i, ret = 0, min_scale;
+	int i, ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -813,10 +816,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe_hw_caps = pipe->sspp->cap;
 	sblk = pipe->sspp->cap->sblk;
 
-	min_scale = FRAC_16_16(1, sblk->maxupscale);
+	if (sblk->scaler_blk.len) {
+		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
+		max_scale = MAX_DOWNSCALE_RATIO << 16;
+	} else {
+		min_scale = DRM_PLANE_NO_SCALING;
+		max_scale = DRM_PLANE_NO_SCALING;
+	}
+
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  sblk->maxdwnscale << 16,
+						  max_scale,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);

-- 
2.39.5


