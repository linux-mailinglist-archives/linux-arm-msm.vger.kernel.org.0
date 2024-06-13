Return-Path: <linux-arm-msm+bounces-22651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB112907F07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B8A1F22371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B1114D43A;
	Thu, 13 Jun 2024 22:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBYsd/AX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFBA14D2B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318191; cv=none; b=dKyTp/jQnLO+dTqkcows7TIgEWPJBIj5KddFLLYrZCrQWoqL2L8w6jzKdbSTSymGQXAlHQeHJPBvezRWWIU2gusPM9kCFKM7e25wJ8HofNl/HsLIEnvwHDPb4NxW/7elJ1mFqyqbicKD+g90Out0nSU2oLIbQmlK+FJ0J09kRJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318191; c=relaxed/simple;
	bh=jDftnbrj2pWC+/GjrBG3nHnjwOHiP63BF0nUNAmtu+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfYyNj8c+SrFDBZRmQ8YF5UQ2T+2tUuPPPZ4+uq+n+lQErqKO0HpDgENze9fy0goW3CKlA1qy5srARTNF8LX0kn1ke/XSt/jZDyEn3TPoNyv4QN5CQTqV7Hbq7GfVYM0a8shlYLedjd6EZV73n2ZxnXPpEzOb3xhuLxqvwQzoco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zBYsd/AX; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so15252151fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318187; x=1718922987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPP7TmA+2loPDbWoPi/CAkxj5Sf30vQLf/NX5YqEivU=;
        b=zBYsd/AXUPusDF1NRrkj48nzGEHaO07oGYgIWNEW4fsc9OZ0g6FnvZFnzPN3lKIbR2
         /EphE9Gg61JbIZsogW61S99mqPqvPgIRWCkkxsgNcH4lpsXTMQVHOqJpRV0HpB/HTm35
         lYnA8UHwIPm61RKdPHuI/uBoRPDopyDXeb3HHH/eZhuNaNyio1oq/jHn9vLvgrRetwri
         lY5UpnzL2S0BR8G63ydVlh33ihF/sGYJjRG59J2P+clhlUr88uJotPk6+XPNX44l/oti
         wjUU6leA+m4dlYIYU09j6vX7CAK6U0zqaWUIVaia+mSG8mz+VnE441AJvNc4Zb7iNJhR
         yc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318187; x=1718922987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPP7TmA+2loPDbWoPi/CAkxj5Sf30vQLf/NX5YqEivU=;
        b=XkTe3+2EOGfY+tissRWxbxhclNLehMeDSZNAuR8dEkHmsgZNgC+Hav7N+kwAHgmKV9
         jeaZ6rrpKfkJi6Wzw+kIHoIWdvsHPPMaVp+A/w6aks2frQ7S19WgbxbxSizzScTZHCOt
         0p1FniXSBd5hZHElf3eolayPxTJrBI8HvdYifOJ4nr5Za5BP95vW8GoA3GMTjWHScr3Z
         vXuKlK9Plz/qQaM9CDx9WC5QNMo4YJpa/nNBVvENf95zsHlz6RxjKWf7g0mLg7odxubZ
         fHRtX7qkkAatOlN03e6JcMT+KBnkQR4nq4ZLdzNf4YGOKF3OFEihRHFqn0eVTCBgQVzP
         oceQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwVDxccPKFNH+TJUMnXSXbSHMu567HW1QwASbfTKyZ/hGgUrp38Cy0rIDlrR+eSvt8SznnIOVXHfGyZP3jvBg0fGFfjhjWC2Q+uHiiEw==
X-Gm-Message-State: AOJu0YxVd02dNNtWrmr3noQrl24QFYjIo+dgM+Zps13yGXPmyIXc6FoF
	ZWGQH3m7F318X+BrRdyCq3AzcmqNk7Ho9SMukfl7QJcdyrtlECSt8CrjIjE48eY=
X-Google-Smtp-Source: AGHT+IEtT1RLQLYQZhL+kRkUTG5moJCCd6vMBf0jLsTImrnkqPzggwnP+12Nd0OXVqD3k7ThUoYiFw==
X-Received: by 2002:a2e:83d0:0:b0:2ea:eb13:daca with SMTP id 38308e7fff4ca-2ec0e60dd22mr5816261fa.47.1718318187184;
        Thu, 13 Jun 2024 15:36:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:05 +0300
