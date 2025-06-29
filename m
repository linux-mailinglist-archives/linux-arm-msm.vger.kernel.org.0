Return-Path: <linux-arm-msm+bounces-62951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B08AECD84
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B90B67AA334
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE8B23ABA7;
	Sun, 29 Jun 2025 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+wWrEAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DDB239E7C
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206075; cv=none; b=U51ymd0VZHnaKaHHwJEgwtq6fTvaBiVKPAWxAQhBTL6U2RIPsGYnA55ZHbReuAhfVgcGUGNn2j1DQB7qeff3VXjlm4WwqNV+dl1YIswxKSg4RBHAZMTBq3ppMT31s+CbbtV/otCzy+AyDTDE5BrhNidW/YjmDz+OPvZlG6Dbl/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206075; c=relaxed/simple;
	bh=B9YTTznctoHdBwrv5g0hUa2frK/TNvG5X6fwVs2vyWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLouDyUB4NIHWjVsDxmb2nj1S7w3eaqdeAU1faWOXYVVX2bzVRmk+5IAg/Eo/M1zuOngoqBteyQWtjE5gYr8ghwhjJ9mNb922U9XDLb7aSzPZ60RaPqQqFsYCFXSQzrp/UGl82V2A/REOQhPeADW1f4trXd7vkdQUUr+/p9b1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+wWrEAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCR9Ik014540
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0BUJyXh6kP
	qdE8f3drw7XmhKLdbfVd0jGadfPkUqgU=; b=X+wWrEAmJGmu/SO93F7X1tUL/59
	vtB+c8v6olldeFmmDYL6571eNla+EuxBl389yKouIntPniJnrcoTMH74DFhA7OQb
	oddhKmFUbna1mFj9CXiF4w/3WfR+IneSap3hPiEblx6jZ4KO/5+1Y55b3CvqA68B
	dfe6fWH5mBmwMIUuOZL56+34LKKgSxNaokRFM5UGNRSVr/c53Rb5X7B1LD7amryO
	WonnlJGGrFyQaKUnvREKcBgP8+8uQlGumwRN3kf0MInolI4eF+n2hMy4uHiQnXb+
	YvFv4uOekV1IJdeU4KaiGyfcu7nFZrsULhP1tjY5SSpW336oVgiI1LYzJkQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcj56c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c37558eccso2974866a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206072; x=1751810872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0BUJyXh6kPqdE8f3drw7XmhKLdbfVd0jGadfPkUqgU=;
        b=gMufGszkhAb3SZH2AQuRrYPZcOmZUdgPh4VxIHCT/0rEgDDCZAOOrJ6P346EZ1pbkm
         cXC6f6kkvrcz6TtETWPf9VIzLrmqolTyEhZg9FX1CtMZjArzVVVNng16Xp/QSM76oHrD
         gvl0Bnq+1wpr1s2md2ZQBQ7Rf/RBupew9A0l47pSHEsKbLLOoPtc3xuQp3i+rcWs0fC1
         V3FGtKqfEgWdHKlgAyvVXkFg0Zm2VyTCsS2cXQeHyEAoNvfddGCCOL4Q5uukigQKphmI
         rSq0IT/LYIfQZGO/eoNE6VgvTCi/bV7hRwhdBt/5FpCeo5a91CN5ILQSaOHLUU4Fs8/U
         Kp6g==
X-Forwarded-Encrypted: i=1; AJvYcCV1OpzmHhzlCHbXJMpahiJSQZ4WA9C5RfwZwhY4VrqSin7jSf6ylE8y2nU4RLuLZXbf0kers187+3hBn/vC@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnqvWmRphdNSffSn9dGKtZ0Ozo7jOhhg2R0DH79JevThXFqOq
	C7Hgflow6famyq8reERDgrW+yRs088Ir6yHG7orJdO9ijQ7YXrkSnRM34DBRXrCZJ+aCCxiim23
	4zhcsbaMNtlnpNNF46TLiUj1mLyBLk4jVXoP6hqvloFTtxVUTtSCU+fxHmJyFbt7VR7NX
