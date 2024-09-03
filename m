Return-Path: <linux-arm-msm+bounces-30453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9009691FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA381F22AE6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E6C1CDFAF;
	Tue,  3 Sep 2024 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMCxVmh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA431CDFAA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333788; cv=none; b=bLxCF2UiQs0x3RLxLVU9cnklgQ+h9yRBUIGnujDIQ87NtbRth7fuqlJoIoJ7fXCU57JX6DkGGVq+St2cY+1AQ0ifD6oa0twT/dG0kPmYR7BDn+2S6EBRGOpmFkXPlqxdLeDVLfdtRO72BrBAxvWS6DqO7oG6874j2tZDAom2a60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333788; c=relaxed/simple;
	bh=UDjBz+OwSb+7oXTheaAi3fvbBJbmIDiMCaat2ECDIjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIag8I3gEw4+Jdk/aalRdmv0JyvL0j6BqcSIQVfzkh+Ac5JJa8iWXDa1lGwU7VwIRTYoj5h8WLK6JAbKyMe5bctBMQnp3ei6vhwnnDe9j+P8CDhA9LWY4tr//L+r0yZp5P1tuALJwG57aYG1V9BxZkE21F6rrWPtVDhPcDBQSZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMCxVmh9; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f50f1d864fso55370581fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333785; x=1725938585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdplmJxptUI5vC4a8O6uUv9gCPQGqO+K3YZJZ67p41c=;
        b=bMCxVmh9MgSnrdnIfhZgVPWTsUbM8Sc3B69Wv1ycgDM+bQZOSlX2fnRulBV+VPUTXh
         O1whAszAQd56QMyBkwRyVTekmHOd/K3PUs+FuDsavUfc5dZCSfO7fEm7ryK1IBvARs5L
         nQmMyLRq9KYt3EADWUOyRvykw13FP8O7LblgQFSxLZTlP9L6jcvhNHRwK5Td/FrwdWrH
         D9NA6JuhmS98uVyg94pxkYY0/ft+EFO/XcUaxZRfusLROolHbXYfwsTJuaJ98VOdZcmX
         aXzfdugppzJVl/KUB9yTNWP3WyEgAN56WDZCZmKs6vJrUyYPWZDdCJDyMW9NyTuke5Od
         3JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333785; x=1725938585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdplmJxptUI5vC4a8O6uUv9gCPQGqO+K3YZJZ67p41c=;
        b=LNN5/PQwWhlzWPqaFWd8jQ07UdzVCHXS4yXKH8YSOVPfJ1+aHag+zkpb7YBLNGXWAi
         h0soGOHodeQUd1te0bz9PLUXqpJgmOBlQWUI2/FC+EKsyDyiVlM6Zhyok/aTMEGc6BZq
         ILHlikFPwI9VkMC8q1+eCtL2YaQFujn3SHO0Se5rUl+RdByN9jVQU8op6KIdgg2Di9ZV
         Tt4GYR+9ZQtUK6jHKyANBnGVPTfKDuOI6qDOO8ZSTZZNo8QwWhdendr0Vi732V+4eNk3
         o/zfwnPxCMAzU3TmnEnzLSv4F5qfUK4BnUoO5bDQpxk6ccl362kSmR6MHq07jAcFBK43
         TKeA==
X-Forwarded-Encrypted: i=1; AJvYcCVpvd/+7amHBk0q1TVeEBsOYyZ2+i27aLLGSQ2dNSgev6iovmXYqPjhmi407jJG5LhwjB/LZOVq8VMrkmEa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyk1mQb6r7uqa4UA9FI6Km8ZA4xVjAtvXttYh5DdHEJLXUBJdF
	qXu34x0ZQ76AgyQFCjLZYa3VKzzdogWfMGsW3iDlInVXWFWvtZp7T3PW0/BzbZk=
X-Google-Smtp-Source: AGHT+IEOgwK1uzPezT8AfH6qRHEtNuFp5jh6ed6Oxbz/+Ff0gSLazpkDyq2/79FYkyfQ5VYW0A6ORA==
X-Received: by 2002:a2e:a54f:0:b0:2f3:f068:b107 with SMTP id 38308e7fff4ca-2f62dc25bfbmr60611641fa.40.1725333784770;
        Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:58 +0300
Subject: [PATCH v6 15/15] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-15-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UDjBz+OwSb+7oXTheaAi3fvbBJbmIDiMCaat2ECDIjs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oENYwMah92zPW3oip3MLKiZnIUYlUa1xd+3t
 /kh6S7kh0+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDQAKCRCLPIo+Aiko
 1cilCACqQ65UqNGu66yj8Yc5UtNC4Bxr5eciWwcxSeEPiNBcvfgPl6Z/KH0YARNLuYG3fmD6KlW
 wAgWGaQj30qYfW9QlswHwi6fZuKIeEgyPlAbh7EdYng5U/RtXh8CkZ/7ypJrA74SNcxeRNsNYBD
 Dm/6c+To2HvdKqwrSFjmIipYV/BP8MBa+yEMBqk8QQ1mD3Ypydo8qVht1lu0f6/usIxo3fUjG7K
 TBvASFRwvgP8id0dUeerPnDPOqcbHiMYimEjrv9Iyd9EOvGWSPw9WD83HflHZURv12dXgSw2EOr
 DwIf1EXXOTm29dCsQcc7HoniYrAM2OIIPzCfygu5IhQn1TME
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
to the drm_crtc_helper_funcs::mode_valid() callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index db6c57900781..58595dcc3889 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1230,6 +1230,19 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/*
+	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
+	 */
+	return drm_mode_validate_size(mode,
+				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      4096);
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1445,6 +1458,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index daa42f289d2e..7083baf7d5ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1201,13 +1201,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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


