Return-Path: <linux-arm-msm+bounces-40860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 891669E80BE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A311884480
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7174156880;
	Sat,  7 Dec 2024 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVSs33G/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471F1547E3;
	Sat,  7 Dec 2024 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588244; cv=none; b=aDOWV3NSPwN7vsUzePgYIGgocgsdYNZecvOuRP3BzrhEGzgUcoq6rlzt3vtzQfJ7KGILwhkeOwuLiShT6ukGCAzxsC7fiYzov555GYHm+6d2l7T05bYckypm6AoEDmQZVH+x1A9qRVBAX8N4AfjvGVmfbgEohtcvGnO1obr00hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588244; c=relaxed/simple;
	bh=+yZ/gV2fVkgam7T4MiJwixZYx5I/P9M9f4tCqOPy3kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/NOm47nhwrBw7n6xd8/NpK3x9yPqNqJIHf9+J6o2naFGwMAAGDJK3yNmGstvnHbYinn1XOTPwwGwIujacEpI/39krWCfgoOTCJj2whqhlRD/HADAB2jCz2OqTuw0o4mMCdLA2rmVil1nCLxShYzeR6Jk/mYGI2B4MkUQGWbVOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVSs33G/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7256dc42176so3398873b3a.3;
        Sat, 07 Dec 2024 08:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588242; x=1734193042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og6TbKNQT7gUo1tyiZb0dTG6ZZOX+cqXvJGjZMol84k=;
        b=TVSs33G/7TXIqkgAu0wF1cAcBwDa8QCiP46oEZZfZDWvzDxBuo5DCQ9i2ti1K0bMSE
         vkeuHCKOQn6js1vB1C7WAMNAFDk4ToZuryO6+7rwyDwNoyYfxnPSKtmXGy6mAKFlfYSd
         bh7xAFMtHdrxK7BoC0kWUIlQbMErja94YbPfHcgVoifeR3L1aYYv3p33+LJLCxABGRLw
         xaxuLF5MhQ4TSCDENPGVDHf+IMT1AtBCKgPVNN8A6PA9UBNur9WeClC+lNsVrSdoCDrX
         445hDxf6jYFTJCCMcPjqxenECP0iq003HTHUjaxu/vQP5v73P4v1QR6t1ct6P4K/OhOK
         h2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588242; x=1734193042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=og6TbKNQT7gUo1tyiZb0dTG6ZZOX+cqXvJGjZMol84k=;
        b=l6+7HA6kLF6JTtHVLiNAna8SkW+XDsE5rd/8zIRnGlh5Lq06iQocdbTmgK5vo1uXhz
         YVK9n9XjyYRErWh4dBXhIUAr/6O7kEtJgzc0iRxGG8IRCSMbMR/OASFxF5Qsh1d4v7g1
         eJ2ZgNBQ2EZkzxF1CG2SYitklIJnQaZ8ExEMOWNeCcSJf4WLF73qEB1eYZagnFbMozXv
         kVU5Kc6u1Pwzl0I07nyOBjZyhfEXjT/dmS1Fu/Qbii0hgaeZghqAO2eoRgeMLWTGtPeu
         GDtjkrHglQAyjgAYKWt8XUXP/hqko+6i+4Z4Y7S7sUFXYYlibarxqhsKdtOPPwjM5mcu
         Q0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh4GGBAoy3c77Z6XBd4qpTuJuvIjUb2tqJ1IL7ZOUmtIruZmFCF1cNw3+hqhucfe540cPteX9xMZvz/CsX@vger.kernel.org, AJvYcCWYeaJFu0BQOzphH4gUIAoerD/k293fy5fr89mIK4PNHivquiKeY50fRmfQHbJodiQwx/l1LPKZBYhk67as@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8l8Ne2DO/mFV7vfnxQwmftSGvUn6C5l+piGj6ZBStzbkjaBGK
	7pykO/+dvIvIanP+wxA4ZteBMIFIeTUceetc8hV6XaBu2fOwMQl2
