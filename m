Return-Path: <linux-arm-msm+bounces-28661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F629539F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2258B287A32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D24876C61;
	Thu, 15 Aug 2024 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gImlFyHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0F664C6;
	Thu, 15 Aug 2024 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746462; cv=none; b=gfbL7MFb0SWAX9z8pH2pKUPHRiXUhDVG3sOVwt+TfKHHvUGEsIJNCGOuhTniC46VSsjtju7+BHzNMcHV2yNJAt0tZ4FSf9CcLH4jdOW6xccS3nF/UStE1qUvVPVtZIXwTwHvEhESj1b2ajfAefYdONStJ1+REIEVxtnnmREFDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746462; c=relaxed/simple;
	bh=20oAYS3mWUIGbiEDLsRaCMFHZNrME6mT7hQZgI2Sra8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmKH52214AWGvLH7VN0HAXKZT3hYx5ifT70ygkKo6j+F/8lqITqqcAPPykoQsaxNsmbnOGmg7zb2CsS5Y5UgcMdsMEfMJTBFQI4QC+A1Vu0+mZ7tqCoFt71+xKXkMEH45VPxLCJukQydI2y98klM6nKnL74mLrh9O0oKAp9gtKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gImlFyHk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8385f38fcdso86299066b.3;
        Thu, 15 Aug 2024 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746459; x=1724351259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJZcAdXengnxQsRuBCfXSm3/IR7ldhfXkm+AS24y8lo=;
        b=gImlFyHkIB3Oc2XMYOKB287gAJO0i/GPm9N5yEsjoCyW15VeYj7dfZ9CJfz19loe68
         h1K7heejLlLHsupCEZU72qbAF8Vs9mD3q+o7YOAANwjoVcM8Rb+CY+vTY/d7y5oFGh0h
         rbs9qAShSZOq8hiLp+ihQFaTyHg+rlYmfw4AvUwahIfTwBybVtx7CvpqvzJZY4cViEcC
         dubkvJXNLwBEy53Jlt4wtaFMfoBYm8k5XDy/sAoD3LynG4VQePZKXlB8TIOUjqo4Lv5/
         /yDyIYnVv6jlgiJtg9tMbn636Qqb6c0twEGE1E91QDx5u/GH7Mozhz5DwC0rG+cTwErL
         N4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746459; x=1724351259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJZcAdXengnxQsRuBCfXSm3/IR7ldhfXkm+AS24y8lo=;
        b=SCFp55zh6Cjohf0/gPqc7wi4QS7lA+NfboZAl6DbuuaX7xVNUeDvIj7nDHHVsM7+C9
         dGyjUI8rfIdFn9OpVN/vl4Stc9negcC6AsoyKB7FujoKN/eUpbKgxZYn5bp+Dqna6Mxy
         7RMnEtKOatcDEKu4mJiA8AIRllYanFB5WHKrL8mK4iy/hip2dG2YoTNSwPgEOKm+9gNH
         jNVnsfB4x/IPGNMUpb+dVMQYuBywmYHQP2fIoDIBW1vLkTuA8N1Fk4ASyDrlSDUP0Jws
         9tpSZzU7GT6E5Ja3qWW944JZBZmafsHQf/qrgVDaQST05MeoG56z36+zlPK6rtD5qq73
         sunA==
X-Forwarded-Encrypted: i=1; AJvYcCVOgShBok3tYQCOkrfn440nehC9hVmGp9X294G9GHJTDcyS+XQ2OUib8J3yiVDx2XUYTiaiAQsJbTogzhjXMpLvbN5W34bzmLEflrSN
X-Gm-Message-State: AOJu0YwPxtzJah9Ps48VJ8P8JlrcOHHGAFSh31y8LkmYUBgMA7V2xc+Z
	/PGgn7IV0Nic7LY3eS4Ws5wytbfISq1r7n/irOFthfLnOs9qgShH
X-Google-Smtp-Source: AGHT+IHF29C4IC0GAOmzG1LjmAPZsf2ZGqUe1rN816bkCVSN1Wb+2P06Jr/oWhrvp2Jca9UErpPefQ==
X-Received: by 2002:a17:906:d54e:b0:a77:aa6d:e0c7 with SMTP id a640c23a62f3a-a839293e973mr28486566b.30.1723746458735;
        Thu, 15 Aug 2024 11:27:38 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it. [79.35.172.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:27:38 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:12 +0200
Subject: [PATCH 2/7] drm/msm: Add submitqueue setup and close
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
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
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2616;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=20oAYS3mWUIGbiEDLsRaCMFHZNrME6mT7hQZgI2Sra8=;
 b=vSb1NAIThr44gOy1adLEVkRxa/kzpiR9f4HJ/bpnUqNFI0dToOp74LyZ/El4114l5ebgPe7oT
 7zYefoUGrPpA0Sj1m4eI+T3puPlPLI0vLUu2IaZ+1tO/TWm9qvPGIln
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

This patch adds a bit of infrastructure to give the different Adreno
targets the flexibility to setup the submitqueues per their needs.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
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


