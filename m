Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1F67CFDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 16:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbjAZPS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 10:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbjAZPS1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 10:18:27 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC462D62
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:17:45 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v10so2138120edi.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z96AqaTFcl9FU+ek8zi38foZSwi4El4juNDQVRie/qo=;
        b=Y1MBhqk7UY9zYtBQe9CAh6hP6RMh00oOVAR335EaRmZfD9bniXdz6rWBWoSQOHKH+8
         hgu58nmCtQQGkgmy3nTXMfL1H7Mr+cElmciDAdWYacRAIByltQubRAwkKYcPk8nqTkmV
         1ZUJx1sRhhQOdGFL0Srhp575vA+MsZ3gEXErlUdLX56JGXoVKDvwQQjtOZ7dKKkUVGbT
         H7th3UhNOrYIIamtqhDO1rYQhcaSSJhElz9qCdbOM+wMW2MxANfg7aGnj7LpLCyYQJTH
         gNyZHwXggStFW5YU5yzyOxTLOkJ6dEP3i6A9LNcNW91VJTC4rejbrH5J2RFsD1AXfAiK
         0dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z96AqaTFcl9FU+ek8zi38foZSwi4El4juNDQVRie/qo=;
        b=dgIjt/oaGggWWvK7xriS/5PV+cnpufArmKK5kcQdCWD0jY85JKPg2UPi42LcDKRCRu
         jKaJLZcoO8ZsLRMqvYE1q/2/HCAiRbBmUkBG+wiy2O/sQT4HsVeOR9P2S4WV2UM7/g/g
         Zu83IgKGd4TMJ90pyBeWDdDC7qIN6R7vxONo/FfYVDg7V3lCEW58qL+wgj/oHS6Ghthq
         QzjK053+yGV3x0qlHFPONFIsbb64LyY84j2TVWE4B+72exM5rt8WD+KBi1//bPylDRSl
         7VV7CxjIo1/Aine09EU6RuVDQ44g5LH7O2snBrV4/Lqn67NM5lYnIk4/x4czH2QbY7Ja
         EBOg==
X-Gm-Message-State: AFqh2kqL6+FMDqJPa3nGPljdkjYTh0D1hgEwW4Tf9oLkrKJXx4KGT/CD
        0o0ZEc9pIP/fdjDf8xp4UBNnCkUUZw8UfDCQ
X-Google-Smtp-Source: AMrXdXvnaQi0omEVpL4ICMDVajWejd1hK7zSe0VSjmPb17yRHP1QsUZCpTGTixT/8iE9MK03/AvhFA==
X-Received: by 2002:aa7:cad3:0:b0:49e:eb11:e40 with SMTP id l19-20020aa7cad3000000b0049eeb110e40mr23991272edt.34.1674746241426;
        Thu, 26 Jan 2023 07:17:21 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:17:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] drm/msm/a6xx: Introduce GMU wrapper support
Date:   Thu, 26 Jan 2023 16:16:07 +0100
Message-Id: <20230126151618.225127-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
of GMU callbacks and introducing a new type of GMU - GMU wrapper.
This is essentially a register region which is convenient to model
as a device. We'll use it for managing the GDSCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  51 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 198 +++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
 5 files changed, 233 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 90e636dcdd5b..5aa9f3ef41c2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1474,6 +1474,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 
@@ -1493,10 +1494,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
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
@@ -1504,6 +1507,48 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->initialized = false;
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
+	/* Get a link to the GX power domain to reset the GPU */
+	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
+
+	gmu->initialized = true;
+
+	return 0;
+
+err_mmio:
+	iounmap(gmu->mmio);
+	ret = -ENODEV;
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
index ad5d791b804c..22dac65cfa8c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -20,9 +20,11 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	/* Check that the GMU is idle */
-	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
-		return false;
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Check that the GMU is idle */
+		if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
+			return false;
+	}
 
 	/* Check tha the CX master is idle */
 	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS) &
@@ -612,13 +614,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
@@ -991,10 +995,13 @@ static int hw_init(struct msm_gpu *gpu)
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
 	if (a6xx_has_gbif(adreno_gpu))
@@ -1120,6 +1127,17 @@ static int hw_init(struct msm_gpu *gpu)
 			0x3f0243f0);
 	}
 
+	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Do it here, as GMU wrapper only inits the GMU for memory reservation etc. */
+
+		/* Set up the CX GMU counter 0 to count busy ticks */
+		gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
+
+		/* Enable power counter 0 */
+		gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, BIT(5));
+		gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
+	}
+
 	/* Protect registers from the CP */
 	a6xx_set_cp_protect(gpu);
 
@@ -1228,6 +1246,8 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 out:
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return ret;
 	/*
 	 * Tell the GMU that we are done touching the GPU and it can start power
 	 * management
@@ -1262,6 +1282,9 @@ static void a6xx_dump(struct msm_gpu *gpu)
 	adreno_dump(gpu);
 }
 
+#define GBIF_GX_HALT_MASK	BIT(0)
+#define GBIF_CLIENT_HALT_MASK	BIT(0)
+#define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
 #define VBIF_RESET_ACK_MASK	0x00f0
 
@@ -1293,7 +1316,8 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 * Turn off keep alive that might have been enabled by the hang
 	 * interrupt
 	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
 
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 
@@ -1317,6 +1341,35 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* Call into gpucc driver to poll for cx gdsc collapse */
 	reset_control_reset(gpu->cx_collapse);
 
