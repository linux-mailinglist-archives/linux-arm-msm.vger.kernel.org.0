Return-Path: <linux-arm-msm+bounces-56544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB6AA7810
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C9B17B664
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B72C267B9F;
	Fri,  2 May 2025 17:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sut1VvIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F7266581;
	Fri,  2 May 2025 17:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205655; cv=none; b=rUqaY//I66nhNcZmzddg6tRBoHcaohZIgx0dJKMWmpHTgUScQ/Fe665axKX3MmdFLa117dSr3bcbuiq7j0GRhXJPJhKvsqYR05R33g2o6/7lsX4KRwxUHpYWvCyEmKCFYVvRUT/nC5V2yETZue2+d3F6cUb/7YzjwHtcJlxvEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205655; c=relaxed/simple;
	bh=iurEEJDW/WXaItu2bNOy6QTDzAvAOfJNFuvdslmbHbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLHHVl5+ZzMaBCcS5jI7/sdzSKypE87qXDzsczLmVNCaAbYbojke9DWw7qldD2BB/cMEUjvZqs//sy41RPlLE35w6KQpmvBacvyhp2BxRhbLoy7j1ZTdwpLbRrMXhI9HCj56N4urDDKwbm1EWF9C6VGDXGXdWQyXMQdhroXtJRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sut1VvIM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7398d65476eso2001804b3a.1;
        Fri, 02 May 2025 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205653; x=1746810453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qstZODCSpW1sZBxoO0k3cphiew3CZe6L6DlFJD6SVs=;
        b=Sut1VvIMWXZ5PdTIhmebEi3LjxyyHQJ9Yx5cW2i+oeTVxbUnL5GN51XUIuWH7r/MNV
         gTYJydAd5mMtl1pzurjClKXpDj5hsyg7dghXk37+OrvrdPkhoYuRZOlgGhKne6Yv3ZgS
         0qCBRTrVO4qTmWhs3GtprjSbNRuzxGZ13G8/m2/b4URj/mnYjtfGdhjG/qYbjaQj0OY3
         xcQSHnVrl/1ejjYH+OosxSR25FRQrQAoydPR0MJq8JAW12KKT9shAw77KfNVXYaHQxXM
         B0VfTO1ToDBF5D16kGxLtkrGGpPjE+cf1x6XywHVe3TfJRw4eI2OrnbHOEUQQEIui1lI
         D/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205653; x=1746810453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qstZODCSpW1sZBxoO0k3cphiew3CZe6L6DlFJD6SVs=;
        b=TaIRn9H1HzfKUon7RpNkH8JILDs/p5Cau8LIpUFwctiqPcYZgu5dGobRnRr9UFLXYB
         oVJDtkxgEfwdphr0j/AlqTa35I4lIUKHlSdJCcxuUjMAylAlTk8G3kx+JLAsA9ismSAS
         B03ctKl5YTWI1bvGBuWI0nsCWyt+gsXNLkB9JgWRw5M072q2A2nHwNzkl8mYTOP1Z+rF
         05HvFQH9++abRX+JWesdDsHpXetM2kTVRgPD8Ki7K9R2g6cHkvdNuyrOTF5gcNgRrog5
         DEE8jspaq1e4um22AtTIobtDyz7RB1lvRienYf/bQjBtZh4yDG76FtqqGR/BYKCaof3I
         iKig==
X-Forwarded-Encrypted: i=1; AJvYcCUfFiJt8MsUgYsjCGGZvHHW7nl5Ajp3qHJPUl2rHqFUAEwO3W9Q+z/9Bfuy2iEkyJezWftCI/woXvk4rOXA@vger.kernel.org, AJvYcCUoXDJ0UktR/w2q6Sm45LriqybkP8yaz64R8lWzDKBfFiB4pA2TODkMJKzdblwnj4PVxS/WZY3JXGxuoMlL@vger.kernel.org
X-Gm-Message-State: AOJu0YwoCUT1vwjgLVgwSzsp/OClT3MTeM62dj8ruk2a89I7uMKvqObc
	MbvBDiRIriGN2RM1MXFSxMnvDRxPQMxZuRswn2OzuFCHB4+3bOxU
X-Gm-Gg: ASbGnctxN3sPPburYc9ETpVF+nszKyPCckC2XD0fw10GXRqSxFCYCGqLYkoYHkTR0Po
	goJEbY8o79WJ9HPRX90d6lHOad07RewGEH5cY12A7pUcTLmQDPq1KaYVnM+mvXYc9d6ez2U2SlD
	UFQNo/W6JOMYfHX4Lkws2H58d3TkMtXMB7ofMkmik4hj6zauI7g5SGbE9q59O+3O+aTcHDaVT6A
	ymOLwU0jTs06BtXljRA/NI/5QfWAd3IERstXhbg33rpdans5AwA0BHUOYE3au8bO1CXVUWayi3d
	LBhKE9xjkDRNuHBLYPSaaiHZhSrMfyQY+hAFyeE0s/WMzNoLrtlUBU9mxHpxtyCH26q0yw7xNYZ
	8NoIOuqLBt/pGFoY=