Subject: [PATCH v3 4/9] drm/msm/dpu: split dpu_format_populate_layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-4-29ec4069c99b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6568;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jDftnbrj2pWC+/GjrBG3nHnjwOHiP63BF0nUNAmtu+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RmjY/PFvNS4jwP40VqiySiYmQITbsp0JjkT
 XzQwQFCvfmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZgAKCRCLPIo+Aiko
 1f9VB/0cD+Oy7iGotBJW/a078s2OPWlUbQui2XcomeWReIsh/EgWCThXXiHCksSbsYu7Y2yqwSr
 k7zl6Yjpx1nAHgFkwmrfG+4dCSojD0K//YXGym+Iku/AiPhrOXG/fa8Bf6cvX+gwfMIAaDCCwKk
 W0YaD4tXz2chXn0KYWNh9NG28qBtPAtm3nR1p1x3CqO8PseNFZledXEDLbJCF5DYeLglm4uJyoI
 d2X45Ii5xSwxEBTqQt2C254gxEM6j8ZGKTHW6sius1jO0h3HV60FVEOxbfbJtZw+7gYgTwVQR/w
 3uKV3Qvy06WXwElWb9jyztUemc0v1kk6VdUsGpkF0sND8r0N
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Split dpu_format_populate_layout() into addess-related and
pitch/format-related parts.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 45 ++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 12 ++++--
 4 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index d3ea91c1d7d2..ccf2d030cf20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -584,7 +584,13 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
+	ret = dpu_format_populate_plane_sizes(job->fb, &wb_cfg->dest);
+	if (ret) {
+		DPU_DEBUG("failed to populate plane sizes%d\n", ret);
+		return;
+	}
+
+	ret = dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
 	if (ret) {
 		DPU_DEBUG("failed to populate layout %d\n", ret);
 		return;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 027eb5ecff08..c6485cb6f1d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -93,7 +93,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 	return color_fmt;
 }
 
-static int _dpu_format_get_plane_sizes_ubwc(
+static int _dpu_format_populate_plane_sizes_ubwc(
 		const struct msm_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
@@ -172,7 +172,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	return 0;
 }
 
-static int _dpu_format_get_plane_sizes_linear(
+static int _dpu_format_populate_plane_sizes_linear(
 		const struct msm_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
@@ -244,27 +244,38 @@ static int _dpu_format_get_plane_sizes_linear(
 	return 0;
 }
 
-static int dpu_format_get_plane_sizes(
-		const struct msm_format *fmt,
-		const uint32_t w,
-		const uint32_t h,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+/*
+ * dpu_format_populate_addrs - populate non-address part of the layout based on
+ *                     fb, and format found in the fb
+ * @fb:                framebuffer pointer
+ * @layout:              format layout structure to populate
+ *
+ * Return: error code on failure or 0 if new addresses were populated
+ */
+int dpu_format_populate_plane_sizes(
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
-	if (!layout || !fmt) {
+	const struct msm_format *fmt;
+
+	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
 
-	if ((w > DPU_MAX_IMG_WIDTH) || (h > DPU_MAX_IMG_HEIGHT)) {
+	if (fb->width > DPU_MAX_IMG_WIDTH ||
+	    fb->height > DPU_MAX_IMG_HEIGHT) {
 		DRM_ERROR("image dimensions outside max range\n");
 		return -ERANGE;
 	}
 
+	fmt = msm_framebuffer_format(fb);
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, w, h, layout);
+		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb->width, fb->height, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, w, h, layout, pitches);
+	return _dpu_format_populate_plane_sizes_linear(fmt, fb->width, fb->height,
+						       layout, fb->pitches);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -388,7 +399,7 @@ static int _dpu_format_populate_addrs_linear(
 	return 0;
 }
 
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -406,14 +417,6 @@ int dpu_format_populate_layout(
 		return -ERANGE;
 	}
 
-	layout->format = msm_framebuffer_format(fb);
-
-	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(layout->format, fb->width, fb->height,
-			layout, fb->pitches);
-	if (ret)
-		return ret;
-
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(layout->format) ||
 			MSM_FORMAT_IS_TILE(layout->format))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index ef1239c95058..2f2bff14c0db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -32,7 +32,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 }
 
 /**
- * dpu_format_populate_layout - populate the given format layout based on
+ * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
  * @aspace:            address space pointer
  * @fb:                framebuffer pointer
@@ -41,9 +41,13 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
  * Return: error code on failure, -EAGAIN if success but the addresses
  *         are the same as before or 0 if new addresses were populated
  */
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *fmtl);
 
+int dpu_format_populate_plane_sizes(
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout);
+
 #endif /*_DPU_FORMATS_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9ee178a09a3b..a57853ac70b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,10 +674,16 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	/* validate framebuffer layout before commit */
-	ret = dpu_format_populate_layout(pstate->aspace,
-					 new_state->fb,
-					 &pstate->layout);
+	ret = dpu_format_populate_addrs(pstate->aspace,
+					new_state->fb,
+					&pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;

-- 
2.39.2


