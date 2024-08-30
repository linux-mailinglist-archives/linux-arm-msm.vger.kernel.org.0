Return-Path: <linux-arm-msm+bounces-30265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C29665AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D6A28193A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA541B9B53;
	Fri, 30 Aug 2024 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVJV+sQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CAE1B86D3;
	Fri, 30 Aug 2024 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032000; cv=none; b=sYt8ULRctg5ensfnt1NnNCViABjvD2gQ5b0jsGTVnhMNJlJT8W6zUHnlpq3l78libA1+J2awqvkjerfySS8lHj61A+l/kY4Vb3AZYN2qneTzza6iIQpuUvoYqGjoAiKhLtEaE7TEW+gMCROd8V3yK0+/rCdg3N+VO1qeSzq6hPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032000; c=relaxed/simple;
	bh=SNycjyoxgs2R64kDhGpyPBIuNCmi08MxqbM4Ak2n75U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s85Y6Tevt/RB4HkwvPB7RdnsXtRD6h6LRU0QdLO8CJjWhJFkA0Kmq0aVXvlYCxaeSN6aOWh26+qJLSADZcOs+u7a0TfBw5U3V8f1LfnoYxwgy9gPkN4TcbnxrvhcsE5zqpdHgDr7uprJgBumZAZDz65PSaL7qI+wyquEMdSYIvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVJV+sQg; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86e9db75b9so211130866b.1;
        Fri, 30 Aug 2024 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725031997; x=1725636797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLP9MMqmlzma4Utv0dqtZOgr60uqrWrjrfDUuDPUx3U=;
        b=SVJV+sQg2cZQOEPZeH1fNwi2WOf7twljpEpwNcav8Uz4DiUgcnH3SpR9xCQMrnK+la
         0kVoC7eGOx+lMbeI7UoABXzKoPejuihWmRfwi7IQUcWvmhHSkc0FLgFDPYX20JooQzZq
         nZOJdqwHmW+L71L9pIRtCgldYdNkA6hKYgzEUko8Ifz46XnxM9YCA6EB1E3k74ixUPHz
         yqnV2+/6E9vR8aHaw/q5hNa/yhiAB0225jL2m/00LUCECSu2euKh877JcUAh+HRa0vA5
         aDPC5JVpNnIFnb9zQNKIJ5lMYxxEHcEfO38BDxqpsKNi+f0UjVErStBokwHLawJ9J3Bj
         QhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031997; x=1725636797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLP9MMqmlzma4Utv0dqtZOgr60uqrWrjrfDUuDPUx3U=;
        b=AMclcV5R+Iy3rbpG8e9A9wHQHPHBZZ4aZstYoswHMQQuq6W5iWwRIQCv5li1Z1iFIt
         iXIRj4Ca5N5dS41L82yMiaKOok6vW6TwHkLVTE78Bcj/qlEXaiLfbFL6EpYIP+ItngR4
         xxbybBbyu2AUzhr4OVyMIp1MqtDHY+88TJJylMpzOKF3evaUriNm48VkbAFRa1SXGs33
         FSCXJh30kyDysg7NHzpgwJZCCUn4hNDxH5Rjx8YNlQoaPQ2Y0cMx9biFsFf/N2HCj+rA
         O/8vtPZY7LmV+g9v1gDL9jCqD3HXnDUuzFIN9KFSvauMwlXRLCHE7M9Vk3394OBD+juJ
         dqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKWOxsO9LUVzQjpTMy7xKFDBn9c0oVFXJMCwlHf1g7+MtKMrHwR1DyrFmlR3Wy0uRC4kVeBw796634RE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcgs29kYl623AbNQFez8pixQEFsNqMQIN5X7uc4uqZ6Q3EsEye
	DKVenOqpkQir7bKU4qhBgu/AOwWuBjEQTNmwWiL8EygC3oSA+7pbsiEGwAR7
X-Google-Smtp-Source: AGHT+IFB0Eg3VkAh1DIRgGbi7bwBedE9tblqW19lKkJGY0O2LvCfm80WTAFkD/+wMRC0IFtmh+DdSA==
X-Received: by 2002:a17:907:97cc:b0:a7a:bcbc:f7e1 with SMTP id a640c23a62f3a-a897f84c6b0mr491658166b.15.1725031996411;
        Fri, 30 Aug 2024 08:33:16 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:16 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:44 +0200
Subject: [PATCH v2 2/9] drm/msm: Add submitqueue setup and close
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-2-86aeead2cd80@gmail.com>
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
 Sharat Masetty <smasetty@codeaurora.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2803;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=SNycjyoxgs2R64kDhGpyPBIuNCmi08MxqbM4Ak2n75U=;
 b=4lg4CjFBFiR1VcFRym09hQaN8fde3H/adBBPW536N9kMF7E8pPNoiY8tK30KYqrnZ/i+e4Oh1
 mlG49Coh+BMCSSAQZg95jq2F7h+OuMMlACL9PvA4rIlUCgTHVdp5SGl
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

This patch adds a bit of infrastructure to give the different Adreno
targets the flexibility to setup the submitqueues per their needs.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/msm_gpu.h         |  7 +++++++
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1f02bb9956be..70f5c18e5aee 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -92,6 +92,10 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	int (*submitqueue_setup)(struct msm_gpu *gpu,
+			struct msm_gpu_submitqueue *queue);
+	void (*submitqueue_close)(struct msm_gpu *gpu,
+			struct msm_gpu_submitqueue *queue);
 };
 
 /* Additional state for iommu faults: */
@@ -522,6 +526,9 @@ struct msm_gpu_submitqueue {
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
+	struct msm_gpu *gpu;
+	struct drm_gem_object *bo;
+	uint64_t bo_iova;
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325..4ffb336d9a60 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -71,6 +71,11 @@ void msm_submitqueue_destroy(struct kref *kref)
 	struct msm_gpu_submitqueue *queue = container_of(kref,
 		struct msm_gpu_submitqueue, ref);
 
+	struct msm_gpu *gpu = queue->gpu;
+
+	if (gpu && gpu->funcs->submitqueue_close)
+		gpu->funcs->submitqueue_close(gpu, queue);
+
 	idr_destroy(&queue->fence_idr);
 
 	msm_file_private_put(queue->ctx);
@@ -160,6 +165,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
+	struct msm_gpu *gpu = priv->gpu;
 	enum drm_sched_priority sched_prio;
 	unsigned ring_nr;
 	int ret;
@@ -195,6 +201,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	queue->ctx = msm_file_private_get(ctx);
 	queue->id = ctx->queueid++;
+	queue->gpu = gpu;
 
 	if (id)
 		*id = queue->id;
@@ -207,6 +214,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	write_unlock(&ctx->queuelock);
 
+	if (gpu && gpu->funcs->submitqueue_setup)
+		gpu->funcs->submitqueue_setup(gpu, queue);
+
 	return 0;
 }
 

-- 
2.46.0


