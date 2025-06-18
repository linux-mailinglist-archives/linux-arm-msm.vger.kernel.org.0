Return-Path: <linux-arm-msm+bounces-61693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B0BADE4F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BA4179A28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288F327F01A;
	Wed, 18 Jun 2025 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tyWbVOrs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YcJJyYmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B4F7E105;
	Wed, 18 Jun 2025 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233237; cv=none; b=NmN/D7stDEnuF9K4ettrNtAZUaB9lgMDLij8CTz3fRVuK3AsVssqnKjaqJxwJlVBY6dgS/uRSsvLKk5/LFtdBok8Lelobso2pXmpUAby2Hlqqsuhjl4/Y5Mtno7JEHDiyYYJ4HssIykKV1NL/Hnf/2bh2QShbP903CR6ukpRQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233237; c=relaxed/simple;
	bh=qETPDyrdVhxjbZ70R5i7ssATWua8Lg7dQ8FkWkW9CKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oU3HjsoTN5HjjZCjJtcP+iMJh34ae170Xijrh9CgV320b+ODh5KLjcNwbtK3FsfOR2kWptPEukG5TQo8IQHJgJGXhD34pUgXyM8rx6OHnFuDN/FsIAb2Tk0QAn2lUs6TESK4WuHsBcM/ql9rGgmt4C41jVA9lJhPKwzwzV71bfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tyWbVOrs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YcJJyYmx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750233233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCQsfc4sAeV4oFREdbtu3IsZF6DaRAPHfJkOBDEN8Vw=;
	b=tyWbVOrsMgG+D/jbHS+tvWgOsqPnwcx9L7jKoSCbEsx7sIUyJyuB9Xk3OzIdI6szHWEgYw
	PN/eev0+qOCZhfbfXYhYHVv7XPnkLwYYY0zIXAB8C1ucDEHZSY7DRpolx8EFMJUMrHJR1W
	jPFXNDLMVmCJlKOl21SAgyvqvBxPUKTmjL0+yOCC8YpxSwNBSabxSIXYMuA1yDuXINk0wX
	E8XSMmGG4/XzV4fZyPQTB3eWABQgkhe5+NHw7gmvO3Xa2Jm48VJjQ4mvtyAL/sX7glhziZ
	2+znQRr1YvMxFzkyTLW5cTc2b1B2gjipj/fICnWo5UC5YH1I7KUbQlGh8sUbYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750233233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCQsfc4sAeV4oFREdbtu3IsZF6DaRAPHfJkOBDEN8Vw=;
	b=YcJJyYmxaizL9X6DdFwvNWLLy4VMkTRTQ4GeSBrj6baa240Z8IeRM10zGM6rPnfcQpuJHJ
	KvZzfn89qXZBFABw==
Date: Wed, 18 Jun 2025 09:52:21 +0200
Subject: [PATCH 2/3] drm/exynos: Don't use %pK through printk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-restricted-pointers-drm-v1-2-781e0d88cd92@linutronix.de>
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=7012;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qETPDyrdVhxjbZ70R5i7ssATWua8Lg7dQ8FkWkW9CKw=;
 b=s1YuqdffsIzyz2ewBx7EM1f0TkMMFvIaLggOHJzH/PpDsvKxHCxHdjj5A5jj6UceOD92sjtnX
 4jzawp06cLSCy5wET63VqKrWF4H2poG9ShtJFV+iZwD/+XuWQ+eoy3P
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 4787fee4696f8e6f9eecaacb1535765c246688c8..d44401a695e203bd36b3b6678fdeb3572a91bfda 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -174,7 +174,7 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "created file object = %pK\n", obj->filp);
+	DRM_DEV_DEBUG_KMS(dev->dev, "created file object = %p\n", obj->filp);
 
 	return exynos_gem;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index ea9f66037600e1020da4b0a9c318ca2f2266a871..03c8490af4f45447d123a20777e5362ebd933b46 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -271,7 +271,7 @@ static inline struct exynos_drm_ipp_task *
 	task->src.rect.h = task->dst.rect.h = UINT_MAX;
 	task->transform.rotation = DRM_MODE_ROTATE_0;
 
-	DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %pK\n", task);
+	DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %p\n", task);
 
 	return task;
 }
@@ -339,7 +339,7 @@ static int exynos_drm_ipp_task_set(struct exynos_drm_ipp_task *task,
 	}
 
 	DRM_DEV_DEBUG_DRIVER(task->dev,
-			     "Got task %pK configuration from userspace\n",
+			     "Got task %p configuration from userspace\n",
 			     task);
 	return 0;
 }
