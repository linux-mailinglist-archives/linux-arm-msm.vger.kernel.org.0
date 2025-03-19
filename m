Return-Path: <linux-arm-msm+bounces-51999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE6A69298
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A12C8A20D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4857C21CC48;
	Wed, 19 Mar 2025 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnxLcZrn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E521A92F;
	Wed, 19 Mar 2025 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396158; cv=none; b=Lm8sZcS3/orPZY4n9l/5xOXxeu/dsQ2y1ZUXMlHDgWuaIbWVN6amzQ7jPhWZtxgFcAKFKeBWhUa2UzbHKBrUVPG5nPi+zahrBjfuJKnNH29/aY5qvQ/+3IUoFIZ5q13JyFGIphUS1MjDLICFpIOgyk5062AAeSorL+wBoSffCbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396158; c=relaxed/simple;
	bh=vvEcPlK3s58XiV/xwu9CpE4wF7xeTRvpA4b5qkLWYYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFFouDBB16Lu88u4L9EZxG8NKj2kgcBYa4HApnKF53CWdPWpu5MJoKlm1IV38uPuLbT01P0PQiqK8CCHOOlpn2S1yfqzuh6yDYlkm6qk0VlhmoPMJcbEEuoqsiEMKNUusXVHkP1EcHJxMHbqPkRIYqcKuut9SVPnUfCF05K/zAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnxLcZrn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2264aefc45dso23524575ad.0;
        Wed, 19 Mar 2025 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396156; x=1743000956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D08iU4HNjMQuncNoMHRtvLgm/o9EB4ZZJ6auL8xvp2Q=;
        b=hnxLcZrnBI8Maa4AqCnIe/SnyNQDmtU3GvujrC5AIjxvZBBoT2PyNxF1V9GpLg7GZ2
         +bU/r3FdYWSWdYshPYR/RkXvEwy0M+kNO6Ton+4cTV7q6tEaqz042h1RWjwvVmZem/0T
         8cH9S45fEabq6Oy8eKTI6sKaZpgZ+eUKU8Wvr+jcDKusKkgCRL+CptEWH107W+0kn1+V
         sDFT57I5TirpXHoq/6S87cyxGpuLQEcx4YOY217bP2CFa+cib2nvuWSRAVzd3S4Knv/K
         kiZYFmaEXe9r/V9rzHc4kYgZVf4IJLr0cwfg9ANk0wvps/7fCb2WKvwsF6bpUV9HDeJ7
         4sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396156; x=1743000956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D08iU4HNjMQuncNoMHRtvLgm/o9EB4ZZJ6auL8xvp2Q=;
        b=Xc0VvNRfOvpdhVw59AKknj4r1oIJdQ+KMTFb3pnISTNDlIqR6ou0Gr9iN+BlRIhASj
         aBLxdeiFOa7wTwFxxQpGg3wNWJl32TsVvUG+RuZrT6TgB+yUYnj535BK3p3EoBk9JAWl
         DqT2FC97M9QLoEWFhGpN3XqoPAsurELgAoaAebIydf+2LMt/Q5eBj7uszJO+ZcrNY/0+
         xaZZiU3z6pAfnw9TuMuiNv9FPooW6AR1YgiEoKvKSTk7xMhMkiVvuy9i+MSEt+YK20fV
         Q7+lfjnbyBddBzeZkOC0dRhlIyaTxPrKWwtl3ppMlrX9KNCz+RUhxA3K1HdIrpKybbUJ
         Wb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWN+E/i1Vtl4YYorybTgHEGDsLiwoIUH1h/XknuXLgecj5agRCPdb9xXY5lI9VvMm5Hjw03fKebWzoPrkHs@vger.kernel.org, AJvYcCWlhaB6mZeh8CLEJARs70Mpyd+9lUSx+7qWZjwS+SBMUYyizgZDDI/Qvd9eMgFuu/GLMCqtnvorK6HiIVa0@vger.kernel.org
