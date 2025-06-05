Return-Path: <linux-arm-msm+bounces-60391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ADFACF710
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A4916A993
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2A82820CC;
	Thu,  5 Jun 2025 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnGnsLuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B642281508
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148379; cv=none; b=j2GigRdY+sKMwMQMZ4L9kXacn/FKO75UChSIKwxFKUM2aserpQp/aLb8QFEZmlHGo1DsJuJWwvPG/JGDzNbWLTKgIfc3i0fK6eCW7hvAY54bCGcqpQGjmwKESxim6UAeqv4+2Cj8235OCHzHLYIWexfjEdY1AOdaTK2WB7d8QV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148379; c=relaxed/simple;
	bh=70ksOc5iQpyAgZMAtxMrI+YhBlo1TK2wUkE1lyJmQ6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OByO/r+AfTg1uTFooXU3brjRVEaQiHZARlQ4lyPI5dhj6zTMn0b4XDskpZJZFUTW9uYMam0ybdKww6phr448fR5Gfd2IwviCvjmVIbVqBMmR11/Zjs/Zk1RvbVg1T7/x7k2iv8Cqg6qJ486KXqRXQHm2JSPH3PDcL/63P42XDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnGnsLuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55597JPq004137
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KKzV8zO4Rj5
	qHtCmhXDXV8OJV41Yiw04GJXbLr0rviM=; b=dnGnsLuXUvEm4gmyUVSGleOdhkM
	Y51qDXt5wPmX90elIq28wPpFlZPSjdetBkW68xql+Xbh7ou9d4ImqOLXOt8abFLZ
	YiWgpYMGyH94At2VnuL26yY1MblLyChBHHKxuWFVQlC3ePoX2X8pR08gFXVyplls
	vghh10MnIPkGB9ARioSG5pkMRBEjBh+5eKg3Vwbvk4tPjcSxTDrpt0Wnk7TdNrnh
	qPqIXyss2Lncaaqd8TN6FwIkwqBm0blrTDkU+qcAVHbh0kOqs5STNEnkKLILo8ZI
	IJKvvUHarSCkeOcjtP1qBDSjUvv4/KOvoXCZoL11RE1vxq+z7J5hcgYR+3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2358430be61so11041635ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148376; x=1749753176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKzV8zO4Rj5qHtCmhXDXV8OJV41Yiw04GJXbLr0rviM=;
        b=chr97n5R6TE/3SneNMqd+ADLHRbajuknfN1rvvQUjaw+VJTcVvk+Z2X8DO3FuPmeT4
         P6rxkfYZtC1uyLQdKeVdyRcLfQZlQhiiqDCOKrFgT7ODpNJCZPDI9/tT4FSY3pD0kIda
         MHcuLsQ1ZkLZzd1T1grXMTsUPfyQuVZkOOuJuPOgjHt70DOStQG2EWqLerf0kkm8OwZ5
         5nx6VKvkRrNmkTYfiPZsERSaabFXXAmVW2NO8B/iRyOnylwdQIbFiXwFIpmqPz4iIhuC
         jcguwbp9mzKhB9iYS+o1U9OhwVBLSz6ZnHewlHONa6+jRwy3aH6NUC+JpZ+A2yFZkyZL
         n7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVm5KHD+j61/9u5vDuzHSygtPlT5CHxDcLcszYXqp5Dc9dUC9J1eawSTiGuNkOVvW/bL8fz1sknBTxeQSu9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6uGn2YKbIbIEF69hUJ5cUoWx3ahlyVuQe1w9sRvEDDV6+uCqK
	Cks7gp67k+u9DSHLvMfFet9GAF+RQtRVVWlLEPIJ6Qhd5+xGVD4pIa1aCJz6k88vdYjSbHb4iGa
	RIBbWWNoTIK1LZodbIXGifgo3qJoRILtegZsqzWTI0WDJzdo+3R5gCJ+P4Fuj0f/I41ba
X-Gm-Gg: ASbGncvCvsnts3Cb0buDqpBA/4+sizB9Vwllv44QppDz3QjguWev69RrcOJaB9LV97H
	ca+37K6HmDy6L5Vg06PZYpUx/MCDS/0ITum+WxG97Zh6raa23DjfIDQ7TyuvcFOwrTi3IyW7l4f
	aSK7fLOKW2PvmuAYMWD1f/Y6X+Lh9JScAzkMfWVGkbpU0CrIwPnCUWPViTejkiYtQnkbD11L0Nz
	FAODjJj/D/GY8II8i6R7LRfj+ds/BzLs0TZfsNjOl+V7tRcD9LRee12hJRWGe2aV2NhY5NAD+je
	J4kmj+yrX5tN1kbeR7C5utBL+FsGVzwr
X-Received: by 2002:a17:902:d48e:b0:235:91a:4d with SMTP id d9443c01a7336-23601d43b6bmr6099935ad.23.1749148375595;
        Thu, 05 Jun 2025 11:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH3weqzHpLNIjHLtP+uTqlW5dhVeoRV0i5zYxxOgw8DNZkhQvY7brneYXfzI8UWx8//Zxt6Q==
