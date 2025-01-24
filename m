Return-Path: <linux-arm-msm+bounces-46078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03010A1B48F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6A911650D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B60A21CA01;
	Fri, 24 Jan 2025 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f64vMJOJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889BD21C9EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717287; cv=none; b=UJAXZRbVCI2ZcLdgO9+8BTM4REXRILUj9rN2YMVgHaiT/RvLnJ9FszAnxXtIFVnFn7WDvP7yeTXae7CsAVlLDb9gj95bXTkVC3x+6YgKUhUxdEmjNyzz9wJGrZYXJhSWSpIzyIex5py83HcGa5KPexKHz4hAMcokE+qxX1oQumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717287; c=relaxed/simple;
	bh=STSqFPRboB3sQ4e2j7TOcKj/UooNkL+QUHC/wJG4nEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syNNuQvZIr88+VMXMQaRN9nn1tza1cmu3E3QGJKUeKTNOhamEheYXJCiBUniL+mqFpe7imobReZzjq1BuVMWfuBFhboOdYoNyaujwVQ1w9/4Cf48GQVHiw2H9lm0ctrkdPDmzp1SBJVZ7G8DDi3IE//+QFW+/jpbvJvVnb7rnkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f64vMJOJ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30616d71bb0so20958591fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717282; x=1738322082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqZJP4iufIhevyvAoHW7Eu6OisyxKDYbF5HtjUMC78k=;
        b=f64vMJOJenUgonIf6YHmkafetXnnjP5F7VDzrw/BxpVbhVq9SSolu3R0z1j3Bvh3sp
         36BJfdGGuRzcoDtRitp4sbkCVZ7p5+6Ti6woo43ipfKnDafinDPOawoKHvt/tCG51BsF
         E7DKMrZDfE7xhQYq/BkI0bWanCj4pFRe+wmjf0SccwS8btcJiv4R981hAV9K+zFObv5n
         ipKyCrrNxH7hLWSqBjmT8RFFOXAwA4HmFM9V7Mu07ldtZ5U82JPYAaHI8MQMW7hmSyLZ
         tnjEPBUgOP6alm32eXwCoMWLt+YuAvYXxKUKq79CbcxPcnDQmy8poHQrvpREVtTvPRx0
         1g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717282; x=1738322082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqZJP4iufIhevyvAoHW7Eu6OisyxKDYbF5HtjUMC78k=;
        b=gkaWon+c4uj2wN8VPJwp8n3eZsgSAWTT/dV0IsAY83qx4g/IquHV4hiufETZ1pHWId
         VpH/p40U8YmTpGYDdUzpPQQRNbHldevopwGPOCU1OdQSsdYoVRRl/WzVrUTv9TmQQzZP
         OEKsGwyTC9bCMzpEZZWTTH1TGsALUIVTx8KHH2ufmBcKGyGefi9YPA0RxO7dfs9/dNGg
         7iCIA2DJfTrShCqOPlJgbnvwniyiX7wbNeJqAXD8nWMHoiqTfyUeCSMlTWPIa/U1HipQ
         HaHYg6oMMdf7lqotZRMq1pSVOUYtoOiUdeuegP0qRx4WyMzNbnsq1eyr2zLVvHRdVbHJ
         1Zjw==
X-Forwarded-Encrypted: i=1; AJvYcCUgetzrB6pgdVy4YmaiZYt9Tn9Q3xkhRIjGBzHSFLkRljA65dtas1+ljZ5ymKtPF5ohItYhgekxa03a8iyR@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQ5fyi3GehSf8TOC+8fzoL7XxDS9DB3Df4iUMTVOkomP/VNhh
	yW5fzeqGC7noq8Ogc8rgKTvVMXsPczDDJEwn7+p1UgUGhDmArTL+NvDUWAOFHTE=
