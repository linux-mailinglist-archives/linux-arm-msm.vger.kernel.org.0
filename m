Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FEE1F04DB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2020 06:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgFFE0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Jun 2020 00:26:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45500 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726304AbgFFE0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Jun 2020 00:26:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591417576; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=I4fnmfnJPxudfrFyDfVNjCnnHZMLEo/q0KIlFZhVNMo=; b=V9rCoEYHOvnJ/cbp0g4XHfQfa0V2lk2b2h3LgqG2MNapEyLkP/0DjaFAgr6ZA3K+GFbXSAKu
 PCiLJZHbJlEdCM573GSW1StH13/jh0oqlRwZDUGUd/n6zMuT8l+VA9+y8WpL3D4qbB8pDolW
 g8mAOIlBMcnGkV7DHrz4NNSaRak=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5edb1ae75ba9f3e9453d3209 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 06 Jun 2020 04:26:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDA26C433AD; Sat,  6 Jun 2020 04:26:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 278F7C433A1;
        Sat,  6 Jun 2020 04:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 278F7C433A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, sibis@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, robdclark@gmail.com,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH v3 2/6] drm: msm: a6xx: send opp instead of a frequency
Date:   Sat,  6 Jun 2020 09:55:47 +0530
Message-Id: <1591417551-38051-3-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
References: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch changes the plumbing to send the devfreq recommended opp rather
than the frequency. Also consolidate and rearrange the code in a6xx to set
the GPU frequency and the icc vote in preparation for the upcoming
changes for GPU->DDR scaling votes.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 62 +++++++++++++++++++----------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c         |  3 +-
 drivers/gpu/drm/msm/msm_gpu.h         |  3 +-
 4 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd37..2d8124b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -100,17 +100,30 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
 }

-static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
+void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 {
-	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
-	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
-	struct msm_gpu *gpu = &adreno_gpu->base;
-	int ret;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 perf_index;
+	unsigned long gpu_freq;
+	int ret = 0;
+
+	gpu_freq = dev_pm_opp_get_freq(opp);
+
+	if (gpu_freq == gmu->freq)
+		return;
+
+	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
+		if (gpu_freq == gmu->gpu_freqs[perf_index])
+			break;
+
+	gmu->current_perf_index = perf_index;

 	gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);

 	gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
-		((3 & 0xf) << 28) | index);
+			((3 & 0xf) << 28) | perf_index);

 	/*
 	 * Send an invalid index as a vote for the bus bandwidth and let the
@@ -126,7 +139,7 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	if (ret)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);

-	gmu->freq = gmu->gpu_freqs[index];
+	gmu->freq = gmu->gpu_freqs[perf_index];

 	/*
 	 * Eventually we will want to scale the path vote with the frequency but
@@ -135,25 +148,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
 }

-void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
-{
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	u32 perf_index = 0;
-
-	if (freq == gmu->freq)
-		return;
-
-	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
-		if (freq == gmu->gpu_freqs[perf_index])
-			break;
-
-	gmu->current_perf_index = perf_index;
-
-	__a6xx_gmu_set_freq(gmu, perf_index);
-}
-
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -708,6 +702,19 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	a6xx_gmu_rpmh_off(gmu);
 }

+static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
+{
+	struct dev_pm_opp *gpu_opp;
+	unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
+
+	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
+	if (IS_ERR_OR_NULL(gpu_opp))
+		return;
+
+	a6xx_gmu_set_freq(gpu, gpu_opp);
+	dev_pm_opp_put(gpu_opp);
+}
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -759,8 +766,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_MASK, ~A6XX_HFI_IRQ_MASK);
 	enable_irq(gmu->hfi_irq);

-	/* Set the GPU to the current freq */
-	__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
+	a6xx_gmu_set_initial_freq(gpu, gmu);

 	/*
 	 * "enable" the GX power domain which won't actually do anything but it
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 7239b8b..03ba60d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -63,7 +63,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);

-void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq);
+void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp);
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);

 void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 615c5cd..82c3068 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -13,7 +13,6 @@

 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
-#include <linux/pm_opp.h>
 #include <linux/devfreq.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
@@ -34,7 +33,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		return PTR_ERR(opp);

 	if (gpu->funcs->gpu_set_freq)
-		gpu->funcs->gpu_set_freq(gpu, (u64)*freq);
+		gpu->funcs->gpu_set_freq(gpu, opp);
 	else
 		clk_set_rate(gpu->core_clk, *freq);

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c..cf0dc6d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -9,6 +9,7 @@

 #include <linux/clk.h>
 #include <linux/interconnect.h>
+#include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>

 #include "msm_drv.h"
@@ -63,7 +64,7 @@ struct msm_gpu_funcs {
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
-	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
+	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
 };

 struct msm_gpu {
--
2.7.4

