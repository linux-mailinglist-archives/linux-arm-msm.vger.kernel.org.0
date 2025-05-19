Return-Path: <linux-arm-msm+bounces-58548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FC8ABC6CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AFB61B65CF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B625428EA74;
	Mon, 19 May 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgpcIYXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0343E28E607;
	Mon, 19 May 2025 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677532; cv=none; b=X+1EA8QL+hHL5BJnwMyK/Z9v+5wgVOx7H8a5N5C6UU9KNDXe6dFgws/vmXCn0NEt0nguSWWZLfF8YXZFTqf7xu0LmGu4/3rByCbcMBtFukbs8ZkWLKYZqAN5DUv1q2bHYJ4pbQA+7pQYWVWh2+4gabWcxMgMPs3A072mK+ostjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677532; c=relaxed/simple;
	bh=epRmHIRuy2Vf7a02MfjZMmzVd8AkGnSuTiO7naC5XiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L75JZQqEsu5LbwmxJ87OEjEpBvImWOHOyMeHCv8w1GjROpI4Vp6Dl22Z0ZYMJTb2Kzyh9jkD4fC0ydV9iYStdLBhgwUI8Iv4n7igLNDI6ra1n8ciqWq2QZP0PIeHiz3QzktThjGtxTEdrVbtxJiozmYZ8rE7C7WVgrggEjQpq4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgpcIYXo; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-879d2e419b9so4106785a12.2;
        Mon, 19 May 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677530; x=1748282330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRvWqClmxzKDaPFD7FcWvt+afLEJ4x6S3/cKoULGmM=;
        b=dgpcIYXoHe0hzWXrYxtDMm4gXtaO1bVHdP2HtEegpIZnAaN9AMWKY78iG1zZ/rmofd
         mKX0cnjhTrRbBa523I2j1kN7k48OYDeF6/SmmnJkmdy5xfZpUE8iQsSBp4LHfZuEZmR5
         0Qff5NPGHPrqp//+s/e9RaZAVZ2rh2ucV7aGO7+GkFvkLTdNwln7YrESnLp4V6yAmEAS
         9vk+64HJU1JCFa2X0ePJvzTr9JfEUs3OYL92YkuvusVRELWpuiDMdbwdd3lfMWsSeUXQ
         mFDkm1Wwt91Mnl4uNH3vnz7QLeHoFhqFl7M51CUE6HD1qnqEJ77RoCj5958rIheQk2td
         BBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677530; x=1748282330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRvWqClmxzKDaPFD7FcWvt+afLEJ4x6S3/cKoULGmM=;
        b=hZVXnzh82LEP0tRloH/7jNZhIbKP6KRDt6sLLRQfFjvwHIgtWdNJrssdkYUHGxJiUE
         Ga0c3FioJOGrz6dVdYiXt/co8geKLwiNmzWS1paUaHxroXl61QpXAmg6lzD9POSieq7C
         kFiJuUVsIigZ/8Zm8DV3p5Jy6oRJOIMVhIjp/ykEMtCS18E9mY3LJ5xBSUoOz9MuxDob
         Il/uc760Mf7+A88i2gexPnRJ7894V+KH+9mpXMDNp2ZfoLffcuZNZhFmGpYjmkqK1vgL
         d2QwIvKcWc6I52XR8buNgwwl6t6QHG9g5dhgUdWvwxKkMBEtwTyF/2uztx7V/vCzCq14
         Tp3g==
X-Forwarded-Encrypted: i=1; AJvYcCVbe4eDtOR1GZ3UnIKk3zdxQLb1Elp7p3IAYjVc0EY63kcaFGhhx9diPjHweDaa6fx1CZe2ItLZgnrOdRCx@vger.kernel.org, AJvYcCVjyqRD5INXbO6d/yh8D4PNH/W/lWhdF1Er6rOkcRvsrSj6geSzT4lz5fGRMeCzGFfX+niYAFVN/UFfw2B3@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKBg3UxHm+2kOekd1HE1gPGYuvoxxpNiBhNSaswfS9M2BCSUa
	3dnY/4pSe3K8LRCxgq5u6a/WXiSqZSouQG12bYp62uhmxksZxOpKrZH8
