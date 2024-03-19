Return-Path: <linux-arm-msm+bounces-14511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D5E87FE94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C94F21F22DF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0195A782;
	Tue, 19 Mar 2024 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E31dABdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09380023
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854527; cv=none; b=BMiS6jsz5rsEHIf659BFtr4YEvozrFQdiVin8753kmn4TFHJrReULj7HYG+Oy69Pisc25sV2u6lmGRXB9zc0vQJKGbIeX8b7y71hXGNWkQBj9zQkc7IOGxHIzcqtHRFr7iPEWvJAMsGnwG0miwTQfUwgB7ya2a2FFcyTWI0N9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854527; c=relaxed/simple;
	bh=jvHmyU6LpSpkeEhCjtJZWDUfSAyNw4kv0iGJlybdwnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nuh07K5UvBMkNNIVMfULlenUQviXspA0ybJMvw0vWUxO36sIGQ+PYz+dPr6yLXVp6VbNghVCGCe6H6LjMrQWzIzHKEAHlz1jUtJu+QtZeGuD8+JHT5ZdQdxDm2+4/jlchARtGSCyX6tpTpp4253fDpf2fnKM90ahdBZwvqUBjD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E31dABdM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5148ea935b8so1905348e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854523; x=1711459323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoxH2nSafGqlFxak1VvOTinRqhcDU4q0kbONIBvGYYM=;
        b=E31dABdMfZfkI7Oib8CABJ11iq5JFhrlHXui3mQk9+TjHcqpAHGtgbRTkgGXXZ3fNi
         MFBq1JOl3xSn+SCMaiYvfmyCadd4E8HF+CrBrHhVj/R5FEsyPDh4inuj8U/zEz062UVd
         rqelu3w+GtITnJsVcS/BFt1tuwbhmx+KuM2RlO1t6wxJZON32EvVHN9eV56W08w45YCw
         ioId8UJ6IrtFR06nbNfQA8TSJVhLqAEy9zPnen0bD9Ev3tL3z+83rxvb02Iq232DMpJG
         5DhCbyNdODy5C9kZigs/Ceu4HmjNDJsl1ToT39VoELzOqgdc4l6XYDoOoavZBtsdz7Dq
         kNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854523; x=1711459323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoxH2nSafGqlFxak1VvOTinRqhcDU4q0kbONIBvGYYM=;
        b=uru8WEAlOkPxkgkhVPAU2E5Sj2wbC0qgTADokM3+b9MTemfs0KdE1JIXCuG7GOOBn8
         ku9ULW6MHozBn5oRRMOwftSerw5CnoFBdrBucfX/3NsmoXGxsfO5uwJOnP2cITPP88KN
         U4KsUlpLSmk1QjY7RDoBs4MhAc3g6VSgWIOZKh73Xj3eJoyAwLLiTwwXRkHedTyRv1BF
         OMJTfz+pvsy16V74G4FhEYC2fdOaC5sQfMrypTCx+PxLuDLtBrw94XaZoyiuXZBnzeqK
         XG+pQtlwUCzRluqutYfFvq1A8m/5PQU8VHTd3LW0kl053OZb4zXlTWklx0BrgLyQMxx8
         kEyA==
X-Forwarded-Encrypted: i=1; AJvYcCWuCKvm3CpIDmszKi9qjwDn32aSHQCVTiTymA++KVIxVW4TJbsgeNC/Kth42dpQnVbBzMq2yZCQJzPTLbingV2Aj9S+GvNfpADsPeU1ZA==
X-Gm-Message-State: AOJu0YyV2MC3mykvzB9fOlhmXGDiNYsIwGEo7SAdiiHnG1avjP7+PCiU
	SbrgWEp/sER6Ks9ODGTpX1FzF87IU8H/hmrpRw0PmIyzK6Ez49zGO4fStc+fyUI=
X-Google-Smtp-Source: AGHT+IG7LcAyXNXLh9gEK/nZvccQqdCxoiZfBEmRbCLT+JwTOtMZhlpo7rls1imooGepjptLzAezaw==
X-Received: by 2002:a2e:7314:0:b0:2d4:6e24:3ca8 with SMTP id o20-20020a2e7314000000b002d46e243ca8mr1698051ljc.46.1710854523377;
        Tue, 19 Mar 2024 06:22:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:00 +0200
Subject: [PATCH 2/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-2-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jvHmyU6LpSpkeEhCjtJZWDUfSAyNw4kv0iGJlybdwnY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3mg/lUnYChbuRD3uRuuewKBgmUKSeY3E7J
 kpIKbB1KLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1YkvCACb8iLD+GOZcSSwv5SOOW8im/SZ3oCI5GcMebNmI7Mo+7zoVz7eOGwir+H1zGG1ynzzKT+
 YdfjeJjXAeq6tJ94Syp8MA51R+okeqmiOro/3rosf2Ht0w+3bRUGhhT8EzUk6qWbrTwNTexUDS0
 24zzUKN6gcCdGHATy5QLrzjX0kMHzPHv/MSTa6WWoKxHr/OzRJeuqfB2GaQVLoyzYtcneZsr7Rq
 kZ5DIJYy1hY+g0z1btfeBH+U4Q2pCJ4qT65M/EUarRM6sAlvI51sbLYQcvEfhVctqd+CFL/Q9/h
 fYNoF2APZFka11Nwf5YtDXcKxv2NgtTbE+WxsTI8QrDwC8xg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layour in the plane state and drop this call from
dpu_plane_sspp_update().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ff975ad51145..5b15d8068187 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -646,7 +646,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -676,7 +675,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;
@@ -1099,17 +1099,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		to_dpu_format(msm_framebuffer_format(fb));
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
 
@@ -1124,12 +1113,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
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


