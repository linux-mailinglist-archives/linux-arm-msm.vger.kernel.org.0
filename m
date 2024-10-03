Return-Path: <linux-arm-msm+bounces-33037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA998F3F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 930B01C21F31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C511AC88B;
	Thu,  3 Oct 2024 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuE8jmAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553381AC42B;
	Thu,  3 Oct 2024 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971999; cv=none; b=kyvv/ULXu6cI/QlpWuPGZ0yB7tFctF1jWTKg91NLzBbjRubDQhEUI/xz6GBE9dPf4cYMSsq/j5SVbSLbdz4FVLswiYo9H00eNoRbZCYyeZkDDwT59uZYqnAtEM2BJPsXqwkh7MPpuXI2Y+0XBzDcL6IhHYU8Be6C/u5ZzQmiiG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971999; c=relaxed/simple;
	bh=uZ9we3Ys2coi5h7xjntXCEGFqTbjLPlewrihZEQPd7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5PNzsb1KOi7EYWEQhRb+bsOzDwVZVE7+yPABo2nLk32E2tXQHo0j5lwfbdK5aTIhuFfR09bIjaxmNCFDmcgg3+oo5F3NGAppC/2XwaRqHTKwlQbukGTdPbfO3LXxzIHwzFskH82CErUVRk4X9hIk+6ja5TQl8pXKKDh29BgJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuE8jmAK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so144882266b.3;
        Thu, 03 Oct 2024 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971995; x=1728576795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
        b=BuE8jmAKhfqdYd1RvYTAGhAydvTwmUnWhBCACqAcR8q51bCD4nbR9g6+hYtOkKv9T3
         qCAOyTtJ41tQvptvVxWZ713Y6j5R8LelCxCoF2QMXv0vHDC/o5JCt/80LTKrUcwGCWru
         3ZI2Le6nuY0vxzY6dmxGu5XgedmL1rFXYBPU0rGnlanPJ3T8Rx6BGLNNsBkJ5IUzVzwz
         43DEPkHWQBFhKeS94Fx+/pOOYuUzoyn5aqz6J8O2ubvg8lfVo4FQy71y453/3qwVVcVG
         fuxvZKf0lYFqFjWU1HYnXIB9wdPC4uxvSJO18mbogisk7Ksighkbfb4Mf5AdZzcaM79C
         +5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971995; x=1728576795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
        b=m4NbWD8pw1zf8Rf/uyQ9xqPMJQQ2JWBenHATHL15ILnE4hTwYGNfaO6rtGrdRZjrxH
         rGPg3opnMM4Gzc1dePzpxbpblRMKuPTNSmyoLgpdMG+X8rtMgoY6tZOrGR+/4ce273/9
         HuIzGlz9HKzeG0TORZyMUiEgWr1V6KF1mILX+IYV8KhGOVDH1OKINxTMTbCX2HEq8drd
         NRZE2yKmCfY+6butDa5ctFMDApvyOdnHr/06iQepbH+FujcLfJcH7VHON1IP1LH3URW/
         dNp4w0pl1e9vgC+TOChMj70NT9y7cmaREUvFnn2viE00rEQIR1OA6H1ePqReCf/zhdJE
         d06w==
X-Forwarded-Encrypted: i=1; AJvYcCWFI88gROJyvnGKlC0LtijVJ87d3qpBLWCbZCeYY0M3ZPi1n53O4P6ZH3jHdlQDfHoNpZigxPJtyNphYHmi@vger.kernel.org, AJvYcCXZJKXaBtx5SIQDbDkgf/1d94viqou0SaAvnLjnIRVID8ElKZehSZRutD/J1DPyDcJ1GSW0JJSLUFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4U6qs+L4rstN5a7FX3kHmmpQeqHIw9GfgkR/fPGQbLUtTT8qt
	jzxd0toaoZslIcNp575CJ5wR9FPKKDJbVVNGYPHFOkob9V8M06Af
X-Google-Smtp-Source: AGHT+IEXjwXCGQzu4SkG+rm26oYPXXKheXbthTe32ChjrbrwiGYdPSoCV9GUf3MdAEpzrqClGYe78g==
X-Received: by 2002:a17:907:1c9f:b0:a8a:71d5:109a with SMTP id a640c23a62f3a-a98f8234339mr801214866b.22.1727971995477;
        Thu, 03 Oct 2024 09:13:15 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:15 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:59 +0200
Subject: [PATCH v8 10/12] drm/msm/a6xx: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-10-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=3460;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uZ9we3Ys2coi5h7xjntXCEGFqTbjLPlewrihZEQPd7U=;
 b=gT9f+nS11o8O39VF9BELYlkLKW0ZRa2NGKwagdc2e/BPRLzaZa4j52+qXrh2RlN1k3/BUgbSY
 t8ULbKCipeCCy1FfG40I2A6Sgve4OwNBZS9A6KH6iUmJvtSE13V8GDO
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption when creating the submitqueue.

When this flag is not set preemption will not be allowed in the middle
of the submitted IBs therefore mantaining compatibility with older
userspace.

The flag is rejected if preemption is not supported on the target, this
allows userspace to know whether preemption is supported.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 include/uapi/drm/msm_drm.h            |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9b486ec08f77933c3666549a16d915aa2d2188b0..2f7c93e74e097a78510700d2c6607d052cbdda66 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -352,8 +352,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x101); /* IFPC disable */
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00d); /* IB1LIST start */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00d); /* IB1LIST start */
+	}
 
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
@@ -384,8 +386,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			update_shadow_rptr(gpu, ring);
 	}
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00e); /* IB1LIST end */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00e); /* IB1LIST end */
+	}
 
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325aa67639406ef413aaeb6a9f08cee..9b3ffca3f3b471f509918edd4a2fdb0f80dfeb06 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -170,6 +170,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings == 1)
+		return -EINVAL;
+
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
 	if (ret)
 		return ret;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f738614a3e229e1017fe4f2ab61cd98bdf..f37858db34e602ce8b92dceccb60d4b6bdcda877 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
  * backwards compatibility as a "default" submitqueue
  */
 
-#define MSM_SUBMITQUEUE_FLAGS (0)
+#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_FLAGS		    ( \
+		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		0)
 
 /*
  * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,

-- 
2.46.1


