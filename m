Return-Path: <linux-arm-msm+bounces-63024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B042AED0EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44B677A30D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026B026462E;
	Sun, 29 Jun 2025 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPWB+XVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31AB263F2D
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228237; cv=none; b=Rqi5DEODvucyeDH+GosOeowp3Wiijr2S0R4H9QMnYCDTLI8RYzpkQj4Ul9BcINLIOkVrkeiyT6vafgpZSM4wjGbSgqHW9zt5jDgwluasdLe1mF3zpwj3PhTyJN3bRQ2BdMXibw/GYLoW/v4EnpQdkSzdYqEhmp91WV/sxGoblKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228237; c=relaxed/simple;
	bh=Ovqye2wwked0Ur0NdxtBqJxZ9D15juMbG5BYQBw2MHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuLp3gaPD3FTDsIpYsQY/bqRMskidUrMsKTp6ZSdA+3gr9R2mNex7Mdze2aY4SsWD1AAMDIxHJXGd7huhNVag8p5DAA0/sxybfJvE/z2tmsxYxN4cVVKZ8R/RuKVwSWQJ7BsmIY9ulxsLZIp8aoL8t7AfcNK+0PjQWDumpNHnZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPWB+XVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJaqmg029289
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I4qWRLNE0J0
	R1zX7la3wdwz6YdoD5A69AfGQZd1gOIs=; b=MPWB+XVG5OtwHb7sUuW6DPsSGRq
	Smd2SKfP2PMen0zmPgM6MwS1DTjzCI2zL+SiprO5JvTL+W+Zg1CLpH2tziPsEb42
	zB907MkPm4ziBjM3tYoIPwjIUId0AOaFwwyAXF+CE5gymphQaQ4bDt7l3SrhLie+
	ygJqhOZ31vrpAn+yzXxRi8OlFES1ppbmEwdrGmiqKbhC6FZUoOR14hW/IlGlsBfz
	yLT1iw7JYl5pB4Rfibca97HXkx/XqpWxJ5x83IVAu3haD/gJxlh/A4gFgOPr6s36
	XvJFuJkvsigufsGqak3UCBM0rCGQGpagexxhUrTMipC8pFYCiTSLJz+vkLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2355651d204so29542215ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228232; x=1751833032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4qWRLNE0J0R1zX7la3wdwz6YdoD5A69AfGQZd1gOIs=;
        b=kryfLNUe9hYpfYQHX8pBUqSCKacIwMYAg57O5aVZBtOaVfK2snFwpdoDmK6X7Gk8Gc
         z7Ap5j77txsxQ1l1gRB60ffFrI1PMXFY8mIf/ghyrQ301g4blm/pu7aO7xlZBwkTopGS
         J0D7QkODGHS+ot/nXatD/68i/JhXn+g8tn3w3PJgmFRC3jcKjgTkJgTUyuiwJxOUhmsn
         sQar5QCpuy1+MQe0BpTIFWWPQwRz53owXD/mkKvczXknO3dEdl9RAWJIhBSJhA7UXrss
         KLW9XGvNpg8lQR1kRWR5VpkxJ8OV8VWE3532pUz2EKSMXzmHknxeTQmuq0ySAKJkn9qZ
         L9ng==
X-Gm-Message-State: AOJu0YwLcLPHJlmUluObgbHaK5lA7aUudjYMvVrlgoK5fKVYfIv0gXjx
	EJheXSWHZa9aiJjSa/3BqxEIDDovxX5veM7vlFaoiMlmPXgC+AEPHTK2+tPkWeEecv4Ou3aIaLc
	FcOzi/nbWcpGEGAaqTIsJsLn5CKArODh39XonBs9cCRZE2LM5lcCQdV1aMcCjQCwhyoiL
