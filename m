Return-Path: <linux-arm-msm+bounces-55964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F7A9FB52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A081F7A9368
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0852153D5;
	Mon, 28 Apr 2025 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJWQUC9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2263B21516C;
	Mon, 28 Apr 2025 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873848; cv=none; b=IrAAA9lOUJ19xVFU2esMNkGY2LFgJg55WjnvtIz2f0/Xe4jEg1LzSKvRnqk6bQaVFF+p07aQ22MagvkhKuS6F+XU6JlT3jprybaxYt+9pn0ERk9tv0CbqBXpNQXxuDCMmwLA6DEs7/MXCGfhQMqokWOJJlf2x3r2vVA2pOOifl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873848; c=relaxed/simple;
	bh=nI/0QLldSSj+tXvriM7r6S4HS0IdOj3fuZQnHFp0qAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COlY0Geep+Z5byMq9rh0ZlbCJ3Hssq/+GdCB7szrNUGSbqth949qM18jNigOE/xYeUHtWQ9sqHZIyAmnTUYrHmc5VSIbpjhpPR4Qa6dcbs3UG44Ykc4WyysLvG6FMAZMvEser8suHAl5ANDAKxxaNWASYFfWqQwNbbeyAJGTyiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJWQUC9/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736aaeed234so4471268b3a.0;
        Mon, 28 Apr 2025 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873846; x=1746478646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMivwjTEQv+Bt6XgKFbGkfEppkRTdRM2MuH4o96ETLo=;
        b=jJWQUC9/K8LMLY8ms8Mm2OgkmipFGYsdT3QOtnyeP5XjWnrWs6rp6G0cMn4M4NVOSx
         Jeramciw8mAkVBoMZpOVKwfvpuxFWir+YinTdxrpL7EG1QtriONiwG5lBg5TqaLnqVTf
         cMVYRzQnlr4w7izbBD4dz54OZgpVUFuVYRxRgrQox5UuW40zEyDPcRhuhybIybM6MmzP
         Y2W7shu100aLAlDjsMtgkZqrm9J28k6XjK+HbtnlZ8z4tYfEMklKOOu+1z1wO5eTUrs0
         tx44RAGQIIzUOKAS0gWd+vqH9FWnhNSoaakD0WQf++kTAbWSWQKfCLPxY5NDZEae70+r
         KU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873846; x=1746478646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMivwjTEQv+Bt6XgKFbGkfEppkRTdRM2MuH4o96ETLo=;
        b=GjpzL3IbbI1t+ZexJ9KGLisS9EnAetMlKZtsiQA6NnW/miGHejMKxt7/rPJYISVFFl
         Q+s5eAVDa7lBGy2sWaQYqy7ZfzrX250OyoeDWiM79YHAaT1Lm2KP/E9tdM1nIxzgg/go
         KqjUDk/g7/LZ6oNPp9YhG22Sm0XSxj4ApS2LXkuA13nNL/UqZVt51ofeKE79du2jsoUr
         O0L7crsnqOXwi8z1YAJHRINf4CQT9RSVwuZwNLlfu2l769LRPNuHqwCG+z5dhgyRJoy7
         KPvL+wfcRl9EldvBYGpWlb5wiQk/m4ey/t8jCf1iZmR/wn6OPrm8lErqLTDWcmLSZ1Wh
         Bb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpaxMg/wqDaQvQVMwpe22NHf825xsJXcx0cmU6/7kD9pOA2hIbzjWwnku/5IxqGXtMma97LeR+QSqo9MMF@vger.kernel.org, AJvYcCUs9w0dbUn/0t2XTkqcy2shszbdV4jWR5qHp8xrYoddiy4tLka1dFN3lRMV+8FoAt5uNGbPDv0XA3XE8Ag6@vger.kernel.org
X-Gm-Message-State: AOJu0Yybz7fZgEsAdOlaHtNTggiZxCp0XNb3mJC1YNcWBfeRPyLn4oB8
	9/sKvRa92+03zpxRi3l9r6dvnE1EsbUGy06pf/L1CQ2KncwM9zax
X-Gm-Gg: ASbGncvsAW2MAUjZ3dbz6PoXLCXmJRaV3MhPgn+IC4x0xSF/eKgGL8Z2ywnFCSMi2pg
	Z5GTe7PsHJ8X9TtRSxgUYNbL/dOF2yLp8AZZ5Vvm+gqsOecEHJaqz+LlY5lA4WA4LmR5GDh3heg
	+y+RGMdCbpazPEht9DLzswBAxDBegi4YIL29DrMoMKxXHz5ZOBW3sppXPXJukE+ZysewKil9dSe
	PuAIOkUVO6RyVWkdolv98ySE7iREbbqrlOLH2MyP8i9LjzCQFchZH/m/zw1LfWGYvZCvNXrTglj
	WZgWgVBhcNpUDCLu82jFqbKX8SsRYrg5yYaflsucmB0zgbo0w+hkjIAhqxwhBNpaCCjoCYwcV8+
	zmzegZ/7CdbH8owg=
X-Google-Smtp-Source: AGHT+IHemaQe6cVy5mFexg+Mw/1KRtL99pVrjJx6X48nmsxpBiqNp9ayGm8uhMvM+ahMGWIhG2J3UQ==
X-Received: by 2002:a05:6a00:4b15:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7402713d46bmr1789183b3a.7.1745873846351;
        Mon, 28 Apr 2025 13:57:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f77032basm7737395a12.7.2025.04.28.13.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:25 -0700 (PDT)
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
Subject: [PATCH v3 17/33] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Mon, 28 Apr 2025 13:54:24 -0700
Message-ID: <20250428205619.227835-18-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9cca5997f45c..d85bd638f684 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -415,7 +415,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -593,7 +593,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0d755b9d5f26..da8f92911b7b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -111,7 +111,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index bbb2ae1cdf45..265c82abc658 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -21,7 +21,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-- 
2.49.0