X-Google-Smtp-Source: AGHT+IGgw9WZ/Vb8oS+e8el5Q3PHxUUFY5SENIV6s+YxiIK0yrzSdKTuf8HN2sCcQrsuR+XarKnSkQ==
X-Received: by 2002:aa7:9311:0:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7405798f929mr6237220b3a.0.1746205652639;
        Fri, 02 May 2025 10:07:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905cff4sm1818332b3a.125.2025.05.02.10.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:07:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 04/33] drm/msm: Rename msm_file_private -> msm_context
Date: Fri,  2 May 2025 09:56:31 -0700
Message-ID: <20250502165831.44850-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
 drivers/gpu/drm/msm/msm_drv.c           | 14 ++++-----
 drivers/gpu/drm/msm/msm_gem.c           |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c           |  4 +--
 drivers/gpu/drm/msm/msm_gpu.h           | 39 ++++++++++++-------------
 drivers/gpu/drm/msm/msm_submitqueue.c   | 27 +++++++++--------
 9 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 129c33f0b027..a32cce8b0c5c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -111,7 +111,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
-	struct msm_file_private *ctx = submit->queue->ctx;
+	struct msm_context *ctx = submit->queue->ctx;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e80db01a01c0..25c939b3367a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -356,7 +356,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -444,7 +444,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	}
 }
 
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len)
 {
 	struct drm_device *drm = gpu->dev;
@@ -490,7 +490,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
-		return msm_file_private_set_sysprof(ctx, gpu, value);
+		return msm_context_set_sysprof(ctx, gpu, value);
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2366a57b280f..fed9516da365 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -603,9 +603,9 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3588dc9e537..29ca24548c67 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -333,7 +333,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx;
+	struct msm_context *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -363,23 +363,23 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 	return context_init(dev, file);
 }
 
