Return-Path: <linux-arm-msm+bounces-30961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACF96DC94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10065B25F38
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181F119EEB0;
	Thu,  5 Sep 2024 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMn2z6So"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7BA19E7F9;
	Thu,  5 Sep 2024 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547903; cv=none; b=EpWA9qT0BdSwpbdJtzQlo/PmTnAqNfDdLWO3dM6WB0Az0/To4NL5tq/keqvm0ITClev2z2CqmbA7M/83t6m/ncvxLbGyiODQD090t5ba7ms7XkqLHHZ8FMto7kKxRVXPXW26PHhYEJMAeYC+k7pd07kwWE7g63upYWPnjcOCX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547903; c=relaxed/simple;
	bh=I8Bhra+oCMavu7JjL/p4zBs7zmYCVxxAvz/Rp0feUEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvHSP2CQVFX+8VdXmjJ+wuzQeku57ALuPQGudyICIDJoyVzI/XPC0hJ6csDBf3aoVOW3m8wGjIgamFFXsrb+RWfg1wkvlpMu7gXNi9a+UG+nPhT49hjhEQm8NHSqIXJmB/l5a2yqCjEm9/NtTyudfeXYoRrJalZuhEhdUVlxeJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMn2z6So; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c25554ec1eso1005023a12.1;
        Thu, 05 Sep 2024 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547899; x=1726152699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tf5oppR7ZrPY04ZNHiHuSxDIc4JVyX4YALpOAdUkRCM=;
        b=JMn2z6SoqsWh0HNEgH/AQMZRygr8UJE0lI9tBaZdIy4l+YJsQNY7yP7bWKorBcW+FD
         V1yM4awSIAfmwI/5CiXl7qHtwPCja8ZKi0Gnv3Gga8PszmPmXQgM4yeR7quoMhje/Ybo
         qr1QVkxOYBlstWdxrP6jPwIC9aEVSNkqzJbnu2NhTm69585CsKN9TgxHN4ZgaLxVhTkp
         MP9XAE2Ir2zn/U7ocNUoEXrsd2pXrCtsR249OQ5pmYlIIOR6dipq5uUCNLuKI9Sz3JCs
         2GkAXsqp9lwufFyG3U7UIVMKNSUVrt2g9ykTNOY0s5UIdZImGALTVDMJxe1AdmWoVdge
         4EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547899; x=1726152699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tf5oppR7ZrPY04ZNHiHuSxDIc4JVyX4YALpOAdUkRCM=;
        b=baXACOkUQ/WoH0SJd0MEA/n0vFPEhGWdwOqSV51jpB+qQ3N19DQpEZ0Uf1Bg91VTiz
         p78N05L1NdFiIPRn6QiLTVFi3Jy7FvXeqMwluIpUE9tJk/Ip8m5xdbhC13gHkgU5Dzgz
         GNRUo4Z1H9a64DExuHNfij5xufbT2+h9b+5lLBHdfX0hAMMPXSDagd/zdgYgZWNaIGEa
         f/HnDE6OFOhOjMpZuaBKOONh8baYeDAK4acY4jfxPwJYu0oYnCdDJBEHgavP90K6DGKg
         5R4Qu35gf22pTcS44UVIAtAo8AMn0IbBZCwZ/xpgB8AABPAeMVMopYpKLGdMqGvkyhRk
         hgGw==
X-Forwarded-Encrypted: i=1; AJvYcCUIVxfkPQGVVbyLbCf7HgtOGSuY4Kk86O3CX7BdCYClrpv1bWT5xCBPlHpwV88RAnqRS8tZkTyFBIrJBHhI@vger.kernel.org, AJvYcCUdJ7dMVeEwqnCUanOgUvUGTDzUHYq/SxJWDr4y8rD+vUhktIjREsWjgryIi1g8AZ5lMZysQtA0QhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2sr1Ac1Cy8IQC7B5rhh8oG8wE62mRT/Bm06oGcHm9neVAYRYR
	GTvW3BY44O1jW/yuvKyYN3g5tIBCcrxmBGLpy857VanurFcp/etO
X-Google-Smtp-Source: AGHT+IHQgG0o6Lvo8CgGzxCxC0nzr8TQzRlSTuMdOFpflPLgPBM+rOwzsIkMd6J2HKpNXeDSdmrkNQ==
X-Received: by 2002:a05:6402:27c9:b0:5c3:c4d9:5e1e with SMTP id 4fb4d7f45d1cf-5c3c4d96141mr4076303a12.20.1725547899514;
        Thu, 05 Sep 2024 07:51:39 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:39 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:26 +0200
Subject: [PATCH v3 08/10] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-8-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=3106;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=I8Bhra+oCMavu7JjL/p4zBs7zmYCVxxAvz/Rp0feUEU=;
 b=1w0Vk0UbTMSsc4jB2uyCG35rkfNX4+rVX5LoJyiiiCDZHHtp6v1xa7gk52PW7kK7tqbAQpgvh
 Q7OU5wahRgJAhMZwpF8yv7XA76BiFN7o3gn641c0Gv2Of/VkTfdRFsL
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
index 710ec3ce2923..512ff443bd2e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
@@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
index 0e803125a325..9b3ffca3f3b4 100644
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


