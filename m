Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFA221D62A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 14:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbgGMMmW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 08:42:22 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:29963 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729801AbgGMMmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 08:42:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594644138; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bPEgtL/MSbVgLWyY5yA0N+moWARpJvT0UPnIgruiK+4=; b=Huq3kBJtls6Oz02O3iexM0uKvWYyNgkFF5ADW4a4MM9nnaEdC/S3reJyKtaCjdtqk/SIRS0w
 Lyt074Qa0tpsCfiBneaFI+a3BWzKhNheOTHTn2M9mhM2rnRBVpWHv085qQubOD7+AuapEy70
 ZIpMw05qwzHbiMs4r/LMNTKAv3U=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f0c56a475eeb235f6b7be86 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 12:42:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF7E9C433CB; Mon, 13 Jul 2020 12:42:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 533D0C433CB;
        Mon, 13 Jul 2020 12:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 533D0C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org, jonathan@marek.ca, robdclark@gmail.com
Subject: [PATCH v5 3/6] drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
Date:   Mon, 13 Jul 2020 18:11:43 +0530
Message-Id: <1594644106-22449-4-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sharat Masetty <smasetty@codeaurora.org>

This patches replaces the previously used static DDR vote and uses
dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
GPU frequency. Also since the icc path voting is handled completely
in the opp driver, remove the icc_path handle and its usage in the
drm driver.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 856db46..a6f43ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -133,7 +133,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 
 	if (!gmu->legacy) {
 		a6xx_hfi_set_freq(gmu, perf_index);
-		icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+		dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
 		pm_runtime_put(gmu->dev);
 		return;
 	}
@@ -157,11 +157,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 	if (ret)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
 
-	/*
-	 * Eventually we will want to scale the path vote with the frequency but
-	 * for now leave it at max so that the performance is nominal.
-	 */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
 	pm_runtime_put(gmu->dev);
 }
 
@@ -849,6 +845,19 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	dev_pm_opp_put(gpu_opp);
 }
 
+static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
+{
+	struct dev_pm_opp *gpu_opp;
+	unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
+
+	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
+	if (IS_ERR_OR_NULL(gpu_opp))
+		return;
+
+	dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
+	dev_pm_opp_put(gpu_opp);
+}
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -873,7 +882,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	}
 
 	/* Set the bus quota to a reasonable value for boot */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
+	a6xx_gmu_set_initial_bw(gpu, gmu);
 
 	/* Enable the GMU interrupt */
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
@@ -1049,7 +1058,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 		a6xx_gmu_shutdown(gmu);
 
 	/* Remove the bus vote */
-	icc_set_bw(gpu->icc_path, 0, 0);
+	dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
 
 	/*
 	 * Make sure the GX domain is off before turning off the GMU (CX)
-- 
2.7.4

