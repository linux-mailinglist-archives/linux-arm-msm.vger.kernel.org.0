Return-Path: <linux-arm-msm+bounces-30271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D40579665B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569A21F21D42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CA31BBBF0;
	Fri, 30 Aug 2024 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJwkqvW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476F1BB6B4;
	Fri, 30 Aug 2024 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032009; cv=none; b=JQCvb5b7MscyeoQqid0JfImvRtCPBUf6SyvCRqQPIiA+Znfk5t/Yl7tirc8oiUHGwN5Edv+zPys17xWVN2tUOJ/8fWsctkBoGcjwVE4QVMgsHUScG09KsL89VwKr9S2jZhe4E48Q6o1ya1VBouuOXzyqGvKYSD4UE5cpb3u+STY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032009; c=relaxed/simple;
	bh=PCj5f1TShzb01/l1DYjouxmbSmeDYaltjowx7/IScpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJQxzBLPXSb87WzhRY5akQZHYNvUragoPCfhmYpU7K+A5M8oEZchaRe1s68/EfJ9KrMKJWaxQ77WcTInK2PCc53FBTPUtYLK+WD0KiM+Geb9H1B2XGDjQekXJgD5YnUbwvaznenupxs0PYl3eTVhaHkVIdjRGt8p8bt9UKl2rM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJwkqvW+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53349d3071eso2609272e87.2;
        Fri, 30 Aug 2024 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725032005; x=1725636805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAQ4Y56zZFeFqXatAlfS+XxAWMpxFW6Iq0fWmOd0/MM=;
        b=LJwkqvW+bJGfMKyPav7+JYVesnm9L9T+NG6G6jyr3V23E+eWlr4lWn8WaLQOWN14qc
         8VUTa42wab9lqXnQYKb4/vltYfKRR8Lk785u/BDd2aZNHaUuK0OrrAMWjZ6rULWMaYUC
         vq6L3KZNjuQ6q49zEuhDkh0Yc4xlNGFBNZ5k5hhBViyIpjpntych7z0s7xO0dzoQx33T
         ySItbvCw6es5GglA/Z06XoA9doFb2jB//Yc++bf/LJE25YiX8fcJZO1cGyyaIaGpQ/oC
         WjjOWN6HTBeSK8XHp94Vmlg7lcUe1mhHup4fAuGSSYFmlTOsqFjzhK/rRDFSHOo25A3b
         /GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725032005; x=1725636805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAQ4Y56zZFeFqXatAlfS+XxAWMpxFW6Iq0fWmOd0/MM=;
        b=VVJeieFcbrqG7toEe29/mJaWEamgOSChFnuZoJvgPAEmR5UlkML9sfU/PdU9fvM0xN
         ynDk/fLceR48tZzndjk5hyM6i6ViLpyI5Ur8ihZf6Vu+HPLMBa5doPvY1SMwBCKJ580+
         xUAUO5wsabtyf+yr6ebkQaaK79I7oK1sSG1hXMPrj7jGBsOqHi1hwv/5R6zU56SYJcCX
         2kAU9sZUjegWUepCb9Q+jNCH8K1SbJlUrDej6efVzzhbUQ2eHyf7P37oyhG/SeOKlZdk
         IuWx+Jy1NeaLN83ppoCUNSrUj/3ASDDy8Wc/E4WixDgHOOULUHnEk/56eNhhDgBqMlYU
         /bSw==
X-Forwarded-Encrypted: i=1; AJvYcCUblnHFfCxyGiTOvWX5HclFXi5SGzyIpc14jq2TtI2W7dxf655KD+eLqWqs0c3OJq3002XONqe6fBAJMmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/T/kQavBvdiFuEwOBv++eTmjQzE/wS3Nt8h69Q/4l8iEKVY/i
	BykBlhPcwv+KNvek0hzlWproOuHRnNxRO6ZY0aTPiLu3eDhjJo1/1zF0Cl2U
X-Google-Smtp-Source: AGHT+IFrmbjxavNlt437RWbF9abPwKhWWT5ynpxuvY6puJC5bTzQLJxMVE4JEXeVIH/ZuWZtbiGnDg==
X-Received: by 2002:a05:6512:1055:b0:52e:f950:31f3 with SMTP id 2adb3069b0e04-53546b44404mr2277523e87.35.1725032004878;
        Fri, 30 Aug 2024 08:33:24 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:24 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:50 +0200
Subject: [PATCH v2 8/9] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-8-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=3100;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=PCj5f1TShzb01/l1DYjouxmbSmeDYaltjowx7/IScpU=;
 b=7mDqV5QllX8WInTlkofz+vJR1xyo96/uN8HKCGeRqD0QSMiGIkIFPqEIDXmwOnG7h3gn/t9XQ
 SqnyfO+F2BFD2xtlIzOyHvAWkygc51T8o5ez2VLIuQlfsYkDsID1xcL
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption when creating the submitqueue.

When this flag is not set preemption will not be allowed in the middle
of the submitted IBs therefore mantaining compatibility with older
userspace.

The flag is rejected if preemption is not supported on the target, this
allows userspace to know whether preemption is supported.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 include/uapi/drm/msm_drm.h            |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3528ecbbc1ab..a2853309288b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -465,8 +465,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
@@ -497,8 +499,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
index 4ffb336d9a60..0a8fc4262026 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -176,6 +176,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && gpu->nr_rings == 1)
+		return -EINVAL;
+
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
 	if (ret)
 		return ret;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f73861..f37858db34e6 100644
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
2.46.0


