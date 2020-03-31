Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC87D198DB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 09:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730076AbgCaH4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 03:56:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23447 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730049AbgCaH4q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 03:56:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585641405; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Fi234FD+AfbWUw+RlwttLk79MCRgOUQ7otJmTUpYaOk=; b=ckBQCaSSrDBxQdzqDA8SvsZJnI6BQdrzLCm+k6qncZCY1Nw5aSJq5uAjH4k6cbnlYa8L1RR/
 /64iwUrsXRWO5WRFgKPCoPfteuI/yDnglMrQweHf4uGJPsMzYhPuel3Mxf7pGf33D589NFnw
 qFR31afHbwlBYg35KfrFw8OgvnI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7bd.7f6cd9f3aed8-smtp-out-n05;
 Tue, 31 Mar 2020 07:56:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8ECF0C44788; Tue, 31 Mar 2020 07:56:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86765C0451C;
        Tue, 31 Mar 2020 07:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86765C0451C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, sibis@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 3/5] drm: msm: scale DDR BW along with GPU frequency
Date:   Tue, 31 Mar 2020 13:25:51 +0530
Message-Id: <1585641353-23229-4-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support to parse the OPP tables attached the GPU device,
the main opp table and the DDR bandwidth opp table. Additionally, vote
for the GPU->DDR bandwidth when setting the GPU frequency by querying
the linked DDR BW opp to the GPU opp.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 41 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 44 +++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++
 3 files changed, 84 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd37..489d9b6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -100,6 +100,40 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
 }

+void a6xx_gmu_set_icc_vote(struct msm_gpu *gpu, unsigned long gpu_freq)
+{
+	struct dev_pm_opp *gpu_opp, *ddr_opp;
+	struct opp_table **tables = gpu->opp_tables;
+	unsigned long peak_bw;
+
+	if (!gpu->opp_tables[GPU_DDR_OPP_TABLE_INDEX])
+		goto done;
+
+	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
+	if (IS_ERR_OR_NULL(gpu_opp))
+		goto done;
+
+	ddr_opp = dev_pm_opp_xlate_required_opp(tables[GPU_OPP_TABLE_INDEX],
+					    tables[GPU_DDR_OPP_TABLE_INDEX],
+					    gpu_opp);
+	dev_pm_opp_put(gpu_opp);
+
+	if (IS_ERR_OR_NULL(ddr_opp))
+		goto done;
+
+	peak_bw = dev_pm_opp_get_bw(ddr_opp, NULL);
+	dev_pm_opp_put(ddr_opp);
+
+	icc_set_bw(gpu->icc_path, 0, peak_bw);
+	return;
+done:
+	/*
+	 * If there is a problem, for now leave it at max so that the
+	 * performance is nominal.
+	 */
+	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+}
+
 static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
@@ -128,11 +162,8 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)

 	gmu->freq = gmu->gpu_freqs[index];

-	/*
-	 * Eventually we will want to scale the path vote with the frequency but
-	 * for now leave it at max so that the performance is nominal.
-	 */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	if (gpu->icc_path)
+		a6xx_gmu_set_icc_vote(gpu, gmu->freq);
 }

 void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2d13694..bbbcc7a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -882,7 +882,7 @@ static int adreno_get_pwrlevels(struct device *dev,
 {
 	unsigned long freq = ULONG_MAX;
 	struct dev_pm_opp *opp;
-	int ret;
+	int ret, i;

 	gpu->fast_rate = 0;

@@ -890,9 +890,29 @@ static int adreno_get_pwrlevels(struct device *dev,
 	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
 		ret = adreno_get_legacy_pwrlevels(dev);
 	else {
-		ret = dev_pm_opp_of_add_table(dev);
-		if (ret)
-			DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
+		int count = of_count_phandle_with_args(dev->of_node,
+				"operating-points-v2", NULL);
+
+		count = min(count, GPU_DDR_OPP_TABLE_INDEX + 1);
+		count = max(count, 1);
+
+		for (i = 0; i < count; i++) {
+			ret = dev_pm_opp_of_add_table_indexed(dev, i);
+			if (ret) {
+				DRM_DEV_ERROR(dev, "Add OPP table %d: failed %d\n",
+						i, ret);
+				goto err;
+			}
+
+			gpu->opp_tables[i] =
+				dev_pm_opp_get_opp_table_indexed(dev, i);
+			if (!gpu->opp_tables[i]) {
+				DRM_DEV_ERROR(dev, "Get OPP table failed index %d\n",
+						i);
+				ret = -EINVAL;
+				goto err;
+			}
+		}
 	}

 	if (!ret) {
@@ -919,12 +939,24 @@ static int adreno_get_pwrlevels(struct device *dev,
 		gpu->icc_path = NULL;

 	return 0;
+err:
+	for (; i >= 0; i--) {
+		if (gpu->opp_tables[i]) {
+			dev_pm_opp_put_opp_table(gpu->opp_tables[i]);
+			gpu->opp_tables[i] = NULL;
+		}
+	}
+
+	dev_pm_opp_remove_table(dev);
+	return ret;
 }

 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
+	int ret = 0;
+
 	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
@@ -945,7 +977,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,

 	adreno_gpu_config.nr_rings = nr_rings;

-	adreno_get_pwrlevels(&pdev->dev, gpu);
+	ret = adreno_get_pwrlevels(&pdev->dev, gpu);
+	if (ret)
+		return ret;

 	pm_runtime_set_autosuspend_delay(&pdev->dev,
 		adreno_gpu->info->inactive_period);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c..5b98b48 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -66,6 +66,12 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
 };

+/* opp table indices */
+enum {
+	GPU_OPP_TABLE_INDEX,
+	GPU_DDR_OPP_TABLE_INDEX,
+};
+
 struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
@@ -113,6 +119,9 @@ struct msm_gpu {

 	struct icc_path *icc_path;

+	/* gpu/ddr opp tables */
+	struct opp_table *opp_tables[2];
+
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
--
2.7.4
