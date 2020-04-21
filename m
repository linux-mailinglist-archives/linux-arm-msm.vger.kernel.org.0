Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76041B338C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 01:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgDUXmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 19:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgDUXmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 19:42:11 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57DDAC0610D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 16:42:10 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id 71so238671qtc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 16:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e4Sn3gzNMx3f1NHoTDeEaScSjYSp8A1Jq9EKbXYsmwU=;
        b=LDJ7L+jLYURqICOdP6Lz7kxp6uFdjIIiwxa8BTgImMyrgj9ZPe0uqjeMpI0+3uE96p
         X2KbfbO36nqAllrk/axdzvEuoXSTZblqJhlXZCJYiliVbN8b0GjsgR20pvv8KOCBYUaZ
         ihV8zSCsbgF02otRXgvLDSc6/3WFjaMhqhs8E/e4mO9LXESWNqlFMBYsK8wG/o4h2e4c
         dIqpEE/btP7yIl2EUrPR8Wz/Ry/qJZAXdkSoSSUB9v7dbdhqn7JzUzPxNA6g6TMwOAP1
         OYfDGGDzEcHtD+hMLxLOgDQ8xj4eD+wAS/8uYhquSJgZo7jEf6jKZ9AwmFqrpJpFB6Ad
         UcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e4Sn3gzNMx3f1NHoTDeEaScSjYSp8A1Jq9EKbXYsmwU=;
        b=d8H83l6NgoTaKCce2i2fDOntUke8Rh9ws07EWzcI5H0zLkxv65/YbkqiJ9f6a7ae+L
         GRsv10KxXS6gbMQ963SbC69JfayfmzwR1UrTfeaYxI6rLU6jFOJMH6vfL7nG4QmHNHZ/
         VwZVMjP/lz9qwNx9FBJ+Z4QWXbXvYCMOf8e6D8GgHhUcS45YcwMOcoleJkvAE0i2u42e
         4GAI+hsTbdAKvOdWmAh2CWRYBBASSk8kBHM/N1nJ83ki4WAoUqwJLIO/IvFKNrGOBA41
         BqJdUShCkD1BsJr7Eqwzi2HeKllfFJFr8sFHvll7zJ1n8kbJt3S+3tZU45Diim69A8vT
         9hGg==
X-Gm-Message-State: AGi0PuZMgQAIiMfkzlxtzP3fOY4ZhyticTpDmS6xN/g9kRH7l0dp8Tf8
        wgKc+aVJhsdrVcpE6vPMsevB1g==
X-Google-Smtp-Source: APiQypIbmJQRQBmiFtFaIo10GNaw3HrB2Vwv4bJHVQ9o0KKbBl8WEk/GfbUG1u00FJjmAHChdq30UA==
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr23568064qtj.154.1587512529424;
        Tue, 21 Apr 2020 16:42:09 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 16:42:09 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 6/9] drm/msm/a6xx: A640/A650 GMU firmware path
Date:   Tue, 21 Apr 2020 19:41:24 -0400
Message-Id: <20200421234127.27965-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer GPUs have different GMU firmware path.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 135 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  11 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |   6 +
 3 files changed, 136 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b22a69e2f4b0..4aef5fe985d6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -571,6 +571,8 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
 {
 	/* Disable GMU WB/RB buffer */
 	gmu_write(gmu, REG_A6XX_GMU_SYS_BUS_CONFIG, 0x1);
+	gmu_write(gmu, REG_A6XX_GMU_ICACHE_CONFIG, 0x1);
+	gmu_write(gmu, REG_A6XX_GMU_DCACHE_CONFIG, 0x1);
 
 	gmu_write(gmu, REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL, 0x9c40400);
 
@@ -600,14 +602,91 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
 		A6XX_GMU_RPMH_CTRL_GFX_VOTE_ENABLE);
 }
 
