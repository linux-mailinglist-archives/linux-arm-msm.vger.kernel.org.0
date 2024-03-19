Return-Path: <linux-arm-msm+bounces-14510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219B87FE91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 815D91C21C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0061980025;
	Tue, 19 Mar 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7nmOh5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991A5A782
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854525; cv=none; b=nfNv9RzZgvpy3RK3IpY7u4A8zubg+vmYinLaXodMAU9Ex8d/N2djF6iUFYFkOX5yof7EACYOCbQ/odvUF57VuSyPezXt0Ka2ShM6WRzqnzCipZW1gaSb9hHMmRwPs0C80C7pfz/NMA7Fcby4SE1mdMfV/qy9wdJjFoDFmIll+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854525; c=relaxed/simple;
	bh=NmZ9EICiCbbTtUxJRhya/PBGKcbwZZCO3QzN71dugWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dShfaUnsH38HUA3cY/uMRS/sN93Anw3klg24cK7jfepXZXi0BnleDLlfPi4Ci0DhtSwFGskbBhJl2nyPEjSaNP5tfQ13y+gH2/M5eW6rvmCwqMH1JaHG2ID1ODkfWJMtuy0xC3wYSs8P3CKyHpOOqjWnsizJs78lqzMbVa4tFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7nmOh5S; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d24a727f78so64670171fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854522; x=1711459322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fNq+ljFUI7fcqD7OFiXNswdwfx8fClPGMRPkyoFRqo=;
        b=w7nmOh5S/Ks8tLIBW7UfPjOGFIlWuGbXPcRNdKvHY0A37MXqDZikATd45IM64utuVn
         KXJTXrWMsZ9y9fvEyzh8E7QGsuN8vt5HEPaaj6U/uokOUyKD/cDJAKYWzpzkTrsq0EUB
         eW05ypVpn+mSZBTlYAkMDqhfq9W4WAaWFOv6TnbGk8IntYSJ+Wx4p8raIxZw2/x01CbQ
         lh8WwmCtDD3cmYfP4ZTWaByFqTPqrZMPCzA07J2BF7wRuyQnOk5B20fKyzYkrQTlC5ux
         Ua8Fu5oVgY8ZXVLgKBfexzdGLSoyO5mk6hFYBYnPcLBkgBdutesEQ9cNcd9ZQHtgncCt
         62eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854522; x=1711459322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fNq+ljFUI7fcqD7OFiXNswdwfx8fClPGMRPkyoFRqo=;
        b=dvHrQ5ulB9tEwiqJcd5PL+3azJ6j+wH8STWClUsONc/PGEjfWjXayrKcG6lAcswuly
         IdOmY93tn31QtmE3ZKBxKm0AZagTQ3H7Kt1eKpYadR/oxl3J1TLhXGx4pX9okTyAo6Jy
         O45rWod29w4we5uZ3vXRlLtnwIGqnQLkNFcyR/NUnlYFzMa98iJtITSoxXGdfW7fm+vi
         upezb2IFjquEUJLsmSfhW3GadC/epW8lnA5PyMUPEQky6GG6TDzUpGgs8QOuj0D2LdSc
         eQdYvnVg81HwP2p+VUFXAVyd2uvlor7FWPRUdisZCjc2BYYaasJk0SOnn3pH4nRmmRJJ
         fbrw==
X-Forwarded-Encrypted: i=1; AJvYcCWIN4p+g2o/FlBTEelr/r3jN7uT0zj8Xuj5v3IuTu8XgEzcxYMH+NoAD6ajMdbLAcU4t+PZOdO5OsKBdhgQdvlY7CdgQz3XUFgnxBvyhQ==
X-Gm-Message-State: AOJu0YwKiIn8D/PGMJYENPedWppzIuDg8wcdcvlOAqJE57ALh0XmH/wP
	aBMQ2UEpB41XEwHl2IQ69Nt1G26byN4JwBDrp3sy6Nqr/sQpZZCV6jrjHFDKY/g=
X-Google-Smtp-Source: AGHT+IECaHeIQblFB/9SyDMHi/valk7FklMHNymPDDVkWfEGdE2IkDgDfuLPcEW+m6WpTHKUAEujxw==
X-Received: by 2002:a2e:7004:0:b0:2d4:93d3:11ab with SMTP id l4-20020a2e7004000000b002d493d311abmr6365302ljc.6.1710854522316;
        Tue, 19 Mar 2024 06:22:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:21:59 +0200
Subject: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4389;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NmZ9EICiCbbTtUxJRhya/PBGKcbwZZCO3QzN71dugWI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3TOFe2Gz3tn4gkOTJDpz5y1bhM28EHGZbH
 oezmXRP0ZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1RirB/wKPBpr/8QFMjPQ4Rnlfp7u0uSfs2gg71A/I9TIebeW7Q3gzrVNj0AsNj2nMNxZyF4x6fK
 M1+A3CFSjqpWZQHHLGYL06VAQKR/F7WYAkgVyO8fnM9/Z/hWjhcAJIWsoAXWu0ciRuHYafIkU/4
 UA5x0ICEEYUwxJCSaV31YxTLQrcyd7chk3/A4mYTs5MCzq+QMiwCqdyrBWCLuBTzrV9iKTJA17O
 9ymJklyBmfUXZGXVQNykhVwNzj4Ka/+nUR3eQmKu15aPbE1JgQloKjPv4mzlDPSWDCbv8jzXZpr
 Lx+jcdovA8ilQ4jn+29e4FMdV0Z5mrTgFT2bfDdmv4deiKpK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_kms_funcs::check_modified_format() callback is not used by the
driver. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
 drivers/gpu/drm/msm/msm_kms.h               |  5 ----
 4 files changed, 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index e366ab134249..ff0df478c958 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -960,51 +960,6 @@ int dpu_format_populate_layout(
 	return ret;
 }
 
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *msm_fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos)
-{
-	const struct drm_format_info *info;
-	const struct dpu_format *fmt;
-	struct dpu_hw_fmt_layout layout;
-	uint32_t bos_total_size = 0;
-	int ret, i;
-
-	if (!msm_fmt || !cmd || !bos) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	fmt = to_dpu_format(msm_fmt);
-	info = drm_format_info(fmt->base.pixel_format);
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
-
 const struct dpu_format *dpu_get_dpu_format_ext(
 		const uint32_t format,
 		const uint64_t modifier)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 84b8b3289f18..9442445f1a86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -54,21 +54,6 @@ const struct msm_format *dpu_get_msm_format(
 		const uint32_t format,
 		const uint64_t modifiers);
 
-/**
- * dpu_format_check_modified_format - validate format and buffers for
- *                   dpu non-standard, i.e. modified format
- * @kms:             kms driver
- * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
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
 
 /**
  * dpu_format_populate_layout - populate the given format layout based on
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a1f5d7c4ab91..7257ac4020d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -969,7 +969,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.complete_commit = dpu_kms_complete_commit,
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
-	.check_modified_format = dpu_format_check_modified_format,
 	.get_format      = dpu_get_msm_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 0641f6111b93..b794ed918b56 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -96,11 +96,6 @@ struct msm_kms_funcs {
 	const struct msm_format *(*get_format)(struct msm_kms *kms,
 					const uint32_t format,
 					const uint64_t modifiers);
-	/* do format checking on format modified through fb_cmd2 modifiers */
-	int (*check_modified_format)(const struct msm_kms *kms,
-			const struct msm_format *msm_fmt,
-			const struct drm_mode_fb_cmd2 *cmd,
-			struct drm_gem_object **bos);
 
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,

-- 
2.39.2


