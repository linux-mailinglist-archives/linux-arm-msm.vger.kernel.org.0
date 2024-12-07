Return-Path: <linux-arm-msm+bounces-40870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D05A9E80E3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A9718826B3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5E51990B7;
	Sat,  7 Dec 2024 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2Pqptvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600DC197556;
	Sat,  7 Dec 2024 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588285; cv=none; b=s2IX9pnIYN/Gv1s9KqiG3YhHVRUAf0EWQbIRZZdGAJc43QF1WBaTnEMUAQ8yKRYK0zXk9aEaPeul+/zC6ecifGBOLLZVUbpBS6T5AGNNQUfSKGsCi5d/eRpuZ6AMKzUDP/OcvYpZU3pGIPhz1w55igG0T5XaQem6sNApE9/hPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588285; c=relaxed/simple;
	bh=xP3p0ysRUEklP7iKC0DFjhWBLF6RvRtsCW7zdp1WO5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TF4FHrtjypfL1VgP1r46XbgPJ2tXWtEYxuaxq7vXog3pPoQ8hcL1eY4fIoqU/KIiIe3djrexChyWf1VgOdBoblme58tikfxkLAHXCDS7ysxZNNR0bb6xrA4DQQ6DkFCYDIkh58R2BkYEMZtJIZBEdpp7QwBKqeovT517DaisRJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2Pqptvx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso11251045ad.3;
        Sat, 07 Dec 2024 08:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588283; x=1734193083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR0VyUIds0OeglVRG0rtcASMffgWhQUAZ/+UBKnhdc8=;
        b=e2PqptvxZ4207qlxiI9n+8lpgyq7mJeajlvSPSRfTFVoT5GHjYRilL9hPDk2uPlcdS
         83mzIUz+NysAHdGHVhlnmCjcp4I09cKU2P6QPA9y4JpbfSPP/bTEMGk8+nOQMTcBspbn
         5+ml6Nz4zY7/QtdYoKgsLzsy94Hprat8qE4w+5FOp2aG2F8y0dWWcXlL0eqHv3A4jIjW
         vKbx+YTwvH66AbqSZnHVOWZ06vLXeWlIgFDEJXWPt4XJiJzF/0ewUHJRz1BJQeIuweC7
         TI0rdPlJXLh85STzmvaCVT3Bp51/h8lcaZore17qyF8Z19Squw6ugQ06qcUW18ZhCNkC
         XAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588283; x=1734193083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rR0VyUIds0OeglVRG0rtcASMffgWhQUAZ/+UBKnhdc8=;
        b=RS/TwAniBP8/g/+/vVxuep0js89LHi+5G4l8fvRQdTye6zh/tfSHhcHRIf1ee31S2G
         kxBrza8l9hksVY8dqwnnOTOIlxcCJYhW+67fvX8QAC5uc+lgzvPqpfcpSI/o3Dw18DBA
         YLowYtJL1tbmoVDzge/N48ysagIyNKjZtV9L/W2+eGGUmplRhrdtSzCDk2ZwaLPwI2vU
         yme/AHzld90JK4o/4xRLyu3WBZjTCZzKGsMpdDXkTZnPbz5agTNRC1BxPAIBFVMgDpys
         lkkJcZAx5cXF3Psyxb3QAz4bFxlN7U363U2+YNcOneS7Rcy1IjTpwWBR3rhUXHZBIGXh
         vgaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOZfgyKuWhNcei3pQHd9elgPSJBiUt1bxkGe6982khat+8S5UV8EOsdwJyVN9suRnGUQfIu9xn2XCnM2Ca@vger.kernel.org, AJvYcCWGGBYgonAwybXgbvbmoUohNbS+RPIGUgBPcag4T/JNPdAoSq6pYxAuy9CekK2uOWhxB5zuFb9ATyI0V29Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3A7uK+Lx3S3mI4Frtf383xHlYc6C0JP7YSTmxMPGQ9rrJV1A9
	KTJFxjAe91vtXYinwjJBwRSlyUjQVNNI9G6rBwssATkGIeekfuZD
X-Gm-Gg: ASbGncuC38EYzhtC9NPgzlmoAokhSw2yc/SPSPLB3biJ+DbFCYXbFK+lrL3a1YpnBBy
	ZKPRopCtJGMjlGYlbsX/WVjLloAg99BsYsV1WzGqsnM6r+ZzoHKcGHztqst7T/w2HJHex9XVNgt
	AK4H/p4xtbrBPF9HwCGgW49E284bAU7rAsXTzJDuEtgsOcETy7NitLjPJ/FEgYoP28RAYrr5p0A
	S6wx9EVw5GCmHqVCpHHqI9xxtXt+F0ep6losgFS8BDcf85/Ucr6L26Gf5jwIOGkiLQm4pB/lVFb
	+/mAz5DL
X-Google-Smtp-Source: AGHT+IGzizwrpsZXPYuNGc1R0w30RUBv8T4B9GyR7kRST9Ud9FnvSGzqVWbe3tz7xQeGoQ9YxhQkTA==
X-Received: by 2002:a17:902:ce0f:b0:215:7446:2151 with SMTP id d9443c01a7336-21614d16ef4mr96271875ad.4.1733588282643;
        Sat, 07 Dec 2024 08:18:02 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5fe68sm45494005ad.67.2024.12.07.08.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:02 -0800 (PST)
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 14/24] drm/msm: Add opt-in for VM_BIND
Date: Sat,  7 Dec 2024 08:15:14 -0800
Message-ID: <20241207161651.410556-15-robdclark@gmail.com>
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

