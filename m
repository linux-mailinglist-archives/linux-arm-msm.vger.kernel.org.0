Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A3C3990D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 18:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFBQwh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 12:52:37 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:45953 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhFBQwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 12:52:36 -0400
Received: by mail-pg1-f169.google.com with SMTP id q15so2706815pgg.12;
        Wed, 02 Jun 2021 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f8TBvuEhJIYSx02uYrz2RNVyn3Huf1vKVuYXCtSr4og=;
        b=XdXEI6OZkfa9mt88eRH4VF/sjKGB/UheHhxI/p1olqZfncUtJSAOpiBwDBJLVfRZjt
         1jK+If0YHetzaptB2IP5Iqt0kkFjYQMHBFEkuNRbnI9mgJUzcz1qzJkazNhZ2hpaY8kE
         YhN/fwYVzXPXr5qeCNqyB0fv85R+/r6n8eoinhZPNh3r13bCKI/97zwV3QHNeFVi7K00
         6J/ulSAdN6HGQvFawRislAq8any1aHhzF504YxsNlG7wo5nNMiALsBrowUaIpXhsSJpU
         L6Txn5EYtZ5tMQiBG9digZH4IN/1tbUmJrqRRrjuIlTl5x0/6YO3js7jGK5w9aKHNziE
         1zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f8TBvuEhJIYSx02uYrz2RNVyn3Huf1vKVuYXCtSr4og=;
        b=igeSJiltK5ZlNtjp1O5Lz+vNW0W8DQbE+QP8LP3acd//RpzBgHJoh4/Ee8ER0EQP9Z
         6y2RhSYOQai6v82iPP4yOxWa/IQMY9WiBXbqt2PH1AakTVXImQmljlb8Uh1axZDau1Xn
         UupEFhvauUAdoE3etrotXWpABj0MU+xKtcKxZyA8FBkcWB/2MsDQUYH1nXDV0m9EVgFy
         HMH6mSgodpxJrDPqqqstb7kxtOmuUpoP2tE43Ed3vUm72ZnmRZOnAVEmk68Ki5o1Y8pm
         bHdKUA5qkIlJWhPzo0FqT3ia0x38wf40TVVhEfpDoz4NirtqYlf4rhOHxUX8vW9w+7j/
         lHGA==
X-Gm-Message-State: AOAM531O5j48jVoc3x3DwEDNdfsJmfgC+SjIZWfAVM+gmD98KcEYADAT
        eYsJW26JME1AUqIHRawgBeLg8yku2NjgEic0
X-Google-Smtp-Source: ABdhPJyuOXkzsKjdZZvjkNsfTtr3SaIfEJJoC+ve1Y21xV1VHDxUe45vvs+ED6TEZIj4jUyTryOLyg==
X-Received: by 2002:a63:370b:: with SMTP id e11mr5449567pga.356.1622652580275;
        Wed, 02 Jun 2021 09:49:40 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id ft19sm107682pjb.48.2021.06.02.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:49:39 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v4 3/6] drm/msm: Improve the a6xx page fault handler
Date:   Wed,  2 Jun 2021 09:52:46 -0700
Message-Id: <20210602165313.553291-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602165313.553291-1-robdclark@gmail.com>
References: <20210602165313.553291-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Use the new adreno-smmu-priv fault info function to get more SMMU
debug registers and print the current TTBR0 to debug per-instance
pagetables and figure out which GPU block generated the request.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
 drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
 4 files changed, 87 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ce13d49e615b..a0eef5d9b89b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1075,7 +1075,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return true;
 }
 
-static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
+static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
 	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
@@ -1085,7 +1085,7 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
 
-	return -EFAULT;
+	return 0;
 }
 
 static void a5xx_cp_err_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 23464d735682..094dc17fd20f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -959,18 +959,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	msm_gpu_hw_init(gpu);
 }
 
-static int a6xx_fault_handler(void *arg, unsigned long iova, int flags)
+static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
+{
+	static const char *uche_clients[7] = {
+		"VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
+	};
+	u32 val;
+
+	if (mid < 1 || mid > 3)
+		return "UNKNOWN";
+
+	/*
+	 * The source of the data depends on the mid ID read from FSYNR1.
+	 * and the client ID read from the UCHE block
+	 */
+	val = gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
+
+	/* mid = 3 is most precise and refers to only one block per client */
+	if (mid == 3)
+		return uche_clients[val & 7];
+
+	/* For mid=2 the source is TP or VFD except when the client id is 0 */
+	if (mid == 2)
+		return ((val & 7) == 0) ? "TP" : "TP|VFD";
+
+	/* For mid=1 just return "UCHE" as a catchall for everything else */
+	return "UCHE";
+}
+
+static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
+{
+	if (id == 0)
+		return "CP";
+	else if (id == 4)
+		return "CCU";
+	else if (id == 6)
+		return "CDP Prefetch";
+
+	return a6xx_uche_fault_block(gpu, id);
+}
+
+#define ARM_SMMU_FSR_TF                 BIT(1)
+#define ARM_SMMU_FSR_PF			BIT(3)
+#define ARM_SMMU_FSR_EF			BIT(4)
+
+static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
+	struct adreno_smmu_fault_info *info = data;
+	const char *type = "UNKNOWN";
 
-	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
+	/*
+	 * Print a default message if we couldn't get the data from the
+	 * adreno-smmu-priv
+	 */
+	if (!info) {
+		pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
 			iova, flags,
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
 
-	return -EFAULT;
+		return 0;
+	}
+
+	if (info->fsr & ARM_SMMU_FSR_TF)
+		type = "TRANSLATION";
+	else if (info->fsr & ARM_SMMU_FSR_PF)
+		type = "PERMISSION";
+	else if (info->fsr & ARM_SMMU_FSR_EF)
+		type = "EXTERNAL";
+
+	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->ttbr0, iova,
+			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
+			a6xx_fault_block(gpu, info->fsynr1 & 0xff),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
+
+	return 0;
 }
 
 static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 50d881794758..6975b95c3c29 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
+	struct adreno_smmu_fault_info info, *ptr = NULL;
+
+	if (adreno_smmu->get_fault_info) {
+		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
+		ptr = &info;
+	}
+
 	if (iommu->base.handler)
-		return iommu->base.handler(iommu->base.arg, iova, flags);
+		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
+
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 61ade89d9e48..a88f44c3268d 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -26,7 +26,7 @@ enum msm_mmu_type {
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
-	int (*handler)(void *arg, unsigned long iova, int flags);
+	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
 	void *arg;
 	enum msm_mmu_type type;
 };
@@ -43,7 +43,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
-		int (*handler)(void *arg, unsigned long iova, int flags))
+		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
 {
 	mmu->arg = arg;
 	mmu->handler = handler;
-- 
2.31.1