X-Received: by 2002:a17:902:d48e:b0:235:91a:4d with SMTP id d9443c01a7336-23601d43b6bmr6099545ad.23.1749148375181;
        Thu, 05 Jun 2025 11:32:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdd034sm122650075ad.92.2025.06.05.11.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:54 -0700 (PDT)
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
Subject: [PATCH v6 19/40] drm/msm: Lazily create context VM
Date: Thu,  5 Jun 2025 11:29:04 -0700
Message-ID: <20250605183111.163594-20-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=K8YrE2tTMaBrqk7BmowA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: u5j5ePy_BRN3w8gQC046JNOr6tUatAZX
X-Proofpoint-GUID: u5j5ePy_BRN3w8gQC046JNOr6tUatAZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX84+8+zPpzYgE
 gwQVCcwhn2HRaOuJW1WcrWvsWrtCOmW2T+NZRxrvTF/mX115r7Sw7Fgknet/5653O7/iPZhgaQo
 T/ddBbn8UQP9aLbRK8uaJ++1v/3W5lSbPuCk3JqYayXwOyU6fgO7boy/9V1TfKej2PLQUM39Lv3
 MJ/4tgOkBQi8YDaZsQlEMws2Ft+uBL/VDn6oB3n7b2cFjvyWOyhGShuwbQVBtNJKwzAUVGq/VKV
 aUcHIwhE9SZZTbZI8/i2BYDfWKQp8tak3L9MTX8ci5hiTUsL82fGdnaQEXylmmBYMiZua8YMu+Q
 p7AkwiYOMKXB5nV/qdGr2FBdMzR8Fq7cDq1UfuiVsd0gOC3OW6ZtQLGVTesE1h5nwgAQkY+qVcu
 FY1vZ8lM1aiuKZDL8L/jDqkeGE9fucN9DMCcb5XMenEVcW/NO2IR0p/9+GmRdBO18QGfrovi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163

From: Rob Clark <robdclark@chromium.org>

In the next commit, a way for userspace to opt-in to userspace managed
VM is added.  For this to work, we need to defer creation of the VM
until it is needed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++-----
 drivers/gpu/drm/msm/msm_drv.c           | 29 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++-
 5 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c43a443661e4..0d7c2a2eeb8f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -112,6 +112,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
 	struct msm_context *ctx = submit->queue->ctx;
+	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
@@ -120,7 +121,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
-	if (msm_iommu_pagetable_params(to_msm_vm(ctx->vm)->mmu, &ttbr, &asid))
+	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e24f627daf37..b70ed4bc0e0d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -373,6 +373,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct drm_device *drm = gpu->dev;
+	/* Note ctx can be NULL when called from rd_open(): */
+	struct drm_gpuvm *vm = ctx ? msm_context_vm(drm, ctx) : NULL;
 
 	/* No pointer params yet */
 	if (*len != 0)
@@ -418,8 +420,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = 0;
 		return 0;
 	case MSM_PARAM_FAULTS:
-		if (ctx->vm)
-			*value = gpu->global_faults + to_msm_vm(ctx->vm)->faults;
+		if (vm)
+			*value = gpu->global_faults + to_msm_vm(vm)->faults;
 		else
 			*value = gpu->global_faults;
 		return 0;
@@ -427,14 +429,14 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = gpu->suspend_count;
 		return 0;
 	case MSM_PARAM_VA_START:
-		if (ctx->vm == gpu->vm)
+		if (vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->mm_start;
+		*value = vm->mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
-		if (ctx->vm == gpu->vm)
+		if (vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->mm_range;
+		*value = vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5909720be48d..ac8a5b072afe 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -214,10 +214,29 @@ static void load_gpu(struct drm_device *dev)
 	mutex_unlock(&init_lock);
 }
 
+/**
+ * msm_context_vm - lazily create the context's VM
+ *
+ * @dev: the drm device
+ * @ctx: the context
+ *
+ * The VM is lazily created, so that userspace has a chance to opt-in to having
+ * a userspace managed VM before the VM is created.
+ *
+ * Note that this does not return a reference to the VM.  Once the VM is created,
+ * it exists for the lifetime of the context.
+ */
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	if (!ctx->vm)
+		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
+	return ctx->vm;
+}
+
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_context *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -230,7 +249,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	ctx->seqno = atomic_inc_return(&ident);
@@ -409,7 +427,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, ctx->vm, iova);
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -418,18 +436,19 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 
 	if (!priv->gpu)
 		return -EINVAL;
 
 	/* Only supported if per-process address space is supported: */
-	if (priv->gpu->vm == ctx->vm)
+	if (priv->gpu->vm == vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
 
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
-	return msm_gem_set_iova(obj, ctx->vm, iova);
+	return msm_gem_set_iova(obj, vm, iova);
 }
 
 static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f51f2c00e6e2..9d58d6f643af 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -63,7 +63,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
-	submit->vm = queue->ctx->vm;
+	submit->vm = msm_context_vm(dev, queue->ctx);
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bfaec80e5f2d..d1530de96315 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -370,7 +370,12 @@ struct msm_context {
 	 */
 	bool closed;
 
-	/** @vm: the per-process GPU address-space */
+	/**
+	 * @vm:
+	 *
+	 * The per-process GPU address-space.  Do not access directly, use
+	 * msm_context_vm().
+	 */
 	struct drm_gpuvm *vm;
 
 	/** @kref: the reference count */
@@ -455,6 +460,8 @@ struct msm_context {
 	atomic64_t ctx_mem;
 };
 
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
-- 
2.49.0


