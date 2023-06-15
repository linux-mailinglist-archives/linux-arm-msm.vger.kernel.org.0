Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA0473237A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 01:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236884AbjFOXWN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 19:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240087AbjFOXVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 19:21:46 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958AF2D7E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:38 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so10898370e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686871297; x=1689463297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zxmhAnEmxSVMknXQwyXBluuzz0sqFgLH39JqXiH4vs=;
        b=FMghnXptOmXW0FtLGsL35qO1ePlBxFNNGx07R2zB7xFRPCmVYbsOZIpFpvHX/gnNy7
         T95HcC3QHkkBllJmhkrjqNe853mggJOpVYOD8QWkECmThg3A3Cse5nJe5N/EiRxP6wRQ
         hp9PkqDAdJglY6c1ogyjLb+n0M+PUFOOeIuDrSizfn6kLNHid4pfZabz2DBIwGJPga6E
         qxRF4V6IAY8wibCZCh3yuawoo8Bhom48VzkEKlGcfF1hwsgWoNpcDBNhGKQBSR/Ti2nH
         5fAzYYzudtv56UW2MaOCJRTgsc34/jIo3MdELcFGL31cW1OIm7Udh2Ofh/dj3s6XoadP
         obHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686871297; x=1689463297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zxmhAnEmxSVMknXQwyXBluuzz0sqFgLH39JqXiH4vs=;
        b=Zg271FQWWCHslsIWIixEdPM169okjUzzq7yGDcn0uMZoY1NbwvjVlWY/9fDRiW94aH
         xNoRnsb+r6HC1PpEqqFccjeqVPQEdLH1ciWTJ/skgPEUJaTENNR7zGeAhjOHdCGlgPaC
         cU7udOYzP6ZYA+l5U9M8NwNOxKHWktrUqB4mV3XodAP2U/dYO6SYVvhQMHtqQc6awvsz
         9RJLn4bFgBGptm7ePUot+TNwpE02SiaJGG0J9RfoWc4qdgqlL0D0TcCDlq475PNyE3bB
         xCEl/Udj4QmDav8xcxgEQQtCk4vPMF1Y4OyinG4GM3y8anTp5VQP0xmmX74AyLx4HwOz
         LIDA==
X-Gm-Message-State: AC+VfDyBHLwmfSc2iEthjvfSE4fxHhdnjb2buztt5KOf/fIaVqAs8MaF
        CqskaAd2/GTLaRvXbYFsrvAfWQ==
X-Google-Smtp-Source: ACHHUZ6Zaba56BkYObGzpwHawVg0/2OGYPZxO/YWcoG2vev3ns0yC9ce71DCKtgzIApeU7/VFBh5yQ==
X-Received: by 2002:a19:6d0e:0:b0:4f6:520d:6b9b with SMTP id i14-20020a196d0e000000b004f6520d6b9bmr59979lfc.60.1686871296747;
        Thu, 15 Jun 2023 16:21:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:21:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 16 Jun 2023 01:20:53 +0200
Subject: [PATCH v9 12/20] drm/msm/a6xx: Introduce GMU wrapper support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-12-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=18851;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Mg3KIbbf0SPJD9Gso3Hg42h9a7bjesm92tOZRXmVyes=;
 b=3gzmQAEKDh92/ZLPfCPxiCC9KjUtopCicRPv33SvXtYWfWIp0At2qpN78+skWoKb73MC/o9xn
 oH2gmv7SA3LAOL5T7eIvF03B7sCzsIG/aDxt+vLBpcrCuipOgOQidZ+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
but don't implement the associated GMUs. This is due to the fact that
the GMU directly pokes at RPMh. Sadly, this means we have to take care
of enabling & scaling power rails, clocks and bandwidth ourselves.

Reuse existing Adreno-common code and modify the deeply-GMU-infused
A6XX code to facilitate these GPUs. This involves if-ing out lots
of GMU callbacks and introducing a new type of GMU - GMU wrapper (it's
the actual name that Qualcomm uses in their downstream kernels).

