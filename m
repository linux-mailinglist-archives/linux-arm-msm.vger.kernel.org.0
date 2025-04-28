Return-Path: <linux-arm-msm+bounces-55974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B7A9FB67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 306D34668DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269F321CA08;
	Mon, 28 Apr 2025 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJzwZLrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C4121C9EA;
	Mon, 28 Apr 2025 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873871; cv=none; b=py7OsUjTsBzTFAF5mQ5wqGKWN86JlIjWAem+RQz4fDH4BeoVi/0TqcXorzBqNdJ8RE0xmZcGF4MhQBl8MQwgAOMlbuBnE9FAvkbzksYT8ZDm0zw+KuiVa3bQ5OsszJwrQKQpJ8PAxyw6JVUdHZAkGNs02MseIKI+VaQbjNLLf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873871; c=relaxed/simple;
	bh=QGQWLMQfXULZQmRm+sgFTC2OwQTts5U5prm3sJrXjco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0QILPim/Y6IuP9pkWZPmtj2/9Bb78SLUP2BY+GnOiX90A4iSLE46xTEirbB0qao/wNEa4YAwpPfco+tFUaUCyUtMFLAAsBTWOGKYMZiL8x4HvXOt5/1nUtsrlFV0FnFGk3ellMRwQyisS+IyUGvu8HdkPZ3Sz8GJoow6/nFH3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJzwZLrw; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736aaeed234so4471465b3a.0;
        Mon, 28 Apr 2025 13:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873869; x=1746478669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7fMWMaiNk7CyDgGL1rTP0tQ8oRJwKaw/NfqTzANkw8=;
        b=RJzwZLrwiV83tLk/cv1SZidf0dHS05suDnLW2YUCDjpUpowoGXPs4tkxsBz33Pg/o3
         QltwLqiek3hVXDC+UDQ2HVPtkZ4T7mN5FFmQ2ut11vPqLNjWzSDQXMtoJb51e7c936Lk
         sFkHL9Ct3TYfap27MQWx7GD/jQysVq2kpC+7vz92ZWC25YW2RUTYiag5hnDvhZndzG1O
         w+MMMVKFtaAp9tnfOFbQiyLxQCx4FFiR8rqCt/ofDZv+/fpcaM1dVvsSawDXQJrRS1Jy
         kZRbjbK9XrmzBlele560Z5Tt0StoDZqYGQ7xb2Huu9IizXk+iEFg8WFTSNm6NXdltQau
         kWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873869; x=1746478669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7fMWMaiNk7CyDgGL1rTP0tQ8oRJwKaw/NfqTzANkw8=;
        b=JrfA5OqYtdnspvgg0OqphnvBwGVJE5HDe5Nwbou6tjuCqdkG8jpONiX9hXf8QJx2yU
         p5ky6F1f+f8QnmEDgHSWJvtScRbv9SobgxpnIWP93XbAn5/OCbjczF6/46wBlsOUfeA5
         1A32MJZs85ZRSlNptimH33vHRTWrpNLlFgE4uNFJd3XzPL/z7tlUS8eQg34lAkBBBV+R
         dbm8oXQENn34EXrfuVnaMY1b1l+LekitSnE5xhL/MCtpA4qPPMNwIy4+6kkXiD36QeQi
         xUDh2UnNsgzlOFiWcnFMO+hLweLY4cK148lqZxg+TJb8W1j4lLlgojnHjBGW7ijAXdAu
         EOVA==
X-Forwarded-Encrypted: i=1; AJvYcCXEXsVn0WakCgYbL7s+MDR4zra6eZ71F3/oH8OxfWN35GgSb5GtjsOnk4fW4TJSGPtczJpdjFq6Xedhcw8a@vger.kernel.org, AJvYcCXkfG8SU05JLb5KJ0Q0vmQiFbPxyPOp/VXd3KVRN0bIG9gE0vHcuKNHc+SRjw+2kzpYTBDHNiM43WteUtgq@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/ayBZzqPxq3CNhmtCq9lyRNrCyUXJjb90dJj+5JFyN5u0efl
	UhGG4bWVcsW+dT1uOymzfrOJUk2y1c3ZvPLOKwNVfu90O6uT//1bOGEqTA==
X-Gm-Gg: ASbGncvx+w85KBKVu6GdDz7+EWX6DRiS/cYONxFpgAA0kadqi3zWiP7OVrI6dcxGGSE
	Iqqe06WDhY2UIfitwJ0lteLLybEbAR9R/9MdctcJX7u77TOBZsN2hLV52waAi/wYBdzfAT8Lbmp
	x7t+ghkXyKeF3QvduLNthMXrgCzcY51QQAHzN7ZIuaxLizWc0fZ1IkwRFJBkA0c8WwR8A/XrhiH
	2JozCezh2sE3Vy09ij5d2GSjYHqZTcY1UtmyfZR9Z6Bj3Dlsi29ml4Xqu41GHAQqLx527DNSPl4
	FjBkcFQaVX3iwhZv0vGZJXQCz5dTPKxmbtp+52UFbsCTxpFm5FgIzlZJcpPWqRmat5ehucCQGlH
	3UNU+wGOYEzZiMNY=
X-Google-Smtp-Source: AGHT+IH81aqJwbOAIqUmEsnXEyHpJU/DOAKm+XZHhRkt0te+xH2CPPCuBSxjNdo1RiiUpAVVfT/zEA==
X-Received: by 2002:a05:6a00:1414:b0:736:339b:8296 with SMTP id d2e1a72fcca58-740271e02b1mr1655188b3a.18.1745873868834;
        Mon, 28 Apr 2025 13:57:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acc944sm8821132b3a.170.2025.04.28.13.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 27/33] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Mon, 28 Apr 2025 13:54:34 -0700
Message-ID: <20250428205619.227835-28-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d0f44c981351..b4b299e3f3d3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -76,8 +76,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -879,7 +879,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 4cd75001aca8..71dfafe2528d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -74,7 +74,7 @@ evict(struct drm_gem_object *obj)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0