X-Gm-Message-State: AOJu0YyDf3Mz0T+pZXFEjM+oSGPZn5t7dOSkcJgIHuFsnHEIfMFTniJS
	OejCOurqMnRyYqWWzhNHBYkg4oh3XANFF4dHjPYmCv5+OgO5Kabu
X-Gm-Gg: ASbGncunOur8J2LZH/roGVxWcyF1+Ea/Tn4L0fISM+C/GTAf4QnsYoptT1ZXXJkjxjI
	DYwPxFFCpY1MZ5Wrd7t7j9rgCkvW9K8+BN6m7qMBbgp20r0CBKj2UitkZXMKgQaGDJWDQHT6gbq
	PcH7DVcECPWd0AkKHfK6VBFwG2izHJD08/heJGyldiSBBeEacn7jgXfpV94hL54rL3TG11LBCzY
	S2d7UJ6R35nkcCzvbUUjnxk8aX8xj5p8WzeYFQGhA0hw3aJ0M6elOqzC0c8TNZ9YNXEgQPm1dco
	MY03OS/xE6qw2i6JFv6et00kyTLbHPDhTQxeXtR4zPzaEKm0USI9vdiKtHlwToVpN/gFk/0+CmY
	z2YSg5brUtLWQYp5THbrz5q+l+qCFfw==
X-Google-Smtp-Source: AGHT+IHr7J/3njBmlr1aPAWAlW7J4WxSjPaEbuE4k28sara3wMuWM/iCK9GgeAO5Qywl3XyBMlZ91A==
X-Received: by 2002:a05:6a00:2341:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-7376d5f1844mr4191055b3a.1.1742396156063;
        Wed, 19 Mar 2025 07:55:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea9724esm11057137a12.74.2025.03.19.07.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 26/34] drm/msm: Pre-allocate vm_bo objects
Date: Wed, 19 Mar 2025 07:52:38 -0700
Message-ID: <20250319145425.51935-27-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Use drm_gpuvm_bo_obtain() in the synchronous part of the VM_BIND submit,
to hold a reference to the vm_bo for the duration of the submit.  This
ensures that the vm_bo already exists before the async part of the job,
which is in the fence signalling path (and therefore cannot allocate
memory).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h     |  1 +
 drivers/gpu/drm/msm/msm_gem_vma.c | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index cb76959fa8a8..d2ffaa11ec1a 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -369,6 +369,7 @@ struct msm_gem_submit {
 		uint32_t flags;
 		uint32_t handle;
 		struct drm_gem_object *obj;
+		struct drm_gpuvm_bo *vm_bo;
 		uint64_t iova;
 		uint64_t bo_offset;
 		uint64_t range;
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 5c7d44b004fb..b1808d95002f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -278,8 +278,18 @@ msm_vma_job_prepare(struct msm_gem_submit *submit)
 	for (int i = 0; i < submit->nr_bos; i++) {
 		unsigned op = submit->bos[i].flags & MSM_SUBMIT_BO_OP_MASK;
 
-		if (submit->bos[i].obj)
-			msm_gem_assert_locked(submit->bos[i].obj);
+		if (submit->bos[i].obj) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+
+			msm_gem_assert_locked(obj);
+
+			/*
+			 * Ensure the vm_bo is already allocated by
+			 * holding a ref until the submit is retired
+			 */
+			submit->bos[i].vm_bo =
+				drm_gpuvm_bo_obtain(submit->vm, obj);
+		}
 
 		/*
 		 * OP_MAP/OP_MAP_NULL has one new VMA for the new mapping,
@@ -309,6 +319,11 @@ msm_vma_job_cleanup(struct msm_gem_submit *submit)
 {
 	struct drm_gpuva *vma;
 
+	for (int i = 0; i < submit->nr_bos; i++) {
+		/* If we're holding an extra ref to the vm_bo, drop it now: */
+		drm_gpuvm_bo_put(submit->bos[i].vm_bo);
+	}
+
 	while (!list_empty(&submit->preallocated_vmas)) {
 		vma = list_first_entry(&submit->preallocated_vmas,
 				       struct drm_gpuva,
-- 
2.48.1