This is essentially a register region which is convenient to model
as a device. We'll use it for managing the GDSCs. The register
layout matches the actual GMU_CX/GX regions on the "real GMU" devices
and lets us reuse quite a bit of gmu_read/write/rmw calls.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  72 +++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 201 ++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
 6 files changed, 266 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aae7ea651607..5deb79924897 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1431,6 +1431,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 
@@ -1456,10 +1457,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->mmio = NULL;
 	gmu->rscc = NULL;
 
-	a6xx_gmu_memory_free(gmu);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		a6xx_gmu_memory_free(gmu);
 
-	free_irq(gmu->gmu_irq, gmu);
-	free_irq(gmu->hfi_irq, gmu);
+		free_irq(gmu->gmu_irq, gmu);
+		free_irq(gmu->hfi_irq, gmu);
+	}
 
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
@@ -1478,6 +1481,69 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
 	return 0;
 }
 
+int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
+{
+	struct platform_device *pdev = of_find_device_by_node(node);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	int ret;
+
+	if (!pdev)
+		return -ENODEV;
+
+	gmu->dev = &pdev->dev;
+
+	of_dma_configure(gmu->dev, node, true);
+
+	pm_runtime_enable(gmu->dev);
+
+	/* Mark legacy for manual SPTPRAC control */
+	gmu->legacy = true;
+
+	/* Map the GMU registers */
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
+	if (IS_ERR(gmu->mmio)) {
+		ret = PTR_ERR(gmu->mmio);
+		goto err_mmio;
+	}
+
+	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
+	if (IS_ERR(gmu->cxpd)) {
+		ret = PTR_ERR(gmu->cxpd);
+		goto err_mmio;
+	}
+
+	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
+		ret = -ENODEV;
+		goto detach_cxpd;
+	}
+
+	init_completion(&gmu->pd_gate);
+	complete_all(&gmu->pd_gate);
+	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
+
+	/* Get a link to the GX power domain to reset the GPU */
+	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
+	if (IS_ERR(gmu->gxpd)) {
+		ret = PTR_ERR(gmu->gxpd);
+		goto err_mmio;
+	}
+
+	gmu->initialized = true;
+
+	return 0;
+
+detach_cxpd:
+	dev_pm_domain_detach(gmu->cxpd, false);
+
+err_mmio:
+	iounmap(gmu->mmio);
+
+	/* Drop reference taken in of_find_device_by_node */
+	put_device(gmu->dev);
+
+	return ret;
+}
+
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0efecde2af1a..b91fc02eb08c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -21,7 +21,7 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	/* Check that the GMU is idle */
-	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
+	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_isidle(&a6xx_gpu->gmu))
 		return false;
 
 	/* Check tha the CX master is idle */
@@ -1126,10 +1126,13 @@ static int hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	int ret;
 
-	/* Make sure the GMU keeps the GPU on while we set it up */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Make sure the GMU keeps the GPU on while we set it up */
+		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
 	if (a6xx_has_gbif(adreno_gpu)) {
@@ -1352,6 +1355,8 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 out:
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return ret;
 	/*
 	 * Tell the GMU that we are done touching the GPU and it can start power
 	 * management
@@ -1386,9 +1391,6 @@ static void a6xx_dump(struct msm_gpu *gpu)
 	adreno_dump(gpu);
 }
 
-#define VBIF_RESET_ACK_TIMEOUT	100
-#define VBIF_RESET_ACK_MASK	0x00f0
-
 static void a6xx_recover(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1426,6 +1428,15 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 */
 	gpu->active_submits = 0;
 
+	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Drain the outstanding traffic on memory buses */
+		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+
+		/* Reset the GPU to a clean state */
+		a6xx_gpu_sw_reset(gpu, true);
+		a6xx_gpu_sw_reset(gpu, false);
+	}
+
 	reinit_completion(&gmu->pd_gate);
 	dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
 	dev_pm_genpd_synced_poweroff(gmu->cxpd);
