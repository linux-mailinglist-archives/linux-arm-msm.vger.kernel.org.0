Return-Path: <linux-arm-msm+bounces-30444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 599729691EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1142628435D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B401CDFDA;
	Tue,  3 Sep 2024 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mbGN1Drr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EF51CDFDC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333782; cv=none; b=Hvn1gu8LYMTOA53HYhDvikdjKvDZ/0J2FXh/b0ekBdVJO65Wkz5dF6CXDEKzEAAsNGFKGKsnxrkNcdq9J6uTHctuNXIWyxziHFTtRVEoiC06osVDrTxAMm8MTlDTpxf2xuRLGiHk5hYkarRomwBqs9H3sS6KDMGOx1RFjrhqT+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333782; c=relaxed/simple;
	bh=WdPcTdFQXJWLycgTMv1JoAmmJsZnOpdWMBcY+eFCp4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgErSHR8vrNbaR+CP5PdGUZX8MTT8gR8acoWUl2PQ+Vpo/UMz9HtYUlGTfWpxXR9twBgXyCzCKRm0lLT1hXNjDJfVqpyb8sF6UwaNi34x0UIrk6aMgFpR8f7LGyzyGxaUpBiqnrCxtD2M019nFKcJxRF8jeGBhBne9pmtkU9jLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mbGN1Drr; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3fea6a0a9so42516851fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333778; x=1725938578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hRpaQcKbcknGZEeL9srQpxHfed15gqaeAj5JZ2LHug=;
        b=mbGN1Drr+B3zSr8Pn35IquEIXjdlCbKQ0dCPHNJ/8AcCFtXuY0WPfRRhfiRNUMueM/
         rv5/ih/qKfoUx3N+fxTzvU1361MQoFbXDhSqabH4GCw0YQD4lzxVH9pP4BGoVZf6t8iS
         jubmGDu16Sb9I/ZSWmMnPsfcTgqyf+ZGlw1pAXyqBA9kqP2il7jwp73J8qAO8OZwu+s0
         u1yUIBIG5IANxXjFtFbXLmyQHUYFVdZFY3sPLTuQglbKpzerfSwRnUN85k3TgzuZDfFj
         pPaFGZt3mt3pMIp7agORMcqD8GM5Z2frqXGmezFlKmRNlU5KSnpWqjIgECI5+yaVS++p
         ETcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333778; x=1725938578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hRpaQcKbcknGZEeL9srQpxHfed15gqaeAj5JZ2LHug=;
        b=k4xTn23c2gS5laWx08MQ01SJz/IAAogETNLSha6DiApRfHk1Tlu+z4vFouH89uLhH5
         rl12YwSuHFPzLJTIZLwV+jp/5cUQml8FVUURh+hWxhO1DcMNH1unvlyIimLLN0rV/Mo1
         W0D4PQfuzqi14NoX9E7wSKlDLEUKN1jOShvL9mwJPwV9Ugg/8LZm1RGa3P5+zG4XLO+7
         dMYOcXS9StsezC8pMzTRJEH01XSng6xmzQ36BMmPEwm4/PX/L64ezUYghe1G8A1zc6aQ
         jUtYrM3uBljFaDleUTnDqJf971i1zhsfcdf6gkvHfyA5I3eDkQM48squx+t1NnTr9mG+
         HO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUKUZyayTeQ6qpJ1iaa6yyjzCHwa5VhF5b2mX3Ng+bc/drTJJqN4MnYatK+3+pv5inyPIev6VFO9oXmdAeq@vger.kernel.org
X-Gm-Message-State: AOJu0YxdO8FJff5QwNFeccmKauDEZjKL2hlOZpPDDCiPiaSGV8lAPLCb
	oLyKDkjs/v4oUa9Vsk49p1jzGlndy3hyZIdrgCfjDQjYdUF78NmcywcILygf6Jr7jNKSAlpc+GP
	T
X-Google-Smtp-Source: AGHT+IG+0zz+F/I5gdve7BbU7pYrQzJfUax/TpvgfPnOk0kGVd7L+w4J0DmnhVPzvJy9ImS+D94meg==
X-Received: by 2002:a2e:be04:0:b0:2ef:2d83:c136 with SMTP id 38308e7fff4ca-2f61e040567mr41237911fa.1.1725333777313;
        Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:48 +0300
Subject: [PATCH v6 05/15] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-5-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WdPcTdFQXJWLycgTMv1JoAmmJsZnOpdWMBcY+eFCp4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oELcjShU39W1AK9lOtdHTGbQfPNL/PcZ7qO8
 DJUzYi4G7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1WLVCACiO2BHrEeD/3IA/R/EsXDKTz4D64NcmnqS/hoaECZjsGd4HJ2xW6zzJRCsB7NV877UtEb
 iexjHOYIqcvGAvszibYsn//u/0fPag7+Tp35jia3tFfUePyGiRAr5bhADH2iCnuPR7q7MkxzyJ1
 mR5fZXtCCIgDrFpyaI7fZvigmT7DuUPulyMRDKrCpk4m5rPZcJoWTuL+3LDgKmRhJ4/wf5U/72b
 4//iOptAbpDfiZ8q1vFgkE1LriM86RoQxNyad6fUyeE4hj6dFkHe17MylwTuOkI5WOxQTVGKP80
 cCeKDbIakwnLStasbmv0pN7V9TA+4ZSaFe8lNTmcSsS7/V8G
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layout in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 29298e066163..93ac5afb623c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -648,7 +648,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -678,7 +677,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		if (pstate->aspace)
@@ -1115,17 +1115,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1140,12 +1129,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2


