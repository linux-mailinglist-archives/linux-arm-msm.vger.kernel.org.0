Return-Path: <linux-arm-msm+bounces-57927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D50AB73E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70945188714B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06145295506;
	Wed, 14 May 2025 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZABJ7V8Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B32949F6;
	Wed, 14 May 2025 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245433; cv=none; b=YDv3MZlrLzoHoiuFzu6aXnbGibJkwpILDTGjavNSuBNoiGfCoCbVrusHk20PxZu2duiFCVyRdK7e+OpMs8zEC2QlcDPTa2RHDVC78SiMqjWvU3/PbmpsA6b4xjvV/kXwx7m6qBL6o/RlNRjxfdWAYybY963UYL6Mu3i5RwTFf5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245433; c=relaxed/simple;
	bh=6o6txMLc6EUCt2tZE/ZV6Q3VKko0BSuow8deFYOJUDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6O2ZD/TJyOw3omM6lOzu0nECc0g5+Y4ISr2+aFZXmOaXiNJs//YNIu0/Waw3XgCEa7XvbnuITS8GMA7WTVR6N7csj7/hqYbgkLW5/EtJvdMvJena5sFyO2yK4tRbYuEjyhDBDwglOK8cpJJMbF03uB61aSWwimdggbHCZhn7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZABJ7V8Q; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e331215dbso9013405ad.1;
        Wed, 14 May 2025 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245432; x=1747850232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
        b=ZABJ7V8QQrcUnvqP/Q55ODWXA2UGEga2s6dChX0l7ZKmKp9UATJicb3NpORS1dIxvl
         qbkto+rLnxC/PQc7bBVYkTkvpqoMbsi4edRSlNMsPaxDSGeiCuRyofH+y8Misjf1Iygf
         aj+8E9w4C8olU4NtsMDIHH20YRbYnej8azbsXr00+cqdiRvQay4UcMkyuI7wm/goN1TC
         eDHp4Z4oYQKuhTYYWEsgvg8xqyV2m1PbwevPHXW/AcNKXgoh+DFOP0C92KqrASIcArwP
         ZCqHpCSixnYYq731mk2QSGPSfRTnW+dOuwfKWfwgkit3ZGi1f/oKOpvoRqiH7Zhu0JiU
         NbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245432; x=1747850232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
        b=VSD4axeY5VqXESSLLjNTWj9e5+c3Pa07QGSx/cSwAgTyp68yA5zEkCEfYlRiyxc/4h
         HH7v5fPGDqeAHfFes5cjkhufUbRsmCs5HtQaxpWUx2OzOOc4vHU+vHlTYG+LPGop88rK
         L+xDrGmFfrOKDscc2Eu/uFGj33cehDGxq7WCB/gDYfvwLGOC8blH6MUzivPZ4ucK18cD
         69LRoOMMnqBQSj0wrbgLC6iJfIVlWUgmwNfjzhsYC+HAOCm/qEqM98ksW02F/csGsMte
         zQowolqoa3hU0y+HXY24CCAWwuqpKzLWy4Ih2EXyKWKdDHhx1j+vv7or0wbx0TJGcbr/
         xD7g==
X-Forwarded-Encrypted: i=1; AJvYcCUw1kuYea4nWCTAgo25+kcR+NGfl8qrUxkYEIg+zCjKSewbtRjuzvV7gbd7qa8Og4ul99mREcFPSS6KjSv5@vger.kernel.org, AJvYcCVxXDibysZTl3QzIGnaSr5DN+STclzzuioR07pvec/9kr4uHNqtVquvhaXGKyODcjLFZqt/Kho4Ky4tegAW@vger.kernel.org
X-Gm-Message-State: AOJu0YyCo3jiQILrrrKOQQuphnJ53WcKF5DIkt9YGNxcbpB3lpG/33IS
	esj1LJKKUtbn5V48Vl52dvEKy0OZz3AxO0RfXjPbU5vXeAfWc5FRO+wkasJ+RA==
X-Gm-Gg: ASbGncuKu5c56xKNYF1lin9xdzLCsWlEGLXU6ERhvc/oZiFtuUfBZ7Bq4V/Uk92V5z3
	mn1ohPPUO1/Q5RHqilfhbrUyOfYuGcOFFDqaBpyoteeflGzfxV/APqcEN799A89CHvvxwo6oaBZ
	eo2owHr69qcnO3qbeGiDbQXxxPPlxzP+KIPH5e342p7CpuRzVcBBmbPwKVHZDpGOGnJEimRWupu
	eVZs9gsjX6GtGI0C/763gRyMhf+xSHLNKvSJ6MTR6aHUd5jE7vONwEOO3cmrxbyxtV8bCwEO9sW
	4xdM7NyS3RoizF+vnrIiXR5xeV0C6EgRHEt74PkHdcxWxK4X5EtDxFxdqcTxwIeKgzaRAh0/07l
	xOP/Ykt9iqeZPwjVEQjzMGEZ6XQ==
X-Google-Smtp-Source: AGHT+IG/+xY6qb4AV9LP07ImSMvm3YeFfAWitThhxMXxaIU6sLb9wVec6ZxoTIx6/t7EiUtMMCTfpg==
X-Received: by 2002:a17:903:28c:b0:21f:98fc:8414 with SMTP id d9443c01a7336-231b39ee975mr6079305ad.26.1747245431695;
        Wed, 14 May 2025 10:57:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2350ddb6e8sm9229093a12.57.2025.05.14.10.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:11 -0700 (PDT)
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
Subject: [PATCH v4 27/40] drm/msm: Crashdec support for sparse
Date: Wed, 14 May 2025 10:53:41 -0700
Message-ID: <20250514175527.42488-28-robdclark@gmail.com>
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