@@ -1576,7 +1587,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	 * Force the GPU to stay on until after we finish
 	 * collecting information
 	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
 
 	DRM_DEV_ERROR(&gpu->pdev->dev,
 		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
@@ -1707,6 +1719,10 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
 {
+	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
+	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+		return;
+
 	llcc_slice_putd(a6xx_gpu->llc_slice);
 	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
 }
@@ -1716,6 +1732,10 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 {
 	struct device_node *phandle;
 
+	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
+	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+		return;
+
 	/*
 	 * There is a different programming path for targets with an mmu500
 	 * attached, so detect if that is the case
@@ -1786,7 +1806,7 @@ void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
 		udelay(100);
 }
 
-static int a6xx_pm_resume(struct msm_gpu *gpu)
+static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -1806,10 +1826,58 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	a6xx_llc_activate(a6xx_gpu);
 
-	return 0;
+	return ret;
 }
 
-static int a6xx_pm_suspend(struct msm_gpu *gpu)
+static int a6xx_pm_resume(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	unsigned long freq = gpu->fast_rate;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	gpu->needs_hw_init = true;
+
+	trace_msm_gpu_resume(0);
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+
+	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
+	if (IS_ERR(opp)) {
+		ret = PTR_ERR(opp);
+		goto err_set_opp;
+	}
+	dev_pm_opp_put(opp);
+
+	/* Set the core clock and bus bw, having VDD scaling in mind */
+	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+
+	pm_runtime_resume_and_get(gmu->dev);
+	pm_runtime_resume_and_get(gmu->gxpd);
+
+	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
+	if (ret)
+		goto err_bulk_clk;
+
+	/* If anything goes south, tear the GPU down piece by piece.. */
+	if (ret) {
+err_bulk_clk:
+		pm_runtime_put(gmu->gxpd);
+		pm_runtime_put(gmu->dev);
+		dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
+	}
+err_set_opp:
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	if (!ret)
+		msm_devfreq_resume(gpu);
+
+	return ret;
+}
+
+static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -1836,7 +1904,40 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static int a6xx_pm_suspend(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	int i;
+
+	trace_msm_gpu_suspend(0);
+
+	msm_devfreq_suspend(gpu);
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+
+	/* Drain the outstanding traffic on memory buses */
+	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+
+	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
+
+	pm_runtime_put_sync(gmu->gxpd);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
+	pm_runtime_put_sync(gmu->dev);
+
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	if (a6xx_gpu->shadow_bo)
+		for (i = 0; i < gpu->nr_rings; i++)
+			a6xx_gpu->shadow[i] = 0;
+
+	gpu->suspend_count++;
+
+	return 0;
+}
+
+static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -1855,6 +1956,12 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	return 0;
 }
 
+static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+{
+	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
+	return 0;
+}
+
 static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2121,8 +2228,8 @@ static const struct adreno_gpu_funcs funcs = {
 		.set_param = adreno_set_param,
 		.hw_init = a6xx_hw_init,
 		.ucode_load = a6xx_ucode_load,
-		.pm_suspend = a6xx_pm_suspend,
-		.pm_resume = a6xx_pm_resume,
+		.pm_suspend = a6xx_gmu_pm_suspend,
+		.pm_resume = a6xx_gmu_pm_resume,
 		.recover = a6xx_recover,
 		.submit = a6xx_submit,
 		.active_ring = a6xx_active_ring,
@@ -2137,6 +2244,35 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DRM_MSM_GPU_STATE)
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_address_space = a6xx_create_address_space,
+		.create_private_address_space = a6xx_create_private_address_space,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.get_timestamp = a6xx_gmu_get_timestamp,
+};
+
+static const struct adreno_gpu_funcs funcs_gmuwrapper = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_pm_suspend,
+		.pm_resume = a6xx_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a6xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
 #endif
 		.create_address_space = a6xx_create_address_space,
 		.create_private_address_space = a6xx_create_private_address_space,
