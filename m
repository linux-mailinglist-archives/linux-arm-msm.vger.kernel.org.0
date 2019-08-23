Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3C2A9AF01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 14:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394419AbfHWMRD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 08:17:03 -0400
Received: from onstation.org ([52.200.56.107]:50866 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394341AbfHWMRB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 08:17:01 -0400
Received: from localhost.localdomain (wsip-184-191-162-253.sd.sd.cox.net [184.191.162.253])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id A68DE3E83A;
        Fri, 23 Aug 2019 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1566562619;
        bh=CJX8LFadZm5cNeTACSmQxnUG8/hXOV2JUJat/Sn2OKs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RbIEnMITtZCMBVKYY0gAp7PTo2xnAZrO1RuOtAjNqPVf3bAE4+YbBX3KkHO08lDYr
         NhMEoHBOIFV/pWwnbseP1McwDbRlE59DwAd/0av2mo5Z2Hk6apfY7QHZHtlBYlCx50
         Sro1qlGEZsjJK5Co7xwHwssVCI/5iGLqw+8iTF8U=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v7 6/7] drm/msm/gpu: add ocmem init/cleanup functions
Date:   Fri, 23 Aug 2019 05:16:36 -0700
Message-Id: <20190823121637.5861-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823121637.5861-1-masneyb@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The files a3xx_gpu.c and a4xx_gpu.c have ifdefs for the OCMEM support
that was missing upstream. Add two new functions (adreno_gpu_ocmem_init
and adreno_gpu_ocmem_cleanup) that removes some duplicated code.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v6:
- None

Changes since v5:
- None

Changes since v4:
- None

Changes since v3:
- None

Changes since v2:
- Check for -ENODEV error of_get_ocmem()
- remove fail_cleanup_ocmem label in a[34]xx_gpu_init

Changes since v1:
- remove CONFIG_QCOM_OCMEM #ifdefs
- use unsigned long for memory addresses instead of uint32_t
- add 'depends on QCOM_OCMEM || QCOM_OCMEM=n' to Kconfig

 drivers/gpu/drm/msm/Kconfig             |  1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 28 +++++------------
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h   |  3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 25 ++++------------
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h   |  3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 40 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 +++++++
 7 files changed, 66 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 9c37e4de5896..b3d3b2172659 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -7,6 +7,7 @@ config DRM_MSM
 	depends on OF && COMMON_CLK
 	depends on MMU
 	depends on INTERCONNECT || !INTERCONNECT
+	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5f7e98028eaf..7ad14937fcdf 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -6,10 +6,6 @@
  * Copyright (c) 2014 The Linux Foundation. All rights reserved.
  */
 
-#ifdef CONFIG_MSM_OCMEM
-#  include <mach/ocmem.h>
-#endif
-
 #include "a3xx_gpu.h"
 
 #define A3XX_INT0_MASK \
@@ -195,9 +191,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_RBBM_GPR0_CTL, 0x00000000);
 
 	/* Set the OCMEM base address for A330, etc */
-	if (a3xx_gpu->ocmem_hdl) {
+	if (a3xx_gpu->ocmem.hdl) {
 		gpu_write(gpu, REG_A3XX_RB_GMEM_BASE_ADDR,
-			(unsigned int)(a3xx_gpu->ocmem_base >> 14));
+			(unsigned int)(a3xx_gpu->ocmem.base >> 14));
 	}
 
 	/* Turn on performance counters: */
@@ -318,10 +314,7 @@ static void a3xx_destroy(struct msm_gpu *gpu)
 
 	adreno_gpu_cleanup(adreno_gpu);
 
-#ifdef CONFIG_MSM_OCMEM
-	if (a3xx_gpu->ocmem_base)
-		ocmem_free(OCMEM_GRAPHICS, a3xx_gpu->ocmem_hdl);
-#endif
+	adreno_gpu_ocmem_cleanup(&a3xx_gpu->ocmem);
 
 	kfree(a3xx_gpu);
 }
@@ -494,17 +487,10 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 
 	/* if needed, allocate gmem: */
 	if (adreno_is_a330(adreno_gpu)) {
-#ifdef CONFIG_MSM_OCMEM
-		/* TODO this is different/missing upstream: */
-		struct ocmem_buf *ocmem_hdl =
-				ocmem_allocate(OCMEM_GRAPHICS, adreno_gpu->gmem);
-
-		a3xx_gpu->ocmem_hdl = ocmem_hdl;
-		a3xx_gpu->ocmem_base = ocmem_hdl->addr;
-		adreno_gpu->gmem = ocmem_hdl->len;
-		DBG("using %dK of OCMEM at 0x%08x", adreno_gpu->gmem / 1024,
-				a3xx_gpu->ocmem_base);
-#endif
+		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,
+					    adreno_gpu, &a3xx_gpu->ocmem);
+		if (ret)
+			goto fail;
 	}
 
 	if (!gpu->aspace) {
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
index 5dc33e5ea53b..c555fb13e0d7 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
@@ -19,8 +19,7 @@ struct a3xx_gpu {
 	struct adreno_gpu base;
 
 	/* if OCMEM is used for GMEM: */
-	uint32_t ocmem_base;
-	void *ocmem_hdl;
+	struct adreno_ocmem ocmem;
 };
 #define to_a3xx_gpu(x) container_of(x, struct a3xx_gpu, base)
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index ab2b752566d8..b01388a9e89e 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -2,9 +2,6 @@
 /* Copyright (c) 2014 The Linux Foundation. All rights reserved.
  */
 #include "a4xx_gpu.h"
-#ifdef CONFIG_MSM_OCMEM
-#  include <soc/qcom/ocmem.h>
-#endif
 
 #define A4XX_INT0_MASK \
 	(A4XX_INT0_RBBM_AHB_ERROR |        \
@@ -188,7 +185,7 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
 			(1 << 30) | 0xFFFF);
 
 	gpu_write(gpu, REG_A4XX_RB_GMEM_BASE_ADDR,
-			(unsigned int)(a4xx_gpu->ocmem_base >> 14));
+			(unsigned int)(a4xx_gpu->ocmem.base >> 14));
 
 	/* Turn on performance counters: */
 	gpu_write(gpu, REG_A4XX_RBBM_PERFCTR_CTL, 0x01);
