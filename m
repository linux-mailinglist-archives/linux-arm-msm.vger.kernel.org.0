Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D495A397CA1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 00:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbhFAWqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 18:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235080AbhFAWqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 18:46:19 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C08C061574;
        Tue,  1 Jun 2021 15:44:38 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id z4so77189plg.8;
        Tue, 01 Jun 2021 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DP1YfdywWVyCkPxUu5K+y6vptB6uD3iQf4y8uHSI9wc=;
        b=Ey82mHQF/GUYn2qYc/zc+1sb4QPT0AnYIMxOrNMl01Yyen2Zxo3G/oQV3Om/1Ja5Sz
         gO9ATvgwOf+MWBdOM96T1B7RMj6A/3tvDZ1/qmnesa5mBmt5eh2y9t55IdR6Sw2R1D58
         TTjqVKIw+nG274zjp46CWaPyEhQG/PRdrZvlEasE1uvK7P0qBwx2y9hmdlk9d/uyCyni
         I4XFabWl85PTzXpRBQI8GKYskdocg4vtxn7wc2xqFTvrrHw0AWNm+BRZnVVB9Zf5jDff
         mT0RoDcJkGBuVkMkKaGLP3orYQ3s+p5mo8vkEn2A9/4Ex5RrKtbRlaw32JgOZ27DDBrT
         x0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DP1YfdywWVyCkPxUu5K+y6vptB6uD3iQf4y8uHSI9wc=;
        b=eAftNWOwDk+DWg6UH1d4SRtUDrkxgsIoYetCu1WtSzfN3LsVOQrA9Yc4h8KWG01g5t
         IDjYM9dPcwGL1Pp3C8QDq+QpyXHi7QlPQ9Y9alk5ejBM1bZcKitufjtXJx4ruWP7glik
         1UufeHtPFeis9Njx8wEbYjjzKYrw1kLddPMGf1m0FpWFkziRHuRyNCWZJNgHgAmwabti
         /B+XoNCSSZWYSAZvdE1U0jz7WsuFe412qnjEUSGbfOw6+0EFE5P0DLO2OEC86t4tXQa1
         b4seNZ8RtAWbtYJg8n+3bysh15pkxU1HN8IOreGOamfGksExq44pNljcP23fRsd7kytQ
         u5vQ==
X-Gm-Message-State: AOAM530drweiGGkKLmeF03fV3/1Vjb/5goJSsqqDXqIWJ7EJKHWoMjU2
        DXyTLN9XKxESz8jvxL49nYg=
X-Google-Smtp-Source: ABdhPJzZBjX8GeX9agDLi9ZI5KEdhTTc/cZkYTORZDv2aaLnDPHLkdknwu1Cb+nrWHHJFjo2eIW7aA==
X-Received: by 2002:a17:902:b218:b029:f4:4b88:a44a with SMTP id t24-20020a170902b218b02900f44b88a44amr28166065plr.52.1622587477600;
        Tue, 01 Jun 2021 15:44:37 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id g6sm5029941pfq.110.2021.06.01.15.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 15:44:36 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 6/6] drm/msm: devcoredump iommu fault support
Date:   Tue,  1 Jun 2021 15:47:25 -0700
Message-Id: <20210601224750.513996-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601224750.513996-1-robdclark@gmail.com>
References: <20210601224750.513996-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Wire up support to stall the SMMU on iova fault, and collect a devcore-
dump snapshot for easier debugging of faults.

Currently this is a6xx-only, but mostly only because so far it is the
only one using adreno-smmu-priv.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 29 +++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 ++++++++
 drivers/gpu/drm/msm/msm_gem.h           |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c    |  1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 48 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 17 +++++++++
 drivers/gpu/drm/msm/msm_gpummu.c        |  5 +++
 drivers/gpu/drm/msm/msm_iommu.c         | 11 ++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 9 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 094dc17fd20f..0dcde917e575 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1008,6 +1008,16 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 	struct msm_gpu *gpu = arg;
 	struct adreno_smmu_fault_info *info = data;
 	const char *type = "UNKNOWN";
+	const char *block;
+	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
+
+	/*
+	 * If we aren't going to be resuming later from fault_worker, then do
+	 * it now.
+	 */
+	if (!do_devcoredump) {
+		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+	}
 
 	/*
 	 * Print a default message if we couldn't get the data from the
@@ -1031,15 +1041,30 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
+	block = a6xx_fault_block(gpu, info->fsynr1 & 0xff);
+
 	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
 			info->ttbr0, iova,
-			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
-			a6xx_fault_block(gpu, info->fsynr1 & 0xff),
+			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
+			type, block,
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
 
+	if (do_devcoredump) {
+		/* Turn off the hangcheck timer to keep it from bothering us */
+		del_timer(&gpu->hangcheck_timer);
+
+		gpu->fault_info.ttbr0 = info->ttbr0;
+		gpu->fault_info.iova  = iova;
+		gpu->fault_info.flags = flags;
+		gpu->fault_info.type  = type;
+		gpu->fault_info.block = block;
+
+		kthread_queue_work(gpu->worker, &gpu->fault_work);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index cf897297656f..4e88d4407667 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -684,6 +684,21 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			adreno_gpu->info->revn, adreno_gpu->rev.core,
 			adreno_gpu->rev.major, adreno_gpu->rev.minor,
 			adreno_gpu->rev.patchid);