+static int in_range(u32 addr, u32 start, u32 size)
+{
+	return addr >= start && addr < start + size;
+}
+
+static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct firmware *fw_image = adreno_gpu->fw[ADRENO_FW_GMU];
+	const struct block_header {
+		u32 addr;
+		u32 size;
+		u32 type;
+		u32 value;
+		u32 data[];
+	} *blk;
+	struct a6xx_gmu_bo *mem;
+	u32 reg;
+
+	u32 itcm_base = 0x00000000;
+	u32 dtcm_base = 0x00040000;
+
+	if (adreno_is_a650(adreno_gpu))
+		dtcm_base = 0x10004000;
+
+	if (gmu->legacy) {
+		/* Sanity check the size of the firmware that was loaded */
+		if (fw_image->size > 0x8000) {
+			DRM_DEV_ERROR(gmu->dev,
+				"GMU firmware is bigger than the available region\n");
+			return -EINVAL;
+		}
+
+		gmu_write_bulk(gmu, REG_A6XX_GMU_CM3_ITCM_START,
+			       (u32*) fw_image->data, fw_image->size >> 2);
+		return 0;
+	}
+
+
+	for (blk = (const struct block_header *) fw_image->data;
+	     (const u8*) blk < fw_image->data + fw_image->size;
+	     blk = (const struct block_header *) &blk->data[blk->size >> 2]) {
+		if (blk->size == 0)
+			continue;
+
+		reg = 0;
+		mem = NULL;
+
+		if (in_range(blk->addr, itcm_base, SZ_16K))
+			reg = REG_A6XX_GMU_CM3_ITCM_START + ((blk->addr - itcm_base) >> 2);
+		else if (in_range(blk->addr, dtcm_base, SZ_16K))
+			reg = REG_A6XX_GMU_CM3_DTCM_START + ((blk->addr - dtcm_base) >> 2);
+		else if (in_range(blk->addr, gmu->icache.iova, gmu->icache.size))
+			mem = &gmu->icache;
+		else if (in_range(blk->addr, gmu->dcache.iova, gmu->dcache.size))
+			mem = &gmu->dcache;
+		else if (in_range(blk->addr, gmu->dummy.iova, gmu->dummy.size))
+			mem = &gmu->dummy;
+		else {
+			DRM_DEV_ERROR(gmu->dev,
+				"failed to match fw block (addr=%.8x size=%d data[0]=%.8x)\n",
+				blk->addr, blk->size, blk->data[0]);
+		}
+
+		if (reg)
+			gmu_write_bulk(gmu, reg, blk->data, blk->size >> 2);
+
+		if (mem)
+			memcpy(mem->virt + blk->addr - mem->iova, blk->data, blk->size);
+	}
+
+	return 0;
+}
+
 static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
 	static bool rpmh_init;
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
-	int i, ret;
+	int ret;
 	u32 chipid;
-	u32 *image;
+
+	if (adreno_is_a650(adreno_gpu))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
 
 	if (state == GMU_WARM_BOOT) {
 		ret = a6xx_rpmh_start(gmu);
@@ -618,13 +697,6 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 			"GMU firmware is not loaded\n"))
 			return -ENOENT;
 
-		/* Sanity check the size of the firmware that was loaded */
-		if (adreno_gpu->fw[ADRENO_FW_GMU]->size > 0x8000) {
-			DRM_DEV_ERROR(gmu->dev,
-				"GMU firmware is bigger than the available region\n");
-			return -EINVAL;
-		}
-
 		/* Turn on register retention */
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
@@ -638,11 +710,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 				return ret;
 		}
 
-		image = (u32 *) adreno_gpu->fw[ADRENO_FW_GMU]->data;
-
-		for (i = 0; i < adreno_gpu->fw[ADRENO_FW_GMU]->size >> 2; i++)
-			gmu_write(gmu, REG_A6XX_GMU_CM3_ITCM_START + i,
-				image[i]);
+		ret = a6xx_gmu_fw_load(gmu);
+		if (ret)
+			return ret;
 	}
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, 0);
@@ -769,12 +839,20 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Enable the GMU interrupt */
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_MASK, ~A6XX_GMU_IRQ_MASK);
+
 	enable_irq(gmu->gmu_irq);
 
 	/* Check to see if we are doing a cold or warm boot */
 	status = gmu_read(gmu, REG_A6XX_GMU_GENERAL_7) == 1 ?
 		GMU_WARM_BOOT : GMU_COLD_BOOT;
 