@@ -2169,16 +2305,31 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->registers = NULL;
 
+	/* Check if there is a GMU phandle and set it up */
+	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
+	/* FIXME: How do we gracefully handle this? */
+	BUG_ON(!node);
+
+	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
+
 	/*
 	 * We need to know the platform type before calling into adreno_gpu_init
 	 * so that the hw_apriv flag can be correctly set. Snoop into the info
 	 * and grab the revision number
 	 */
 	info = adreno_info(config->rev);
-
-	if (info && (info->revn == 650 || info->revn == 660 ||
-		     info->revn == 690 ||
-		     adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
+	if (!info)
+		return ERR_PTR(-EINVAL);
+
+	/* Assign these early so that we can use the is_aXYZ helpers */
+	/* Numeric revision IDs (e.g. 630) */
+	adreno_gpu->revn = info->revn;
+	/* New-style ADRENO_REV()-only */
+	adreno_gpu->rev = info->rev;
+	/* Quirk data */
+	adreno_gpu->info = info;
+
+	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
 		adreno_gpu->base.hw_apriv = true;
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
@@ -2189,7 +2340,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
+	else
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
@@ -2202,13 +2356,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		priv->gpu_clamp_to_idle = true;
 
-	/* Check if there is a GMU phandle and set it up */
-	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
-
-	/* FIXME: How do we gracefully handle this? */
-	BUG_ON(!node);
-
-	ret = a6xx_gmu_init(a6xx_gpu, node);
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
+	else
+		ret = a6xx_gmu_init(a6xx_gpu, node);
 	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index aa70390ee1c6..c788b06e72da 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
+int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 30ecdff363e7..4e5d650578c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1041,16 +1041,18 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	/* Get the generic state from the adreno core */
 	adreno_gpu_state_get(gpu, &a6xx_state->base);
 
-	a6xx_get_gmu_registers(gpu, a6xx_state);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		a6xx_get_gmu_registers(gpu, a6xx_state);
 
-	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
-	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
-	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
+		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
+		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
+		a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
 
-	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
+		a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
+	}
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
-	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
 
 	/* Get the banks of indexed registers */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6934cee07d42..5c5901d65950 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -528,6 +528,10 @@ int adreno_load_fw(struct adreno_gpu *adreno_gpu)
 		if (!adreno_gpu->info->fw[i])
 			continue;
 
+		/* Skip loading GMU firwmare with GMU Wrapper */
+		if (adreno_has_gmu_wrapper(adreno_gpu) && i == ADRENO_FW_GMU)
+			continue;
+
 		/* Skip if the firmware has already been loaded */
 		if (adreno_gpu->fw[i])
 			continue;
@@ -1074,8 +1078,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	u32 speedbin;
 	int ret;
 
-	/* Only handle the core clock when GMU is not in use */
-	if (config->rev.core < 6) {
+	/* Only handle the core clock when GMU is not in use (or is absent). */
+	if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
 		/*
 		 * This can only be done before devm_pm_opp_of_add_table(), or
 		 * dev_pm_opp_set_config() will WARN_ON()
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 5a26c8a2de7c..de0b03a4b594 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -115,6 +115,7 @@ struct adreno_gpu {
 	 * code (a3xx_gpu.c) and stored in this common location.
 	 */
 	const unsigned int *reg_offsets;
+	bool gmu_is_wrapper;
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
 
@@ -152,6 +153,11 @@ static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 	return gpu->revn == revn;
 }
 
+static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
+{
+	return gpu->gmu_is_wrapper;
+}
+
 static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
 	WARN_ON_ONCE(!gpu->revn);

-- 
2.41.0

