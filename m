Return-Path: <linux-arm-msm+bounces-57929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 394DBAB73E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE695189061E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A090729670B;
	Wed, 14 May 2025 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpfXWbJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24246296706;
	Wed, 14 May 2025 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245439; cv=none; b=MLqFbeAJ0iKgDJIPVQwjcky0KKHh28ZxR5/45/6bKNAzJ5Q0ieTA+405hSLwpAMY4MDxDgyj1e/3/6xdt96ZRZ5a58W6n0shjtnHlW/ghik8gbwBy9HTYMt3FxN+W9w05i1hrYcGEUz/N3jKkl5VOrwn6Elm59Atm80DKqR3zHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245439; c=relaxed/simple;
	bh=haGZ+UJKDT5zrMmZSLCMqCktSdcIsOAyCJunT6dnxXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHqp9YDth6fJ6PA23lmRDVKp3k0BSaTC59NAygrLCequwsfz32zHPTW32Vhjv5bntwpShUjOYW/95bKavIB3wcCEggfHAgO2bzCncBVV0yn1PnEgb/yXHCnuqO4tBfy9pu7Ievsgsa7fsAs03ojFcVqBrOFonjCGJPu+U7dt20g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpfXWbJt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b239763eeddso3823a12.1;
        Wed, 14 May 2025 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245436; x=1747850236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OGsDvIqo5XclOUc6BEWJUo/roXo2xV2Id3WLdmBtZI=;
        b=hpfXWbJtoIUuvjAwZ6qbgH7lWRtRhPMTQQhDt/VZLu12T3Fja7PuR4zli0+2GF3tFY
         q8sVPwI/3I4UF1iAN30gVo7bqKSdCTo6dR7hAn4V+AATYx9/Djxc39JAjl7nBz/YiYhN
         XUUqzbT+zWqYLJDec9a9LY+hV0wP6LK63B8BmUxnhJ8qDGztVemg/9yo6O9r5Xajhj/c
         r08Bqu2QL7W3/gQ1hIRI/X4C09SHvutOWShOpp1zuVEePFSzglP7bvLK5cIqH62WFjlC
         k1Qlo0uCl8rNnlEKdeyO9MZT356KoTQ8z2SabIhTjy1IGQXy0+qsew39z999T4lniHLD
         GZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245436; x=1747850236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OGsDvIqo5XclOUc6BEWJUo/roXo2xV2Id3WLdmBtZI=;
        b=ZMll3pox1hZoaV8K5kDTGXWViv2JvVtfZZDcW530rbhoXCWmJbsieTkjM7cKJHfbte
         3pOfDzpfS7xykvUPlb5kpsWsdFMPikUcVXiItMzClIsAxzd/mz4mQAWbTXfK7h140RMa
         3m0nOLcNXAO0kG/2NEkc+rYKGinr6oOuBb9sKwMNqEf9TtviES9vG76gKEyh7ud5hxJu
         yDeFMnUQqd4jYedA8sdihXIq4WK1JFIUAEYAi20G9Btt6gSiCQ98nMAlyt/T1KZEvvvr
         iZl/znWhS53dlJ+rsFYeWbRXnGweoGWxAK74zS5QiABbD9BQMZudmdl2Z8XPV69klQoI
         ZdNg==
X-Forwarded-Encrypted: i=1; AJvYcCVuK8lrHjlKpqC+5ahc53j1NOf2RkcWkhTDffQ2skw/lqwE17UA6aUpYp787Ec/YIjeIyXlan5VHRCZ+IjT@vger.kernel.org, AJvYcCWJ5sDdOly7Gx0o1uOFy6MV5M1caqam8d8rOpWgvEUZJ6uixSANbQ4likIdoNeBW/07NhZS7lp5yrxrfMH+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9YNJZU5TQBQsnMKkxerns263EHYfSkVDMPWSd8H/iAKJL7n8K
	doJFTPDgqd9leUgtlnsz9KGsFqfLk1OPcwk8mARNe6LHEpFycf2g
X-Gm-Gg: ASbGncuNBj+qZdXNaz/acXCzXNYqu+mL3g1MYCEk2tCDkY+UwO+G8IyMEtFxGxAOc0u
	dVmqDKHb6Dyddj2LZppCw4i+4wgkjycF32vvqF+m/uGvifTzJyqQz7tjbxJcdMDmsVP9XcWx6i9
	gaK18jz+uWlx7b4CZiC+K/HlzNJ/eSdhorkerNY4VJJOlewgQVoOdPauYSETUUqSXYm8bDJ1+Gm
	qHjz9ep/tadErrViKwX6EuvEz3Hz4NH6657cbHAO1G+uvxW+Z6LEHYeQWq6BjCT2rRHBsxa4JIq
	6COhat6p/cuc9Kb9n9o8QUw40m++r8DP7rd733ubUnlw2at3xh7PSGLLmnp5eqZAQv4oGumhpjf
	+H6moquJq/LG7kRyx2Bs5BCSJVw==
X-Google-Smtp-Source: AGHT+IH9wQlkOPqNW8YQ4kpaCIbRl6H97vWaWszv+E6r2pcAe/TcyCnVu8w4qjCvYmmtQ9fmJR4z9g==
X-Received: by 2002:a17:903:2349:b0:224:584:6eef with SMTP id d9443c01a7336-231981d0230mr72619145ad.41.1747245436406;
        Wed, 14 May 2025 10:57:16 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bf6sm102661035ad.141.2025.05.14.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:15 -0700 (PDT)
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
Subject: [PATCH v4 30/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Wed, 14 May 2025 10:53:44 -0700
Message-ID: <20250514175527.42488-31-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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
index cf152a31d836..f68cccc38df7 100644
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
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0