Add a SET_PARAM for userspace to request to manage to the VM itself,
instead of getting a kernel managed VM.

In order to transition to a userspace managed VM, this param must be set
before any mappings are created.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c           | 13 +++++++++--
 drivers/gpu/drm/msm/msm_gem.c           |  5 +++++
 drivers/gpu/drm/msm/msm_gpu.c           |  5 +++--
 drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h              | 24 ++++++++++++++++++++
 7 files changed, 87 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 97ec1dedeb98..ced5206bdc81 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2251,7 +2251,7 @@ a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 }
 
 static struct drm_gpuvm *
-a6xx_create_private_vm(struct msm_gpu *gpu)
+a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
@@ -2261,7 +2261,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_vm_create(gpu->dev, mmu, "gpu", 0x100000000ULL,
-				 adreno_private_vm_size(gpu), true);
+				 adreno_private_vm_size(gpu), kernel_managed);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 033c1c9c457e..90848852ee50 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -444,6 +444,21 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
+	case MSM_PARAM_EN_VM_BIND:
+		/* We can only support VM_BIND with per-process pgtables: */
+		if (ctx->vm == gpu->vm)
+			return UERR(EINVAL, drm, "requires per-process pgtables");
+
+		/*
+		 * We can only swtich to VM_BIND mode if the VM has not yet
+		 * been created:
+		 */
+		if (ctx->vm)
+			return UERR(EBUSY, drm, "VM already created");
+
+		ctx->userspace_managed_vm = value;
+
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7a23549db97d..b31ec287c600 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -229,8 +229,11 @@ static void load_gpu(struct drm_device *dev)
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	if (!ctx->vm)
-		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
+	if (!ctx->vm) {
+		ctx->vm = msm_gpu_create_private_vm(
+			priv->gpu, current, !ctx->userspace_managed_vm);
+
+	}
 	return ctx->vm;
 }
 
@@ -419,6 +422,9 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
@@ -440,6 +446,9 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	/* Only supported if per-process address space is supported: */
 	if (priv->gpu->vm == vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 99e0ce38cd92..0bfc993571fc 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,8 +47,13 @@ static void put_iova_spaces(struct drm_gem_object *obj, bool close);
 
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
+	struct msm_context *ctx = file->driver_priv;
+
 	update_ctx_mem(file, -obj->size);
 
+	if (msm_context_is_vmbind(ctx))
+		return;
+
 	/*
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17d8be47db19..5def12abac6c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -822,7 +822,8 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 
 /* Return a new address space for a msm_drm_private instance */
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed)
 {
 	struct drm_gpuvm *vm = NULL;
 
@@ -834,7 +835,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 	 * the global one
 	 */
 	if (gpu->funcs->create_private_vm) {
-		vm = gpu->funcs->create_private_vm(gpu);
+		vm = gpu->funcs->create_private_vm(gpu, kernel_managed);
 		if (!IS_ERR(vm))
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5efbca0b9fb1..70abbd93e11b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -79,7 +79,7 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			     bool suspended);
 	struct drm_gpuvm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
-	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu);
+	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu, bool kernel_managed);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 
 	/**
@@ -354,6 +354,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @userspace_managed_vm:
+	 *
+	 * Has userspace opted-in to userspace managed VM (ie. VM_BIND) via
+	 * MSM_PARAM_EN_VM_BIND?
+	 */
+	bool userspace_managed_vm;
+
 	/**
 	 * @vm:
 	 *
@@ -446,6 +454,22 @@ struct msm_context {
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
 
+/**
+ * msm_context_is_vm_bind() - has userspace opted in to VM_BIND?
+ *
+ * @ctx: the drm_file context
+ *
+ * See MSM_PARAM_EN_VM_BIND.  If userspace is managing the VM, it can
+ * do sparse binding including having multiple, potentially partial,
+ * mappings in the VM.  Therefore certain legacy uabi (ie. GET_IOVA,
+ * SET_IOVA) are rejected because they don't have a sensible meaning.
+ */
+static inline bool
+msm_context_is_vmbind(struct msm_context *ctx)
+{
+	return ctx->userspace_managed_vm;
+}
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
@@ -673,7 +697,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config);
 
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2342cb90857e..072e82a80607 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -91,6 +91,30 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* MSM_PARAM_EN_VM_BIND is set to 1 to enable VM_BIND ops.
+ *
+ * With VM_BIND enabled, userspace is required to allocate iova and use the
+ * VM_BIND ops for map/unmap ioctls.  MSM_INFO_SET_IOVA and MSM_INFO_GET_IOVA
+ * will be rejected.  (The latter does not have a sensible meaning when a BO
+ * can have multiple and/or partial mappings.)
+ *
+ * With VM_BIND enabled, userspace does not include a submit_bo table in the
+ * SUBMIT ioctl (this will be rejected), the resident set is determined by
+ * the the VM_BIND ops.
+ *
+ * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
+ * And it is not allowed to disable VM_BIND once it has been enabled.
+ *
+ * Enabling VM_BIND should be done (attempted) prior to allocating any BOs or
+ * submitqueues of type MSM_SUBMITQUEUE_VM_BIND.
+ *
+ * Relatedly, when VM_BIND mode is enabled, the kernel will not try to recover
+ * from GPU faults or failed async VM_BIND ops, in particular because it is
+ * difficult to communicate to userspace which op failed so that userspace
+ * could rewind and try again.  When the VM is marked unusable, the SUBMIT
+ * ioctl will throw -EPIPE.
+ */
+#define MSM_PARAM_EN_VM_BIND 0x15  /* WO, once */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.47.1