@@ -318,10 +315,7 @@ static void a4xx_destroy(struct msm_gpu *gpu)
 
 	adreno_gpu_cleanup(adreno_gpu);
 
-#ifdef CONFIG_MSM_OCMEM
-	if (a4xx_gpu->ocmem_base)
-		ocmem_free(OCMEM_GRAPHICS, a4xx_gpu->ocmem_hdl);
-#endif
+	adreno_gpu_ocmem_cleanup(&a4xx_gpu->ocmem);
 
 	kfree(a4xx_gpu);
 }
@@ -578,17 +572,10 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 
 	/* if needed, allocate gmem: */
 	if (adreno_is_a4xx(adreno_gpu)) {
-#ifdef CONFIG_MSM_OCMEM
-		/* TODO this is different/missing upstream: */
-		struct ocmem_buf *ocmem_hdl =
-				ocmem_allocate(OCMEM_GRAPHICS, adreno_gpu->gmem);
-
-		a4xx_gpu->ocmem_hdl = ocmem_hdl;
-		a4xx_gpu->ocmem_base = ocmem_hdl->addr;
-		adreno_gpu->gmem = ocmem_hdl->len;
-		DBG("using %dK of OCMEM at 0x%08x", adreno_gpu->gmem / 1024,
-				a4xx_gpu->ocmem_base);
-#endif
+		ret = adreno_gpu_ocmem_init(dev->dev, adreno_gpu,
+					    &a4xx_gpu->ocmem);
+		if (ret)
+			goto fail;
 	}
 
 	if (!gpu->aspace) {
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.h b/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
index d506311ee240..a01448cba2ea 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
@@ -16,8 +16,7 @@ struct a4xx_gpu {
 	struct adreno_gpu base;
 
 	/* if OCMEM is used for GMEM: */
-	uint32_t ocmem_base;
-	void *ocmem_hdl;
+	struct adreno_ocmem ocmem;
 };
 #define to_a4xx_gpu(x) container_of(x, struct a4xx_gpu, base)
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 048c8be426f3..0783e4b5486a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -14,6 +14,7 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <soc/qcom/ocmem.h>
 #include "adreno_gpu.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
@@ -893,6 +894,45 @@ static int adreno_get_pwrlevels(struct device *dev,
 	return 0;
 }
 
+int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
+			  struct adreno_ocmem *adreno_ocmem)
+{
+	struct ocmem_buf *ocmem_hdl;
+	struct ocmem *ocmem;
+
+	ocmem = of_get_ocmem(dev);
+	if (IS_ERR(ocmem)) {
+		if (PTR_ERR(ocmem) == -ENODEV) {
+			/*
+			 * Return success since either the ocmem property was
+			 * not specified in device tree, or ocmem support is
+			 * not compiled into the kernel.
+			 */
+			return 0;
+		}
+
+		return PTR_ERR(ocmem);
+	}
+
+	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->gmem);
+	if (IS_ERR(ocmem_hdl))
+		return PTR_ERR(ocmem_hdl);
+
+	adreno_ocmem->ocmem = ocmem;
+	adreno_ocmem->base = ocmem_hdl->addr;
+	adreno_ocmem->hdl = ocmem_hdl;
+	adreno_gpu->gmem = ocmem_hdl->len;
+
+	return 0;
+}
+
+void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
+{
+	if (adreno_ocmem && adreno_ocmem->base)
+		ocmem_free(adreno_ocmem->ocmem, OCMEM_GRAPHICS,
+			   adreno_ocmem->hdl);
+}
+
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c7441fb8313e..d225a8a92e58 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -126,6 +126,12 @@ struct adreno_gpu {
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
 
+struct adreno_ocmem {
+	struct ocmem *ocmem;
+	unsigned long base;
+	void *hdl;
+};
+
 /* platform config data (ie. from DT, or pdata) */
 struct adreno_platform_config {
 	struct adreno_rev rev;
@@ -236,6 +242,10 @@ void adreno_dump(struct msm_gpu *gpu);
 void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords);
 struct msm_ringbuffer *adreno_active_ring(struct msm_gpu *gpu);
 
+int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
+			  struct adreno_ocmem *ocmem);
+void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *ocmem);
+
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *gpu, const struct adreno_gpu_funcs *funcs,
 		int nr_rings);
-- 
2.21.0