+	/* Software-reset the GPU */
+	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Halt the GX side of GBIF */
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
+		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
+			   GBIF_GX_HALT_MASK);
+
+		/* Halt new client requests on GBIF */
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
+		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			   (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
+
+		/* Halt all AXI requests on GBIF */
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
+		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			   (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
+
+		/* Clear the halts */
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+
+		if (adreno_is_a619_holi(adreno_gpu))
+			gpu_write(gpu, 0x18, 0);
+		else
+			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+
+		/* This *really* needs to go through before we do anything else! */
+		mb();
+	}
+
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
 	if (active_submits)
@@ -1501,7 +1554,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	 * Force the GPU to stay on until after we finish
 	 * collecting information
 	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
 
 	DRM_DEV_ERROR(&gpu->pdev->dev,
 		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
@@ -1666,6 +1720,7 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	int ret;
 
 	gpu->needs_hw_init = true;
@@ -1673,35 +1728,81 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	trace_msm_gpu_resume(0);
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
-	ret = a6xx_gmu_resume(a6xx_gpu);
-	mutex_unlock(&a6xx_gpu->gmu.lock);
-	if (ret)
-		return ret;
 
-	msm_devfreq_resume(gpu);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		ret = a6xx_gmu_resume(a6xx_gpu);
+		mutex_unlock(&a6xx_gpu->gmu.lock);
+		if (ret)
+			return ret;
 
-	a6xx_llc_activate(a6xx_gpu);
+		msm_devfreq_resume(gpu);
 
-	return 0;
+		a6xx_llc_activate(a6xx_gpu);
+	} else {
+		pm_runtime_get_sync(gmu->dev);
+		if (!IS_ERR_OR_NULL(gmu->gxpd))
+			pm_runtime_get_sync(gmu->gxpd);
+
+		/* Set the core clock, having VDD scaling in mind */
+		ret = dev_pm_opp_set_rate(gpu->dev->dev, gpu->fast_rate);
+		if (ret)
+			return ret;
+
+		ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(gpu->ebi1_clk);
+		if (ret)
+			return ret;
+
+		mutex_unlock(&a6xx_gpu->gmu.lock);
+
+		msm_devfreq_resume(gpu);
+	}
+
+	return ret;
 }
 
 static int a6xx_pm_suspend(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	int i, ret;
 
 	trace_msm_gpu_suspend(0);
 
-	a6xx_llc_deactivate(a6xx_gpu);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		a6xx_llc_deactivate(a6xx_gpu);
 
-	msm_devfreq_suspend(gpu);
+		msm_devfreq_suspend(gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-	ret = a6xx_gmu_stop(a6xx_gpu);
-	mutex_unlock(&a6xx_gpu->gmu.lock);
-	if (ret)
-		return ret;
+		mutex_lock(&a6xx_gpu->gmu.lock);
+		ret = a6xx_gmu_stop(a6xx_gpu);
+		mutex_unlock(&a6xx_gpu->gmu.lock);
+		if (ret)
+			return ret;
+	} else {
+		msm_devfreq_suspend(gpu);
+
+		mutex_lock(&a6xx_gpu->gmu.lock);
+
+		ret = clk_prepare_enable(gpu->ebi1_clk);
+		if (ret)
+			return ret;
+
+		ret = clk_set_rate(gpu->core_clk, 0);
+		if (ret)
+			return ret;
+
+		if (!IS_ERR_OR_NULL(gmu->gxpd))
+			pm_runtime_put_sync(gmu->gxpd);
+
+		pm_runtime_put_sync(gmu->dev);
+
+		mutex_unlock(&a6xx_gpu->gmu.lock);
+	}
 
 	if (a6xx_gpu->shadow_bo)
 		for (i = 0; i < gpu->nr_rings; i++)
@@ -1717,6 +1818,11 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
+	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO);
+		return 0;
+	}
+
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Force the GPU power on so we can read this register */
@@ -1754,7 +1860,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put(a6xx_gpu->shadow_bo);
 	}
 
-	a6xx_llc_slices_destroy(a6xx_gpu);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		a6xx_llc_slices_destroy(a6xx_gpu);
 
 	a6xx_gmu_remove(a6xx_gpu);
 
@@ -2017,6 +2124,34 @@ static const struct adreno_gpu_funcs funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 };
 
+static const struct adreno_gpu_funcs funcs_gmuwrapper = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
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
+#endif
+		.create_address_space = a6xx_create_address_space,
+		.create_private_address_space = a6xx_create_private_address_space,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.get_timestamp = a6xx_get_timestamp,
+};
+
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -2049,7 +2184,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
 		adreno_gpu->base.hw_apriv = true;
 
-	a6xx_llc_slices_init(pdev, a6xx_gpu);
+	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
+	if (info && info->quirks & ~ADRENO_QUIRK_GMU_WRAPPER)
+		a6xx_llc_slices_init(pdev, a6xx_gpu);
 
 	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
 	if (ret) {
@@ -2057,7 +2194,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	if (info && info->quirks & ADRENO_QUIRK_GMU_WRAPPER)
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
+	else
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
@@ -2072,11 +2212,13 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	/* Check if there is a GMU phandle and set it up */
 	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
-
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
-	ret = a6xx_gmu_init(a6xx_gpu, node);
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
+	else
+		ret = a6xx_gmu_init(a6xx_gpu, node);
 	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eea2e60ce3b7..51a7656072fa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
+int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b7e217d00a22..e11e8a02ac22 100644
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b4f9b1343d63..7c5e0a90b5fb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -32,6 +32,7 @@ enum {
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
+#define ADRENO_QUIRK_GMU_WRAPPER		BIT(3)
 
 struct adreno_rev {
 	uint8_t  core;
@@ -145,6 +146,11 @@ struct adreno_platform_config {
 
 bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
+static inline bool adreno_has_gmu_wrapper(struct adreno_gpu *gpu)
+{
+	return !!(gpu->info->quirks & ADRENO_QUIRK_GMU_WRAPPER);
+}
+
 static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
 {
 	return (gpu->revn < 300);
-- 
2.39.1

