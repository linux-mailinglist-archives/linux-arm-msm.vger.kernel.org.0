Return-Path: <linux-arm-msm+bounces-22647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91484907F03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 946241C221BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610AE15534F;
	Thu, 13 Jun 2024 22:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CykZTJYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772B14D71E
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318189; cv=none; b=Y/9MNpohNT3V5KJeta/XcnbVAoU/LRZPA+kJNXUn1ckZeLMu1iCCfe0KToQlArojW8JXjwoKhQyuxfUhj6dI1UHmBVyAtFIQiC21eBCNTfw1nI4eAOTu4PzAsQndh1CeyQJkCCaQEAa7Wx+euQ87jKCo6SIqE40nhBclSJRcy3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318189; c=relaxed/simple;
	bh=nHy/s501BKISDY/viUTlwbtLfmlHRF5tf45zr5mVRjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HX+HHvEnpsyRymGTSAlvtL3swNCcFIuvmwI0rvUG+i6QGBxBiS+RC2x7Y2juxvhiKoFxlXkCjcWJHqdyma3Cs2E8GOXTtA5mM/0pff77tK2qbd221wG0mf9k0Mo2ae7XK4xKhfFc3nsT13CJqA4Hgs8tQ0cAzgsegTpIQvoyY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CykZTJYs; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso15501841fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318185; x=1718922985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Axn0CffF4ZXu41BfYhRYHrbH241ZyeeHoXr5qagjCJ0=;
        b=CykZTJYs3Rlvg2A3SAxluiwmphzWpsH/IqrnqYIQ+gpzY3LVM3EFxgXzWdZ89VUmO2
         RmwtE17n7BOgwPcD54WRasAP+hR6xMIK8566veHD9u0bmKgizFhqq1B/48V5QvXo4i7+
         Z4L3GB70fBBy3Owj5/3e6w5BhNqNcJxwQ07DTPmPjNBhL9dDhmVbmTZS7w/++/CEvrzW
         7Vjuw/2JfT/M+8kCu12oyGOMDA8IwEH6cK+dvuFV0pggUZNWSUXHza1DeCjivCskm7Cg
         0t10jXjRoSWQdzc4e6LeE94l08FNpNvJVrwjtN24Rcsd/5m+ffE3Wvd0+GMjbMD3Jutt
         lQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318185; x=1718922985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Axn0CffF4ZXu41BfYhRYHrbH241ZyeeHoXr5qagjCJ0=;
        b=C3K0lZnle3k6uwhbeRHA+4cRw2AXDO5q6564sLvO7/hWEtIWtvVq/6Fy5zeSKTcD9A
         GDZof5QOhUfoqd+cxBZhZg1ulodsoQi4ObriYktduq7ZBAzqaOCYmrl0xqlfOghvIFLm
         22NhBrFMTmIJcgS4kW4uO8GwNUZcDt1iRoXLJOq9eJ/u2zaznkdbGQ4O9aSTVEDJlKWF
         NxSMXkBjWwRW9BjBaCZk0iTJtRv0JIVi0oXwVGIYfpICpdDVPnCh9Xuy619TtLMu0F5p
         AitLGUQeJvySwO81UNxebP8m/uWUmQal1+MYZc78SP8KCiU9UTb+MAKDUfWHQ94PepYw
         SEUA==
X-Forwarded-Encrypted: i=1; AJvYcCXDw364T2d3Slktayq7M6mCMQtec+hyJBlJ9t9gaFY0grlIv9zFTwNKDTTM2Ggt98feRCunaqOlJmOIr1qts/nXhYUjYplx0XiOydLePQ==
X-Gm-Message-State: AOJu0Yz6hE9s4hd/XiCn7KFsEpCQ5B0y126KF0ajsYcfXT5eAEwryINW
	RBMTJN+sgKqxm2YElxarhzwd5W9jUdTLzrap+DOxw+vs+wVt1kG2OMpgFaxAkA8=
