Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055341B65FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 23:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgDWVKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 17:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgDWVKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:54 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12B6C09B043
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 14:10:54 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 23so3217263qkf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cp480AXn6BYf8tn1IEyvGoLuimotRsbCnt5LAroxAjI=;
        b=neVBJTxFFkAouaSXp/YhH+cIbCEOk71zTANtGkrdW4jRvPPzD9j0vDYWmK3qbzbbO9
         SHf/pATweVJ7CYeOrpMwS1L44/kgJne99f37fsaMKQvYjrgx/VfsMkbcaXPoY8+1uV3X
         Ad85SQnr85UOioZkfRcuvHo/E2LBZjJ/QKHZsh9z0vebOf2J4tn5fdACz+j1NWAxobZs
         QvwMRCAPXIzldtHe9yMGED6HO3Oe9yxCVieE/OZaWKZZPHkaJxO9/K0wIIAmMvPqd2DW
         pBJIjcDs8oY12YMkrSaSqowWzdPHdapLMItWlt/NkkiCTK1SMI8+SLvM9rv3gEsGm4Er
         HThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cp480AXn6BYf8tn1IEyvGoLuimotRsbCnt5LAroxAjI=;
        b=qeJTFTZeI6ZLI/Qgt2YpbndM1e1jcbXUiFJJkgeKTjzVzGZNSR/rTqBZhPiQsdv7uJ
         AdHDORDb4RNvazA14WiMi/Fb/4gU7MTK4/Zs2WpKQmEdzH4P/0bye9OJkOHuapwrS8yz
         IjTKC9Ci4pIdgrPNwJIEMn+HJTHn2EiVmeO4EpOvukioZakx5U2Qhl/OuIhOGrmj5Pae
         dlP5YrmmTABpKp0RlMSDkA6cvaZ7BX83VM9Pf4FRpHLTkYHHQNN+5+En/LJst0eSypCx
         rssN0cj2U20USwJeFUZs4VQ/r5K516/VGt+n33pcqr1O6p9Y3wgjNGX0ZbPPPDLuKJsy
         bdIQ==
X-Gm-Message-State: AGi0PuYmSf04fsDzT1cgk9hFl4LrlnBDGL3BUT5Mndvv1bnbnbSMGNlj
        PDvwqJmTZgY8WExNxK37tz1Ejg==
X-Google-Smtp-Source: APiQypKjtj0vh80vokk0e2giIvPZ3zkRKeST16VCfGuBHW3G8znEUfWcn6JxVcwixNYh5pulGHK5TA==
X-Received: by 2002:a05:620a:13ab:: with SMTP id m11mr5660024qki.88.1587676254079;
        Thu, 23 Apr 2020 14:10:54 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:53 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 8/9] drm/msm/a6xx: enable GMU log
Date:   Thu, 23 Apr 2020 17:09:20 -0400
Message-Id: <20200423210946.28867-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is required for a650 to work.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  4 ++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c6fce994194d..aec54cde8534 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -201,6 +201,12 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	u32 val;
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
+
+	/* Set the log wptr index
+	 * note: downstream saves the value in poweroff and restores it here
+	 */
+	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
+
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
@@ -744,6 +750,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 
 	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
 
+	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG,
+		  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
@@ -1049,6 +1058,7 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->log.obj, gmu->aspace, false);
 
 	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
 	msm_gem_address_space_put(gmu->aspace);
@@ -1453,6 +1463,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_memory;
 
+	/* Allocate memory for the GMU log region */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0);
+	if (ret)
+		goto err_memory;
+
 	/* Map the GMU registers */
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio)) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index e16c16bb65bf..47df4745db50 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -61,6 +61,7 @@ struct a6xx_gmu {
 	struct a6xx_gmu_bo icache;
 	struct a6xx_gmu_bo dcache;
 	struct a6xx_gmu_bo dummy;
+	struct a6xx_gmu_bo log;
 
 	int nr_clocks;
 	struct clk_bulk_data *clocks;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index b4357ea550ec..176ae94d9fe6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -205,6 +205,10 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
 
+#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
+
+#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
+
 #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
 
 #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
-- 
2.26.1

