Return-Path: <linux-arm-msm+bounces-22648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC502907F04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46B471F229A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BCD14D2BC;
	Thu, 13 Jun 2024 22:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rz4/8h/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C38514D290
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318189; cv=none; b=bTkztAa1iS/4b5F7T+W71s8+iIy0TaG7OUmZ6eDe54JQPn6GKhbngjbNqSssTza/OF2hlURmi3saOYq2q8oF8Pp1A++e/nqJOz9DR5FEGMahQMZgEjEQSjv1JHDHEEa/bUD/mugeOuAX3RkzoqMy2f0D++R4OOj7KSl+uD8bnQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318189; c=relaxed/simple;
	bh=b8kT7uNMoxyE9AV8a51TAAbK8IFnReILBdf2NuP/B5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pl6nglFuq71R4NJ9HKkIGsQTNxLJCUBV9vdnBV77waCeZgT27IdBhnYHkseFRw+diN5vzEN37Qu6FnlU50A7dihoCJ81WxDHJTysra9cfIgWUebypRfLPx3Q/uBBR8Pa1noarCFUH5c/wfitDETbU1Qe9u8R+fStoa3gzO0DroQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rz4/8h/j; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eadaac1d28so14655961fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318186; x=1718922986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oXOVdRHNNnObgLlS+JRiMGauu/PqHbIdd79rxd9IUg=;
        b=Rz4/8h/ji+BdzlibRFiPGf/sqnwxnV8LUUar/0IKK/E+hg9AFqIBr+jfETGmV/6qfx
         iHnVXJfNP6MHsakfWvLiEaqh+i2+oo28sySUauEgvGjixOkQMkOfiQ0JxLTF8q/2ntC7
         6gwcPydbaZMieMQRRwkxpw/i+x6hJVNOfAqCJ8oYNKR2I+h2C0qs4Ene5rS3wMzHJ5Kr
         W4vbvDD+svCZL3MvZc0QuBV/uflFwdJKbiLkD2MGV4VFAv6PSZmgiwzT3UjjQzoKpbKq
         IrhLiKjlDQqTtp23W4Lm7MhbZP+rocD0apBVh3fC2yePlfjhdBsQFh3A5V2Y7cpqOTJy
         izPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318186; x=1718922986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oXOVdRHNNnObgLlS+JRiMGauu/PqHbIdd79rxd9IUg=;
        b=aGcar6OqYdB3xXLkDcwOdhKiRQODzH/cIvq2mh94QpfZs4JabquQhpJqJUQfYyE/pI
         BK0PenMO8oF51K4P5uzOQygLDMJVW7RK065r5nIxqxwfz5hYeCiQb818EjAmbuwyJeGJ
         oEMQ+TaUlyrw9Hhkxu5r6wf8+ik9ZT+7YkjCvkCX9TCKoFDdCDhFXwtNtt88BbRu77Is
         6JRPGVkCwkg+MXYRrfeo1Qc8dB81ON8vPrfnXwZqes/mmlu+X/qnA87impdpldXN8MYB
         aaDVZhfuBmU5K8njSu5ygtOSmocsVc54rl/JD29ATW9L2jAsQmfpYChmBWkQAKwl5U/n
         lqsw==
X-Forwarded-Encrypted: i=1; AJvYcCVqBU+qJ8ChB4RY8v0QJkF5zeN21Fy++UYdsJ3i1ANCL4ygFppAD3k8vsBFY+fBClz28G0WKCePpoGWvcNl5eBAI2TR1L/IP6Zo2dXdww==
X-Gm-Message-State: AOJu0YyNmqN9+KuqoaRe2f6ol3UYwKw+AP59ZIgEL/d5nw0zJiU+dZuf
	DiuYoVNeOijU7QMrGmORXr1GL4c8aOl2l8eVQlGpJcRQq1rwBv4eiiE1UwEtctI=
X-Google-Smtp-Source: AGHT+IGInrYLWQtlrQXLhQ4Fn4kMM+TkC/CKnLcZaun/7ZLsRJVyvJLpQDWNJbCrFaCALcESKJUw9w==
X-Received: by 2002:a2e:9b4b:0:b0:2eb:fded:a5c6 with SMTP id 38308e7fff4ca-2ec0e5abf16mr6549171fa.51.1718318186257;
        Thu, 13 Jun 2024 15:36:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:04 +0300
Subject: [PATCH v3 3/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-3-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b8kT7uNMoxyE9AV8a51TAAbK8IFnReILBdf2NuP/B5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RlQ4b4UFtQ4hs13DaK5VdWZWyeacZvvgTSI
 rmJHgwS0xeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZQAKCRCLPIo+Aiko
 1WqmCAChOYvOsWwRTgWuhRjG3petU3qQ51O4u5DNklC8Hq8IHtZ+fSuxnCiwdPdx7vWnSgqE+VX
 6LR9REmrxxt/uT+IrRUXNW8kReqN39GWOEG5prNQCXsIEKkiOIlfEnRVo9xp+hVKhpTbEO0egji
 auEjWflaqOQRkUq7HhCo3i5cfRPSRMhVewDvKndHSc9qEtCQpsWPPLOmv6/JdixnVbCEuWm3gWD
 Jnd7ShmuETOgQnzEzepbG54Cl0sgI29P8BYv+evqMKGx9Z2JLOaRAgt5M5/EsZcYG5cw+a/X/ba
 3GoliQbr8iURjjzbRMtiZDcBPWA5c/xB5bzdp2D9K7F9/jln
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layout in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..9ee178a09a3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -647,7 +647,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -677,7 +676,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;
@@ -1100,17 +1100,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
 
@@ -1125,12 +1114,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
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


