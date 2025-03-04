Return-Path: <linux-arm-msm+bounces-50231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27FA4E89A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4481917D08E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7030A283CA1;
	Tue,  4 Mar 2025 16:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfE7TIDQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6B283C9A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107450; cv=none; b=lDY7w18CP6Rov8J/LpWgHLo1NhzcvzkZC+aWexfuqxxZ6YXF1MoiZ55/BJtHmtWlz0TUWAqqQ9x64j0ma4PWY9qZS+8pda1JZ9z4a4HEL3mqECGs3wHkR4ueoT8DfDhAs4GFzVM65Z5z2Ez3clXm4i12VmJ8XqgEJGz+ikwf4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107450; c=relaxed/simple;
	bh=1LEQ/SMNbwf2yI/kiLpEh729+NspG9MjxFycNdw8Mco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BoFPnpo+kxZ+bwPv6xbB+IUr05TORwwDdvb3Hz4LyiypWIr/CIsU3HDzDiZND2fukuy3ziuTa00fA2CENzmiptIeN6ZoW5hSr1vp+v911EhKSR2DEh0l4KqUAON8bmY6QgoF5C6aVvPSJeNMXpRe4Kc3U0pxGWuzl8He/R4msyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfE7TIDQ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e88ee9dd84so9052416d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741107446; x=1741712246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvSBZTv+Bn83Qgi3n8/RjQE01uKIcw895iDtbXzMRaM=;
        b=BfE7TIDQ2zLek1Qj12YD1NKTE3S7EJh4tn0+yM71/NWEdt5wm+5BbevB5eGawvQu67
         ZoE+MvXvnpE/N6JiaDQtof9L7pt+7WuR1fU8xgSZv1ksdtYPXmDGuRV0tsAnqZnOziX3
         9KVMcT1aMhwNi9Gx+NV0abRJtZeT9P+tVV5WjSyvtVT+I+heo9BNlZQFKCPdTvU2Zmdb
         gsXTZ3Hi9RmGMW3OAIlO5ENbPWGN4GUEl12DbtcEoZi8pgqT3WPPWy59a8CWQ0PvxWJu
         ClBdbzgK1GBNpZrezSf2C/mdZi//b/czT8Q/rtQEu82fLZm5+8mqW9NuB/p8zKSUig03
         SPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107446; x=1741712246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvSBZTv+Bn83Qgi3n8/RjQE01uKIcw895iDtbXzMRaM=;
        b=aJNUsgZzdUmjRr8WWf9MK4FfVy5rwZ5vsW3ConeePC5/sLZ3/c2gAHXEbf4runPoe2
         zpw4hQacyGopz+nfpR4fTft/qeXVOeHa2ZEX111hLEgA+/D1cDuy6A3uSM6I060jznAI
         JdWetsLoedW35zVKc4R4R776cOWaNd3S9TDq7fU57Eaa+gxDSmNQbeEs6MOxzOu/HCaq
         32Vng5/USFsUarws+bhPx/nsYdH7U5qVxEpZMLugrRcSLgfle9KzJqxiivZ/wFSgj7zv
         ePzLoLrKUJrj35CpFIIzUwuJHiGXpFB7XPZwrrDUgp8sUjSt/+qWx4SMgXjCVM/bp5aF
         xUbA==
X-Forwarded-Encrypted: i=1; AJvYcCVkzGBBm+vgac9rq9ZuE1wRFoaK0VwUlki1hB7SSeH7ldo/SrDTc9nEe6S6SUCf6xbfpOVATzdWp/3n2W8Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2sIdy5WauA9iHqWqNWUHIEVqG9USb3sSRq2/BwH56LGKzbbEc
	XFbRKpqzZ5ocD26qvfpwghXXkSgbvnsxccQzyhAOu+VClqxticQh