X-Gm-Gg: ASbGncvvHdW4tS9bgspkM1oZ3A/LqYot2/tnL8XtCAKgqUmX6t+QGksoXNckm/5pwG6
	xcl1gGuivQzQuSlbylK+G9+pr2GfYIzybjuRGnKSGSHmc+qELrbf4GeNS2J4tYtmyXhjflWfwuk
	kMRtjloyetWRBAFsItFE2YS/JUGbccOeR8SAavgkiAPlSbj/92XSBAsu2QyUL/ztC/Yk9hyKMG3
	Yr5uosGU6qrXSCjXwx7pAdXjKhixRIOsdpqu+wYr9HaKrwB54xgxaoReT1JY+HY9o6eNeNd92wt
	hPfF+Picbub/sjq/OmF28lqy4yfyXAqg
X-Received: by 2002:a17:902:db09:b0:226:38ff:1d6a with SMTP id d9443c01a7336-23ac3cf54d3mr146088705ad.7.1751206071986;
        Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE32k7Afuea4S6YlDfLE+VUZzeCxgrzidUbH0ovqiE4vkhu2fW7o1UrBtt/LddK/revmNzJUg==
X-Received: by 2002:a17:902:db09:b0:226:38ff:1d6a with SMTP id d9443c01a7336-23ac3cf54d3mr146088305ad.7.1751206071431;
        Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f182csm62074285ad.55.2025.06.29.07.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 21/42] drm/msm: Lazily create context VM
Date: Sun, 29 Jun 2025 07:03:24 -0700
Message-ID: <20250629140537.30850-22-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 42ZjlrcvIS5t_Zm462JINvDpw14ruNKX
X-Proofpoint-ORIG-GUID: 42ZjlrcvIS5t_Zm462JINvDpw14ruNKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX3mEgpugUzqp5
 ICl225L4cLpcuiQRlouQrk/3sO1m3rQQB3Wx3DeF/nBKjmw2IcsYK+n2QQ93G6GL6BQLbdVZFIb
 2LDPLwd9jiYh6ztTrNCToUGeIqagbG5M9/wYgHPZgKGMvDxwyaMhSP0PvnMhyp51o4KQmWIsF16
 0RIe8SdsAVMGxVr9kdTezq6bhvFrB34K5P8GY1F7TBJ8dGEX79TBkrNGffblXO6GFvpX26JXnmk
 zNI+KQx7u2J28jZlZF2Ez4f/xy51M/3kQCwNGeQuR273iLjCuSa5dbVIcWBK10KuENbFLIxiDBn
 RBafO0tzf7DG+f9LW8s8llfHZ7Ln5CRHAzRPosIz3XnUHWFElsfni9qGJJX6EvOVjMEEDwYsRFA
 +fuIdzyffm1cCZhnFTN47jK7+JD/LuNWAc6cj6KR8QIWDhLqiD+M5FNFMK3timACvS6AfXXC
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=686148b9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=K8YrE2tTMaBrqk7BmowA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

In the next commit, a way for userspace to opt-in to userspace managed
VM is added.  For this to work, we need to defer creation of the VM
until it is needed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++-----
 drivers/gpu/drm/msm/msm_drv.c           | 29 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++-
 5 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0b78888c58af..7364b7e9c266 100644
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
index 12bf39c0516c..2baf381ea401 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -369,6 +369,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct drm_device *drm = gpu->dev;
+	/* Note ctx can be NULL when called from rd_open(): */
+	struct drm_gpuvm *vm = ctx ? msm_context_vm(drm, ctx) : NULL;
 
 	/* No pointer params yet */
 	if (*len != 0)
@@ -414,8 +416,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
@@ -423,14 +425,14 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index c4b0a38276fa..5cbc2c7b1204 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -218,10 +218,29 @@ static void load_gpu(struct drm_device *dev)
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
@@ -234,7 +253,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	ctx->seqno = atomic_inc_return(&ident);
@@ -413,7 +431,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, ctx->vm, iova);
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -422,18 +440,19 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
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
index d8ff6aeb04ab..068ca618376c 100644
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
index a35e1c7bbcdd..29662742a7e1 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -364,7 +364,12 @@ struct msm_context {
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
@@ -449,6 +454,8 @@ struct msm_context {
 	atomic64_t ctx_mem;
 };
 
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
-- 
2.50.0


