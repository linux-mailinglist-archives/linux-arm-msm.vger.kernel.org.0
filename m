Return-Path: <linux-arm-msm+bounces-58513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5114BABC633
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12A63B6C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E59289361;
	Mon, 19 May 2025 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1vVtuu2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD678289342;
	Mon, 19 May 2025 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677262; cv=none; b=lrBD28E6a1fgJDmpxxNByXLPHF55gZbvzbciJdaF37UKQfhDESrotWLtg3vZHW4uejKcTnt/SyvW16LRYGFQtOko29hij0zHcqb/RXoYEM2RxMuRFZZGTSshzFfzm3OjI7She7eEA+oep1Ti8rtyYaQ+EUlvwRfGaHlQ7fBaf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677262; c=relaxed/simple;
	bh=tibBYXh+OHMaU82MthggxsnfGTDjqalhpzUjKNyekhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuZIYkf8QhrgJRdnR0ZlHzUdlxMXB8WE/0z3UAQqSz3vNZ6qvM0DgShDnyV2GkaZ0OASfmyM35S1FdkkiyO2JKRmUksy20iPbHW9PAuYkpcJPrMyCOODnzUm2CXNUooZLPSHBh3ZhdT5cXaTN3lRPsnkp5cwC1ky/6oKWsT8vm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1vVtuu2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso4806685b3a.2;
        Mon, 19 May 2025 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677259; x=1748282059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtcNSFug1MEkA4buKrnQDhhH7gHYNLRZJbU0s44kbqs=;
        b=E1vVtuu2qOYopz//eUpl6EwDPPtNMVMV4cCDr3jaZ+sXFupyaVtgTTWW/SO23SgYI5
         qANC//Pia/d04VjEg8KoG8mlXQSqpUNZaXSEmLUm46C2DIlIMzbsTNuI241Ytz94zeTI
         3oG5Jlhzy1fpP8zC3nFtFvs7PDwlGA5ETvAkLaxjMM2T4HNFG10y/mHdglQq20ePK3Xj
         6sBa0uELPV5xKbGzq5EkwpyrzPM1AVzYYFD7jCjwJstyilwzNAydKzt8j6L7nYqjeH/f
         I0czVYAJfqhYCOUsXUHIjUOx29480JrSC0+UnKdDLRvrmiOob32AfGgkJKos0h3tSOzz
         pkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677259; x=1748282059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtcNSFug1MEkA4buKrnQDhhH7gHYNLRZJbU0s44kbqs=;
        b=MKLl0e7NsOJfW+ew2/mN9JRbpR7KpopwFxTinPHQ5FKF0o7Yc1ZKZw3AjkdUdzlRmN
         MZCk3PMAGTxPX0lgKyfXcUSCbVOxO1uD5kWI/RUw7nR44i9rA86k+Gli0xNPZVDL7BcB
         3GLDkWrVUixm4W2UG9+gL2d7DJCZIFsKjk4IqbR5/di7REEBtsvsmJT2sqdKgQeHNWr6
         +wEPOe0yIx1WdDPkn4hVmEqow+0YvjgTch0+nJNVLNhdQH4I/isVWwZnnBsU5ciH4hAV
         +ZNnX2fx6bCIB0zSqbT2dbxY3Un8yT2Q0aO8F99mBd8cRTKGMyw04+fPKX7jTJ0CBHUd
         jABQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk0Xg3QSfu+aQu935kmbBiixU3UZsA17k0bFYUxGpwHh1ogercjknp3Miw49OkbRyZbqE0ZqS5OYOxSoim@vger.kernel.org, AJvYcCWjKAvFM77fwUaDbsDWOLRBatsNIK43LSrrzxTHgeScg3e3s9X/ZJ2XgrkFt30P0k2jDiHsKPLLJD8451Hp@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwrHRfaUpUns+ifCPsIBcZoZXjJmjKRJxUAsvnzkfMGb2q3EE
	bpLNCEAjd4gkQRqxGi5Hd1qw8vaV0FKp8103czFszPLnURXspe7AQNPR/p5YQA==
X-Gm-Gg: ASbGncvjJx5qDg8e2AHjidvIvfba0gJ70FFiMFdNYy+N/kH5MURM4FTvwRFXbwI1YLg
	dEE0ASf3BdBlzdX7bXqzrPSyvbLj2z5OjlYIEnlxCZptSSpdYBnn6Hz/BBF0P8Sjr16CfQ+dTxJ
	hfEl83FaldfD617qA5Ex1LDVawiPN0+kePoiT/BRxAU6iNElKJIdHjzkLh4dwqV6n6nR128I7rr
	6+cQRU4PcgiiKm9fIQQgaY1RDuB2CIdROZnvlUjUOaTTOG59OZnkxwUJk8iYJUHltse8CMFkrwo
	10ZjD/oD1yLIdoeQiM94QgdjKRMX2ODEBCdvczMSKG1lzlE42FbEHFqxm1QMeYWMUlmv6xzJFIR
	WTaqtww20h80zTu4GjPh1UMQ1Vw==
