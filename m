Return-Path: <linux-arm-msm+bounces-58521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF8ABC64C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47D21885689
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F76328A722;
	Mon, 19 May 2025 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ6d/Cyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3E28A704;
	Mon, 19 May 2025 17:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677289; cv=none; b=IjBuHVB1rYdHpHmHym23XHUrRNXZkPDomHiKLw5UXoeyCzhVlHPPlsT2EJIr09VufUJyDhOvcAmlMiX6Bxs80nX3K3iDtCoB3bDCrXqZyWD4YUldrrXXMtVF0spgyYdfr7DwZWqWAimnE3nf3kXjOprOFpezrj3YOf1R2Cul0vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677289; c=relaxed/simple;
	bh=2WpPjdOnE7lRX5ZCDjp17CsoLPIlDS7/qvt4/yxrQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbqZEIRP8Qf5CgGBBXWtnlFamqY/o4EkoLpiEaXWmZPKcRyKrpxNYYDqicC3SyP5fsqaSCgRgQsxtEG4RiV8MZiO09/ykx7tqYdRa7U4Wq09MvU+Ny1uV0cDn2/YlYyHpR0fd2k8cggP+KO4GhpxmE3VC7K/EuahGdceX67oHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ6d/Cyg; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c9563fd9so1440650b3a.3;
        Mon, 19 May 2025 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677287; x=1748282087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=NQ6d/CygaWMMo/wB6fCsLZQIYFxEzRkn0rNyy6lHcy9GZQMq8R8kLfYtAEoj1Gj2xE
         etEgyMsKHg/Ys+GYSkcWkQK2kiHKgjLgBf11ZHFIF/LL3bLOL8HsJRGBoJW5uoQNa3H5
         Fhu1P7omzBT0X0HDBA8IuQmUKLRz0fe3C4mQWr3PccyRPXt6I/P8lr0nnZeCwTkgntkq
         PLCdchmnupcQJEZFLFu4LZVHjmSTEieSZ8EHMwc2xSaGpXHvVFFLnwPIhzn3Qp75Zb/y
         iFaYvS0iKe9nY40/MAIclNbdpKDDj607RKplpRrtefFZORDkiO2bVv0FHY68ALaoNyOc
         aUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677287; x=1748282087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=FXh3ik6qHTedCOrnQnfi8Brjimire8eLftN0EozWr0zvIkMBYEK7UN/iuk8f6fyMZn
         L9Glaprg3ciobxu+XwchGiAS7yk0zUuH+2upKphG+BpgFc/Ng74x1Lct7TRQE3LcK8C3
         Sq2RUrMat/w7HyV7ujPgoI+YJOEp77AGH66DMzHlT5dxuWEoYmHPuWoxHq6OdMQEh86M
         D/dpjNilUJIevqd4AtG0bywXNk67EQJKxQPtLork0ha7hzTAdDxr0dxFx/JkS0uaBTnl
         YqaYeteRi9Cj4MjYfeyWE6f7LJdktTj34Bd/IONuhb4iigTr9j3wHKquq+dR82MAgLMm
         tGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnIBCBG5GdYZfok9Ww+f7NA/6Ui9cufwP8lH68TQgONZfx7ICe5dvvooNgbPwLUrQTDOhrpKhj4BnqyI8T@vger.kernel.org, AJvYcCXfsMUn/IvuAY5qm5o8Tjbaaui0TsBwwUTGSh2rMqP2X8K1boa9JYkRZ9OibJ2PlKGZV4V7ilLi40ue9Frg@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUx/7CVJmm8LmK9q2AqDrtQ3Eh4gllgjyR4r8KmvB2IzJO4m1
	hNvSGPj5Z5ZTRcWj+GnBr21EJ8CvFHnGCNd5cIsheKNZ7CYLHpx0z8dt
X-Gm-Gg: ASbGnct5K2f21K55vMH/lV5OdkcMoan1N//0K6ujfREtin8+TDD2JxVURa47hF6s30R
	gxFTDK4xhQpZmfmRQg2gDO6399/Y6yWBCEV/xSMQwMzvsIFjSV9QX3AX4M2Mwc18ac+BMDOLyNF
	5dICdLOsP3DqiUEzRhiMFDspv7CdSrdJElleTftXLcAqtg7V7aD8WnPQa07E2q5B6scR/CBn5fc
	XaQ/Kz+6hx8Gwf7rYs+s1idqV8IpHkteitDSKgZD+DDDwoF56aTBsB6hjbV6//crAAXWj8ka0uK
	10Txy5FJKHFzEuX+P3Nz1Mge7eQqZrFIppBfa44a63/Z0ORADhz7MYSDTiff+fs0rI6b9SW4qOn
	A7V9xN9XP5Vtbcq9Z8lm2acoRuQ==
X-Google-Smtp-Source: AGHT+IEkvwoassi3JU2FtzTDATo/5K2z8O6vVEhGhJrQDz6ZrR86QLifz9h8DEvlWr3Zl7UexLwoQA==
X-Received: by 2002:a05:6a21:9185:b0:1f5:7ba7:69d8 with SMTP id adf61e73a8af0-2170cc65d73mr20170979637.15.1747677286871;
        Mon, 19 May 2025 10:54:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm6539985b3a.82.2025.05.19.10.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:45 -0700 (PDT)
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
Subject: [PATCH v5 10/40] drm/msm: Collapse vma allocation and initialization
Date: Mon, 19 May 2025 10:51:33 -0700
Message-ID: <20250519175348.11924-11-robdclark@gmail.com>
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


