Return-Path: <linux-arm-msm+bounces-21430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838048D7861
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C2A1C20CE6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7DA29411;
	Sun,  2 Jun 2024 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E44ik5dP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A37C086
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364401; cv=none; b=q6qBrOOV9rDSPgi2jcLyBOaPMfRqj5RntKxQkiTqzIxwBIl9eNyMrx7dhdh7AXoeDEtj9rQRwYdNxRcrHaSM+I3YgyMbkLvFjtH45gcXnZwC0IU4bJH++84orAr9PkQoj8aF2dUw1VBPNat8k2+BGTDeex3Ze4Hh0F4hN1jZ/Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364401; c=relaxed/simple;
	bh=jidBMydco/5DfITBWsZBXtE9R50V90I/Z1ZObhQMr4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVKFy2OidExdQmH+DybxXpLaW/g1g//CgqPavpBNz4+8sB31dPANCS3yjc23gDazIU5Zo5D/0eLsOxLU6XvR0mBE3MwTRMBYFGDd6OJ/HI6L1+kSuLt7z5texnbmnUhTkTRedFpgYtMSZWTEI/038+SRCI8i4BRLy7KrKzn5mL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E44ik5dP; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso3408191e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364398; x=1717969198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qp9FZ/KZqeOjUAWYJu0Xh72B89CvM0oCuzm0aVvXT1M=;
        b=E44ik5dPa9SGAMY7JDWCz5Mwdq84tgu2cZZY4yFipX2wlx2a/k55gxbpbhYEui+LjQ
         Vo1hM6hnNCxRLoIkjc5pGv7SmLHZ26Ts+MryKeJFY28OerNBNWA9vtgr/GRzSj3yPL1L
         NasYUK/fn5KfVLIyQntkY3XMcJaedy2sGsSrW5srCaRxjglTH6dJJTzwn0YlmFC+eDNn
         kdo6Va5wjfz5qaE6DAWV/OxP33Vhi6JFaexMeeWos0Rf3tgG4Zd6t/cTJjSOWWUippzC
         k2CBhfL1DJBllGNBmsG4E1B0dwigbnTmV7HI1YNa0300hX9FHAawC+FXxYnw5yVqKnKd
         I5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364398; x=1717969198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qp9FZ/KZqeOjUAWYJu0Xh72B89CvM0oCuzm0aVvXT1M=;
        b=Ad5GTo8zts/j57UgggeAl8keNFVXmg3DVCVi8RyFR95j7Crt+3Z0+daiXAQtACJv9E
         6WnTIGjRxlDI6dB5eBL+Qy2oVVt9sKVQ8nn8WYAsOeePUXQ+y6PQbWIZtWtaBlCkQjVX
         qtCbZpKNZKqPXRObsx16OH4B/koFcTPeC/ZXsHbV52VdIjbJ6f3SeM9IcLUYDR7OkMEC
         S3sTiBIuqK686En9Eoe7MJI1KNTQbLRikFv4pkYtsKKGSKIQuJdsbDiC6VIr5Wjc5861
         yb4EC92C5iUouKMoQOLOEV0HqtNOY5M2fzxh2tCJiNd2Fim6ekLxyP4sLm8NeRs1HGGO
         3Jtg==
X-Forwarded-Encrypted: i=1; AJvYcCVgweUp7sSTWPJoT0ZakVPVO1tC+9nwkPlng3ppbtrrh6idEfd3h8VwHEOoTLhIifnH3fG0mypo5Ifp57ZJE9q+qZ+g5xDLd9XXgVGiHQ==
X-Gm-Message-State: AOJu0Ywb9OymRSRyMmo1wMVy7DPfXWTvUhIwvzQEAwDcE2Rd+8rOqy+a
	nnWNbeQADkkL9GVI5LQL6RiGMNo5G34uY9n8jCdrDbzvXMdv7LeBxBaBNBH5XPvVhQL9S9nHKM4
	5
X-Google-Smtp-Source: AGHT+IEAwm0w8+Z8Ipt9kYIObuKscTEAB+n6TxakwofZucyV59zCcLs50ECCLJ2Qdyb4B8ImhnL9MA==
X-Received: by 2002:ac2:5059:0:b0:51f:5760:dd34 with SMTP id 2adb3069b0e04-52b896c210emr4440368e87.55.1717364397772;
        Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:55 +0300
Subject: [PATCH v2 9/9] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-9-16af520575a6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jidBMydco/5DfITBWsZBXtE9R50V90I/Z1ZObhQMr4Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOam196bo+wcCbur0w0TxnWzapo7bLGi8eHyh
 1s1b/+FagWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpgAKCRCLPIo+Aiko
 1QGsB/4jqxWpfJt2CtymybHgjeXtamR2wwkPVI7lUOVx/6tFVCh/kFSjNQIvSNTrSAjGc9raLAY
 UzV2uXTJfHj47KMauiF0MIRILFtI+NYgJI20prq1qL8LRbIg8objny7nkKq4yaOGSkg4uBJWhyA
 dh8N6h6TgMhkjfn6RDK35RDnSB11cx8scH66TxthrzPUZp+UDcXGV6pffQ2L3Sc9+iVH1k90Yip
 sdavL0VRZ0jggtaQLBIJ9D4b9qUQkAwMAjKxYVlXFLjYQI6XKd7DEeQ0nr21OmHY91VdzCeCfBM
 LBuZ5quRWDiK7bjYJR/KO0Rt5YKuICjTSHHzbBU1drr9ANYC
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
index c5e874a3656a..8cf063e4c09d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1236,6 +1236,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+					 const struct drm_display_mode *mode)
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


