Return-Path: <linux-arm-msm+bounces-45463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70FA157A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 19:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75DD57A5895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8331A23AE;
	Fri, 17 Jan 2025 18:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPpIsm3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1E71A9B2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 18:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737139664; cv=none; b=k41Y5t3wY3rzxo687rxe3pl8dXdSAh5zBLDO1jS11hEx9y60ibTkJI3YYMbiMfqUtcFI629Fp/LCr2n1FQ2xm7GmYC7hOt5tGL/43o3fmYBePVzH0aRIM7Rtha9XfyiuS3AX2HVVVqyX97Rpn19pFDE6NPGBGD1STnuur4msk6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737139664; c=relaxed/simple;
	bh=Azd0LHGJbPV6BAUlAR+Xa9srFF0aNcFCaktmBN9LT5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhGBzmRtDErT6Xtz4iZ+Z+Em6Cf3RLPnM60YQ3sXSN/U8+FlX6rijcFTUifeEYOnde8sq5Ac468pvgZKXaLdPZ7zcCWd1uI2MAri/AR/Ks+Pxr2CDN6uWo69wVURLyka0iNe/ULcqsS/YP4nHyFmYRLd4Mq87GPgmV2kfD1FBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPpIsm3t; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8983825a3so3380616d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 10:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139660; x=1737744460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L1KrStSGgMrLKkKl6uxBZehY7mDLoPXpGyU7mfraHE=;
        b=VPpIsm3tETTi/r1bPLozaojw2/fDFn8yawBI6op76LNRbHrKoSeTITPPVVfRSjv1R9
         m7Kr6waOA+Walp5MMN+9tQ90spGHWHkE08Vb+j7tHeCQH078ght1FyFHhW2rwijMcry2
         17bA3fKnki3ng7URjh7vJrz2hhR/LZdi8fVt4QRxTFej0l0iFdMPjAD413IoG3pCbcW6
         zzrUYJ/LWRYMuIj4TDv36oSwqE/9tJwAfHe/fmmzF8+OL9enWxmN3f+WGq8p5m6kCI9r
         Ti8D2Lw7mCrQsyqrQuRc/HSXFaDvolrfS9i2eX5vUvj42McJkm/dl+JPrTQVGvPl3/4g
         D/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139660; x=1737744460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L1KrStSGgMrLKkKl6uxBZehY7mDLoPXpGyU7mfraHE=;
        b=CKgrCG5kC7nQx6aVChSTPlpVgJ1ciNcaIUwK+cC/+B1c5unLU/PdhNh7I1RwARxd/W
         qMsUhd/YYw4doTA7hoC0iLgzcWjeZOAjlFy9YrTZJsgCMVsZIO2D3ex+mFp/U7lvybxW
         mqoJGjijU3dhQu7h3f42VPd9uBLOq+sxgHlAIXStnn3TcKHqIXB2Y3g6aq52qk/OPV4K
         DGKkwcUSknpbm/MjXQNeh4pIQHU2IBvA9aoxISmQ+VeTbvr197LEXVQc16r8n7NlqUKF
         Ig0ZpV7DDtlyXEjBJraYP3C8GECtshftnOcYjiqB6qzt2Ibk00lEyhlQUTV6JzaKJIeM
         L2Og==
X-Forwarded-Encrypted: i=1; AJvYcCV4NdACxFb2IXD+dgiimBfIrQ+2t75GQ7f9O/pbcoeoobN898EKI6SUbQdaqGZ9NjakI+GPv1fa0oFc8qBA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/SQECAvGXwNIPP2WjDseAqCCb8tXFIBvwQ6v7GR7PxW0vUPd1
	d1WBiZGa+sNcc57hG/qI0aQlZtICKuGJsVaOZLJU3d9YGfCsQIZD
