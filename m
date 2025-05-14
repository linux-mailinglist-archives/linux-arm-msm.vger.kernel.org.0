Return-Path: <linux-arm-msm+bounces-57937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC7AB73F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B417B3AD628
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB07297A76;
	Wed, 14 May 2025 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+MYnpeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C13297A54;
	Wed, 14 May 2025 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245450; cv=none; b=Bv9UHPshWweBQJjFPwYSUvjUhCOkfHad1+a+SgwdmZ6KCKjqdOGXePLzJsRl87Vvltp2Z/nCBcBiXinaXCJD2DxGrj8ACIlmCe6Nw35WfcCZITbfsIx8qhuh7wQvIunXZyluFHq9EyRMGkI74FSlDX+TJwyBBuaZYzFTwGRGG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245450; c=relaxed/simple;
	bh=UcAqZvFDt7U+BW6VIBHyV0fcphdW1QL4Jq129FgGGls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxgT8PKeGCQYBDEQpHw15/UVghcTvp1mBS4jXHAPHhMcx13AY+RrIKRnliLWgtvL49yAFwchL02eNnKkUFFm3sGXQvem5GpiixqoefanjfxT6Dq4PgAFywWaBXr5EGwDICfyUkrkP1PFHcRAgRvWAjIzJVjQGMzOZbYtbn3fmLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+MYnpeI; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b20d46fcc86so7138017a12.3;
        Wed, 14 May 2025 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245447; x=1747850247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWkSHzWYylgZiENJaCxVHoO51rhOHK3hhQfmyoyKh5A=;
        b=k+MYnpeI5fleU5g5iN+P+dofpq+UnSdFHdDWTG+Ypee+/JMPWXzWRfNus6f3yL4cKQ
         kCWjVQ0z7CMijTPT94VXxR45CtmQXbMtD01wLYIkHIPyAYGWlJ2GLfvk3fNT5SFcWJ7f
         cwhLKkk6OHc+LJxmQ8imWwfaELrzTI2w1ezBJ89yOkGsBmNyXk1ccc4JdcR0eO6tHajl
         VFEOXhzN1I6Mp8lIrz6dFeHMl82MEJ9jO84Lxzkn0gNpDb2eWZ+rpOvfBI4RwEPxsSgb
         1Vs61tGyuGekMiNUpzdN0/Jy3O64aj3L6o6Z2/1huwrcjurURrS46O0yLL63ReKlEbWV
         QdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245447; x=1747850247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWkSHzWYylgZiENJaCxVHoO51rhOHK3hhQfmyoyKh5A=;
        b=YLb0Kktcb1dNVH9FXo764LmgSJl211vqZSp1gO0+oeQI8iUw8cg4vxdZ1DfRXbx1t+
         F5qIZmoTrBIg0N1BFnIJL7EpjwHKnr4egDCpOkkpneLJiH9aQCHTcQGAFoOLuP8wgKR3
         paPNRWqf4ciMEJSAKJwbK9O5Q60ZvqCyfSqm+57vcKPrOck7oxWUE+BLYaC8IDCKPe/o
         eeB+F6y6qYVJX3UPLoCkkDJg9fQdmvFkH8RgfxRo5a3sOiZP4wGw2yej6n/lgWBYqNL2
         2vQKmo8m7SrUjn+7t+W9M/izVqtVST9BViKDfnB+eVvIWEmAZxfXymzsGp2JLLJ7gLD8
         OWBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYzn1XLJu02YvChVkm3MEj/4o2epbOWJjw38Sy3pSbKd5/uKrCg4fQT4vytlEFJo/b55wb2V0Bpd3dPUmG@vger.kernel.org, AJvYcCWXYTTk+ck+fW6FXMxot5JUidkRkFO23LpTZrzDUtpShs9b0b4CqDlyqYmNGXBceiKvUe+blqcghWhvJKcw@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6cTfVKetSz6A6DDM6igmJ4hTrWH7FjFtUoGGreVGODhemAUJ
	9v6mK0MwcB864hAquk6rozDwcakRO9NyjgC8T5+whQe5GqgRZg10
X-Gm-Gg: ASbGnctlNT/C2Rh1MbDU0zm1KRskjbkkvr6M56xutI6eHTon6O1dEaNQCbbG75k5eYV
	TEbFd4nCYyGDmpLYWuLZadCVVCXDrtEk8J61piu1LiGixyCWFW0/z1yfVY2tZM11O01tSp3lifG
	wRh46c1EcLygjyy4ZaehSh5Nn+JU/kbE/CuHSvUXyjcqTi8ac4thOUCeYhhbHOoddkN3HQIb0zS
	Pn0Re0LbBsoLhJuPbMp485WT3Yuw0rJZAJVWFXlBUvD1Ep6oEz+69zNwJ3zL0nPUon/vtxzrnak
	ytQFKUuUBIbu1T7Q1fHX+fTx4jKCCWhg++lRJ084OQLRDEKX+FmHcP+A6Vc9UrzpTnF1aCt9j2P
	U3udVoYvnaH1Y4x5Ro62Y7lSJTg==
X-Google-Smtp-Source: AGHT+IFYuYMRJAhJDRGLu9iVmy1TI6zuaZ5P8OwLSfV5nLRJ0P/fFpkMXPAZk2X0myH4pcKqikjmyg==
X-Received: by 2002:a17:90a:da83:b0:30a:20d6:ed35 with SMTP id 98e67ed59e1d1-30e2e620ef9mr6036477a91.23.1747245447279;
        Wed, 14 May 2025 10:57:27 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e37f23f25sm1656627a91.13.2025.05.14.10.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:26 -0700 (PDT)
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
Subject: [PATCH v4 37/40] drm/msm: Add VMA unmap reason
Date: Wed, 14 May 2025 10:53:51 -0700
Message-ID: <20250514175527.42488-38-robdclark@gmail.com>
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

Make the VM log a bit more useful by providing a reason for the unmap
(ie. closing VM vs evict/purge, etc)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 18 ++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 09e25bacd356..abf463d700b2 100644
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