X-Gm-Gg: ASbGnctcb7HkE2aHlXrIuDpaDr/xwX7CgMj85qMZ9n7yp4cTL/CyVj81+DJUEKYK7S2
	9O/moi8WhHdTASNzRriMZzACQmgi2AUyciI9ibDpnlAHbEwic5GCEK5ue3RJwsuCso+d+pH24Kr
	nAcZFNxIAfqCbh+i1aisOxH0t+jW90n39yV3Uldf3Q24PuqGmK0s183hQCpUulVYzE6AgTKOik1
	Z5W/6lCx1j11pDzu3wYz17uyQJhqpfzNdl5MFDBRNKWjLxNBzu3Rhx64r2BAUxdTetchG5bzzS8
	OXJsrGfw/g/4oYwvqIcX30br9kbxagM/AqaKxT9TrNmP3HkMWn20l3t8TdhNWpa99AFN+QdcVlY
	LzXJ+1xfTIsWU1NhS0uSkR2+Xrg==
X-Google-Smtp-Source: AGHT+IFSCRME9JDUW5z8EzZUYG4tLxuEeEsf9R+XNpuY5fatJnRhvLSh6kee0oW3SatZc/zFyCJFtQ==
X-Received: by 2002:a17:90b:1ccc:b0:30e:823f:ef3a with SMTP id 98e67ed59e1d1-30e823ff012mr20546249a91.30.1747677530269;
        Mon, 19 May 2025 10:58:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d58ffa7sm7660063a91.43.2025.05.19.10.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:49 -0700 (PDT)
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
Subject: [PATCH v5 37/40] drm/msm: Add VMA unmap reason
Date: Mon, 19 May 2025 10:57:34 -0700
Message-ID: <20250519175755.13037-25-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Make the VM log a bit more useful by providing a reason for the unmap
(ie. closing VM vs evict/purge, etc)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 18 ++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 040f0539baa5..bdc99aff3130 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,7 +47,8 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
-static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			    bool close, const char *reason);
 
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
@@ -80,7 +81,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, ctx->vm, true);
+	put_iova_spaces(obj, ctx->vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
@@ -407,7 +408,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -422,7 +424,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, reason);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -603,7 +605,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_unmap(vma);
+	msm_gem_vma_unmap(vma, NULL);
 	msm_gem_vma_close(vma);
 
 	return 0;
@@ -813,7 +815,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -851,7 +853,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1063,7 +1065,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true);
+		put_iova_spaces(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 4dc9b72b9193..1e9ef09741eb 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -168,7 +168,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_unmap(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d349025924b4..313bde6447e4 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -53,6 +53,9 @@ struct msm_vm_unmap_op {
 	/** @range: size of region to unmap */
 	uint64_t range;
 
+	/** @reason: The reason for the unmap */
+	const char *reason;
+
 	/**
 	 * @queue_id: The id of the submitqueue the operation is performed
 	 * on, or zero for (in particular) UNMAP ops triggered outside of
@@ -242,7 +245,12 @@ vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int
 static void
 vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 {
-	vm_log(vm, "unmap", op->iova, op->range, op->queue_id);
+	const char *reason = op->reason;
+
+	if (!reason)
+		reason = "unmap";
+
+	vm_log(vm, reason, op->iova, op->range, op->queue_id);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
@@ -257,7 +265,7 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_unmap(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason)
 {
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
@@ -277,6 +285,7 @@ void msm_gem_vma_unmap(struct drm_gpuva *vma)
 	vm_unmap_op(vm, &(struct msm_vm_unmap_op){
 		.iova = vma->va.addr,
 		.range = vma->va.range,
+		.reason = reason,
 	});
 
 	if (!vm->managed)
@@ -865,7 +874,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 				drm_exec_retry_on_contention(&exec);
 			}
 
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "close");
 			msm_gem_vma_close(vma);
 
 			if (obj) {
-- 
2.49.0