X-Gm-Gg: ASbGncvPPKYgLaMDDGRbqsy41Y28ZiQw5rmGx5KQcXhQsDzG3xrdpIuJeifa9KRjtz6
	IKMUmW8agabRj6jrQebOEMo2SLgIWA/eLxUVxaeoMdjGi6cT0vxRx42idm2Yw0kBW0M++vsXLT1
	+qptMxkJQwRPE3mG8GFRGpnMuxETqCiCySQBMr7+D1+WdR8+Bf0Y7gQKMNS950nmpP1DZj7MrBa
	O+GZ6Sprbv/IY2Kk8EVgWY9aeqcUSNyu7d2Ju1+ZKw+23n0UNmVBfuyKwtBQsCfau3hcTj2yoEd
	+JdoJ3sA
X-Google-Smtp-Source: AGHT+IG87V2LVfkZufSxkAwW+KhZ7IjRJrfnw/8csBCiSK+b09Gfi6ZYwYPOhJurL7WhNm8Z6C0bDQ==
X-Received: by 2002:a05:6a20:3d87:b0:1e0:c6c0:1e08 with SMTP id adf61e73a8af0-1e1870c802dmr10900586637.25.1733588241979;
        Sat, 07 Dec 2024 08:17:21 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2a90339sm4776139b3a.105.2024.12.07.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 04/24] drm/msm: Rename msm_file_private -> msm_context
Date: Sat,  7 Dec 2024 08:15:04 -0800
Message-ID: <20241207161651.410556-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
index 0ae29a7c8a4d..867c6161ef1f 100644
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
index a18c69a9f3fa..719abefecb6f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -306,7 +306,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -394,7 +394,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	}
 }
 
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len)
 {
 	struct drm_device *drm = gpu->dev;
@@ -440,7 +440,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
-		return msm_file_private_set_sysprof(ctx, gpu, value);
+		return msm_context_set_sysprof(ctx, gpu, value);
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9bd38dda4308..caf8816e6252 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -569,9 +569,9 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 }
 
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
index 6bc6f67825ce..e7c76d243ee7 100644
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
index ebc9ba66efb8..747e2ab8373a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -44,7 +44,7 @@ static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 
 static void update_ctx_mem(struct drm_file *file, ssize_t size)
 {
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
 
 	rcu_read_lock(); /* Locks file->pid! */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index be6e793f34bd..99d3f2c4bae5 100644
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
index 0d4a3744cfcb..6ff9541990dc 100644
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
@@ -330,7 +330,7 @@ static void retire_submits(struct msm_gpu *gpu);
 
 static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
 {
-	struct msm_file_private *ctx = submit->queue->ctx;
+	struct msm_context *ctx = submit->queue->ctx;
 	struct task_struct *task;
 
 	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7cabc8480d7c..76ad75f06706 100644
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
 
@@ -339,7 +339,7 @@ struct msm_gpu_perfcntr {
 #define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
- * struct msm_file_private - per-drm_file context
+ * struct msm_context - per-drm_file context
  *
  * @queuelock:    synchronizes access to submitqueues list
  * @submitqueues: list of &msm_gpu_submitqueue created by userspace
@@ -349,7 +349,7 @@ struct msm_gpu_perfcntr {
  * @ref:          reference count
  * @seqno:        unique per process seqno
  */
-struct msm_file_private {
+struct msm_context {
 	rwlock_t queuelock;
 	struct list_head submitqueues;
 	int queueid;
@@ -504,7 +504,7 @@ struct msm_gpu_submitqueue {
 	u32 ring_nr;
 	int faults;
 	uint32_t last_fence;
-	struct msm_file_private *ctx;
+	struct msm_context *ctx;
 	struct list_head node;
 	struct idr fence_idr;
 	struct spinlock idr_lock;
@@ -600,33 +600,32 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
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
2.47.1


