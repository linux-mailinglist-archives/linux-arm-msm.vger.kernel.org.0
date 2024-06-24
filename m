Return-Path: <linux-arm-msm+bounces-24033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A722D91588A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C742B1C2268E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045CD1A0AE6;
	Mon, 24 Jun 2024 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIShwXJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B401A08DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263633; cv=none; b=Aq0pyIusvKC9xSxyHGSEANQLQBEh1cnl5/xVd9Y/WMs8nzTocDxKHbLCaQe1+lXkGLMUb6JtElzLd3PsfmpxgexisnwAqemnUYvANO5Wj3W04XOAyAN4l5Ce4Hj49baNghyYQzvipbw4teNtj1ScHaeR9j/QApCusRdXA2VbEc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263633; c=relaxed/simple;
	bh=EolmHRhwGXXQUzrkytdeQx4Mh8dKlNx5sMNxyMkQHl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkjPYp6wag7nml2BppN+paWmst/13f9rmG4wwl2r7A4igLs+sXI/aU0I2w9gZ01NQKN+XRk+gG6bb3MgZboFvd9N4+AuUPIV07GMTn2Dytswk8rO+nH7JconWC8X6UVJ1wMPtM8JnI054xLjFb0wfdRRilpokRBjuLXc1SyMKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIShwXJu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec6635aa43so9098631fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263630; x=1719868430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
        b=hIShwXJuNdDa5D2f2BFgJwkMealdQEDFOWkYId4b1xdG0EsLO7gWwe9AnQHglflDzL
         cZApKhNl2l91UCTg2gM7VpLRPXo6d7W2qSK57Zt/CMkbU6Mx6v3i2luhGqwxzltM8u+E
         C5NR6gTUee6D8Ay/LGq1mjdJOX9eUHBG1QLcFwsdWggri/FTogEe0Ps+3JgUiikZnH4i
         ggudkBcy1eOdZzyrh5fSKilQGWM6K29K+oQUTuRoICYIYWzkk9NEvofI+4T/T2T/SYqu
         Odj7oFl8ZCbRMpCJIPvXK2TYkdP6NDSH2fEUH7FX2X9HGYGxJkVnFaTbMD6Ka9XCCjgA
         MhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263630; x=1719868430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
        b=gzkrfMPULBtGNMk02M8lrYcftkWrdzPAzS7O1TsuyxGZk/sJjWcIYETLuD42GYn9rU
         MjeEG+RYw6cx7VR7Yc3MFPa4dsrltRBzL5KXJrqjLkRXhckMB72yyV0Sy7U8sguVLV5w
         MgfbyRIlvxmqRuSFmOrFgdmbgGRLt9tFfGY0irZFndwTtKbddCqVrTyX7XQ9XDlKbvqS
         TsbFAnTsDGITXf4wt9dkbw534dnDEIdjSxUXLQCl88y9iihEv3LkaOmWvdDY1f/IJgyq
         ky1mPqfU1FtwlnCVFPXF6MrxgBq5xWcDUO0IcXZfxoobIQmQ6CVtr4l4V7WT9zHVvdiM
         ftcw==
X-Forwarded-Encrypted: i=1; AJvYcCUSmu7NFXly2tv4xb3Ml+NUjGgtAh+8+fsQ1Q3oJKXYUn2mBbNddAp6R1cxVVv+nTJFPBe8SeTk4FlejyRfBDqrWQp20Ph/4XY0ZpudQQ==
X-Gm-Message-State: AOJu0YzXPScPSn+5Fu6xFQYnAUJ2K50qD1yrIWeuSoAl8IlunvRwGUbd
	IraQprVR2K3+fuGkGALUJkq7lAjmyEQiYG3BqVpiSy6n2Xk1n5CFIrYzVwFFQUfcp5mik4VdxXC
	vVOY=
X-Google-Smtp-Source: AGHT+IGyGPp99oq4Tb6z7Mf6u8KLobjMdJrAmeINy0arfJBBJO7Y5Kp2tYMUAvNgwH7MdlLaiJXaag==
X-Received: by 2002:a05:6512:b1d:b0:52c:84d1:180e with SMTP id 2adb3069b0e04-52cdf826746mr5092059e87.67.1719263630644;
        Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:46 +0300
Subject: [PATCH v5 06/16] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-6-501d984d634f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EolmHRhwGXXQUzrkytdeQx4Mh8dKlNx5sMNxyMkQHl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGH4G8AYzcLriv7wCQKxlgJ7zw7WmKapFAg4
 hnWwOtHK1eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1adgCACCOrmmoWBBeDESFtrf3scoGYQE8Lvq4b+Xt9enahMjE8eBGftf5YG50NEjkLlIIKDD3qL
 3ILskOYwmjKRZaAp4zEM4OlL4fOAankKF82agbLZzmobJKpGjv2UrYQi4JzFfF1DrElnB3GtQnN
 gKYwRT4CvKbhHAJQmoctC2rT2pS2ptkkvdzLNAUmb2o5e8hRr3w3A2IIg48q4E6HabUbMXyXQis
 X91MSSqLgOinZQ4cQJZo2omRhtJykqqM43Kt6Hu9OtCFjGDcejLq9tV0y+k9crg/I45/BoOyEG1
 eIuJnrNvBOKuFIkL8yvRk9hN2VnO0pnS+TYonSaSjGtkNAXz
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
index eabc4813c649..241c2d7a218a 100644
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
 		if (pstate->aspace)
@@ -1103,17 +1103,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
 
@@ -1128,12 +1117,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
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


