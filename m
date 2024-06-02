Return-Path: <linux-arm-msm+bounces-21421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EC28D784D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A47D628149C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A4129411;
	Sun,  2 Jun 2024 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BF2K5T7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF012574D
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364396; cv=none; b=arEsWCsOAU//gTkLNywWtorOayKTn6L2zhTHUEdqMDFbkqU+ztUYWZP3cjDTl1WW8/1P5mADUN/0055nEnkn82u75h8GaDa9XzMynGMqjHwFSGYrXA1ZLNmTEw6J1kbweSBYhHdNhp8Cv0Miau4bdKeHTnnw/5nRfWCDk2iS9Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364396; c=relaxed/simple;
	bh=nHy/s501BKISDY/viUTlwbtLfmlHRF5tf45zr5mVRjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCpuTlAGAgmbaWOJ3/JsOfJ09KtjqJgwJIigIcWgIBN7FSlx8zFTrEl8vPfUimars9hiNUiRl3EkGqjyUPX+vP26WmwWoT/fo9WbCGre0pG6DP7kvkNbg6bCInAy1SnNcJ+/ajRM93Z1vFUXWp4G57kUEJJecO3YNjnAsH2zOqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BF2K5T7H; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b894021cbso2920140e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364392; x=1717969192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Axn0CffF4ZXu41BfYhRYHrbH241ZyeeHoXr5qagjCJ0=;
        b=BF2K5T7Hd9CNfnwhKGOyXEHlWm4+YvKSzhwsTUpbt7/HXnQuV+5sdTCs43L0F6cHeL
         X4PJYIwW08Hf89mZe3ougQhubAQU0dUyCS8oQ6pQcXRr51vceV17r+Te6+wOuGiS9LoN
         LAhFK+ooLH33/aNyye2MypKnIlFshFiIMoDeGFkfFJHrIn0Hr10KyDj3IILeAMLlyanv
         JcuC2H0HAF+YQ+0LGC6ii4GkGTNx+bLm0uZ+qpjw1tVZE1HNb77yjAM+IbcmbdPP7Xtp
         pncECtt4V3i/QqJMJ+Vmmm25QyDwVkfz4FaiS03an0GyZnBUdNhKAAhX4prRkQPoZL7Y
         BQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364392; x=1717969192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Axn0CffF4ZXu41BfYhRYHrbH241ZyeeHoXr5qagjCJ0=;
        b=i8sUsFB8l4fZLApF53To5fhcdrdPRVAG0+2yY6UNtn5uJsuc8leDF2jtb9zfGaYG4w
         PkUSnPNDp8pHPRHWkfwTzy44bFsrssJ2L8S2ZERI+vfVgLEAUQxW7tPVeJMK09L3KMmp
         8WIcwVWYPcM85FPRlRIHkD3i5mD9QCayo5vlSyiiFzLALGxjvxa4nzbhHfNk7ilyz3lF
         /G1VZZfmF3Ge34kctykconBibRb9rGoTcaioQgPk6AYGp0uU6YjjHp0LFhmEaDyikZV6
         qhObfiJHlSiHiAn4tFafpABtyb2zJIf9Q6KeLUE46ljDKA2gyAgr9IA/om+SNU9nnJ8/
         4HbA==
X-Forwarded-Encrypted: i=1; AJvYcCWwQKvSKqFWICCGeHRlU1LmrBVLkvd9l28n9FPpOTGWCmQdUd32X2RPhFNPHI8rQS6SNTWq2AI5CUqJhgEQ6izXzCE7ljJnHTFMpE/vIA==
X-Gm-Message-State: AOJu0Ywg7LwJi8Iw1o03T4P8Ot6gOnFcTsT2IcEvpdbhw1OaBVHvlbQx
	EAF3YgHEMVY5ETn/6yga0nyfq/UnoPTZb8oaT3/TbkLjBqwsb8j6gaXDYjfWWqraOjU8wTudT3V
	u
X-Google-Smtp-Source: AGHT+IFfReYRhO/HiJhMNiFndyCOAnoEs/0TBIkJ4a6aBxNSnQZ3JaNQvEPnqjZNZRCjA4ePM7CNwA==
X-Received: by 2002:a19:ca17:0:b0:528:649b:d7bb with SMTP id 2adb3069b0e04-52b8949e1a9mr4408779e87.0.1717364392118;
        Sun, 02 Jun 2024 14:39:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:47 +0300
Subject: [PATCH v2 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-1-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOakbZRQAWT1SrHe2d4rp3wBk6oRcDx5dtv92
 q7JRPvfocyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpAAKCRCLPIo+Aiko
 1T+5B/935Z6X8ffnw1vTDzVAMCOqiaH0eDbY03Q5LjZT49O5xZEuZe15kolZhjlB6mgWpF5PbR/
 CSI4fUcTPvN9h4v6TOkwldQJXXV+PcUBprbMFuMOD/9T3O5SL+aLJIKnw9mwGZmWIqXLcePiFyq
 0MFiprqUusppYPnWSB2aAJgbu6ExTjTBPxYWZq33Um+qKGl9ls32tW+HnA1EObepxmn67ef7Nzk
 wd6gM5mVXWbZwq/dNEOGSYHZ6bDF7bfNfRCHBSh6GQD1BbHGC9JSzo7puXZpNOLpMyyf2MtYEGV
 Eq4nfvxZo+KvOEQGdB5h03JDeX5Q3y5pU2n/ptJVmW7daxAh
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


