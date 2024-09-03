Return-Path: <linux-arm-msm+bounces-30442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F376E9691EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762BF1F23418
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF021CDFC8;
	Tue,  3 Sep 2024 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmopXcYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1031A4E6B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333781; cv=none; b=C+27dOBWFdBB4KksnSvkeujl2B0Np2VmFHWXhX2wfa/VFU1YQIDj//zfFwcEwx+Ac2senDXnaXCF8Nsrcy99pwijVqdJY8fVwrrokM2jZwFDXj19yvEMcFi5Tp9F2KNKKvQgxBJejFdGBcmgzYWnVJZFoFXdm1NZppB4ILnl2xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333781; c=relaxed/simple;
	bh=3r29oRaw22hTRdemyvT0BFMQ814IpSnij8irLxE78YM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yfc0y6oNFPG2Th/FivMWrfOPzKUNlGV5aC3nICUo1PD/cqvPnOPPgqzxCTTfZ6L4Tds6WDbHE3MfufywH9jKwBoNj+RGKg5spcljdj8BQ/Jb5SjlZNre5rnB0QkEWQ0OUfnaxbJXAezyYc1CzXOv1Z9m4u1tp3Dv0o2P7QlNgNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmopXcYM; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3f0bdbcd9so56435891fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333777; x=1725938577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0b2tP8OogQhAD1iHDJFAy53Wy0WW52N9JDrZmCScDm0=;
        b=gmopXcYMbouMsQ4nacE6MfQvsCIdl3RWJgW/8W4apoBgzI1s2DNz5KliHBW/4/qNnn
         0U4um4FlHccsl+EplmqEeT0yJbVEE7vYXKuHW0T8vXdgiXfjwtSa/ZPdbkIQ1R4lFT1K
         pDjfcKH9LcbzZNkdiYLpEigEh6MrF9iscPf3wfRzDHnlp136ngoG+eQK7PzB7Dnce2F6
         cddeN9JQQaGGb5jC5yyoRMQFzcdA6OD5Q3HUTfWRk1BnP1whKEKUaNpWQI7xHgiQblMr
         tKArqoZOXvCJSA6wbC98b+2CoqA4gTPVkch1Kf48FCF4CSB0Z/vWN82C/TzOW/B/BY0f
         QH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333777; x=1725938577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b2tP8OogQhAD1iHDJFAy53Wy0WW52N9JDrZmCScDm0=;
        b=TAgpRZ9Dc+qnRA4cCo4TinEbTwcAi+mHtVAkCw5bgiJl/giPxkdSlGTGcOefjTI4zq
         lRv4g2Gnp9oklq6yPcxQNO+72wb39WiEXe6yYgtg5O+LLEdsEkFWUKquPCZ1NsuegpM7
         +DpjZrljDoX2ZhPzCBwEh0gM2wXrZtO3vzD0bqXLERuo73VZS6ry+zg28HtB3omb26Cg
         DQ6Zam3/sEboeMshMROO2FhoHGWnyKbRpH1uXULzRBCzgwZNht6koX6VamY1qi8V4JHy
         zsTGFu8QoZynOrXQWaOUNbMLJRoHScpEQ8R+LtR126aR0iriPXxi/M/GpshujhaaJXtq
         VWRg==
X-Forwarded-Encrypted: i=1; AJvYcCWIFdLwrMCMD4M9XcCHj+cVTQxYg8e6T30Jrc4X7ms4kelM3o87bOZ4iNRcoRyF/W3qfNT+x8QWrIUeqP1P@vger.kernel.org
X-Gm-Message-State: AOJu0YyBamYqavn760b2mt3YyBEamq4G9Lm7bYq3TLFa4FMq0IkG05WP
	4JpdUm2fUqPsBPNC9p7bWMyUFvCUN9E+IXZrpC8JqH4G5LPMd4sz3lufWow6W24=
X-Google-Smtp-Source: AGHT+IF609hyxGru/0DwXLOm+aBppJnb/2O5mseMolEQbXXJ+G32pmFtPFZsBHipYB4ednMd14J6qQ==
X-Received: by 2002:a2e:5109:0:b0:2ec:637a:c212 with SMTP id 38308e7fff4ca-2f636a7ff93mr27956781fa.39.1725333776413;
        Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:47 +0300
Subject: [PATCH v6 04/15] drm/msm/dpu: drop
 dpu_format_check_modified_format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-4-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3r29oRaw22hTRdemyvT0BFMQ814IpSnij8irLxE78YM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oELa+Mg47GRvTWkAKtgMV38RWmxyBsMCzKBK
 /uRDH6xsNiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1VdgB/4y/saMcEJda+LUaovBSmDs9uEcuONDbHzpCSddpYxDPDcMDx1ckgRSXn9YalM2yWPnC5b
 MoNA6niJb/VDoSJ6cT2winkIM3u5OALdEtNMVx6TE3oNQMXS++o04dQ82koqh12Qku/U51VS6AG
 cjwzCeFCqEztLKeemIMH6Gf2dHpQYX8SzN70YQaknfa4dvo8vnp3FcN/JMIhJklLVtTkPDA3Cmv
 dfE/UjooXvnUS2e+rIh0KWyZUUSDLB7QnCUe0u1VfJR//8vyq+W4kxKaWHnro6W/CiPUwawEn/T
 TpvbsT/15GAr6n5+YHEzXQtDXEwcyL+uXK3qxAOyPG8pcaG2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_kms_funcs::check_modified_format() callback is not used by the
driver. Drop it completely.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
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
index 9bcae53c4f45..daa42f289d2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1025,7 +1025,6 @@ static const struct msm_kms_funcs kms_funcs = {
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


