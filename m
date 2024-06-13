Return-Path: <linux-arm-msm+bounces-22655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC5907F0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D9671C21EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCAD14D45E;
	Thu, 13 Jun 2024 22:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xI8L3mIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90B6155CA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318194; cv=none; b=hpckOC8wG37Libq4cVdIYzXKf827qXYp4p+UApuf4j8ZhESCP7KggrEkaVG+XFJy3wInik43Ivqxejd/vGDjR0NAXz7EykrUsxvYstl38VxWlXQXsC39gPkWMyibAi7RfhoAm0riSt98ETEHa3zpbSKfGtwj/2OSZf2Oc4h+6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318194; c=relaxed/simple;
	bh=2Gk0OMDHQiW3uhDmJLEQ/urAc6vwlA6k4JGigLg8AG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZfM7OzWGOvF0CbdkGgwW2X692jXmcbdLlD9kwo/ulqfMDzprbzhOIIHpX3sABoPJr4pzQZn1LQzfiQ2dV4Wu84uvFgX5eunpE/LncYFxxoYg41BxvgMNxBDP9hm08j/7ZhJ/KUX3UPdnjeVaxwXHaHpdZZbLFn6Dm7p4Sv6OTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xI8L3mIw; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eadaac1d28so14656441fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318191; x=1718922991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY4Fdj8LBem1j0JhiZYvE2hhGJdtm9/4wNp5qRC1HxM=;
        b=xI8L3mIwPb1eAnnBOqxTLCG9J36q7b83pYk+PE9ftVRlR6ggxK0vLJSjzT699STiyh
         YRMSwjHnXr82yfMpZLSvf7b0e/JoyZ/28+XXLS8Rw3M2hQ1vbnTwXZuiTStLatPDJjnY
         Vmip7fuCN96TaY14M8V1HCXT3kuCI1wTx2QzrOX9fdODwTG5NW2MWUmfp9Kqfpj7+5Ik
         Udgi9P0Asxv3ljJYCVLBkdAu+/tHGbCFvAfcGykyVUWvjLv9mN4uCyekhjEmw4GB8C63
         3Am2o4r5jt78AtMRR8WgxfcXRFZSXN6Bbv77LFybrj+tF8Zynl9qdLYXpHt1xJvLzzhv
         v19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318191; x=1718922991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bY4Fdj8LBem1j0JhiZYvE2hhGJdtm9/4wNp5qRC1HxM=;
        b=FZ+OkdgzRRNadd6psG5k0V42xL4itnVn5dH9AeSrb/CkrZw6WzAYlU6ZUqJGb5urbE
         0MXWhIjoIwQU4HnHoo80ux05nnAdkzGzJhVV9t1i4jsO2wSqk7XgXLMvN4YFzo8+mGow
         n6F4yWCIsVQtIyIXYk6aVFV9lBhvqPXguKByDtrUreqG5f6Q6wxFmRfHkHjZtLpq3pft
         vnuPMJTiSG3u0+hctuOnOSuAAaLS5eahcYXL0xchuExhlYlUKD0hZE+j/FzjPyq2CmTa
         9Y6c5IMOW+n3REfXxC5Iv3//QBx3Qk1R1SLt7vPFmJe9LM7i4kltT4Rc/ZX/wD45Kdb3
         s1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZG9nIr6PmE8cNi1TdOeYqA7zflsGcGa7nOo38wzGtuF9zn/fPygVgnPOErZIlwVnnjNUT1Se1NOpwGaTCu7uzDMeNVZymQ3aEbS/Ug==
X-Gm-Message-State: AOJu0YxGdjVd2Eg0mnvmBxTMoy2bj9gckzD0qBqzd01Zcjby114qa/Un
	jDAvgeP92wrYoIlXvQ2YoiJ+l+bMi0FqE518e7WYKbDNG6x5Iq5tuF17b7futL0=
X-Google-Smtp-Source: AGHT+IG2py+4H7jt37FBEfwRxv0sXfQYiHwnRpgTcq1yNZuakide7ZoahBL0t1WvLFAHnD4eErzECQ==
X-Received: by 2002:a2e:7205:0:b0:2ea:e4e6:f227 with SMTP id 38308e7fff4ca-2ec0e59e337mr7131841fa.35.1718318190997;
        Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:10 +0300
Subject: [PATCH v3 9/9] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-9-29ec4069c99b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2Gk0OMDHQiW3uhDmJLEQ/urAc6vwlA6k4JGigLg8AG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RnU2cAhfsW0kpryawy2or81SC35WoohLjIt
 OyEwH+9gv+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZwAKCRCLPIo+Aiko
 1ZnjB/4mC7hCuKEZDzh+Akh97KN/xGwFn6VRH1/8fEb7ME9Y1HkeGiQk2DERDy1KHd4U6y2tDbe
 uEsPl+1gbs+TMxEFC9VPMmap6BB7ir92uClFDSh9efVmtApZRu/ztJUf6edgFlLcxtLpmc1vqfs
 7dtsXPS3y8sqe5OQAJd4vo5Qns+dt3AvQs+0rDSq4KRvgl6i4acI+qVIlVgwm8hNtxHf8fYvrH+
 Ea3jF8umIA7E9euQjr3PRctyD5yUSBsQcDyTf9FJ2qtd+Bqx8mZVy0zf9D3ib9nJqNqtUSZaBPB
 3flRryxais5gC4QhHT2GDAhp8qCASqoUNwR2VUsoi252bou3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
to the drm_crtc_helper_funcs::mode_valid() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5dbf5254d310..44531666edf2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1236,6 +1236,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -1451,6 +1465,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0d1dcc94455c..d1b937e127b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1147,13 +1147,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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


