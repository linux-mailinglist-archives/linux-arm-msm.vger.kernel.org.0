Return-Path: <linux-arm-msm+bounces-60399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD98ACF725
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61960188EA0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F0F286D59;
	Thu,  5 Jun 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UC4FJCH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4505327CB06
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148389; cv=none; b=jUaYFemtsQUHDaLEql2W8UDeAr7kZFKIePm7/gTy5EKghBcJnr2OCTxWRlf8Tkpyw4qI9OKynnMmUtk2I0KCbgNDZ8trEat5f3W+qVCBH18FcIBtlskIHrU6Rlw0uZqnNpte5MAzY2OGPShGqErX5EN1DlLej3BzW4qeZgWtgWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148389; c=relaxed/simple;
	bh=cVRNX2A6ELOpK0RfBGNzCk+LFIQL5ZAU1DSg6RQcvzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRoQtyzKCg89keSVMZDRF+cyn5Cc4rG1+dE0k/8w/bZdvWPgZM52P6ViBbwjCwTB2bLE0/gQ7euzuzG64JTvMgGeme7ygjfnnzRQXRz1U2jmJrzyz9tfHrhymFE2nGgbULlW5e+hRCAMlt0yYVn8/cW/YmlisI8yceDStsHCapo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UC4FJCH5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HbtTr005392
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F6qh8d6fUyE
	8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=; b=UC4FJCH5X1JLCxB5ylfxR7L8laL
	9MqIhJsSIs3QAhPEEhv1Ikih6CoaxRVdPGUFvnCgbfSSMa8s5xTTUZEqg94X3QZp
	y9n0luRXoqq8kjh6UI4M2yXyWpINJkJZQX0hP/A8+mFwRYRwpZ9mjqV9lMXaTwGt
	+mQ6pWjwAu04mrjCQ4tUSckZ5CIoWORh7LjUR100dorIuMDxXXoMsAiUDtAI6t9l
	FWMq0BjxWCK9uz3wO94yrSvlLcE+lJ4Zne8ByBpQzh1bY1VrLb9iVBz//IiTIvw5
	dMIilNjwl/mAb0HFDexazbq9pzTLUfeeAmbmfIwg3RlMSczgOQYm5zzx4LA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me1ruy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so6209245ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148383; x=1749753183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6qh8d6fUyE8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=;
        b=fHn6CgB6FG/VUBsvxmluYshWGnZVXEU8ejN1rtzITwl7hEpCWLje48gSBeWCp8kzOO
         Exv9ZQNt4WbRSJMo7QDMIRUqaZWLHJKnlmLSBZi9sOxg1usMkbeb1+UeNVWw453aM+Ls
         Ea7TARPyYIx7diXrPgdU9W09LzyEV1hvDBQT9DrVjptxiccgb83qJocQYnqSBLeU22a3
         reibkfcb09M6ndBxYdR2w9SUPtluz5ArXeUdWLNWrbRpZvdoENaOLGBVJHxpo/LR6gP+
         xoULSeAY4/PnRMm023cskVhgxfiVUqjmhkjakd3/H/v67/L0Veihhds5spOA8a6mXOgs
         ujQw==
X-Forwarded-Encrypted: i=1; AJvYcCVbDerP1eo6cP/ZduWIK8Oqm76MB0pWAs1qCJaMeHJO1JyZlmUVm1dvUHDDzyEYOmwI+vvbl/l+uaSgVx6W@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLUx5udBKpV0Z33JsV8Wn+Et2AAXprUqxQ3FRKHZLSAZLFlt2
	k1gf4TOdlTjv0DWEu6Tw7E7uaAUKmPguWtpMXSlChJUWWXBb/X4n/7ObhQnRTb0QCIoAgHu6Jfa
	md5oCH5QM+AAkCq6XjlDMAMMRKmm1tnUEa9Jx4KOh/C4iSMUGsRVQlvxucSb16MoBOTUJ
X-Gm-Gg: ASbGncsqmhpl14wE/SOvvNfoKKm3I3IlQiRzmeWIZV3ndgCbrcX6aYmSZdeXQtH8JRZ
	2jIWEkimPc1BzsDLEW4r9PCbUaLem5eYxvu3o7vOOxlnu3avUN+7LY6/ueDVPhb3vScH7WRPnMX
	jbKceR4YIP7u3pSloLGaDGrn6hIaKgrDnV3/hPCCHVGVyt6vBT1wf58FbBKJT52UQ7eNa0dz2r5
	gM5irtYavRVWOx/FUzc1oLy9FFEXTrpBTBUs41W6TUipQSFM7TSv4wJaPCqmy9BToo8R0ox6xZN
	eJ93WV4fDYSnZrAgtW/fDw==
X-Received: by 2002:a17:902:db10:b0:235:ef67:b5a0 with SMTP id d9443c01a7336-23601d977c9mr5811025ad.36.1749148383278;
        Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXsjrpMtJeaeFHHJbJYs5K+E0Ts7FRZDqdRwAsfHwOl9dnEOZ4Y9cggfPiVerZSYeeQaSUqw==
X-Received: by 2002:a17:902:db10:b0:235:ef67:b5a0 with SMTP id d9443c01a7336-23601d977c9mr5810695ad.36.1749148382861;
        Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8863sm122351415ad.19.2025.06.05.11.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 25/40] drm/msm: Crashdump support for sparse
Date: Thu,  5 Jun 2025 11:29:10 -0700
Message-ID: <20250605183111.163594-26-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Pte4WLCPkEuLvLDM6fuj368tjU5HBxKM
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=6841e2e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Pte4WLCPkEuLvLDM6fuj368tjU5HBxKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX3cDOEbiWrSC9
 3Fy8na4p3uZcYOZnZTQHhoDRkgoWGY1Cxh0QrGW+G4kj2R4ZqDr36d1Ruywg+Qy0sPNOXzNYOwv
 VnNkHluxUmyH6H4FJPt3YO6ErYU08IkYb1YduwfY2nxy2KGM3fQGHjzmkR8GVKfkbzh8uqBkCay
 EyDC89BBoB/6M+q2iZ0/DgSJhFmS9Xt1CINjyTHJg7OGVs7IZJwohRE5mSjzFdqUbZaZOMxYU3L
 q6ZZmaKSQqXlSTQjk2FP1wj0c/Niunuw7M8N9hNf1qPySi3pwesePJeHUzYAPpSlBKEo11BNHlL
 7upEJOmeqReF7mI2cjyzrPYwxnAu/tOJilgdVJFVE/EqDc9XwrMu/YaPRSjtkf2yDC41hce+kKg
 lFc6aBCU6jyQfbmI7/TDhgsgZ0JlMKmUh1KRv+eqBum8PYHm1B/aygQh8ROPgw88nGhqPYHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163

From: Rob Clark <robdclark@chromium.org>

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2eaca2a22de9..8178b6499478 100644
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
+			struct drm_gem_object *obj = submit->bos[i].obj;;
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