-static void context_close(struct msm_file_private *ctx)
+static void context_close(struct msm_context *ctx)
 {
 	msm_submitqueue_close(ctx);
-	msm_file_private_put(ctx);
+	msm_context_put(ctx);
 }
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	/*
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
 	if (priv->gpu)
-		msm_file_private_set_sysprof(ctx, priv->gpu, 0);
+		msm_context_set_sysprof(ctx, priv->gpu, 0);
 
 	context_close(ctx);
 }
@@ -511,7 +511,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 		uint64_t *iova)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	if (!priv->gpu)
 		return -EINVAL;
@@ -531,7 +531,7 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 		uint64_t iova)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	if (!priv->gpu)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d2f38e1df510..fdeb6cf7eeb5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -48,7 +48,7 @@ static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 
 static void update_ctx_mem(struct drm_file *file, ssize_t size)
 {
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
 
 	rcu_read_lock(); /* Locks file->pid! */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3e9aa2cc38ef..16ca6cfac967 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -642,7 +642,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c380d9d9f5af..d786fcfad62f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -148,7 +148,7 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p)
 {
 	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
@@ -339,7 +339,7 @@ static void retire_submits(struct msm_gpu *gpu);
 
 static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
 {
-	struct msm_file_private *ctx = submit->queue->ctx;
+	struct msm_context *ctx = submit->queue->ctx;
 	struct task_struct *task;
 
 	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579..957d6fb3469d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -22,7 +22,7 @@
 struct msm_gem_submit;
 struct msm_gpu_perfcntr;
 struct msm_gpu_state;
-struct msm_file_private;
+struct msm_context;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -44,9 +44,9 @@ struct msm_gpu_config {
  *    + z180_gpu
  */
 struct msm_gpu_funcs {
-	int (*get_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+	int (*get_param)(struct msm_gpu *gpu, struct msm_context *ctx,
 			 uint32_t param, uint64_t *value, uint32_t *len);
-	int (*set_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+	int (*set_param)(struct msm_gpu *gpu, struct msm_context *ctx,
 			 uint32_t param, uint64_t value, uint32_t len);
 	int (*hw_init)(struct msm_gpu *gpu);
 
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
 #define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
- * struct msm_file_private - per-drm_file context
+ * struct msm_context - per-drm_file context
  *
  * @queuelock:    synchronizes access to submitqueues list
  * @submitqueues: list of &msm_gpu_submitqueue created by userspace
@@ -357,7 +357,7 @@ struct msm_gpu_perfcntr {
  * @ref:          reference count
  * @seqno:        unique per process seqno
  */
-struct msm_file_private {
+struct msm_context {
 	rwlock_t queuelock;
 	struct list_head submitqueues;
 	int queueid;
@@ -512,7 +512,7 @@ struct msm_gpu_submitqueue {
 	u32 ring_nr;
 	int faults;
 	uint32_t last_fence;
-	struct msm_file_private *ctx;
+	struct msm_context *ctx;
 	struct list_head node;
 	struct idr fence_idr;
 	struct spinlock idr_lock;
@@ -608,33 +608,32 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
 
-void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p);
 
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx);
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id);
 int msm_submitqueue_create(struct drm_device *drm,
-		struct msm_file_private *ctx,
+		struct msm_context *ctx,
 		u32 prio, u32 flags, u32 *id);
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 		struct drm_msm_submitqueue_query *args);
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id);
-void msm_submitqueue_close(struct msm_file_private *ctx);
+int msm_submitqueue_remove(struct msm_context *ctx, u32 id);
+void msm_submitqueue_close(struct msm_context *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
-int msm_file_private_set_sysprof(struct msm_file_private *ctx,
-				 struct msm_gpu *gpu, int sysprof);
-void __msm_file_private_destroy(struct kref *kref);
+int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof);
+void __msm_context_destroy(struct kref *kref);
 
-static inline void msm_file_private_put(struct msm_file_private *ctx)
+static inline void msm_context_put(struct msm_context *ctx)
 {
-	kref_put(&ctx->ref, __msm_file_private_destroy);
+	kref_put(&ctx->ref, __msm_context_destroy);
 }
 
-static inline struct msm_file_private *msm_file_private_get(
-	struct msm_file_private *ctx)
+static inline struct msm_context *msm_context_get(
+	struct msm_context *ctx)
 {
 	kref_get(&ctx->ref);
 	return ctx;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7fed1de63b5d..1acc0fe36353 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -7,8 +7,7 @@
 
 #include "msm_gpu.h"
 
-int msm_file_private_set_sysprof(struct msm_file_private *ctx,
-				 struct msm_gpu *gpu, int sysprof)
+int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
 	/*
 	 * Since pm_runtime and sysprof_active are both refcounts, we
@@ -46,10 +45,10 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 	return 0;
 }
 
-void __msm_file_private_destroy(struct kref *kref)
+void __msm_context_destroy(struct kref *kref)
 {
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
+	struct msm_context *ctx = container_of(kref,
+		struct msm_context, ref);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
@@ -73,12 +72,12 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
-	msm_file_private_put(queue->ctx);
+	msm_context_put(queue->ctx);
 
 	kfree(queue);
 }
 
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id)
 {
 	struct msm_gpu_submitqueue *entry;
@@ -101,7 +100,7 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
 	return NULL;
 }
 
-void msm_submitqueue_close(struct msm_file_private *ctx)
+void msm_submitqueue_close(struct msm_context *ctx)
 {
 	struct msm_gpu_submitqueue *entry, *tmp;
 
@@ -119,7 +118,7 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 }
 
 static struct drm_sched_entity *
-get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
+get_sched_entity(struct msm_context *ctx, struct msm_ringbuffer *ring,
 		 unsigned ring_nr, enum drm_sched_priority sched_prio)
 {
 	static DEFINE_MUTEX(entity_lock);
@@ -155,7 +154,7 @@ get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
 	return ctx->entities[idx];
 }
 
-int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 		u32 prio, u32 flags, u32 *id)
 {
 	struct msm_drm_private *priv = drm->dev_private;
@@ -200,7 +199,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	write_lock(&ctx->queuelock);
 
-	queue->ctx = msm_file_private_get(ctx);
+	queue->ctx = msm_context_get(ctx);
 	queue->id = ctx->queueid++;
 
 	if (id)
@@ -221,7 +220,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
  * Create the default submit-queue (id==0), used for backwards compatibility
  * for userspace that pre-dates the introduction of submitqueues.
  */
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
+int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
@@ -261,7 +260,7 @@ static int msm_submitqueue_query_faults(struct msm_gpu_submitqueue *queue,
 	return ret ? -EFAULT : 0;
 }
 
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 		struct drm_msm_submitqueue_query *args)
 {
 	struct msm_gpu_submitqueue *queue;
@@ -282,7 +281,7 @@ int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
 	return ret;
 }
 
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id)
+int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 {
 	struct msm_gpu_submitqueue *entry;
 
-- 
2.49.0