X-Gm-Gg: ASbGnctUwrq0nq99HpaxvX8c0iEB6k7f8uouT1VMzYfEvrv9dWebEeeCwkP7iMWbEr0
	gLzM1o0RNUo+UlJVkucNMi7OIB20EAlWu12DjFB2Ny0PkIOMesJ7s0QrXapKdVxQ/rAbQZNWLyS
	r21VpeyLWSwE9zt2bcTcnElkUlzbgfkkLbLSBNLyDeiUdu0OhnMZABIwxP5tCWFulo6PuZep7S8
	KHS8DbbNr5ITzLmYAVv2oKRRYNS5l4Q+ho2ICWL3TvxcT3vxWhO7B3tb2KVPYtX3HvIH9qiOO7e
	kl+IEwtRdSRHd2rXrAsq+eH4n6269O3lsF32KpLM6DKGUCAIz/kbqzLyXvrzftRaA7v5HP1GzDZ
	ABNs=
X-Google-Smtp-Source: AGHT+IG5ertw9SqZ82seP6yo0bwmOgw/MoKrjDy2609FiAuOH0UXSvPb32PmJG14bpD2BohhLdq4Qw==
X-Received: by 2002:a05:6214:2462:b0:6d8:e6be:50fc with SMTP id 6a1803df08f44-6e8a0d7281amr88986276d6.6.1741107446025;
        Tue, 04 Mar 2025 08:57:26 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:57:25 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:51 -0500
Subject: [PATCH v4 5/5] drm/msm: Temporarily disable stall-on-fault after a
 page fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-5-be14be37f4c3@gmail.com>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=9275;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=1LEQ/SMNbwf2yI/kiLpEh729+NspG9MjxFycNdw8Mco=;
 b=da8F8D1JeaERAjqcBDywOQpSKylWhhwOpzeiLpZTehLyJpqF0L/L+8uNejzktaGj0JeAqNW7Z
 /QFELiO7dWWCtNdvh2Mupw/wlKE+PXfXv4iEBsA3JcXDq3o0HxQpHgb
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
the GMU some guaranteed time to continue working. We only use
stall-on-fault to halt the GPU while we collect a devcoredump and we
always terminate the transaction afterward, so it's fine to miss some
subsequent page faults. We also keep it disabled so long as the current
devcoredump hasn't been deleted, because in that case we likely won't
capture another one if there's a fault.

After this commit HFI messages still occasionally time out, because the
crashdump handler doesn't run fast enough to let the GMU resume, but the
driver seems to recover from it. This will probably go away after the
HFI timeout is increased.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 42 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 24 +++++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c         |  9 +++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 71dca78cd7a5324e9ff5b14f173e2209fa42e196..670141531112c9d29cef8ef1fd51b74759fdd6d2 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
 		ring->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..5a34cd2109a2d74c92841448a61ccb0d4f34e264 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
@@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	/*
 	 * Toggle concurrent binning for pagetable switch and set the thread to
 	 * BR since only it can execute the pagetable switch packets.
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1238f326597808eb28b4c6822cbd41a26e555eb9..bac586101dc0494f46b069a8440a45825dfe9b5e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -246,16 +246,53 @@ u64 adreno_private_address_space_size(struct msm_gpu *gpu)
 	return SZ_4G;
 }
 
+void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
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
+			ktime_after(ktime_get(), adreno_gpu->stall_reenable_time) &&
+			!READ_ONCE(gpu->crashstate)) {
+		adreno_gpu->stall_enabled = true;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, true);
+	}
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
+}
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
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, false);
+	}
+	adreno_gpu->stall_reenable_time = ktime_add_ms(ktime_get(), 500);
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_flags);
 
 	/*
 	 * If we aren't going to be resuming later from fault_worker, then do
@@ -1143,6 +1180,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		adreno_gpu->info->inactive_period);
 	pm_runtime_use_autosuspend(dev);
 
+	spin_lock_init(&adreno_gpu->fault_stall_lock);
+	adreno_gpu->stall_enabled = true;
+
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index dcf454629ce037b2a8274a6699674ad754ce1f07..a528036b46216bd898f6d48c5fb0555c4c4b053b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -205,6 +205,28 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
+	/**
+	 * fault_stall_lock:
+	 *
+	 * Serialize changes to stall-on-fault state.
+	 */
+	spinlock_t fault_stall_lock;
+
+	/**
+	 * fault_stall_reenable_time:
+	 *
+	 * if stall_enabled is false, when to reenable stall-on-fault.
+	 */
+	ktime_t stall_reenable_time;
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
@@ -629,6 +651,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
+void adreno_check_and_reenable_stall(struct adreno_gpu *gpu);
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