+	/*
+	 * If this is state collected due to iova fault, so fault related info
+	 *
+	 * TTBR0 would not be zero, so this is a good way to distinguish
+	 */
+	if (state->fault_info.ttbr0) {
+		const struct msm_gpu_fault_info *info = &state->fault_info;
+
+		drm_puts(p, "fault-info:\n");
+		drm_printf(p, "  - ttbr0=%.16llx\n", info->ttbr0);
+		drm_printf(p, "  - iova=%.16lx\n", info->iova);
+		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
+		drm_printf(p, "  - type=%s\n", info->type);
+		drm_printf(p, "  - source=%s\n", info->block);
+	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 03e2cc2a2ce1..405f8411e395 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -328,6 +328,7 @@ struct msm_gem_submit {
 	struct dma_fence *fence;
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
+	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
 	bool valid;         /* true if no cmdstream patching needed */
 	bool in_rb;         /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5480852bdeda..44f84bfd0c0e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -50,6 +50,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->ring = gpu->rb[queue->prio];
+	submit->fault_dumped = false;
 
 	/* initially, until copy_from_user() and bo lookup succeeds: */
 	submit->nr_bos = 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4d280bf446e6..4da2053c1ffb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -401,6 +401,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Fill in the additional crash state information */
 	state->comm = kstrdup(comm, GFP_KERNEL);
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
+	state->fault_info = gpu->fault_info;
 
 	if (submit) {
 		int i, nr = 0;
@@ -573,6 +574,52 @@ static void recover_worker(struct kthread_work *work)
 	msm_gpu_retire(gpu);
 }
 
+static void fault_worker(struct kthread_work *work)
+{
+	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
+	struct drm_device *dev = gpu->dev;
+	struct msm_gem_submit *submit;
+	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
+	char *comm = NULL, *cmd = NULL;
+
+	mutex_lock(&dev->struct_mutex);
+
+	submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
+	if (submit && submit->fault_dumped)
+		goto resume_smmu;
+
+	if (submit) {
+		struct task_struct *task;
+
+		task = get_pid_task(submit->pid, PIDTYPE_PID);
+		if (task) {
+			comm = kstrdup(task->comm, GFP_KERNEL);
+			cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
+			put_task_struct(task);
+		}
+
+		/*
+		 * When we get GPU iova faults, we can get 1000s of them,
+		 * but we really only want to log the first one.
+		 */
+		submit->fault_dumped = true;
+	}
+
+	/* Record the crash state */
+	pm_runtime_get_sync(&gpu->pdev->dev);
+	msm_gpu_crashstate_capture(gpu, submit, comm, cmd, true);
+	pm_runtime_put_sync(&gpu->pdev->dev);
+
+	kfree(cmd);
+	kfree(comm);
+
+resume_smmu:
+	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
+	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+
+	mutex_unlock(&dev->struct_mutex);
+}
+
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
 	mod_timer(&gpu->hangcheck_timer,
@@ -949,6 +996,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	INIT_LIST_HEAD(&gpu->active_list);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
+	kthread_init_work(&gpu->fault_work, fault_worker);
 
 	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index c15e5fd675d2..8dae601085ee 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -71,6 +71,15 @@ struct msm_gpu_funcs {
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
+/* Additional state for iommu faults: */
+struct msm_gpu_fault_info {
+	u64 ttbr0;
+	unsigned long iova;
+	int flags;
+	const char *type;
+	const char *block;
+};
+
 struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
@@ -135,6 +144,12 @@ struct msm_gpu {
 #define DRM_MSM_HANGCHECK_JIFFIES msecs_to_jiffies(DRM_MSM_HANGCHECK_PERIOD)
 	struct timer_list hangcheck_timer;
 
+	/* Fault info for most recent iova fault: */
+	struct msm_gpu_fault_info fault_info;
+
+	/* work for handling GPU ioval faults: */
+	struct kthread_work fault_work;
+
 	/* work for handling GPU recovery: */
 	struct kthread_work recover_work;
 
@@ -243,6 +258,8 @@ struct msm_gpu_state {
 	char *comm;
 	char *cmd;
 
+	struct msm_gpu_fault_info fault_info;
+
 	int nr_bos;
 	struct msm_gpu_state_bo *bos;
 };
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 379496186c7f..f7d1945e0c9f 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -68,6 +68,10 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
+static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
+{
+}
+
 static void msm_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
@@ -83,6 +87,7 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_gpummu_map,
 		.unmap = msm_gpummu_unmap,
 		.destroy = msm_gpummu_destroy,
+		.resume_translation = msm_gpummu_resume_translation,
 };
 
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 6975b95c3c29..eed2a762e9dd 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -184,6 +184,9 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	 * the arm-smmu driver as a trigger to set up TTBR0
 	 */
 	if (atomic_inc_return(&iommu->pagetables) == 1) {
+		/* Enable stall on iommu fault: */
+		adreno_smmu->set_stall(adreno_smmu->cookie, true);
+
 		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
 		if (ret) {
 			free_io_pgtable_ops(pagetable->pgtbl_ops);
@@ -226,6 +229,13 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 	return 0;
 }
 
+static void msm_iommu_resume_translation(struct msm_mmu *mmu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
+
+	adreno_smmu->resume_translation(adreno_smmu->cookie, true);
+}
+
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -273,6 +283,7 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
+		.resume_translation = msm_iommu_resume_translation,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index a88f44c3268d..de158e1bf765 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -15,6 +15,7 @@ struct msm_mmu_funcs {
 			size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
+	void (*resume_translation)(struct msm_mmu *mmu);
 };
 
 enum msm_mmu_type {
-- 
2.31.1

