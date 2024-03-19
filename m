Return-Path: <linux-arm-msm+bounces-14512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1487FE98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F036285361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B63D8003F;
	Tue, 19 Mar 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8D6Iu2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6280028
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854528; cv=none; b=Z3Ypachquo26eyytWHDkpNnCC9gMdIciIf+usTFy/+Ez185ZEr3M3hZAucNnb+5oopu6OFNHZFR+AegwogUOqLhkIEDDwFPAeqUVEWO+RD3Xp5j53Ue8Pv7SvU8I5nRfHp+d1cXx/buo6gQlkQbapKDB+vMHpTWmc2GEH2kk77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854528; c=relaxed/simple;
	bh=5iGDWVtriFGrB5YnokcGmSkKiWEPQN0KlqXQNhPq3c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbIvYQ4jRIq435zCRd1l27239KoUM+CLCTN15u23CdtS9sGYk+8HKzl/AFm7hEzO7uSOjNg7P9VIqtwyRbjGkE3SyvFcdmCk5Lgf0a0ASB1M2XatG6IuX6TS3gm0nXiIjoF3OJ1qvLWJjhUPN9f5vyoL34e+AODXdLIhUgVrU7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8D6Iu2m; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d46dd8b0b8so73608221fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854524; x=1711459324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHmAL+VTrYFRdG1FcBobe9u/j58wPncf3Wah26zHOAM=;
        b=p8D6Iu2mcwrEqv/HeX2/ljsEgsgR2JdG5sQhqAZslhmPDXJuff6x+SgS7zNpoSduYE
         Cf/ErNj2hprymbCSQ3x/PUqBmWdOrXMg818CvdV7CeF9z/DsjhCoerFf3K+M4FV6J7/i
         2Q6lO0f7KABRHDSn0N4y5u0YBkNf2xiapK6bKARZRopIUHxmAwyYXaQuV3/+BFr8SPWc
         ebVldiODnDEVCB9FoUfbuNOdvTZhXDPIHKucY08a4LF6yQMiG5DpmYNpAbU3jygjZzqr
         e3rcYvXCS43bVBn2zhvHcxCQez1OHjgZvvb0BydmVfrUQaSYKTPgiHfnN5lK39/0EgZ9
         Rxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854524; x=1711459324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHmAL+VTrYFRdG1FcBobe9u/j58wPncf3Wah26zHOAM=;
        b=MoP4F27grOMYASl2Hz5Ik1SHT2d7RGXyVr217ppV24divYPPboUOJOW/LJojKNS1/C
         9uG4Tp4liApvmBfQg0GjameBi98NjwmRkQwa1PqQVYoLf95XWBzkU+i2ss8cresdD65P
         1pOFFlU5/vjOJiUqAHH9+efbbiNtEgHjhNqADyee6cFfWDiimdPddCOZzOlCrWarQh63
         pMzDC3pnTzrpEw5CEVteUq7XeV3SJ5FFSj+0vFk7GQZzoWrq7IqjofiiHCURElDkULbI
         MRK3fM+okhBalJb+Y8bRJu1iho3x7E+CtS5s/2Fz/0qr8gQrT94y6+lfxffFXSe7oCpm
         aXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUawls3bdOD6G+4USXPCXuRv6QgvqCbR4uyHjaOHUTWbelkZjvSVTTM6ZpwDx48VERw9Vw2uAdcpmhr+8NDzliGjweyPaTK7jJLtF8vOQ==
X-Gm-Message-State: AOJu0YwHcIpOcC0QUFBGEq/Ej5Xf7Jm/t58xlgozvGVyPNO/YuigEsjy
	cy//xlcLxMa9KHZZoUdx0bN/H/NIECXhvvnVZb5ZxEQE1Ja8oiGR5zkX2rkfmgY=
X-Google-Smtp-Source: AGHT+IFJrrO9iCwa2B4OniI7eX4+Qc33bMbxiuNIkOLXZh953l6UtRT+SmZY8dLVbVdizonPb60jiA==
X-Received: by 2002:a2e:91cd:0:b0:2d4:24cc:b499 with SMTP id u13-20020a2e91cd000000b002d424ccb499mr10582469ljg.15.1710854524426;
        Tue, 19 Mar 2024 06:22:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:01 +0200
