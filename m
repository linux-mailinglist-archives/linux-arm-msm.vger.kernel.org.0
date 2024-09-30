Return-Path: <linux-arm-msm+bounces-32785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF3398A62E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034B12841F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BCE194AD5;
	Mon, 30 Sep 2024 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaKTRxRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971319342A;
	Mon, 30 Sep 2024 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704380; cv=none; b=a+K/oPFwDIcAL39R9vVfnnPcM5rbQmMpa19bvUE5dTUh+sdOwl2JY5MqNKG3OGeqXqqgWpSv1O6EhkVnj27tDnAh2Xl31uTyY/h2Qc6ps5eg3MVy367OvH3g6RVavDYggBV2z8ER7dm72/DKDilVss7wRl4/td6rm293RBbm8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704380; c=relaxed/simple;
	bh=uZ9we3Ys2coi5h7xjntXCEGFqTbjLPlewrihZEQPd7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOv3kcXRB1RPTFfon0ur/JZMrAENCvRTI7uiU22RMdS4vJaEuvJj4UuJENufBu4i7IetFBdNxv+hNPmc0CVDB1nVmwMA6V+RlDqByGiy2OllfDJlWnKFYNMvP2l6pPNnOnPXX+nePOnYJfBDZE9Dv3nmrOep/4XlzAmQvbDEKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaKTRxRP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c42f406fa5so3285983a12.0;
        Mon, 30 Sep 2024 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704377; x=1728309177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
        b=DaKTRxRP0nXRWGBLewzFEw9tJnvuYq+x2b4K63McWn2wDF7MunpjSGnzgv/BBchMWd
         kuzI06Cm/vANf71v/YuJPOndS+jCD3jA4owtZrbazHLs4qPeEuphJiSl5sVlCmJmaa2Y
         FpHyTxK1DPHezaI+MjLOvsf23zLsXVXZA2cZIrTB3psh3QdueQ2uGt3ZK/yH2PuIEo7+
         S2dx6ZhJ7OtlzSiSwoBs3/XeukN6aBmbJsMa4BRc6iyajrUGV4yHw7Pi70TwDwClrS5I
         bZl6MgRlstG8tBT+XewvNJb56XXtcVGugmgh6kX5RjdBAEAz8mB3Amq2rYwLDpNbC/Fv
         45mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704377; x=1728309177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
        b=r1rN3ybjV8lc+nzCkERBYOSFH/ervD5NnRJ16McjZe/glqPtMr9DBafyfIcutgcgdj
         k42u75BqkN3oPYKoPHGMGkWyjQCQoJowRX8C6sgQkXwFCIsveqsTJZ4V8RKYpmyZRlJV
         YVsM3xrjFd6/NVfA4+XIgZPw3OSO1sByZU5ADUw/Gmrt5I1YHAe7WzPZVagu+MXjFOWw
         +/yvUG4DCdZ2+5MPwdSacaegUgtMu+tJpcdQGF/Lto9z0dGCY2EtR3d9DqH/2GxBj0nw
         TLrWsrLwCCtb5FtROeHjd5dMCJ4TDMknPk4j3LpF7neLQaqrLR5BrfMtoP+Su1D8YYcR
         srDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8yztAFYRWNvFndJ0csH9SUo3+WDdd7jLdYWHXsSPFaQsjmm2J50nz0YsAS2rAjsZfLHSQgyxaDD/2HQYJ@vger.kernel.org, AJvYcCXQzF7pYTdEYHSaNior/V52gN9UAcidBxrFMhE040u2YzkGhS11jmCTo5A+9Qh7W6LBAaFzT30jnck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4vuiIBjTSFBtyakUKbX9Nbzl6MbKoaUaM8voLqq94yA3jPWQ
	qJ3Xfl/ZGvfhRV6Y6izQY++rB0u61Ia1R1k7p7Ee52u6tJvlhQZK
X-Google-Smtp-Source: AGHT+IGyYZohwzEfRJ7JukdiTs8/AiEIC8Om2PpNLoQy2qZlKN5ofJCR+FAIXgB/nwG2DcHZxweFdA==
X-Received: by 2002:a50:cb87:0:b0:5c8:7915:4c7e with SMTP id 4fb4d7f45d1cf-5c88260f0b3mr15486219a12.36.1727704377170;
        Mon, 30 Sep 2024 06:52:57 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:45 +0200
Subject: [PATCH v7 10/12] drm/msm/a6xx: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-10-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=3460;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uZ9we3Ys2coi5h7xjntXCEGFqTbjLPlewrihZEQPd7U=;
 b=2TPTL/YXg14iDfwte1tR4l2sYS8/mBRAuGnLsTzxp2aNQbsCRHYAvbOOZCfaJ7Xjhtmj4jjt9
 /VFKfHR61IUBQM69D3zvhVX0nBQBxzj75/f9CMixhtVwT7oZ+4LEZD2
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


