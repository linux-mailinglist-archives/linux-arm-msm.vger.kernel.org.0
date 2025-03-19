Return-Path: <linux-arm-msm+bounces-51997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C3A69394
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1EE1BA3779
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AB021C18D;
	Wed, 19 Mar 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6ug+hVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3621B1AC;
	Wed, 19 Mar 2025 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396155; cv=none; b=Az5H0WMIcSb4Ug+CQxBDJZztQCVtqX0kclEeu68A5OYuen0C0+MuDa93rzakUQZAcMswstCMetaQFnB+u5/U4gIT20tmP6dODz51cVZpfeYmfGNBls5i6ZrIGpyHHhYqjie9V7OUMnu88XNrUrR5n9TSqKH8ALvcVhnyvaMXTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396155; c=relaxed/simple;
	bh=FwxaUtuGUGnf+03W7aSRAmknTmY2nh4vyXLrmgsC2SM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGvYme2MkWee7t/teDu90PVwnr7T7rsM02NGleUGs9AF0VFmG85dd9oVrqjKpy6B5otMChZvBblNozW48YZmrUIN60EKQfH1JKH7zYs+klw6ydbLZArJjeeFP6bFFruGZ4aOpMDeA6mAGA45rpHSxDFuzfyz8kmrl2UNVcL89p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6ug+hVe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224341bbc1dso135052505ad.3;
        Wed, 19 Mar 2025 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396153; x=1743000953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtskW6rdhWE0A0tJOFKFCUzMYzKfmRFhzl7PyUes/t4=;
        b=Y6ug+hVewtLjeQXRzfyto+Xe8vjzAXP+ciLVqVbfmwNC4JnxbLlyvIXQ4xvmUftGze
         CmpwZNh6qqkOio199TSYsWK5VSpoT8+FtVSByo54ryBb45SXMzajesrtqmAAavp8YqEB
         /k5ELWuyneGBMGRwd6xs0/MYLW+SPpsl3mOtwzz8o6xzGQtcPiLZxZSaGEdZoVyaISNk
         ZzJh0nAkgxdKU2f1RqA1Z45Uumeihvo+iIectZiAyHqLPfXdI6ruEyITJuGMLm0xJWK4
         tdb7mvqMvt4ZS39Rr7NiAf9jNrxOe7Nwu/UVnCahDwv6lcF+DbrrdCSFthVBeR8Un5oQ
         32YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396153; x=1743000953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtskW6rdhWE0A0tJOFKFCUzMYzKfmRFhzl7PyUes/t4=;
        b=iMix/MzmfPoBHFuqeEiw3Vms8v/FT39ZNq7Y9ID5ccxveprORXSRZmUpi7E2WKGVrZ
         MwnYMkA0sks/mENsdH6N0IpUtaQqfx+LLIwbFhaBqImj5c1qxtgvd6YP4N4VgVSr7X6g
         hzZUqoWSJAGyjUWwTq6ujgecxazF5frN+pq7i97egdiy2AhjnpFNNa7nZS8a3bMal0Or
         u39C9zm6TN5Ziu7u7sSHMQZ5/k7qKI3pd/naJPYUNWaqCrSAXBF4LOFOLUY6JpZXwz6b
         TZJBab/zb7/Yj46Byb9+gRs+TVonguMkL1v6/HkvZOPB5JF2t60Fd+jbpICFEzTndFcg
         T73A==
X-Forwarded-Encrypted: i=1; AJvYcCU7uCAJ3nX27DV0uDkSvVtGHuj44FsBcolgbyrB5VW644ge+cCLDgB2oIqXlty4z9J6GzE8/NFdbh5zkffa@vger.kernel.org, AJvYcCVcOaWe137AbEofzuI36gzlCvCnvjSJfKO1bvdqvdBEo4qrppBYKbmwRw7yfVBLg5plpdPIb6+gWdL1qgZ2@vger.kernel.org
X-Gm-Message-State: AOJu0YwsIKQy1HbfFSTt+DZBrjF21CjBkOy7PYYYOecnoyFEpaAq84HP
	x/Ymbh4uNhm+sK66/HRQ2QUFHPTVOW3bsD3POVzoTb8wF2V7fM0N
X-Gm-Gg: ASbGnctLhB+1x3nLf2/4pGemkDnl0nLXS971+y06P95PkHdsH3EOXjfODJlyey31bE1
	ZaoajC97Gfw6kSud/zOkEMa9XrbWR4vSMMeludk/o5UCpvQDv8KsU2vhXJbFxWzLsvKhrk1IVW4
	F7TB9yEcAfewLlsDl+ZiLroEwUtAmH0vJqVvZIEP+CRGrZHvwFAhglOkbpNxtoScdx4iBlhpsGG
	RhDrylqf0W+SMTHgYNf59eASZkcezyhcjwH0kMqUIFfdLMTepNMjcPWjYSuofE6fYGR1b3tUpkw
	0gnJ7CqA4yU7rf+StMe91r1dendr8TrQGbD/CA3TKLgmnn3LnlRA8DCyOWB8uwmsMjsLa2MLf5Q
	qBREa/o1D89GzZUQgZQ8RSzwuZHpWDg==