@@ -394,7 +394,7 @@ static void exynos_drm_ipp_task_release_buf(struct exynos_drm_ipp_buffer *buf)
 static void exynos_drm_ipp_task_free(struct exynos_drm_ipp *ipp,
 				 struct exynos_drm_ipp_task *task)
 {
-	DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %pK\n", task);
+	DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %p\n", task);
 
 	exynos_drm_ipp_task_release_buf(&task->src);
 	exynos_drm_ipp_task_release_buf(&task->dst);
@@ -559,7 +559,7 @@ static int exynos_drm_ipp_check_format(struct exynos_drm_ipp_task *task,
 					    DRM_EXYNOS_IPP_FORMAT_DESTINATION);
 	if (!fmt) {
 		DRM_DEV_DEBUG_DRIVER(task->dev,
-				     "Task %pK: %s format not supported\n",
+				     "Task %p: %s format not supported\n",
 				     task, buf == src ? "src" : "dst");
 		return -EINVAL;
 	}
@@ -609,7 +609,7 @@ static int exynos_drm_ipp_task_check(struct exynos_drm_ipp_task *task)
 	bool rotate = (rotation != DRM_MODE_ROTATE_0);
 	bool scale = false;
 
-	DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %pK\n", task);
+	DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %p\n", task);
 
 	if (src->rect.w == UINT_MAX)
 		src->rect.w = src->buf.width;
@@ -625,7 +625,7 @@ static int exynos_drm_ipp_task_check(struct exynos_drm_ipp_task *task)
 	    dst->rect.x + dst->rect.w > (dst->buf.width) ||
 	    dst->rect.y + dst->rect.h > (dst->buf.height)) {
 		DRM_DEV_DEBUG_DRIVER(task->dev,
-				     "Task %pK: defined area is outside provided buffers\n",
+				     "Task %p: defined area is outside provided buffers\n",
 				     task);
 		return -EINVAL;
 	}
@@ -642,7 +642,7 @@ static int exynos_drm_ipp_task_check(struct exynos_drm_ipp_task *task)
 	    (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_SCALE) && scale) ||
 	    (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_CONVERT) &&
 	     src->buf.fourcc != dst->buf.fourcc)) {
-		DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: hw capabilities exceeded\n",
+		DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: hw capabilities exceeded\n",
 				     task);
 		return -EINVAL;
 	}
@@ -655,7 +655,7 @@ static int exynos_drm_ipp_task_check(struct exynos_drm_ipp_task *task)
 	if (ret)
 		return ret;
 
-	DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %pK: all checks done.\n",
+	DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %p: all checks done.\n",
 			     task);
 
 	return ret;
@@ -667,25 +667,25 @@ static int exynos_drm_ipp_task_setup_buffers(struct exynos_drm_ipp_task *task,
 	struct exynos_drm_ipp_buffer *src = &task->src, *dst = &task->dst;
 	int ret = 0;
 
-	DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %pK\n",
+	DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %p\n",
 			     task);
 
 	ret = exynos_drm_ipp_task_setup_buffer(src, filp);
 	if (ret) {
 		DRM_DEV_DEBUG_DRIVER(task->dev,
-				     "Task %pK: src buffer setup failed\n",
+				     "Task %p: src buffer setup failed\n",
 				     task);
 		return ret;
 	}
 	ret = exynos_drm_ipp_task_setup_buffer(dst, filp);
 	if (ret) {
 		DRM_DEV_DEBUG_DRIVER(task->dev,
-				     "Task %pK: dst buffer setup failed\n",
+				     "Task %p: dst buffer setup failed\n",
 				     task);
 		return ret;
 	}
 
-	DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: buffers prepared.\n",
+	DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: buffers prepared.\n",
 			     task);
 
 	return ret;
@@ -764,7 +764,7 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_task *task, int ret)
 	struct exynos_drm_ipp *ipp = task->ipp;
 	unsigned long flags;
 
-	DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %pK done: %d\n",
+	DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %p done: %d\n",
 			     ipp->id, task, ret);
 
 	spin_lock_irqsave(&ipp->lock, flags);
@@ -807,7 +807,7 @@ static void exynos_drm_ipp_next_task(struct exynos_drm_ipp *ipp)
 	spin_unlock_irqrestore(&ipp->lock, flags);
 
 	DRM_DEV_DEBUG_DRIVER(ipp->dev,
-			     "ipp: %d, selected task %pK to run\n", ipp->id,
+			     "ipp: %d, selected task %p to run\n", ipp->id,
 			     task);
 
 	ret = ipp->funcs->commit(ipp, task);
@@ -917,14 +917,14 @@ int exynos_drm_ipp_commit_ioctl(struct drm_device *dev, void *data,
 	 */
 	if (arg->flags & DRM_EXYNOS_IPP_FLAG_NONBLOCK) {
 		DRM_DEV_DEBUG_DRIVER(ipp->dev,
-				     "ipp: %d, nonblocking processing task %pK\n",
+				     "ipp: %d, nonblocking processing task %p\n",
 				     ipp->id, task);
 
 		task->flags |= DRM_EXYNOS_IPP_TASK_ASYNC;
 		exynos_drm_ipp_schedule_task(task->ipp, task);
 		ret = 0;
 	} else {
-		DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task %pK\n",
+		DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task %p\n",
 				     ipp->id, task);
 		exynos_drm_ipp_schedule_task(ipp, task);
 		ret = wait_event_interruptible(ipp->done_wq,

-- 
2.49.0