X-Gm-Gg: ASbGncv92IXELGh041FLzQB0SRA4UKqNrdVVdSfDy6tcLSgJT4ftQzD66hTez/MAPD8
	IxsCbQd/zorMoU68S+Nles3W6D4BNxNmxMLlYkbd+zuIV2HJ/G0xBnS0hWAmamRraZQEs5gboeI
	uG2A1eXaPmEI9S6A6gi2oO0t9lYkRt+OBFxmP3mX92c9kM3AutVUDLKlvSdOL8zhSjUELEDAEg/
	e6UUzRXflp7hvtkcqtMUZ7erZ4Kxl+Avdpk8bxPQUh7ub0hEf3kqQnN1KcbE0lE6a6fVNvL2XVu
	3ecAQG+b6SLQ
X-Google-Smtp-Source: AGHT+IGbygDMYFkk0NHDouJWb1lGgESCNIcAMGqnoMkLcYKm6hxwcjQGKts6Rc3SjiI4FqcEWgmtng==
X-Received: by 2002:a05:651c:888:b0:302:4115:acc with SMTP id 38308e7fff4ca-3072cb133d6mr127175271fa.26.1737717282519;
        Fri, 24 Jan 2025 03:14:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:14:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:24 +0200
Subject: [PATCH 6/6] drm/msm: drop msm_atomic_check wrapper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-6-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3359;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=STSqFPRboB3sQ4e2j7TOcKj/UooNkL+QUHC/wJG4nEI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YVzfyLXqMiGQiguLsbAbNz16n03nkZg3A86
 jritelnE+SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1ZfHB/0TLEmivajMQxYP83XdMY/7B2Y1Mw8PXawKgnfObCHfQq/5J523H4HSRJOCN16gkYtXIgi
 DG+J71a51F3+tTe5P2KMApNtGaO8VHbgbB5MArsHLgKf0ne1ii8aMTPWoBUDqTPHi3Fe/ojPhDC
 T/RnSmXAjEiZDr+fUnUgaLfw9FhASwWi8ONjNGgSMtx6fc9iELeKTHx2icUnyNdbuRgqzvXR2i3
 hjxzM4vtFQ/ALQof/kfBO+tZt7ZEzws81M3gas+UpTWPSL+dNlxYUioN52zwCpheknppTVzGasH
 NQetVf0FO8fyyA3JRLc9DrI0yV00vsBbO/pDkmB8yzE6eBRU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

With the CTM and CDM checks now being handled by the component
callbacks there is no need for additional wrappers around
drm_atomic_helper_check() wrapper. Drop the msm_atomic_check() function
and use the helper directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 --------------
 drivers/gpu/drm/msm/msm_drv.h    |  1 -
 drivers/gpu/drm/msm/msm_kms.c    |  2 +-
 drivers/gpu/drm/msm/msm_kms.h    |  7 -------
 4 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 4377233bd6447060b1300cc0d6877b6a777b1edb..550bcc77acb0426df1f06b08032307c0deef6c4c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -181,20 +181,6 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
 	return mask;
 }
 
-int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	int ret = 0;
-
-	if (kms && kms->funcs && kms->funcs->check_mode_changed)
-		ret = kms->funcs->check_mode_changed(kms, state);
-	if (ret)
-		return ret;
-
-	return drm_atomic_helper_check(dev, state);
-}
-
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fee31680a6d540d87cada67342bd5bee721662df..321f3c1f4932434e7fb6d18548f27df13c56eb71 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -232,7 +232,6 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_state *state);
-int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
 struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
 
 int msm_crtc_enable_vblank(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 4cfad12f4dc1f91a78b36572f6643ac135e00067..2d934fc0fcfd90a67f934d01fd9b194d4eb97609 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -22,7 +22,7 @@
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = msm_framebuffer_create,
-	.atomic_check = msm_atomic_check,
+	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index ec2a75af89b09754faef1a07adc9338f7d78161e..e60162744c669773b6e5aef824a173647626ab4e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -59,13 +59,6 @@ struct msm_kms_funcs {
 	void (*enable_commit)(struct msm_kms *kms);
 	void (*disable_commit)(struct msm_kms *kms);
 
-	/**
-	 * @check_mode_changed:
-	 *
-	 * Verify if the commit requires a full modeset on one of CRTCs.
-	 */
-	int (*check_mode_changed)(struct msm_kms *kms, struct drm_atomic_state *state);
-
 	/**
 	 * Prepare for atomic commit.  This is called after any previous
 	 * (async or otherwise) commit has completed.

-- 
2.39.5