X-Google-Smtp-Source: AGHT+IG6wCp6TlA5EcFXQS2zFAxUCtLNnEc3uD8oXoV+1DTRNZ9SvFOcNery9DY95MRlGiEtjpK1Aw==
X-Received: by 2002:a17:902:d4c7:b0:21f:522b:690f with SMTP id d9443c01a7336-22649a57d5emr44840415ad.46.1742396152544;
        Wed, 19 Mar 2025 07:55:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe4c5sm115221445ad.192.2025.03.19.07.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:51 -0700 (PDT)
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
Subject: [PATCH v2 24/34] drm/msm: Split msm_gem_vma_new()
Date: Wed, 19 Mar 2025 07:52:36 -0700
Message-ID: <20250319145425.51935-25-robdclark@gmail.com>
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

Split memory allocation from vma initialization.  Async vm-bind happens
in the fence signalling path, so it will need to use pre-allocated
memory.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 67 ++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index baa5c6a0ff22..7d40b151aa95 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -71,40 +71,54 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	return ret;
 }
 
-/* Close an iova.  Warn if it is still in use */
-void msm_gem_vma_close(struct drm_gpuva *vma)
+static void __vma_close(struct drm_gpuva *vma)
 {
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
 	GEM_WARN_ON(msm_vma->mapped);
+	GEM_WARN_ON(!mutex_is_locked(&vm->vm_lock));
 
 	spin_lock(&vm->mm_lock);
 	if (vma->va.addr && vm->managed)
 		drm_mm_remove_node(&msm_vma->node);
 	spin_unlock(&vm->mm_lock);
 
-	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(vma);
 	drm_gpuva_unlink(vma);
-	mutex_unlock(&vm->vm_lock);
-	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
 
 	kfree(vma);
 }
 
-/* Create a new vma and allocate an iova for it */
-struct drm_gpuva *
-msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
-		u64 offset, u64 range_start, u64 range_end)
+/* Close an iova.  Warn if it is still in use */
+void msm_gem_vma_close(struct drm_gpuva *vma)
+{
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+
+	/*
+	 * Only used in legacy (kernel managed) VM, if userspace is managing
+	 * the VM, the legacy paths should be disallowed:
+	 */
+	GEM_WARN_ON(!vm->managed);
+
+	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
+	mutex_lock(&vm->vm_lock);
+	__vma_close(vma);
+	mutex_unlock(&vm->vm_lock);
+	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
+}
+
+static struct drm_gpuva *
+__vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
+	   struct drm_gem_object *obj, u64 offset,
+	   u64 range_start, u64 range_end)
 {
 	struct msm_gem_vm *vm = to_msm_vm(_vm);
 	struct drm_gpuvm_bo *vm_bo;
-	struct msm_gem_vma *vma;
 	int ret;
 
-	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	GEM_WARN_ON(!mutex_is_locked(&vm->vm_lock));
+
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
@@ -128,9 +142,7 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
 
-	mutex_lock(&vm->vm_lock);
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
-	mutex_unlock(&vm->vm_lock);
 	if (ret)
 		goto err_free_range;
 
@@ -140,17 +152,13 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 		goto err_va_remove;
 	}
 
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_link(&vma->base, vm_bo);
-	mutex_unlock(&vm->vm_lock);
 	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
 	return &vma->base;
 
 err_va_remove:
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(&vma->base);
-	mutex_unlock(&vm->vm_lock);
 err_free_range:
 	if (vm->managed)
 		drm_mm_remove_node(&vma->node);
@@ -159,6 +167,29 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	return ERR_PTR(ret);
 }
 
+/* Create a new vma and allocate an iova for it */
+struct drm_gpuva *
+msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
+		u64 offset, u64 range_start, u64 range_end)
+{
+	struct msm_gem_vm *vm = to_msm_vm(_vm);
+	struct msm_gem_vma *vma;
+
+	/*
+	 * Only used in legacy (kernel managed) VM, if userspace is managing
+	 * the VM, the legacy paths should be disallowed:
+	 */
+	GEM_WARN_ON(!vm->managed);
+
+	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+
+	mutex_lock(&vm->vm_lock);
+	__vma_init(vma, _vm, obj, offset, range_start, range_end);
+	mutex_unlock(&vm->vm_lock);
+
+	return &vma->base;
+}
+
 static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
-- 
2.48.1