X-Gm-Gg: ASbGncvZZPA8yi6Ucj+UJVNrHIo9ZNz/z9njckc9KK3Lgl5C2/7+lG89AlS5uH4qMht
	6pm9WogXxaxi+WGNRNIOFANu8R9Uek0mcnqwkzQCCiV/+ghVXVTiqlTLDP6KU799Wxv8tA7wfPy
	js2NATwrlgqeMVU4I3mNQHFJBZUDilyDGshMsd838mPUlbQZOMw1MSOKFN5T81B+kWV9KpyH55C
	GKGgHwr+LLIIXDGtP801aXxvCiF4Sx/CGcFdg46dKP+fO7/nylg6cPWq6oLUTRQFnOpojID0iRE
	UkuVQqVy6thAcwc=
X-Google-Smtp-Source: AGHT+IEIyw5aGTESg9zUs6A5tho39lsXqAds1z3a8v1SLXZHSS9GUHBu+n7xHH9/ywAcj3SysGTDjA==
X-Received: by 2002:a05:6214:528a:b0:6d8:a90b:1564 with SMTP id 6a1803df08f44-6e1b21ba3f6mr22060366d6.6.1737139660304;
        Fri, 17 Jan 2025 10:47:40 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:39 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 17 Jan 2025 13:47:09 -0500
Subject: [PATCH 3/3] drm/msm: Temporarily disable stall-on-fault after a
 page fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-3-bc9b332b5d0b@gmail.com>
References: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
In-Reply-To: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=9406;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=Azd0LHGJbPV6BAUlAR+Xa9srFF0aNcFCaktmBN9LT5I=;
 b=gspZvcy0PinUMwLI8bcCW+Uo6tVZOE/Ynr6m7+0VeKjlXgIRjeYaEXzAu1aAjUlDpx/jq2nlv
 ln3K0SO9BS3B9wdm/nclFxOBJtN7Ugr7u838eMB87ADklULFCMaraL+
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

When things go wrong, the GPU is capable of quickly generating millions
of faulting translation requests per second. When that happens, in the
stall-on-fault model each access will stall until it wins the race to
signal the fault and then the RESUME register is written. This slows
processing page faults to a crawl as the GPU can generate faults much
faster than the CPU can acknowledge them. It also means that all
available resources in the SMMU are saturated waiting for the stalled
transactions, so that other transactions such as transactions generated
by the GMU, which shares a context bank with the GPU, cannot proceed.
This causes a GMU watchdog timeout, which leads to a failed reset
because GX cannot collapse when there is a transaction pending and a
permanently hung GPU.

On older platforms with qcom,smmu-v2, it seems that when one transaction
is stalled subsequent faulting transactions are terminated, which avoids
this problem, but the MMU-500 follows the spec here.

To work around these problem, disable stall-on-fault as soon as we get a
page fault until a cooldown period after pagefaults stop. This allows
the GMU some guaranteed time to continue working. We also keep it
disabled so long as the current devcoredump hasn't been deleted, because
in that case we likely won't capture another one if there's a fault.

After this commit HFI messages still occasionally time out, because the
crashdump handler doesn't run fast enough to let the GMU resume, but the
driver seems to recover from it. This will probably go away after the
HFI timeout is increased.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 56 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 21 +++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c         |  9 ++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 71dca78cd7a5324e9ff5b14f173e2209fa42e196..a559e47af5b549e154fa6c32ef8879dd856531a2 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_gpu_enable_iommu_stall(adreno_gpu);
+
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
 		ring->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..0e63ee62d3eff3e274bae375430efbdf6f8dccf0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_gpu_enable_iommu_stall(adreno_gpu);
+
 	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
