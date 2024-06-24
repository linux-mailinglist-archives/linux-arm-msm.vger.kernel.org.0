Return-Path: <linux-arm-msm+bounces-23987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 250909150E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57071F250BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FDB1A01BB;
	Mon, 24 Jun 2024 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8c7zaAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC913D2BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240445; cv=none; b=VhslpaTp437JIAWTtnIpN04uHoYn93AlABPuNXhptC4SAWvmP1ulUSQlf9N3TZImligYoJV7PBa6i9dke5/VXNuAnISAsTo1M+HcCA1EqKM5NcBsg7ohS2GSKoXBfCV8Oolnd4z3D8u0mX74rFgdSu0daC23rRgasIdHI5VzTk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240445; c=relaxed/simple;
	bh=zqoTIjqPYIYWXKg68mMznSRJO1h39pUrDrqziijLBcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mO+FmNtOPyTYVsBuDPzWG78bg2POv4BFiLXaTCsBqHTK0FK3/t8PzudhRSIgDuS/Ev0nwnNQ3jSeTI4TVDYFdPEFafN/bS3gdk2Y1KYupCUReVg2rb1Zj8KNUeCChFetajM3k7ZlR/w4BTWBlixGrMvMTy4ZTic4shgScUs0ejY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8c7zaAm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so2527466e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240441; x=1719845241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqnaJ5AjjFaixpPDS11Y462kVHejpQNyVm4rRV0MBdo=;
        b=q8c7zaAmJeHr192GgaWUCwvCDbpy/avjzfex3w+wvdwR7Q7FuDPWvj9uyu5jboFDnu
         tJVLXxWBLO9B+OXAXoh6jHXRH8cLw630oLXWh5P7z0Khtj917uGFyOWtf/2lzOR9rOHU
         wf1rBjh85FdVauwsaFh2HZnpVUpWnvQFCZtmxRtXERk6p4dafnf0JBtwzK90XJKOIzLO
         xTlQxBxVJNd4smJj3/8x8sj+P13tSzsW55pciIc2aS/SHprCTVlal3dD/rF6FV3TBM+z
         Rbto2CXaMDTo034uUuwdsSXpz0hL2EKzzHzPOQEQmnWx2uHk8P/LCqg+uJrn3hR7AnPn
         emyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240441; x=1719845241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqnaJ5AjjFaixpPDS11Y462kVHejpQNyVm4rRV0MBdo=;
        b=CF6ec4NhgC+FTd1B0AiAvfoXZlYEXhVQiq4W2e0UmuB8Hno3+Uw+ByA6kS1JNLvDa6
         45tEoh7Thn9ZZka6EeLgl835+DPaGTTgrO9/gdhrxglU7e6X0wOcUtMrx0xqydpYEn7w
         lFdUQRXAma1Jcc9Iflp0mk7CbrejvS+jWTbYe11qE6e82g/i4Yc6SWmGY2pP65AxpyRY
         9KrwH0YmiXhHY8XqTo0OoU5xIDZSBLdCTVTipD4oIuGxBYBrqzZ+SYxX1V+GksORTjZa
         kAv2rIW2EAMXrGulGYLS45Zb8LGSkYFOdIc7T/UXwF/Sxm4FSc3ZzXJkw7uY3S8t/guS
         GQhg==
X-Forwarded-Encrypted: i=1; AJvYcCWT3lmyDA/HpEYkbNnhXqkwWtnOibyiUXch6PU/5gdNwx9kZxzPxqown70+P7W+UXLDDj43p+eH44vT24drTnAf1LfZTQMhKvFC8uGO/A==
X-Gm-Message-State: AOJu0YwmdpEKrqTbyz1sQIzfdfdjbkzk+oKD34mJZtwVyKk8bHd9+Aew
	vtKm9Ke1dJN1cGH47EXseB9ludFRPm2DSfD+IW8gNywwOYkJrbkIPYH1xCpnI5Y=
