Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27995FF948
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 12:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfKQLst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Nov 2019 06:48:49 -0500
Received: from onstation.org ([52.200.56.107]:38716 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfKQLsl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Nov 2019 06:48:41 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 0D0183F252;
        Sun, 17 Nov 2019 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573991320;
        bh=Ps11L1huhdufwEObnE5u3q2EQ5i1pa0Gu/TdDVAo1bA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J4AKBDzsvxJfYViOAevEfCHNoL4bHydUuZXIAsr05WFpzp4FYD6zDFuza3OW6aujR
         2OsJNOe7897+TaSMJKOwxuClmAwG628bWK5gWeyshtwiZ1lb1rTa2qlfIN4WB6Kal/
         FALjo8QTUnPajjzItfpnBu210dkfkGAgGvr21bHA=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] drm/msm/gpu: add support for ocmem interconnect path
Date:   Sun, 17 Nov 2019 06:48:23 -0500
Message-Id: <20191117114825.13541-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117114825.13541-1-masneyb@onstation.org>
References: <20191117114825.13541-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
and must use the On Chip MEMory (OCMEM) in order to be functional.
There's a separate interconnect path that needs to be setup to OCMEM.
Add support for this second path to the GPU core.

In the downstream MSM 3.4 sources, the two interconnect paths for the
GPU are between:

  - MSM_BUS_MASTER_GRAPHICS_3D and MSM_BUS_SLAVE_EBI_CH0
  - MSM_BUS_MASTER_V_OCMEM_GFX3D and MSM_BUS_SLAVE_OCMEM

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  6 +++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 20 ++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.h           |  3 ++-
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 85f14feafdec..7885e382fb8f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -132,7 +132,7 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	 * Eventually we will want to scale the path vote with the frequency but
 	 * for now leave it at max so that the performance is nominal.
 	 */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	icc_set_bw(gpu->gfx_mem_icc_path, 0, MBps_to_icc(7216));
 }
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
@@ -714,7 +714,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	}
 
 	/* Set the bus quota to a reasonable value for boot */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
+	icc_set_bw(gpu->gfx_mem_icc_path, 0, MBps_to_icc(3072));
 
 	/* Enable the GMU interrupt */
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
@@ -858,7 +858,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 		a6xx_gmu_shutdown(gmu);
 
 	/* Remove the bus vote */
-	icc_set_bw(gpu->icc_path, 0, 0);
+	icc_set_bw(gpu->gfx_mem_icc_path, 0, 0);
 
 	/*
 	 * Make sure the GX domain is off before turning off the GMU (CX)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0783e4b5486a..d1cc021c012c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -887,9 +887,20 @@ static int adreno_get_pwrlevels(struct device *dev,
 	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
 
 	/* Check for an interconnect path for the bus */
-	gpu->icc_path = of_icc_get(dev, NULL);
-	if (IS_ERR(gpu->icc_path))
-		gpu->icc_path = NULL;
+	gpu->gfx_mem_icc_path = of_icc_get(dev, "gfx-mem");
+	if (!gpu->gfx_mem_icc_path) {
+		/*
+		 * Keep compatbility with device trees that don't have an
+		 * interconnect-names property.
+		 */
+		gpu->gfx_mem_icc_path = of_icc_get(dev, NULL);
+	}
+	if (IS_ERR(gpu->gfx_mem_icc_path))
+		gpu->gfx_mem_icc_path = NULL;
+
+	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+	if (IS_ERR(gpu->ocmem_icc_path))
+		gpu->ocmem_icc_path = NULL;
 
 	return 0;
 }
@@ -976,7 +987,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
-	icc_put(gpu->icc_path);
+	icc_put(gpu->gfx_mem_icc_path);
+	icc_put(gpu->ocmem_icc_path);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c9dc8..e72e56f7b0ef 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -111,7 +111,8 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;
 
-	struct icc_path *icc_path;
+	struct icc_path *gfx_mem_icc_path;
+	struct icc_path *ocmem_icc_path;
 
 	/* Hang and Inactivity Detection:
 	 */
-- 
2.21.0

