Return-Path: <linux-arm-msm+bounces-30448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4209691F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D9F1F2390E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6461CDA2F;
	Tue,  3 Sep 2024 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+9pLeAI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEBD1CDFDC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333785; cv=none; b=uZwbHUjYKeJrmFgAHpP2Z/bsXSDqx1V2o5OxYU7e+4kfu9fwQkYlzVHfPDlhj/pmQBbBE8wEm9zVsFTqan7pEfFAckxFKr1xGvVIt8Gxm/UbK+epAk9PuFopRyr0WPQ6k8qHPaj891X/hYQ62ODbL7rs64JOlnr6XF1h61b1/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333785; c=relaxed/simple;
	bh=y8DgJCrh+hdjgmNdEpxMNgSg4lRIgEqSrkB+B0sbClU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0xiIwqr1flrfnN6mrpxW4RR8wx5SKXOBDxCjoXk/DCuUHe4As1SDZITilL4awHA5FDJg4kn76BuD6N/3GacTTxiFUETtYmq2A99QoDfij4jTfqHyN+x5Em5MTVZ5/XgkWntukK5UsEL25PjAEJ4SHfJV0x0UjxcN/vLxjcjsug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+9pLeAI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f4f8742138so53852611fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333782; x=1725938582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlHosw42irjAE4eSpgL5tq+xOsmfq1L7o+p8smAZqg8=;
        b=B+9pLeAIxnRqREvXPX6tpTMZoeejX7Upr/bCBDsKIHIievjqhHjkNR96/1I/TF+q28
         8VC7nH6P4JYK1e8Edo7jo6dAF1B07kiBS8gNLFaP0T+81UXLFCF8FyGUUjIk0BDGfy9Q
         wmwkxqb1YuXwDTn+ZJbPqPlF5/aWpZLVQNM43nK2YluLHAYDA3DS0Z6VMCMEt5twHln5
         iqT0qmJSqvkTO41wpPt5xnYeBYoaSpqYHa4xRouGDRsirvHfQVDphHOesLpJ3EBeF+AA
         WTc6dsdb25nGHhC+aHzEpSp1nlInIMSyGyQOOtO57eRwM1ITSozz2O96sVI13e6IcEVe
         54iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333782; x=1725938582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlHosw42irjAE4eSpgL5tq+xOsmfq1L7o+p8smAZqg8=;
        b=rNu6v66XPOa3W3mYtqfOZr0PomHOdycdlRI+N9m122RuoJWzcgl6pAYL3X+auTqMSg
         qOnHY8hPq7wu+lv8XRaKAj3WWL8TbXfpJm7DcguxY1PjQm2yE5jrpkyhyZ7lXhAkDQfc
         mUW+cbQJrn68jLQdh8i/0sUFaUEsdKvYdXJpmf8vF7zyDj8TkOZjbbBtsegceiC9NbHo
         /RPO5Aw9ohFjBvWdKBH+8rTgSG3A7VZ8cnBhOKsL5n0anKcHhEA/4zWqn+aebrGN/mJC
         8RvLgkXR1mDQAhyOIxSyVxTDqym3vzvKS4rH8kHZRnk9sh+Y+q6qUgaLGUEhGPiCALWR
         I8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA7bzvpO6yt4OE/NrgwlEm1i1PKqqYhQdwX9HkDGy/ZhKZB0f2/HX5dHInI5zhKguZhnNgOGOp+tBHZpx9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5oEHyHn0+7JRyOLTT6WpRU4S6M5hCAnGdhKdZf8tnKNY75bE8
	+kEsQLpdk3MmJSb42MKQqF2HmS73yY7rQ0isCgR9vKLJs8NnGeZUdprw8aX7GyY=
X-Google-Smtp-Source: AGHT+IHVewIoZZ8n+zPcMtvkRlvtaleNA01F5L/r0rIdgnc1Z8JG7qzJyhoMRSVLWaabgJF8kPzmYQ==
X-Received: by 2002:a05:651c:551:b0:2f5:ce9:14df with SMTP id 38308e7fff4ca-2f6108a77ebmr110733631fa.40.1725333781342;
        Mon, 02 Sep 2024 20:23:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:53 +0300
Subject: [PATCH v6 10/15] drm/msm/dpu: split dpu_format_populate_layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-10-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6392;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y8DgJCrh+hdjgmNdEpxMNgSg4lRIgEqSrkB+B0sbClU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEMLVq9Y9+wRcd2UNeNzdRcTJPj97EXNA9Kb
 u1dkcHgsxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDAAKCRCLPIo+Aiko
 1WeuB/4pximPIk9C0is6iCXqSCjlezCGOdRpGU5uyFGOP68LIsG5ORmmmwX3DjvykNqQ2UuC6Qb
 e5hWuMLgVdJlI3MKGG9VuUlPFlBS1khwMz1YWspM9UpoQxgLL3cYezE3EHtDhG68kexaehni8Zr
 U+NKL85xWmVPGrKw3roH1+1ogxr6hEQZh9Leljd7ouqdpe5tOUc/20+GZ+FFlSThUE8XkRBkrqx
 1mzdkkYIuiK59WZRDsVi+ySesGA1hNBz4bJCyzP5lFA13hOyYBJGUW2N50f5cpzXaX8SsPl4O1C
 a8/GuQwEpn9R0rXT6OWxkgT5mvV3WYwRXh/AQ5S2MQDEjsRF
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
index c4a16a73bc97..ede926d30285 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -579,7 +579,13 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
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
index 93ac5afb623c..39ceb7b65318 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -675,10 +675,19 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
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