X-Google-Smtp-Source: AGHT+IHfoaJv978Czlxz2gm9072BTwY+BS2IF2pnRlm1dcwmT8qxoPjG5rodOyD+ZLhqCUX5vkqwAQ==
X-Received: by 2002:ac2:4838:0:b0:52b:c27c:ea1f with SMTP id 2adb3069b0e04-52ce185faa8mr2458055e87.55.1719240441554;
        Mon, 24 Jun 2024 07:47:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:17 +0300
Subject: [PATCH v4 11/16] drm/msm/dpu: split dpu_format_populate_layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-11-1038c13da3a5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6392;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zqoTIjqPYIYWXKg68mMznSRJO1h39pUrDrqziijLBcc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwPdixzEzKzF2XAW2L0kXnE0sAJGbfHiPHa
 QAPnApaMB+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1WnLCACyXlV+KDnQNmk8XONoRWF2Rx7ZlX/sNe697OhldnXiCsXyB8Fkb8XR4EEQrPlSIz/ywED
 XV8MY/bXq0+QO4QMIAYudw4Gp4+kS97fmOTdXrimneXtpWcwYpv2A1x3e0em2vvj6ZEtNYZCqVa
 3fUR3xMIXhP4V1hJX+3GwqxaXP2z+HLz2hA9Zso2Vj9JDiibT52ek2CcGNXOLLGgBVd96YVUnwh
 Jp3gLcMXkKnd/pGSXwPa+g4K4mSay5zUHQzSJ46FILJ8lYb8DflqNxvW29hjcEGNyvmIgktDEm9
 i+bqWujYD/0bt737z3WKzaXYeXi8y4iPvnhowc7ay4lZ9Ghj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Split dpu_format_populate_layout() into addess-related and
pitch/format-related parts.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 32 +++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 15 ++++++++--
 4 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index acbba6d4e68c..d8e37400d852 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -584,7 +584,13 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
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
index 4d17eb88af40..abe3a1c0e409 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -93,7 +93,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 	return color_fmt;
 }
 
-static int _dpu_format_get_plane_sizes_ubwc(
+static int _dpu_format_populate_plane_sizes_ubwc(
 		const struct msm_format *fmt,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -170,7 +170,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	return 0;
 }
 
-static int _dpu_format_get_plane_sizes_linear(
+static int _dpu_format_populate_plane_sizes_linear(
 		const struct msm_format *fmt,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -244,12 +244,21 @@ static int _dpu_format_get_plane_sizes_linear(
 	return 0;
 }
 
-static int dpu_format_get_plane_sizes(
-		const struct msm_format *fmt,
+/*
+ * dpu_format_populate_addrs - populate non-address part of the layout based on
+ *                     fb, and format found in the fb
+ * @fb:                framebuffer pointer
+ * @layout:              format layout structure to populate
+ *
+ * Return: error code on failure or 0 if new addresses were populated
+ */
+int dpu_format_populate_plane_sizes(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	if (!layout || !fmt) {
+	const struct msm_format *fmt;
+
+	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
@@ -260,10 +269,12 @@ static int dpu_format_get_plane_sizes(
 		return -ERANGE;
 	}
 
+	fmt = msm_framebuffer_format(fb);
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, fb, layout);
+		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, fb, layout);
+	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -377,7 +388,7 @@ static int _dpu_format_populate_addrs_linear(
 	return 0;
 }
 
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -398,11 +409,6 @@ int dpu_format_populate_layout(
 
 	fmt = msm_framebuffer_format(fb);
 
-	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(fmt, fb, layout);
-	if (ret)
-		return ret;
-
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
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
index 241c2d7a218a..8191282b8819 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,10 +674,19 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		if (pstate->aspace)
+			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
+						pstate->needs_dirtyfb);
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
 		if (pstate->aspace)

-- 
2.39.2


