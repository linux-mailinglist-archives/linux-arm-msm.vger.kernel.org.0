Return-Path: <linux-arm-msm+bounces-58538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FAABC6B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3D4168559
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A66928C842;
	Mon, 19 May 2025 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGEFM45d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A73728C5A6;
	Mon, 19 May 2025 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677515; cv=none; b=el9qleOmLctSB6KEfbiKLPdgdYB1l5+yHm219EENDvFIWoTRg5pNZn60syXI+PZoa9UpGN5kMDK3uCUHUNsvwSid4ihSuiZ5rt+/G/Grk1k3LMHgafreDW5ItU2Mxs+L+E+eOGLVValG1Cpw0PJKIyJqZRoptcgd2xeGqQV8hKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677515; c=relaxed/simple;
	bh=6o6txMLc6EUCt2tZE/ZV6Q3VKko0BSuow8deFYOJUDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlZw+YuiaKGbP/YiLbYMPQ1+CX7eu+f1HCGifrqMwYXuBIwXIZ/LWl2p3Xo/HuDI/LhBcpu5+C97EBi3r+egjYJYnKcIa0EF52zcPjuT0yWa38fsjsnuwy6+l5Nk1//4TPbvVtmi62FUsAcZ2mJb3G5xOXW+0xhhghBN3pYiaiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGEFM45d; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c3d06de3so2145333b3a.0;
        Mon, 19 May 2025 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677513; x=1748282313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
        b=NGEFM45dnWFSf1f4pKUWeUBDeWXZN4Ithdm5TCUk+oSA4KzxxB7l0iNGK/fINtGcEU
         XBkW8Ms/eCj4wROl/Rswz2G09eAtyDG4AyQtpxG27krt9WI9NGnmL+ge4WFkUBiiCKwq
         9FhtvDA3Vi8slHjp4HAH3mdth/T3mSnWm+HfLQ4Jkbw9Ht5KnnPkO2vg1FEJ6VaCD4v6
         Vadwv6MOwAkvsWt5YHJQT9hb1We+UQD/RcJy5Ruvc4ImgEiiSrb9SWJZciF9JRC/htzj
         vZjORk4bG0vYpQjcTJfmkhWDHwQjQDlM9CVEryMyfSXBaFp6KKpcfeRsGiGOpHfXwh9U
         hdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677513; x=1748282313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
        b=Z3WddLksZ6YQdc95nZcAXwC7DqHYsnmGg0KaQCOVfzrO5wTSfEPoVEnbGWX1bK+cIp
         EJEnEioI23KmNVGpJJxWYB9bWPmuGrBAGMFuCql26RN9F47gjxGOeURWo6JnTYA2KPk5
         gCT5/Y/XL78fWZHfY/7oi00bvKdz4ApUQFXpWi3ypirXMPtqtVACtlj6KWsOzKxFDh9K
         NcIMUCeYJDzkAeTf8CuypJNAaBgo4SaNH7e7s4D9LnD1TOCENvZMG854f+4mGWkKFbT4
         BQa5k80TeoDXofXgfIEqlmQ/Hr+m7sQsD8Qo/szWK5KMhZ91ivYWyZftWGdvENeo6q5P
         xd/A==
X-Forwarded-Encrypted: i=1; AJvYcCVErBjyZ5sK1gd1mJOZWCdRYJQiuRHB8ghjFHBiajdVKUt6v3A+s95jUqy13DH6T9QXbCy5qDjVESzWUoxs@vger.kernel.org, AJvYcCVIwIK93pXlkX65Gm7MdBOiMlwUPTsXWZvMKqOXCInyhVnudkcDltn8iiEcNu93AM3ej2K2WgkX7SbtJrMB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyra7u0D591JM7unxUx63UtVGfEGYFU6//mC5DwEi1kuMZqwvyX
	YMB19lqcBlbY0oK1yNmGv1dhOCkFU5CksmIHNQHLDGzyave1cFoKXudo
X-Gm-Gg: ASbGncsn29way4qYnrJOjQuiKE2OBNW4x/AuD7ZqNRHitRSnDpfC2UxJB/duQlJYueD
	fYbR6S2g9dm9GDKZMHaWzybhJQWUmCSpw+EgVuYEsYnEtFnzjRTyF0F+lbHncVvClx3L8E7Wifv
	iVjnlLwP8FIafAjgzguecl8eIKkscrySoDWV7OD6BKmoAqHfHkiRv89d43bKyengPPYrWw4qNo1
	SSnHkjBBB3uMJWLQVH0hXyr+XOb+oN3tz2TMEiil2Dczb2eFlQeMtcgyt2A/mX/aRhC/qOzANKa
	Vh6W1RB/dPgwTqmOpPqgbMmFDY167yoyuZ3pL8V8NTbQZq9N23Wr+2yr95igKPsxPOHqZfoKDoH
	aUVIe3ZOaJvwARVzgvf/Og5Ot2nZbaMz1MKz+
X-Google-Smtp-Source: AGHT+IFUxK2Us5L6gTZXlOtrwuoPQ/zSMm9MPFd7jSFIQ7VrGyhlBc7R6pQsPS3u5sVrKCGwMMnmdQ==
X-Received: by 2002:a05:6a00:3492:b0:742:9bd3:cd1f with SMTP id d2e1a72fcca58-742acd728eamr16972300b3a.23.1747677512785;
        Mon, 19 May 2025 10:58:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876dcdsm6728589b3a.138.2025.05.19.10.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 27/40] drm/msm: Crashdec support for sparse
Date: Mon, 19 May 2025 10:57:24 -0700
Message-ID: <20250519175755.13037-15-robdclark@gmail.com>
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

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2eaca2a22de9..b70355fc8570 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -241,9 +241,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		if (!state_bo->data)
 			goto out;
 
-		msm_gem_lock(obj);
 		ptr = msm_gem_get_vaddr_active(obj);
-		msm_gem_unlock(obj);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
@@ -251,12 +249,75 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		}
 
 		memcpy(state_bo->data, ptr + offset, size);
-		msm_gem_put_vaddr(obj);
+		msm_gem_put_vaddr_locked(obj);
 	}
 out:
 	state->nr_bos++;
 }
 
+static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submit *submit)
+{
+	extern bool rd_full;
+
+	if (!submit)
+		return;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_exec exec;
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+		drm_exec_until_all_locked(&exec) {
+			cnt = 0;
+
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(submit->vm));
+			drm_exec_retry_on_contention(&exec);
+
+			drm_gpuvm_for_each_va (vma, submit->vm) {
+				if (!vma->gem.obj)
+					continue;
+
+				cnt++;
+				drm_exec_lock_obj(&exec, vma->gem.obj);
+				drm_exec_retry_on_contention(&exec);
+			}
+
+		}
+
+		drm_gpuvm_for_each_va (vma, submit->vm)
+			cnt++;
+
+		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+						  dump, vma->gem.offset, vma->va.range);
+		}
+
+		drm_exec_fini(&exec);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gem_lock(obj);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+			msm_gem_unlock(obj);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -279,30 +340,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 	state->fault_info = gpu->fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
-
-		state->bos = kcalloc(submit->nr_bos,
-			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
-
-		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
-			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
-						  dump, 0, obj->size);
-		}
+		msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+					   &info->asid);
+		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
+	crashstate_get_bos(state, submit);
+
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-- 
2.49.0


