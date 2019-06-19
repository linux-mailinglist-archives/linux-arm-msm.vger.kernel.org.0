Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9FF14B023
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 04:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730374AbfFSCcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 22:32:17 -0400
Received: from onstation.org ([52.200.56.107]:35146 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730337AbfFSCcQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 22:32:16 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 53F313EA0E;
        Wed, 19 Jun 2019 02:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560911535;
        bh=fcgvpkLyM92w4+oGhzDyZOcpYDn3ZLNQMODBulNcsJc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=etUaTbFbhl0Q9JAqG66RCbE+cgOl6xzYi67cnsUlMeelxN+BjFB/maJrvBCmxUjLp
         CK1jp1juzwCqGgReNtTsUOpSAKtpNYmMGOZtvz/vCohUzSrwjLz6vvPmmEXQLyk50Y
         wwG6gA6l0k4H7OsK9GmJH0ZacGhOhsgFLs8yklmg=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] drm/msm/gpu: add ocmem init/cleanup functions
Date:   Tue, 18 Jun 2019 22:32:09 -0400
Message-Id: <20190619023209.10036-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619023209.10036-1-masneyb@onstation.org>
References: <20190619023209.10036-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The files a3xx_gpu.c and a4xx_gpu.c have ifdefs for the OCMEM support
that was missing upstream. Add two new functions (adreno_gpu_ocmem_init
and adreno_gpu_ocmem_cleanup) that removes some duplicated code. We also
need to change the ifdef check for CONFIG_MSM_OCMEM to CONFIG_QCOM_OCMEM
now that OCMEM support is upstream.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v1:
- remove CONFIG_QCOM_OCMEM #ifdefs
- use unsigned long for memory addresses instead of uint32_t
- add 'depends on QCOM_OCMEM || QCOM_OCMEM=n' to Kconfig

 drivers/gpu/drm/msm/Kconfig             |  1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 33 ++++++++---------------
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h   |  3 +--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 30 +++++++--------------
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h   |  3 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 36 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 +++++++
 7 files changed, 70 insertions(+), 46 deletions(-)

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
index c3b4bc6e4155..72720bb2aca1 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -17,10 +17,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifdef CONFIG_MSM_OCMEM
-#  include <mach/ocmem.h>
-#endif
-
 #include "a3xx_gpu.h"
 
 #define A3XX_INT0_MASK \
@@ -206,9 +202,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_RBBM_GPR0_CTL, 0x00000000);
 
 	/* Set the OCMEM base address for A330, etc */
-	if (a3xx_gpu->ocmem_hdl) {
+	if (a3xx_gpu->ocmem.hdl) {
 		gpu_write(gpu, REG_A3XX_RB_GMEM_BASE_ADDR,
-			(unsigned int)(a3xx_gpu->ocmem_base >> 14));
+			(unsigned int)(a3xx_gpu->ocmem.base >> 14));
 	}
 
 	/* Turn on performance counters: */
@@ -329,10 +325,7 @@ static void a3xx_destroy(struct msm_gpu *gpu)
 
 	adreno_gpu_cleanup(adreno_gpu);
 
-#ifdef CONFIG_MSM_OCMEM
-	if (a3xx_gpu->ocmem_base)
-		ocmem_free(OCMEM_GRAPHICS, a3xx_gpu->ocmem_hdl);
-#endif
+	adreno_gpu_ocmem_cleanup(&a3xx_gpu->ocmem);
 
 	kfree(a3xx_gpu);
 }
@@ -507,17 +500,10 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 
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
@@ -530,11 +516,14 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 		 */
 		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
 		ret = -ENXIO;
-		goto fail;
+		goto fail_cleanup_ocmem;
 	}
 
 	return gpu;
 
+fail_cleanup_ocmem:
+	adreno_gpu_ocmem_cleanup(&a3xx_gpu->ocmem);
+
 fail:
 	if (a3xx_gpu)
 		a3xx_destroy(&a3xx_gpu->base.base);
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
index ab60dc9e344e..727c34f38f9e 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
@@ -30,8 +30,7 @@ struct a3xx_gpu {
 	struct adreno_gpu base;
 
 	/* if OCMEM is used for GMEM: */
-	uint32_t ocmem_base;
-	void *ocmem_hdl;
+	struct adreno_ocmem ocmem;
 };
 #define to_a3xx_gpu(x) container_of(x, struct a3xx_gpu, base)
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index ab2b752566d8..b8f825107796 100644
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
@@ -601,11 +588,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 		 */
 		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
 		ret = -ENXIO;
-		goto fail;
+		goto fail_cleanup_ocmem;
 	}
 
 	return gpu;
 
+fail_cleanup_ocmem:
+	adreno_gpu_ocmem_cleanup(&a4xx_gpu->ocmem);
+
 fail:
 	if (a4xx_gpu)
 		a4xx_destroy(&a4xx_gpu->base.base);
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
index 6f7f4114afcf..3a1bef87bf5b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -25,6 +25,7 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <soc/qcom/ocmem.h>
 #include "adreno_gpu.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
@@ -897,6 +898,41 @@ static int adreno_get_pwrlevels(struct device *dev,
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
+		if (PTR_ERR(ocmem) == -ENXIO) {
+			/* This is an optional property so return success. */
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
index 0925606ec9b5..0947a6124cac 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -136,6 +136,12 @@ struct adreno_gpu {
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
@@ -241,6 +247,10 @@ void adreno_dump(struct msm_gpu *gpu);
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
2.20.1

