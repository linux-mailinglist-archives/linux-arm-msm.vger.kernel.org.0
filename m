Return-Path: <linux-arm-msm+bounces-23992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC09150E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 387D528611F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647641A01A8;
	Mon, 24 Jun 2024 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiTY3Cxw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD41A0707
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240448; cv=none; b=Tg+1r0tXHeUAq1qeP65UkThORrctV62i/wMi6XJxfukd/oUCmy/aez1Y5xVuYB8DjfXSnIcMAWqBBOF2Oh0f3NTpBGX5Zuuwd6v8m0fgJWO5siauBH7shaHbkj7BQIRVoYSrUbQbEJABUUlV0tfUCijuqTeWxjeDq05CqiVz02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240448; c=relaxed/simple;
	bh=N3YZKN6loeIt7zXSx7uKEpsl5ti+ONaIe5A6G3FjkBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/r8vcmrj4rcDIKCrKNYluu02eUM4nV92vZBb0CH+ntNHkWpodt2L7vdD+nJ7WbUvax2KXY/+9lHGhnjudm+2e5/dOAMSEwa+8oBtkI5lmA/3KHCK0Ks7Iuggz15dyQVdabI3XIMZOO1oBhwGTUmQ5I6AoJBIbiVx+Zl22ywzAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiTY3Cxw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso3112137e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240445; x=1719845245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
        b=YiTY3CxwWAag1MHojd17aWh8ic3vBtTU4M4QxwpR53FMrM8yv6Ds9RBBYp2thZ9M7c
         /cxRufI97Bhfm56VSVn1L9R7z511K6o03mobTfYqwhzJvlDMDqIx8GezSecynvs2m1lE
         z6eOdTBJPoqr44no39MbVCK/UulJbwkdfOGdRAbu5H4T0uiSN5lr4T+p9CKgIrxwcHQC
         r9ckeCPNG4crUqZ73iwky8ZaSFM+7XxIpjzrYKOJPAHIQ8bZFoTbSEd1M66oUNYt5/hA
         ZNt5oZIqgk0UK8H6M/S/4x8lQBh4ZX/UdrpcVtH2v17if58DuxvLpwj1mqz6JqmMVd8R
         5Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240445; x=1719845245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
        b=UGLAeRwpuv4WidMGGbQYlncdJpv3ReD6fWMZ6fD0bvD8l74DxbblqUhSNTN+w2rZ4S
         6b22ZuXDB7f9rcAPt827ePXG4IaRxjH+FguVarFmewzFmTinaNLrtnfl7pGf4AmNc48L
         7j8pMJ0JX/Bh+C6RpL0vSRWBxyyHs9lAJQfBTvKJ6fcxxdoyBMG7wjgEZJS75y6Fong/
         1U0/gm8lop9T0UfS5QYXwvIVMxOZOlAtSacOmufr4h+UDzFgb48GAfM7zcr9r6T45STM
         IpQ80cgrbITtnzi20ZHkX7MqhBTmGwr6ZzKz1gv4qSEpBmdrO4NEfmsyL/QDazth8UZJ
         V+uw==
X-Forwarded-Encrypted: i=1; AJvYcCUxSbgd3uL5yQjrsv/uI2hHlltDWrFHRlo31bciKI/TLVqZl7RUWq5roZgWcuENBJ6nP+w0mLItMQRlVHdH36i4uQCdZUUzzowlq6z7iQ==
X-Gm-Message-State: AOJu0Yw1e/c17Y28SI0daK3IG7TZ8qCira+b9IhwiOKQ5ujddOzykr/+
	0TotT6uIGbVHASWp8ibC1y9wAJVvzgtsAIalp/D9uVZJIBSsv7TMyZOdnMtRc+o=
X-Google-Smtp-Source: AGHT+IE2tq5O6bSrI55XWg6dyvThtBg2EX196a2jkj5KUfUF2VK4A2DrFZtJeJOGcRqTct6QoQtMVg==
X-Received: by 2002:a05:6512:3da5:b0:52c:e3bd:c70b with SMTP id 2adb3069b0e04-52ce3bdc788mr2974341e87.1.1719240444851;
        Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:22 +0300
Subject: [PATCH v4 16/16] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-16-1038c13da3a5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N3YZKN6loeIt7zXSx7uKEpsl5ti+ONaIe5A6G3FjkBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbxG1j08vEex/AL+/BKNEehGKP1/V7s07UNY
 2qFA6lUUwaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8QAKCRCLPIo+Aiko
 1cesB/9YdDl3hmZOd1LdElWwNw3tnumm7aoxG3qajMAgQoVZG9l5Af7/QSMFT5rJeg24+eT2xRR
 KwiOITmSJtgIX08d/mALiMq1UPSBaWRGRpT8Y+Lmtwd+lHH7HuDJbpLpQIkPjVswji7eNhr6Gyc
 f9qNh7lnuE+QWuockHzCMI3jGHfE7/TwlUq/G0gFzkREVIk6zILia3bs+obsGcVGsb+zogmvigQ
 JL5Ejw7z4DpQaBrXacCmVTY0UuFLgxxZzxTe61tuxhCuK1vZhs/d4/4KTGoU217byGDcQrKxxWQ
 f3WpUuRAT69uS7x/Z7Bs7Gvq78qbrbHJ2PTeeehDjzxL/aNw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
to the drm_crtc_helper_funcs::mode_valid() callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2a87dd7188b8..f4ec3df45536 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1235,6 +1235,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/*
+	 * max crtc width is equal to the max mixer width * 2 and max height is
+	 * is 4K
+	 */
+	return drm_mode_validate_size(mode,
+				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      4096);
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1450,6 +1464,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 40e4b829b9da..1c86f22859fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1191,13 +1191,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 
-	/*
-	 * max crtc width is equal to the max mixer width * 2 and max height is
-	 * is 4K
-	 */
-	dev->mode_config.max_width =
-			dpu_kms->catalog->caps->max_mixer_width * 2;
-	dev->mode_config.max_height = 4096;
+	dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
+	dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
 
 	dev->max_vblank_count = 0xffffffff;
 	/* Disable vblank irqs aggressively for power-saving */

-- 
2.39.2


