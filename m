Return-Path: <linux-arm-msm+bounces-55971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7DFA9FB63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E571A872AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6D52116EE;
	Mon, 28 Apr 2025 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFKXT8xe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67C21ADAB;
	Mon, 28 Apr 2025 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873864; cv=none; b=rdPajctI2u3N7KtQs8/z6MUuuF94bqonndPIFY7U7v5L9iYstpIv2Bea8Rj5Fwppjw3Q4Sgnd02RepDOTrmd4828LuEk4FAj6Lh5ykA13JnPg7c8aMzRVVwGdP1rDc3eenjajcDqICGjkZDtmO2wyVviGkKYpBBOVn8vQ7g1TEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873864; c=relaxed/simple;
	bh=6o6txMLc6EUCt2tZE/ZV6Q3VKko0BSuow8deFYOJUDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5V0v97SiitcFxWm5CBmMMEu2j7HfayFngAnLpYTg4PiTfaZgS4+VZEFw2hnEGj76an0eseZWbRcH9u70qzdtbHbxWWi/AGCQMKPs1X5FhSJZQAV2l8DGcjWiexRv8mzVEX4+CJ0Isz4FZHdVgMTxxFJ1UC/eL4/soYzQmgscpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFKXT8xe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30384072398so4596137a91.0;
        Mon, 28 Apr 2025 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873861; x=1746478661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
        b=UFKXT8xee6x3ovGlEDisac4sxVosTWzV0koWwHUHUdvO+0QdASrqdGwaynIH9xfQQS
         QyrdgezzSC4FMKxurnfL4XF73jYsAuG4G9MMu/9oDIlfVrzPhs7cn/8bSC/Tuk9jwtOj
         2TveBnt+8WO8BSXrqi54a8YKKBf00LE6xECoxm7T+YuFqYD+HEtoVer2Royubeq/+5vn
         lkN5HD/WzefNGydR0FBAUWiJUl5710bkWH8UHVs7Qe5iOAplubJAVeFGG+XQ4lxcmYl9
         ifg4L4RMD5T5pl1EFZVHb3xbaCFgMUWPCpTttVJr97/5oWCu6A3dMLjXNysBZdw5T8C+
         bxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873861; x=1746478661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
        b=usulylPGHqyiRltKh2HvinVLQviUgHFxzRFZVbYFf0zq0KgM1uY4V96mvc9IgRLGfW
         YcpE7J3rM53NOE4aEYjuBJVrmRKYRsa9Xozbf38PI7jZXT3+srjs4xhcOHyLj16HKYhf
         AzgP74yR7PVd4bU1gZZGpzEPZQTAW1Gu1EFsPn0p+dBZjYfqDRVN2JNxFkoPX1iK8ten
         Lb0Vr3OwCXOMeu/thioliBX/9MnuxcNbfDRgzXVkZ7S7VR/SYwxfpjnPJkAuCLA3KDQ4
         08MuM2hhbXPo7Tjw0qSQYcQTGGOYJGyK+MjnJTy0YPPvf0AadH3N23m0SLXHSKs9Iw7F
         nXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9NGFqps8okwu3XYVn15sOeJHvp5H5YIPbUhc2iLqagsEtE/6xTgKFSHw2IFPSE/DnDrDJhxpcRKGRpuzy@vger.kernel.org, AJvYcCVicNQsi/Fpz3fIC0A9u/LggqLpneGz1GtHYh2yUZG2gtrsg+LtNqE+1fW7ymBAlzk7zbOmsyEf5OjK5cw5@vger.kernel.org
X-Gm-Message-State: AOJu0YzhIsll/ed2Hf7pts84UFT9iJgolQ1OC5TsPI+FLXUYawF6LjgY
	YXuJidH3jBmb8VYoIvhxB0EZF/ZKsroDc37tLkAxg2dL68qi9f0K
X-Gm-Gg: ASbGncvW+c8LpbAUWvnSbTiKAwsusgF01eHxDLB1PMMAEWdsCY2etM21cSrCmwYEB4N
	+n05mKUS+t+f6lXz8oIXHAjGhlixSJZHRekDql/E/EBXqev0ZRjKu2e0PJxl6jDer+yiuIVhT6x
	WT09dsopQXfMa2rtXzgOfN3JJqael+Z8ZFcJOC+Ztg3bPUSjSFBPc7CrHk4CI9RpfzEFvdt9uk0
	jCfUyW7LP07nYACa4S+WdAKElhM/wsnysBDDEdv0Bf5/zZUvZabgEgM5mBBQTNTOo7lBuyvxVNY
	hpGyyJoYeiSlFQTQxIgKGeY7R/jLo6e7rLQNbVI3zRzz+g7LKK8CxqqYZd5NcIiyBM/3LQ0O+Hh
	ETdFPlpWtNZ1BIsw=
X-Google-Smtp-Source: AGHT+IHGblZmjYEovhWRsH3Z4hP/77P++HOl6hbzbI8bABh5qSjrrzi0UekkDjCe28bJpEdMz/aiqw==
X-Received: by 2002:a17:90b:5210:b0:2ff:6bd0:ff26 with SMTP id 98e67ed59e1d1-30a23e375a5mr275743a91.34.1745873860976;
        Mon, 28 Apr 2025 13:57:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7760d7fsm7697761a91.21.2025.04.28.13.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:40 -0700 (PDT)
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
Subject: [PATCH v3 24/33] drm/msm: Crashdec support for sparse
Date: Mon, 28 Apr 2025 13:54:31 -0700
Message-ID: <20250428205619.227835-25-robdclark@gmail.com>
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


