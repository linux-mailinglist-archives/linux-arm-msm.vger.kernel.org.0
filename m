Return-Path: <linux-arm-msm+bounces-52005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C2A6924F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF1527A9A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF6522156E;
	Wed, 19 Mar 2025 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExlfGZ0w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA722069E;
	Wed, 19 Mar 2025 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396169; cv=none; b=EjWR8crAtG09wJuI+yDNQzbtfpvqT1XEKOsagc3TOPF3xzuUKNGvqXZ/iDbW/mYVJUJpVR6T3xla1N0fPv7t1d1gH5icFxjb4FhM/PAu7M+4CrHcHGZcGPukog9yYNMyR1lK7DHkmSpHy9vXy2d8DuwZ7ykIuqpW9RN6xQKbs2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396169; c=relaxed/simple;
	bh=uIfgqD7C1i00zcyeb/y3LvhT1Dks9hkfIXrDIFz061Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SySw7/5PLZBPV2/7JiLac+jIjA+12rJeiqAimkvP6iIc+eZX4ak1k/1qoFVUTjMTzqTQOjFt1gI0ZkNFSaRQVqdCS5Dktmvyy6T/Edk7uPGSE8HMAC4/IikWBLyFyCF5HcdWceKUZEsPOWKuBgLoRYfWDI6horTKIsHscXnhulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExlfGZ0w; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22622ddcc35so26913765ad.2;
        Wed, 19 Mar 2025 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396166; x=1743000966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iJJUPboSKZ/bv7FjvwLTYQiRkvsdluYBcqCTVGU80Q=;
        b=ExlfGZ0wZiQ8kQUS46Cn3bKMsmEhRLZGbnf15639pEle6WeySI5Fuw29wEIn0uQEi3
         D0kijxOFcHBT9uaHhrU/U/kQH20byLNWRxkEBn4AcA9fTB4SjBKWbJzCEV2yocxiVz7V
         CX2PQJwVQNNY1f1b79ljRXJavKAfQiQtgCfmZ3n0PfmEewRaMkeBaVFrSPbNje2nEm8j
         5EQrC+tSEZ37qKhjIv7SrihfGZ8l5HK6Se1gPvs+tsv6ReihXAydDO9vhpDCwL8xZTOY
         satYGwKxzQ3CGrvXKk4SuJUIAVr0Mj0mIv76K/KyngPZQ05wqZPI7Yh8p2mp1YIbDc0C
         Cx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396166; x=1743000966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iJJUPboSKZ/bv7FjvwLTYQiRkvsdluYBcqCTVGU80Q=;
        b=tDuL/aoPItssOIYq4heeQkbgKnZ6HFDbI//3MyO5jw2ppu6Xi0/F0jLLm4bGrvuF39
         GpWAEX4apkn6BukEKX913wvSTZ02anBwQLrbNHpCPEaOSFB18S6QF7xmIz3QOaz8mmtD
         6z8ExmIUNY1Pb/sadYtFLTdtoRM7ni7L4UdNvy/FSXF16zIShoYCsFuZWvZEphbRd/kY
         HByfQw4GCxt2iJ3nOPiDpTHm9e19US1aW12nL0LuTQwLl1118q3aNoVIFsFf5jBrazur
         6I/KW8vfTXdMvE6KGVX2rp+5xF7xfRKhbx+kPIvYDWUzuljusYM3L2R2RB8FcLpG4X/u
         K7fw==
X-Forwarded-Encrypted: i=1; AJvYcCUhByuAKqnz8XIpTy/FzMURHMLkElVIsA6NQwt87TWb2hOIfFyxD2rX89oHFOva90+PCiP6Np75AbPjNMn3@vger.kernel.org, AJvYcCW3Ac+wYJwcGEvplEbpOD15iJtWz3yd+4/BNbj8QQeg4yjM3tQn9mfd8FDa5q0Z+wZkSZzlMwYkOCcW4tIJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ME9cmdBr17c6rbvP3VO8eeCTUAVVmqsepOqXY4xIictiYkRK
	8ROgpigAiOs1RCXrZsMlzquWuJQfkAtTI7SRC4ZVtsFhqqxYrZJK
X-Gm-Gg: ASbGncsQ1AZqUxjM6fk03fIqsPznjXJ0qFjr+JPvYl9NGBoFN3Dy9zMp+ERWLfUG4kv
	NaKsL8g7W1dXgQg8hfM/cBJDyWB6c3i86Z9D4BZDdLVokYZNUppZhBnKK5mDIY/UUzcEWZK+vKt
	bVjW50tnaJb7S04Ywum/vbsG/i2tOwWeKyzEO9Qr8USnfMDvMThnw4CECSlSV/cx/qw2pfZds0E
	qhmw6mnMP1elzbD/eOC+SX8iXpeT/gPyQEKtPTDpLG6+A2mB5ScsCSX6xHnNaaeh1uMJ6WPQg+C
	yDabZGhu37QCshgxV1stR+QkdVWMVk64ndGDQCBm9QZWEB8GXCi53wZ/eQKZPTDRGRsMNX9VZK3
	qsrUZnt2t2/hpjL4rpVw=
X-Google-Smtp-Source: AGHT+IHerem0/qAVd8w9wdi6CqAo+LURLK868SOtur7NURzmdVJu7fqFKbLZ4OivC08XjLdtTOT8uw==
X-Received: by 2002:a05:6a21:78a2:b0:1f5:80a3:b008 with SMTP id adf61e73a8af0-1fbecd36bd5mr5863055637.32.1742396166652;
        Wed, 19 Mar 2025 07:56:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea041e7sm9254606a12.44.2025.03.19.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:56:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v2 32/34] drm/msm: Crashdec support for sparse
Date: Wed, 19 Mar 2025 07:52:44 -0700
Message-ID: <20250319145425.51935-33-robdclark@gmail.com>
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

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 73 +++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index e35125d88466..aca943dc0cd7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -257,6 +257,50 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
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
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		mutex_lock(&to_msm_vm(submit->vm)->vm_lock);
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
+		mutex_unlock(&to_msm_vm(submit->vm)->vm_lock);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -279,30 +323,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 	state->fault_info = gpu->fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
-
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
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
2.48.1