Subject: [PATCH 3/9] drm/msm/dpu: split dpu_format_populate_layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-3-d0fe6bf81bf1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6470;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5iGDWVtriFGrB5YnokcGmSkKiWEPQN0KlqXQNhPq3c4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3xkvqOmmR0Ns8RnYUEqsRoEOkXHwQGfaON
 conmC/oDB6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1aLHCACa9PuogW7mEukz9ZO7SbSgH/aZdnepACxkdM0oVbID9277heaXpKI/niF9fjPE8BPRTG7
 1iSdwYY8BMSbLorrPhKRA6nt9n0mB7FuBwajb0zt054baSSQMYo5CuPE+fLrNW1pbwiLWwBf6fd
 9/ptp+SsgcLJL/6a/wD9xRxYkMJWXuEhdaL5gZJ8fQipf1a/qo8mVgD3e3jHcdNSpACBTBkIjY9
 2RhJO9vE7Bnu5Mk3zqaeaCmVt6lEipUxDx1Dz50cseZSXbaXbrxVmulQ9DcKFXiwSGSZU/HN0el
 hgJeB6/Mz7Ox/Wgy095wKPg44Oam58QME4M3Bi37v1Xs1K0Q
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Split dpu_format_populate_layout() into addess-related and
pitch/format-related parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 44 +++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 12 ++++--
 4 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 1924a2b28e53..0fd85c0479ec 100644
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
index ff0df478c958..1fc9817278df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -629,7 +629,7 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
 	return color_fmt;
 }
 
-static int _dpu_format_get_plane_sizes_ubwc(
+static int _dpu_format_populate_plane_sizes_ubwc(
 		const struct dpu_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
@@ -708,7 +708,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	return 0;
 }
 
-static int _dpu_format_get_plane_sizes_linear(
+static int _dpu_format_populate_plane_sizes_linear(
 		const struct dpu_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
@@ -780,27 +780,37 @@ static int _dpu_format_get_plane_sizes_linear(
 	return 0;
 }
 
-static int dpu_format_get_plane_sizes(
-		const struct dpu_format *fmt,
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
+	struct dpu_format *fmt;
+
+	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
 
-	if ((w > DPU_MAX_IMG_WIDTH) || (h > DPU_MAX_IMG_HEIGHT)) {
+	if ((fb->width > DPU_MAX_IMG_WIDTH) || (fb->height > DPU_MAX_IMG_HEIGHT)) {
 		DRM_ERROR("image dimensions outside max range\n");
 		return -ERANGE;
 	}
 
+	fmt = to_dpu_format(msm_framebuffer_format(fb));
+
 	if (DPU_FORMAT_IS_UBWC(fmt) || DPU_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, w, h, layout);
+		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb->width, fb->height, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, w, h, layout, pitches);
+	return _dpu_format_populate_plane_sizes_linear(fmt, fb->width, fb->height,
+						       layout, fb->pitches);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -924,7 +934,7 @@ static int _dpu_format_populate_addrs_linear(
 	return 0;
 }
 
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -942,14 +952,6 @@ int dpu_format_populate_layout(
 		return -ERANGE;
 	}
 
-	layout->format = to_dpu_format(msm_framebuffer_format(fb));
-
-	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(layout->format, fb->width, fb->height,
-			layout, fb->pitches);
-	if (ret)
-		return ret;
-
 	/* Populate the addresses given the fb */
 	if (DPU_FORMAT_IS_UBWC(layout->format) ||
 			DPU_FORMAT_IS_TILE(layout->format))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 9442445f1a86..dc050e253db9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -56,7 +56,7 @@ const struct msm_format *dpu_get_msm_format(
 
 
 /**
- * dpu_format_populate_layout - populate the given format layout based on
+ * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
  * @aspace:            address space pointer
  * @fb:                framebuffer pointer
@@ -65,9 +65,13 @@ const struct msm_format *dpu_get_msm_format(
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
index 5b15d8068187..d9631fe90228 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -673,10 +673,16 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
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


