Return-Path: <linux-arm-msm+bounces-57894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F9AB7241
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64DF28C2BD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392C4281370;
	Wed, 14 May 2025 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGT31Rm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69629280A5A;
	Wed, 14 May 2025 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747242229; cv=none; b=XhN6RLh0nm2z2QBfkJGwiChE2djjRnNVCXDNretdKPZ7/wQlGblfiG2HLpvskYQO9aj9FqIlPPfAnlgLAax1saB40XDZ/5MKQRX0hQBm/5iXyizX+wfFRiOfYTbW9ds+15xhZHWJnf0bIzmUnE2rzCeWKALL88pDO3G55l1GGOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747242229; c=relaxed/simple;
	bh=2WpPjdOnE7lRX5ZCDjp17CsoLPIlDS7/qvt4/yxrQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPiZlj3iSdjugSNG5b1IFieY7gRkN1FPLR4VDfgyuOGi21udGUuwjyqnZY81JtSIbcxoNKrS/pMRkU3+PuTn7mGGcNSu87qsWxzpfU6A42bV3b4Mo9NA4xnC147raw2xSuqsH08CZImh0A2HWVYeTTmbYfI7yzFjBiv1EN/jNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGT31Rm+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso162328b3a.0;
        Wed, 14 May 2025 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747242225; x=1747847025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=OGT31Rm+jlljElEekBc/4WUqE2ARMH60IhyZTh+xs4lO0Gr76AzPb7SSRgZP1mFsVj
         JVR9clNm66C76AmYQ3Z5bbsLyYmKh2jgCEYnlvcGbS7KD4ZrDab/jU07OJuwcm/0Ybth
         0d8LCGhNL9wyp0Q7Y8gyp9rRQ/sOx2NFSloGcTNMyUK8cWuRVk2z8P203GG2Nxk7mynl
         XSrdUy0u85iHfH17gj0xHTV2rvXvYO/XSXnAHObWxmfMbZRC0NDTPonq/mAGxXFucsAu
         //wwuF7U2Rfaz/TckZSEjdtAa+XPjQT4vyFEaYE3ucKFCvlvmzsIAODCj8js+n+RiG5i
         CSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747242225; x=1747847025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=aQzC4JdlAmo80AzAHYGz8lFwDLqJUt7HGRQcM9Xm7GG9Cv8MutYtw0j3/wTCz40Wr9
         xUsbGur9/XZxx78WdzRpDruTDwLFQ0wVQx77CD79eBD3Wi+Vka3uFAtvu/UqDCSaV5Ii
         fFdNr5RBCHxj+kMKQcmQEVZ1p5KRs0lksbnJNLae7s1Uu7lhlbOGhWG6dLjpEOBEo/F7
         HtIVUgoJpPbZkvRdHXcbNlbSExPiViU3QRwzzd4WeJjNzQjKy/vC9XE3wN3OjY2XlYh8
         4gc8W8/ZvVWIuCjEPAJW1p557az/z5/hUoIwOcZTY6ei3SVsP4QKJDjRfQHWi5VPUOCo
         Xp0g==
X-Forwarded-Encrypted: i=1; AJvYcCWIQESc50wGCRFBij7KTTbbxkPtsaSinmqv0Kwz2VT7t50FKtjMp7q4hMg3+5Lr9yZmh4GvN75j7qeHC0JW@vger.kernel.org, AJvYcCXzVDRySCjBVKbMphgQkKUq+mvYZDHR18/PTnKEPi88otJwZJFJ5jRbE3e6ZdO/Tn8deVWbZ3ztZS4WO/rP@vger.kernel.org
X-Gm-Message-State: AOJu0YyjVsmITKu8TsQV5zZKQknVdK/XMCrWflgey4abZlmiiQ8C53Bn
	69/rDCeGQjz3csES6hNqaD+HCmUP3lz9fsExCnnINgk3xMJJyrbk
X-Gm-Gg: ASbGncvbaX+14n+Ncgj4SHWivnSaU+R5DaQ28VMa0/Y7AmQ4aORzQpw8wKmzMRawFtn
	6EGXoG+Ho2ckix46XKSmKyR5+3BjZN7AjKDQG5HKMqq58CLXkwKVduRFH7fezivQUOl8Cx2zy7T
	OauUdRnPix+LgDQh1bkNPSaF2+gCByFKIt2zBrOMHtdHZle0ieLmTvPIBdC91K4F4R4hayem4NW
	WRRigv2veP2Q6v03O4+a9Xo9koME2wNqaTIbC50pH9iyk8dN5iqsK9rS+7ITH9HsJBI2d+lNEU7
	+ct5rbGm6xdMPCVm7m/S/5qFTeTSqzNh/Yey4mErZxrRyZFBEftUAfsUf9RDBuoAG7qXhOA+1lO
	SBFtTN+/DhvOFXssL2zdiAbFSYQ==
X-Google-Smtp-Source: AGHT+IGfKsH/YJoljsqYatcFXJhDCdbv9YL+0dsBSHBH6NvuU5sSC3Rj1HW5LCWbfSjAfbE4fmoZFw==
X-Received: by 2002:a17:903:4b4f:b0:223:4537:65b1 with SMTP id d9443c01a7336-231981a27f4mr68873495ad.36.1747242225161;
        Wed, 14 May 2025 10:03:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742d13sm102034515ad.90.2025.05.14.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:03:44 -0700 (PDT)
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
Subject: [PATCH v4 10/40] drm/msm: Collapse vma allocation and initialization
Date: Wed, 14 May 2025 09:59:09 -0700
Message-ID: <20250514170118.40555-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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
2.49.0