X-Google-Smtp-Source: AGHT+IGLGnR2gjVBiS7uWt9d8fdk1foprJrMCPDgzog9mB8/+ApvxdoVytfH9URIqIITFimmH1FxGA==
X-Received: by 2002:a05:6a21:3289:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-216219356ddmr20309299637.24.1747677258870;
        Mon, 19 May 2025 10:54:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb08450csm6611996a12.55.2025.05.19.10.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Mon, 19 May 2025 10:51:25 -0700
Message-ID: <20250519175348.11924-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Eases migration for drivers where VAs don't hold hard references to
their associated BO, avoiding reference loops.

In particular, msm uses soft references to optimistically keep around
mappings until the BO is distroyed.  Which obviously won't work if the
VA (the mapping) is holding a reference to the BO.

By making this a per-VM flag, we can use normal hard-references for
mappings in a "VM_BIND" managed VM, but soft references in other cases,
such as kernel-internal VMs (for display scanout, etc).

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 37 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_gpuvm.h     | 19 +++++++++++++++++--
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1e89a98caad4..892b62130ff8 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1125,6 +1125,8 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
 	LIST_HEAD(extobjs);
 	int ret = 0;
 
+	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
+
 	for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
 		if (ret)
@@ -1145,6 +1147,8 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 	struct drm_gpuvm_bo *vm_bo;
 	int ret = 0;
 
+	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
+
 	drm_gpuvm_resv_assert_held(gpuvm);
 	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
@@ -1386,6 +1390,7 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
 	struct drm_gpuvm_bo *vm_bo, *next;
 	int ret = 0;
 
+	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
 	drm_gpuvm_resv_assert_held(gpuvm);
 
 	list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
@@ -1482,7 +1487,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 
 	vm_bo->vm = drm_gpuvm_get(gpuvm);
 	vm_bo->obj = obj;
-	drm_gem_object_get(obj);
+
+	if (!(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF))
+		drm_gem_object_get(obj);
 
 	kref_init(&vm_bo->kref);
 	INIT_LIST_HEAD(&vm_bo->list.gpuva);
@@ -1504,16 +1511,22 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+	bool unref = !(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
 
 	if (!lock)
 		drm_gpuvm_resv_assert_held(gpuvm);
 
+	if (kref_read(&obj->refcount) > 0) {
+		drm_gem_gpuva_assert_lock_held(obj);
+	} else {
+		WARN_ON(!(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF));
+		WARN_ON(!list_empty(&vm_bo->list.entry.evict));
+		WARN_ON(!list_empty(&vm_bo->list.entry.extobj));
+	}
+
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	if (kref_read(&obj->refcount) > 0)
-		drm_gem_gpuva_assert_lock_held(obj);
-
 	list_del(&vm_bo->list.entry.gem);
 
 	if (ops && ops->vm_bo_free)
@@ -1522,7 +1535,8 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 		kfree(vm_bo);
 
 	drm_gpuvm_put(gpuvm);
-	drm_gem_object_put(obj);
+	if (unref)
+		drm_gem_object_put(obj);
 }
 
 /**
@@ -1678,6 +1692,12 @@ drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
 	if (!lock)
 		drm_gpuvm_resv_assert_held(gpuvm);
 
+	/* If the vm_bo doesn't hold a hard reference to the obj, then the
+	 * driver is responsible for object tracking.
+	 */
+	if (gpuvm->flags & DRM_GPUVM_VA_WEAK_REF)
+		return;
+
 	if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj))
 		drm_gpuvm_bo_list_add(vm_bo, extobj, lock);
 }
@@ -1699,6 +1719,13 @@ drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
 	dma_resv_assert_held(obj->resv);
+
+	/* If the vm_bo doesn't hold a hard reference to the obj, then the
+	 * driver must track evictions on it's own.
+	 */
+	if (gpuvm->flags & DRM_GPUVM_VA_WEAK_REF)
+		return;
+
 	vm_bo->evicted = evict;
 
 	/* Can't add external objects to the evicted list directly if not using
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..652e0fb66413 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -205,10 +205,25 @@ enum drm_gpuvm_flags {
 	 */
 	DRM_GPUVM_RESV_PROTECTED = BIT(0),
 
+	/**
+	 * @DRM_GPUVM_VA_WEAK_REF:
+	 *
+	 * Flag indicating that the &drm_gpuva (or more correctly, the
+	 * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_object.
+	 * This mode is intended to ease migration to drm_gpuvm for drivers
+	 * where the GEM object holds a referece to the VA, rather than the
+	 * other way around.
+	 *
+	 * In this mode, drm_gpuvm does not track evicted or external objects.
+	 * It is intended for legacy mode, where the needed objects are attached
+	 * to the command submission ioctl, therefore this tracking is unneeded.
+	 */
+	DRM_GPUVM_VA_WEAK_REF = BIT(1),
+
 	/**
 	 * @DRM_GPUVM_USERBITS: user defined bits
 	 */
-	DRM_GPUVM_USERBITS = BIT(1),
+	DRM_GPUVM_USERBITS = BIT(2),
 };
 
 /**
@@ -651,7 +666,7 @@ struct drm_gpuvm_bo {
 
 	/**
 	 * @obj: The &drm_gem_object being mapped in @vm. This is a reference
-	 * counted pointer.
+	 * counted pointer, unless the &DRM_GPUVM_VA_WEAK_REF flag is set.
 	 */
 	struct drm_gem_object *obj;
 
-- 
2.49.0


