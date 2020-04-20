Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A06E1B0DC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 16:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbgDTOD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 10:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729218AbgDTOD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 10:03:56 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61968C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:03:56 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id m67so10532898qke.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5wiA5TpN8HWy5aksHuDRRPcXTpQtsJoeuncyM+XhNEU=;
        b=i7P+eZZf3msTeWbAIPTGyLn7ln/IqwEkbnZEstnwQartX2fG4d5qRLf1re5K6gH4xP
         ni20SsjiTIzzsIAhr0nNj3cf8ascYmfMG+yFnpgzumL01kmOGLIJcDUp7lml8Qoj9eK3
         nrL/tAYq0df/vbTZlqq6Mb9ZC7pS4CqkOyiHjjnGEU/+EI7QwX7SZWEsD8GS22hvevGd
         9OFwwylgg+EsA39HXeYoFTePs3HW8WJCHLZBTL8UNLbH8DHc9jjbDQzbgRZOMs1tfgfz
         EPSYXJKS9dZYzs8hsSQJFKKfMWnn4YWu21HLzsBJ54VlvNjqkRntgaXuOHaj7FSUIfZp
         8U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5wiA5TpN8HWy5aksHuDRRPcXTpQtsJoeuncyM+XhNEU=;
        b=GgeoJxmViZ56EB7H4cFCXZVD/foAn03+UA77KDOfMqgRtR1g1lyyvKFN7eEVjL+pZa
         HWmXpZdQNSkDKe8FZpnmwosBFo51F4ET+VhsFeWalQd8P7P3i6E1aRgljtPAd31JvvSs
         KiKHDhVYyPrRN5MHTWyYeDiTSOnfp7Pn/pAcRDhp3tTYtW3wWLEqMLGOAqOzMNcTKbWm
         RxhH3JT1ovyxzgh+m0S80SvOe/wdViiOtc1e6IzZqsL8iVU1onG3DkZYi1e+EDeHT/ma
         BVON8NGCGy3odbCfRwt50I1LL9m27N1tcA3z41NgUSji3bqNzWKGVPiBbN+zZSYogsbe
         nauA==
X-Gm-Message-State: AGi0PuZDsogItStti8pAZEEWbkGVA0xlnv1hjzp4vwPL56oDQFVMTMUU
        IFhEiecOYmKvAdGJVhG5spGn3A==
X-Google-Smtp-Source: APiQypImwBZS/W4osorIoiXMrglEpKAksu4A1gbcuZp2TfFYEKih7JLgINAFFMD+Kcp01fMbWZ7Z5A==
X-Received: by 2002:a05:620a:1458:: with SMTP id i24mr16094926qkl.279.1587391435499;
        Mon, 20 Apr 2020 07:03:55 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 07:03:55 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/9] drm/msm/a6xx: A640/A650 GMU firmware path
Date:   Mon, 20 Apr 2020 10:03:09 -0400
Message-Id: <20200420140313.7263-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer GPUs have different gmu firmware path.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 136 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  11 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |   6 +
 3 files changed, 138 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index dc2d69837110..6dffd1095a24 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -570,6 +570,8 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
 {
 	/* Disable GMU WB/RB buffer */
 	gmu_write(gmu, REG_A6XX_GMU_SYS_BUS_CONFIG, 0x1);
+	gmu_write(gmu, REG_A6XX_GMU_ICACHE_CONFIG, 0x1);
+	gmu_write(gmu, REG_A6XX_GMU_DCACHE_CONFIG, 0x1);
 
 	gmu_write(gmu, REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL, 0x9c40400);
 
@@ -599,14 +601,91 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
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
+		else if (in_range(blk->addr, gmu->icache->iova, gmu->icache->size))
+			mem = gmu->icache;
+		else if (in_range(blk->addr, gmu->dcache->iova, gmu->dcache->size))
+			mem = gmu->dcache;
+		else if (in_range(blk->addr, gmu->dummy->iova, gmu->dummy->size))
+			mem = gmu->dummy;
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
@@ -617,13 +696,6 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
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
 
@@ -637,11 +709,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
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
@@ -768,12 +838,20 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
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
@@ -1322,6 +1400,10 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	iounmap(gmu->mmio);
 	gmu->mmio = NULL;
 
+	a6xx_gmu_memory_free(gmu, gmu->icache);
+	a6xx_gmu_memory_free(gmu, gmu->dcache);
+	a6xx_gmu_memory_free(gmu, gmu->dummy);
+	a6xx_gmu_memory_free(gmu, gmu->debug);
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	iommu_detach_device(gmu->domain, gmu->dev);
@@ -1366,7 +1448,27 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	if (!adreno_is_a640(adreno_gpu) && !adreno_is_a650(adreno_gpu)) {
+	/*
+	 * Allocate memory for the GMU dummy page
+	 * note: allocated first so iova is 0x60000000
+	 */
+	gmu->dummy = a6xx_gmu_memory_alloc(gmu, SZ_4K, 0);
+	if (IS_ERR(gmu->dummy))
+		goto err_memory;
+
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu->icache = a6xx_gmu_memory_alloc(gmu, SZ_16M - SZ_16K, 0x04000);
+		if (IS_ERR(gmu->icache))
+			goto err_memory;
+	} else if (adreno_is_a640(adreno_gpu)) {
+		gmu->icache = a6xx_gmu_memory_alloc(gmu, SZ_256K - SZ_16K, 0x04000);
+		if (IS_ERR(gmu->icache))
+			goto err_memory;
+
+		gmu->dcache = a6xx_gmu_memory_alloc(gmu, SZ_256K - SZ_16K, 0x44000);
+		if (IS_ERR(gmu->dcache))
+			goto err_memory;
+	} else {
 		/* HFI v1, no sptprac */
 		gmu->legacy = true;
 
@@ -1414,6 +1516,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 err_memory:
+	a6xx_gmu_memory_free(gmu, gmu->icache);
+	a6xx_gmu_memory_free(gmu, gmu->dcache);
+	a6xx_gmu_memory_free(gmu, gmu->dummy);
+	a6xx_gmu_memory_free(gmu, gmu->debug);
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	if (gmu->domain) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 781714ffaa91..ff5d9c61e487 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -58,6 +58,9 @@ struct a6xx_gmu {
 
 	struct a6xx_gmu_bo *hfi;
 	struct a6xx_gmu_bo *debug;
+	struct a6xx_gmu_bo *icache;
+	struct a6xx_gmu_bo *dcache;
+	struct a6xx_gmu_bo *dummy;
 
 	int nr_clocks;
 	struct clk_bulk_data *clocks;
@@ -93,6 +96,14 @@ static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
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