+	/*
+	 * Warm boot path does not work on newer GPUs
+	 * Presumably this is because icache/dcache regions must be restored
+	 */
+	if (!gmu->legacy)
+		status = GMU_COLD_BOOT;
+
 	ret = a6xx_gmu_fw_start(gmu, status);
 	if (ret)
 		goto out;
@@ -957,6 +1035,9 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
 	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
 
 	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
 	msm_gem_address_space_put(gmu->aspace);
@@ -974,12 +1055,14 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	size = PAGE_ALIGN(size);
 	if (!iova) {
 		/* no fixed address - use GMU's uncached range */
-		range_start = 0x60000000;
+		range_start = 0x60000000 + PAGE_SIZE; /* skip dummy page */
 		range_end = 0x80000000;
 	} else {
 		/* range for fixed address */
 		range_start = iova;
 		range_end = iova + size;
+		/* use IOMMU_PRIV for icache/dcache */
+		flags |= MSM_BO_MAP_PRIV;
 	}
 
 	bo->obj = msm_gem_new(dev, size, flags);
@@ -1320,7 +1403,27 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	if (!adreno_is_a640(adreno_gpu) && !adreno_is_a650(adreno_gpu)) {
+	/* Allocate memory for the GMU dummy page */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, SZ_4K, 0x60000000);
+	if (ret)
+		goto err_memory;
+
+	if (adreno_is_a650(adreno_gpu)) {
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
+			SZ_16M - SZ_16K, 0x04000);
+		if (ret)
+			goto err_memory;
+	} else if (adreno_is_a640(adreno_gpu)) {
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
+			SZ_256K - SZ_16K, 0x04000);
+		if (ret)
+			goto err_memory;
+
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->dcache,
+			SZ_256K - SZ_16K, 0x44000);
+		if (ret)
+			goto err_memory;
+	} else {
 		/* HFI v1, has sptprac */
 		gmu->legacy = true;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 463e2d5f2bb9..526911010cb1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -57,6 +57,9 @@ struct a6xx_gmu {
 
 	struct a6xx_gmu_bo hfi;
 	struct a6xx_gmu_bo debug;
+	struct a6xx_gmu_bo icache;
+	struct a6xx_gmu_bo dcache;
+	struct a6xx_gmu_bo dummy;
 
 	int nr_clocks;
 	struct clk_bulk_data *clocks;
@@ -92,6 +95,14 @@ static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
 	return msm_writel(value, gmu->mmio + (offset << 2));
 }
 
+static inline void
+gmu_write_bulk(struct a6xx_gmu *gmu, u32 offset, const u32 *data, u32 size)
+{
+	int i;
+	for (i = 0; i < size; i++)
+		gmu_write(gmu, offset + i, data[i]);
+}
+
 static inline void gmu_rmw(struct a6xx_gmu *gmu, u32 reg, u32 mask, u32 or)
 {
 	u32 val = gmu_read(gmu, reg);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 1cc1c135236b..eb2cd41dae6e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -101,6 +101,10 @@ static inline uint32_t A6XX_HFI_IRQ_OOB_MASK(uint32_t val)
 
 #define REG_A6XX_GMU_DCVS_RETURN				0x000023ff
 
+#define REG_A6XX_GMU_ICACHE_CONFIG				0x00004c00
+
+#define REG_A6XX_GMU_DCACHE_CONFIG				0x00004c01
+
 #define REG_A6XX_GMU_SYS_BUS_CONFIG				0x00004c0f
 
 #define REG_A6XX_GMU_CM3_SYSRESET				0x00005000
@@ -199,6 +203,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE		0x000050ec
 
+#define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
+
 #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
 
 #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
-- 
2.26.1