X-Gm-Gg: ASbGncsoZncXSza/3u8Q7gj+EvDiG+rAi9DC6bB+FsfTOdWLaXvsfpHWhRYaes67rOc
	aceEhLMSjwRVuihjkHiXjFI2ZLI6ahgOlqQ/jj9vTxXa+0LJt+igIffJwVr9MGhuPpvHv8zXERs
	210EMir3skPfxIZoRsPslv78frN26TfU7YAasQp1CU4nQIFlu5xEt/0wAKCHftxjNjHHw8EZVlZ
	D+zWRfJnd1PDfZ+CxrMRDsDL+gB1QK0g4GQbMDzwZAt2YKdvUU/plmB3yGUiC6002d5a6Kp/8k+
	ce3jxy/VRl6aaSigiZXfr3hohqWnnNLepw==
X-Received: by 2002:a17:903:481:b0:234:a44c:18d with SMTP id d9443c01a7336-23ac45c8ac9mr142686695ad.22.1751228232491;
        Sun, 29 Jun 2025 13:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXgqXWLpWh3u413uLHW7n8uV/SIdZHu7UXlZEtqI9HdxNrR6GQmrfMw5kPbpgEqNBCAovTHw==
X-Received: by 2002:a17:903:481:b0:234:a44c:18d with SMTP id d9443c01a7336-23ac45c8ac9mr142686435ad.22.1751228232046;
        Sun, 29 Jun 2025 13:17:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bb29sm67006285ad.137.2025.06.29.13.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 37/42] drm/msm: Add VMA unmap reason
Date: Sun, 29 Jun 2025 13:13:20 -0700
Message-ID: <20250629201530.25775-38-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f49 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=S93TA_zjY9FrSvCmoiAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: oDn7lQ-Au0daS_4nMGwsVOuDRvaS9_RH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxTYZT1nMxJlQ
 qCIgMhPkDdf9nv1HMCsOXE0F8Fz4Hwl5m/utUMYpUcx88P0/4QZTSyq9mi/QRZ1Q3SxuWhaw1Mb
 GnGpcl48j/iaw+6GmfqopJv2vgOg/DHVdXRCPlTO0fWTa1OEDJNqlIif0MXEQi2MVUpBcvtdBjM
 swJ2pF7sEHHfAfwNTMfjVK8c8CDhWyK1AIREN72Tv8jK3WLVoNiAs8B/Gm6Oz0ZrkCK43+/Ta1h
 /byQ61UEjyQxh00H7ZG0fDUX3xoT6hvdrxoqbrLUqoGM5IqboBvOxWqV9speSRU3UzpyrYJNyU/
 T+Tg4MNmQl5OmdGS34tJL7hPhs92l/YB8cgpsBJqhC2eiuqBCW6HtVRKhXANDor+oLYGUu0VvIY
 /E9C/3r2f09vDce3DCQaF6KNK60GTFnQSpW1D9xFFdqyM7Cr3UQ/xIjjqfR+3ZqUNrZ5eEVT
X-Proofpoint-GUID: oDn7lQ-Au0daS_4nMGwsVOuDRvaS9_RH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Make the VM log a bit more useful by providing a reason for the unmap
(ie. closing VM vs evict/purge, etc)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 20 +++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 77fdf53d3e33..e3ccda777ef3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -43,7 +43,8 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
-static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			    bool close, const char *reason);
 
 static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
@@ -57,7 +58,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "detach");
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -97,7 +98,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, ctx->vm, true);
+	put_iova_spaces(obj, ctx->vm, true, "close");
 	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
@@ -425,7 +426,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -440,7 +442,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, reason);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -617,7 +619,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_unmap(vma);
+	msm_gem_vma_unmap(vma, NULL);
 	msm_gem_vma_close(vma);
 
 	return 0;
@@ -829,7 +831,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -867,7 +869,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1079,7 +1081,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true);
+		put_iova_spaces(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 062d1b5477d6..ce5e90ba935b 100644
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
index 9564e40c542f..63f4d078e1a2 100644
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
@@ -863,7 +872,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 				drm_exec_retry_on_contention(&exec);
 			}
 
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "close");
 			msm_gem_vma_close(vma);
 
 			if (obj) {
-- 
2.50.0