@@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_gpu_enable_iommu_stall(adreno_gpu);
+
 	/*
 	 * Toggle concurrent binning for pagetable switch and set the thread to
 	 * BR since only it can execute the pagetable switch packets.
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1238f326597808eb28b4c6822cbd41a26e555eb9..6bf834d075219193cce187ec5f55aa691121aad3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -246,16 +246,65 @@ u64 adreno_private_address_space_size(struct msm_gpu *gpu)
 	return SZ_4G;
 }
 
+void adreno_gpu_enable_iommu_stall(struct adreno_gpu *adreno_gpu)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	unsigned long flags;
+
+	/*
+	 * Wait until the cooldown period has passed and we would actually
+	 * collect a crashdump to re-enable stall-on-fault.
+	 */
+	spin_lock_irqsave(&adreno_gpu->fault_stall_lock, flags);
+	if (!adreno_gpu->stall_enabled &&
+			READ_ONCE(adreno_gpu->enable_stall_on_submit) &&
+			!READ_ONCE(gpu->crashstate)) {
+		adreno_gpu->stall_enabled = true;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, true);
+	}
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
+}
+
+static void fault_stall_handler(struct timer_list *t)
+{
+	struct adreno_gpu *gpu = from_timer(gpu, t, fault_stall_timer);
+
+	WRITE_ONCE(gpu->enable_stall_on_submit, true);
+}
+
+
 #define ARM_SMMU_FSR_TF                 BIT(1)
 #define ARM_SMMU_FSR_PF			BIT(3)
 #define ARM_SMMU_FSR_EF			BIT(4)
+#define ARM_SMMU_FSR_SS			BIT(30)
 
 int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4])
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const char *type = "UNKNOWN";
-	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
+	bool do_devcoredump = info && (info->fsr & ARM_SMMU_FSR_SS) &&
+		!READ_ONCE(gpu->crashstate);
+	unsigned long irq_flags;
+
+	/*
+	 * In case there is a subsequent storm of pagefaults, disable
+	 * stall-on-fault for at least half a second.
+	 */
+	spin_lock_irqsave(&adreno_gpu->fault_stall_lock, irq_flags);
+	if (adreno_gpu->stall_enabled) {
+		adreno_gpu->stall_enabled = false;
+		adreno_gpu->enable_stall_on_submit = false;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, false);
+
+	}
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_flags);
+
+	mod_timer(&adreno_gpu->fault_stall_timer,
+			round_jiffies_up(jiffies + msecs_to_jiffies(500)));
 
 	/*
 	 * If we aren't going to be resuming later from fault_worker, then do
@@ -1143,6 +1192,11 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		adreno_gpu->info->inactive_period);
 	pm_runtime_use_autosuspend(dev);
 
+	spin_lock_init(&adreno_gpu->fault_stall_lock);
+	timer_setup(&adreno_gpu->fault_stall_timer, fault_stall_handler, 0);
+	adreno_gpu->enable_stall_on_submit = true;
+	adreno_gpu->stall_enabled = true;
+
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index dcf454629ce037b2a8274a6699674ad754ce1f07..c59501afa40c223d02bea3ff9b0dbc309d099317 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -205,6 +205,25 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
+	spinlock_t fault_stall_lock;
+
+	struct timer_list fault_stall_timer;
+
+	/**
+	 * enable_stall_on_submit:
+	 *
+	 * Whether to re-enable stall-on-fault on the next submit.
+	 */
+	bool enable_stall_on_submit;
+
+	/**
+	 * stall_enabled:
+	 *
+	 * Whether stall-on-fault is currently enabled.
+	 */
+	bool stall_enabled;
+
+
 	struct {
 		/**
 		 * @rgb565_predicator: Unknown, introduced with A650 family,
@@ -629,6 +648,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
+void adreno_gpu_enable_iommu_stall(struct adreno_gpu *gpu);
+
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..8d5380e6dcc217c7c209b51527bf15748b3ada71 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -351,6 +351,14 @@ static void msm_iommu_resume_translation(struct msm_mmu *mmu)
 		adreno_smmu->resume_translation(adreno_smmu->cookie, true);
 }
 
+static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
+
+	if (adreno_smmu->set_stall)
+		adreno_smmu->set_stall(adreno_smmu->cookie, enable);
+}
+
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -399,6 +407,7 @@ static const struct msm_mmu_funcs funcs = {
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
 		.resume_translation = msm_iommu_resume_translation,
+		.set_stall = msm_iommu_set_stall,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881f2a6789ae2d03e1c02d10046331a..2694a356a17904e7572b767b16ed0cee806406cf 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -16,6 +16,7 @@ struct msm_mmu_funcs {
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
 	void (*resume_translation)(struct msm_mmu *mmu);
+	void (*set_stall)(struct msm_mmu *mmu, bool enable);
 };
 
 enum msm_mmu_type {

-- 
2.47.1


