Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F4E69639B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 13:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbjBNMfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 07:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbjBNMfK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 07:35:10 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F8E25B81
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:35:08 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id y25so23224162lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xA+kN+obUIRP0zoQQBSx6Ae50JOqCvDqgecBRUu64w=;
        b=Qw7hMhUoqIKPXhDfsz/ySL8uoLTpBy6tHGGhP7lL6dLmkTQYdP8hF+oQF+RBnQA8YK
         VuE8/upp1bS9HEWiPalffI2uZUSglQw6vHpsLggqLhFILnxqpKSDGPYq+AjKi1u04Xhx
         m3oSyYTsbKubzH+BILQjWGBWoCTkI3C6lJvSh54tUA5XmqsG6+LBhtyUqmL+sltW+7e2
         QmAKXRjs7r+UMgv2lIvgJZVHqZUTMFAtAXqB3wV6Ijj12yxDr5xXJYAPb/0zuqqGlJnx
         1nb18gItM66buG2ehFLJ7ts/wB5xcmq8KNh36FBqjjecFhaHaxtbfiGAmMUnfm+BIhYK
         3Emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xA+kN+obUIRP0zoQQBSx6Ae50JOqCvDqgecBRUu64w=;
        b=yX6NhZ919KTfTp9kAELdn/pWIVxDi4/fdVV4EjZSie+LeTajvvkegtB3WFnVWuAYrX
         BXVd9N3rE2RDK4AqXh6zwIIU/fR8VbyCInCqTk3MR2UXsbr5NPaGqm6ooYpxMivBgIeB
         lB1e5TRaVAVoDc2ZE7KGtODwgeYJINyC3XcH+WYU9p4wvjvrHq0CWJBsS4UA1cTqBOYa
         z9hPCyOArdWNHoIRss59gdjlG3cu9K3zSCKo6N0hA9wPBzD4R5YVnsbyN4pdQEs1XXsU
         mw02WwEjXDHBzIpR1b1c0albg2PR5iBRVXYRIwL9J9kZsUijiKyWhVwQhu1Y6/SI7Qxi
         nGaQ==
X-Gm-Message-State: AO0yUKXEM/EDKCNUPkadjT2cfWKm+GnsDhV2BGO+1+EZmCFr0a1X5yVI
        XM850xslxo0ACO0xA7SRgB/u7A==
X-Google-Smtp-Source: AK7set96cW1APGUhflQzq/yAXvyGNVmPG2Tw6CheVx53Inp2YZqR250bI4T6yMMoHPImjwmsalCAAg==
X-Received: by 2002:ac2:53b3:0:b0:4b5:178f:a14c with SMTP id j19-20020ac253b3000000b004b5178fa14cmr702874lfh.16.1676378106924;
        Tue, 14 Feb 2023 04:35:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 04:35:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/adreno: split a6xx fault handler into generic and a6xx parts
Date:   Tue, 14 Feb 2023 15:35:03 +0300
Message-Id: <20230214123504.3729522-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
References: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split the a6xx_fault_handler() into the generic adreno_fault_handler()
and platform-specific parts. The adreno_fault_handler() can further be
used by a5xx and hopefully by a4xx (at some point).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 +++----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 60 +++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 ++
 3 files changed, 71 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index aae60cbd9164..faee45135ca8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1361,73 +1361,23 @@ static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
 	return a6xx_uche_fault_block(gpu, id);
 }
 
-#define ARM_SMMU_FSR_TF                 BIT(1)
-#define ARM_SMMU_FSR_PF			BIT(3)
-#define ARM_SMMU_FSR_EF			BIT(4)
-
 static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
 	struct adreno_smmu_fault_info *info = data;
-	const char *type = "UNKNOWN";
-	const char *block;
-	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
-
-	/*
-	 * If we aren't going to be resuming later from fault_worker, then do
-	 * it now.
-	 */
-	if (!do_devcoredump) {
-		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
-	}
+	const char *block = "unknown";
 
-	/*
-	 * Print a default message if we couldn't get the data from the
-	 * adreno-smmu-priv
-	 */
-	if (!info) {
-		pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
-			iova, flags,
+	u32 scratch[] = {
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
-
-		return 0;
-	}
-
-	if (info->fsr & ARM_SMMU_FSR_TF)
-		type = "TRANSLATION";
-	else if (info->fsr & ARM_SMMU_FSR_PF)
-		type = "PERMISSION";
-	else if (info->fsr & ARM_SMMU_FSR_EF)
-		type = "EXTERNAL";
-
-	block = a6xx_fault_block(gpu, info->fsynr1 & 0xff);
-
-	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
-			info->ttbr0, iova,
-			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
-			type, block,
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
-
-	if (do_devcoredump) {
-		/* Turn off the hangcheck timer to keep it from bothering us */
-		del_timer(&gpu->hangcheck_timer);
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)),
+	};
 
-		gpu->fault_info.ttbr0 = info->ttbr0;
-		gpu->fault_info.iova  = iova;
-		gpu->fault_info.flags = flags;
-		gpu->fault_info.type  = type;
-		gpu->fault_info.block = block;
+	if (info)
+		block = a6xx_fault_block(gpu, info->fsynr1 & 0xff);
 
-		kthread_queue_work(gpu->worker, &gpu->fault_work);
-	}
-
-	return 0;
+	return adreno_fault_handler(gpu, iova, flags, info, block, scratch);
 }
 
 static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a05d48ecae15..9bbc298fe6d6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -246,6 +246,66 @@ u64 adreno_private_address_space_size(struct msm_gpu *gpu)
 	return SZ_4G;
 }
 
+#define ARM_SMMU_FSR_TF                 BIT(1)
+#define ARM_SMMU_FSR_PF			BIT(3)
+#define ARM_SMMU_FSR_EF			BIT(4)
+
+int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
+			 struct adreno_smmu_fault_info *info, const char *block,
+			 u32 scratch[4])
+{
+	const char *type = "UNKNOWN";
+	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
+
+	/*
+	 * If we aren't going to be resuming later from fault_worker, then do
+	 * it now.
+	 */
+	if (!do_devcoredump) {
+		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+	}
+
+	/*
+	 * Print a default message if we couldn't get the data from the
+	 * adreno-smmu-priv
+	 */
+	if (!info) {
+		pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
+			iova, flags,
+			scratch[0], scratch[1], scratch[2], scratch[3]);
+
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
+			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
+			type, block,
+			scratch[0], scratch[1], scratch[2], scratch[3]);
+
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
+	return 0;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b4f9b1343d63..f62612a5c70f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -341,6 +341,10 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 				  struct platform_device *pdev,
 				  unsigned long quirks);
 
+int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
+			 struct adreno_smmu_fault_info *info, const char *block,
+			 u32 scratch[4]);
+
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
 /*
-- 
2.30.2

