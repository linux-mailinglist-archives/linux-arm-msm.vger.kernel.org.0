Return-Path: <linux-arm-msm+bounces-51982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0958A6924C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8215617D9A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8022F1DE2C0;
	Wed, 19 Mar 2025 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyqeF05F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36361C5D7F;
	Wed, 19 Mar 2025 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396118; cv=none; b=pK2eyveW9GsP0d7GPVPFlTq5NxSEuoLg0mVhCuKFNP1DQIRF8kSlYYo64+YuBMsw1XuR1lfLbWriD/6uTk5jvurwwlEyWEo919VCnIx0bbqncuafor8l5llqsQlqPMLn2UQIMu0Z6KIo69me+oOxVRsP71mPbjmo0GjG9GMQ0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396118; c=relaxed/simple;
	bh=560nB3wa8JPZR6h5FvcIg2j3kD7bO+nrJmtCZ0ZUB2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQIEt/Bxt/FB2C/34BeSf8WuPlqXknaEt2W0oBWSX7YgErER7/uJl+8e3GcG/9VnrQmR8cCrib9jeoZmebkf/+uOS4/2m12muDg3mXhQfiRbTQVDgf+/29BpFeQgOS711gSXtfXWAqqwu82E10zm/EPdTM7fakauOBSdvJUIu8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyqeF05F; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso3262300a91.1;
        Wed, 19 Mar 2025 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396116; x=1743000916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9o9ghClyA07C4hTObpMloLPtnE0pvgT4RZs/4ytmhg=;
        b=lyqeF05F/RdDh+8BirUa9l8FoCgHWvwxlt7nuXQpxjXGSgitm781mLT40mgoXZY4E0
         /1b29tVsJlnLQuaovYZgUc3kY14EpeIglgQDYa9xUzpbCwWhQTxQ/tjPOQMDuruSCROM
         jHtClO3tTWp34wclYXpvcLo54TtAqHp5TA5/akjyJfAzQyqv4hGTqsgLPtK1V3rDw/no
         nZQ4lIkT8VtEGeNw3waI15b5IIlRvf287sMICKE1smoSDZWhZNBRXpk+c6CItFHYDo3E
         AYo+TLAjg3hB2t+o5G9vFXae4Sy7MPb0BO7cKsJPD75u1PduBxo0ceXYJcf+glFFYLWn
         RyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396116; x=1743000916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9o9ghClyA07C4hTObpMloLPtnE0pvgT4RZs/4ytmhg=;
        b=tQyvmQ/756Zqs3PUuOO90Xv4OXWwwCksjDrq0unfR4gYPWEAZaeBNUK2ytEENLRiOz
         4OGaWHQ2Nn/9zz4CJapDilaLMs46OS+qnfh+mrePziT9BcXutiJYxQky5KUvtaOAaM5I
         gkv4CeSxfKhL2F78/1k7z3Uh1CnyoXssVcZz6fFeo21lmDwWqaiRSVpky8q7jiLZsP0f
         n7YweVXq9nzUw9BADqCoJbN3c1ZmSW24q43BXGtq7DA0KGwAM+aYAVgPAoJTWmQ/Yqdo
         i8nJWHU33XwmDNRQaPo7ykyl8KYO5UexiyM38alpwMqhBmpA6I8+upSVGfZ9hTHMFShb
         Er6g==
X-Forwarded-Encrypted: i=1; AJvYcCUGzBrxVV7fhhCMUUsa4gfXrmsRpt1cNXoI8A0EHEfXTdplcLihRaO07X6iM4wCoO1axkXfhTBwq7kym6tE@vger.kernel.org, AJvYcCXseZaLYGV5wEgwtRLNSImI2DZdgUjQZKs7bCjfy/08q8RlrE6FB/L4E2ecqLG8XPAHUuUbRsTLwr5F53Xs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqp/ewYybrAaqKX6oeLQ9hvO/iYAxumChjXpJFjGd6KVsUAqBv
	/KhruQIf4Nzf1+u10PkaetEHuF1VhM8l/NlzfRbdyFLcLDEykC6c
X-Gm-Gg: ASbGnctAAdwmdFayiNaqPnEte9X60RuR36ETuqdOA++UnltjeMWTIktMR9YPWv11Mf9
	12Ut4bgW/GMPLlHHiqSgCg6lBcaOebkldopJ85u0rVf3YelaWGSja2iS1vgQunFUR5hI0pKW7Hk
	rSsh57oYFnB7uWnbO0eqUJzcTFvHyBrG+1xXfqSZGfhVJKvM3VnQdOrHA5QNAlwryHR0Q1LBcsV
	LBGdACUkVau7H4tt5xapkWyN8O0FNjO/kztNrLAdSwDkss7PMy0ozNaoD7Atcah3rt+uEKnBnmd
	uA4aUT58hgS3mdqPVqk26T5juuGATGO1t65fXA4ni3aTax9bkkVbeLA3JmAGfpNVahrZjAXXj0J
	vjonWJugqH6e6/y+m7Pk=
X-Google-Smtp-Source: AGHT+IESGz446nj65kMylJg7WGLLeVI35K62WmvD4n/0MdQAwude8TjaYWISSQUbowHgQj0n2LPWxg==
X-Received: by 2002:a17:90b:224c:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-301bdf84fb6mr5011147a91.14.1742396115955;
        Wed, 19 Mar 2025 07:55:15 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5d0d78sm1668031a91.46.2025.03.19.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:14 -0700 (PDT)
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
Subject: [PATCH v2 09/34] drm/msm: Collapse vma allocation and initialization
Date: Wed, 19 Mar 2025 07:52:21 -0700
Message-ID: <20250319145425.51935-10-robdclark@gmail.com>
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.48.1