X-Google-Smtp-Source: AGHT+IHCGXVz8lmVwtJZmyRAiRUNsUm7GaCgW5618J6o8Zn/pXZpXzZ1TjoxBsWQRycODYBBi47/xw==
X-Received: by 2002:a2e:9616:0:b0:2eb:e9cf:e179 with SMTP id 38308e7fff4ca-2ec0e5c6d69mr6125901fa.21.1718318185457;
        Thu, 13 Jun 2024 15:36:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:03 +0300
Subject: [PATCH v3 2/9] drm/msm/dpu: drop dpu_format_check_modified_format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-2-29ec4069c99b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4184;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nHy/s501BKISDY/viUTlwbtLfmlHRF5tf45zr5mVRjI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2SeoUzS7VA35Cp89zJVTt+ZD8z7O1juXDftnApI/bX
 eW++md2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiHvrs/ysj3u5LEqiNfz+x
 iuOSbs72sOTtluXJK68G7ujcyZx/+8Xsvtdhyvuvb+a5UqX9fv3zfhvX4EVtzu+U7DVqoq6kfZJ
 hv290TN5dxPWNo3n3fi2t+QXc96NPPt2/Psxd9tJCr0MZy9dcOrRBeum7r5Mqn1lVutd5SqXfL2
 J6/fdb4esIFW43rve1LewT6+VnHj7QdXGWWvU0Wz3VWr0L9r4ZdRc0N8m9Sv3q0qUho/B+nUHc4
 w6W70r3ttTv/j5/hgj3/rd8Yc33yiWTbu53cK842srBc9Fjy14293Kx+u/+z95KeJ28d3Jdfb7Q
 yQ8ShgE8Ly+2y8g9/8lrvkbqZ9w5L9GijkPdaodbxSITAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_kms_funcs::check_modified_format() callback is not used by the
driver. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 43 -----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 16 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
 drivers/gpu/drm/msm/msm_kms.h               |  6 ----
 4 files changed, 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 6b1e9a617da3..027eb5ecff08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -423,46 +423,3 @@ int dpu_format_populate_layout(
 
 	return ret;
 }
-
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos)
-{
-	const struct drm_format_info *info;
-	struct dpu_hw_fmt_layout layout;
-	uint32_t bos_total_size = 0;
-	int ret, i;
-
-	if (!fmt || !cmd || !bos) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	info = drm_format_info(fmt->pixel_format);
-	if (!info)
-		return -EINVAL;
-
-	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
-			&layout, cmd->pitches);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < info->num_planes; i++) {
-		if (!bos[i]) {
-			DRM_ERROR("invalid handle for plane %d\n", i);
-			return -EINVAL;
-		}
-		if ((i == 0) || (bos[i] != bos[0]))
-			bos_total_size += bos[i]->size;
-	}
-
-	if (bos_total_size < layout.total_size) {
-		DRM_ERROR("buffers total size too small %u expected %u\n",
-				bos_total_size, layout.total_size);
-		return -EINVAL;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 210d0ed5f0af..ef1239c95058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,22 +31,6 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-/**
- * dpu_format_check_modified_format - validate format and buffers for
- *                   dpu non-standard, i.e. modified format
- * @kms:             kms driver
- * @msm_fmt:         pointer to the msm_fmt base pointer of an msm_format
- * @cmd:             fb_cmd2 structure user request
- * @bos:             gem buffer object list
- *
- * Return: error code on failure, 0 on success
- */
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *msm_fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos);
-
 /**
  * dpu_format_populate_layout - populate the given format layout based on
  *                     mmu, fb, and format found in the fb
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b78..0d1dcc94455c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -981,7 +981,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.complete_commit = dpu_kms_complete_commit,
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
-	.check_modified_format = dpu_format_check_modified_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1e0c54de3716..e60162744c66 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -92,12 +92,6 @@ struct msm_kms_funcs {
 	 * Format handling:
 	 */
 
-	/* do format checking on format modified through fb_cmd2 modifiers */
-	int (*check_modified_format)(const struct msm_kms *kms,
-			const struct msm_format *msm_fmt,
-			const struct drm_mode_fb_cmd2 *cmd,
-			struct drm_gem_object **bos);
-
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
 			struct drm_encoder *encoder);

-- 
2.39.2


