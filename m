Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F00F11100FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 16:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfLCPQP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 10:16:15 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:53550
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbfLCPQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 10:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386174;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=90R9t0Ga87128dvz4AQumucGcEUKYo+umkcqvBQs7ag=;
        b=kkSVY9EKOfW5CnsiERJJbxWvTJzg+ImCZK3ys8aLwWzvMpYaeE6615QrrcZxfCgY
        XCAqzw47Ir27s+vegpDXHYOlewGpJEx4POiCzExPFcuZ7m1+9wWn4UP8QYUVpSTztcY
        DPBxyktTxG5kkFgA04oDeeg337rzCwTtmpW8jNTM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386174;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=90R9t0Ga87128dvz4AQumucGcEUKYo+umkcqvBQs7ag=;
        b=Trbt/NDscuPBQ8B2ErfkayFVhdSbBRFBN3HFQ/HoqzZ4/UFIm/1leXkpDAxLwCPc
        jr5ZIyaG8uiwpLmiFNRoSnn4FbjLuPru/iPFA6bIU8xhnoSXZHHYlgnFRMd4Gjg20AY
        eG4zKehJiMwcx7ABdxsfn2JPligcYrj+fRIjU2Qs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54F3BC447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 2/5] drm: msm: a6xx: Add support for A618
Date:   Tue, 3 Dec 2019 15:16:14 +0000
Message-ID: <0101016ecc5552f2-48a2cb2e-753d-4686-a79b-5d05756056ca-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for enabling Graphics Bus Interface(GBIF)
used in multiple A6xx series chipets. Also makes changes to the
PDC/RSC sequencing specifically required for A618. This is needed
for proper interfacing with RPMH.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h   | 52 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 24 +++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 70 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  9 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 12 +++++-
 5 files changed, 154 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index f44553e..ed78fee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -16,11 +16,11 @@
 - /home/robclark/src/envytools/rnndb/adreno/a3xx.xml          (  83840 bytes, from 2018-07-03 19:37:13)
 - /home/robclark/src/envytools/rnndb/adreno/a4xx.xml          ( 112086 bytes, from 2018-07-03 19:37:13)
 - /home/robclark/src/envytools/rnndb/adreno/a5xx.xml          ( 147240 bytes, from 2018-12-02 17:29:54)
-- /home/robclark/src/envytools/rnndb/adreno/a6xx.xml          ( 140790 bytes, from 2018-12-02 17:29:54)
+- /home/smasetty/playarea/envytools/rnndb/adreno/a6xx.xml     ( 161969 bytes, from 2019-11-29 07:18:16)
 - /home/robclark/src/envytools/rnndb/adreno/a6xx_gmu.xml      (  10431 bytes, from 2018-09-14 13:03:07)
 - /home/robclark/src/envytools/rnndb/adreno/ocmem.xml         (   1773 bytes, from 2018-07-03 19:37:13)

-Copyright (C) 2013-2018 by the following authors:
+Copyright (C) 2013-2019 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)

@@ -2519,6 +2519,54 @@ static inline uint32_t A6XX_VBIF_TEST_BUS2_CTRL1_DATA_SEL(uint32_t val)

 #define REG_A6XX_VBIF_PERF_PWR_CNT_HIGH2			0x0000311a

+#define REG_A6XX_GBIF_SCACHE_CNTL1				0x00003c02
+
+#define REG_A6XX_GBIF_QSB_SIDE0					0x00003c03
+
+#define REG_A6XX_GBIF_QSB_SIDE1					0x00003c04
+
+#define REG_A6XX_GBIF_QSB_SIDE2					0x00003c05
+
+#define REG_A6XX_GBIF_QSB_SIDE3					0x00003c06
+
+#define REG_A6XX_GBIF_HALT					0x00003c45
+
+#define REG_A6XX_GBIF_HALT_ACK					0x00003c46
+
+#define REG_A6XX_GBIF_PERF_PWR_CNT_EN				0x00003cc0
+
+#define REG_A6XX_GBIF_PERF_CNT_SEL				0x00003cc2
+
+#define REG_A6XX_GBIF_PERF_PWR_CNT_SEL				0x00003cc3
+
+#define REG_A6XX_GBIF_PERF_CNT_LOW0				0x00003cc4
+
+#define REG_A6XX_GBIF_PERF_CNT_LOW1				0x00003cc5
+
+#define REG_A6XX_GBIF_PERF_CNT_LOW2				0x00003cc6
+
+#define REG_A6XX_GBIF_PERF_CNT_LOW3				0x00003cc7
+
+#define REG_A6XX_GBIF_PERF_CNT_HIGH0				0x00003cc8
+
+#define REG_A6XX_GBIF_PERF_CNT_HIGH1				0x00003cc9
+
+#define REG_A6XX_GBIF_PERF_CNT_HIGH2				0x00003cca
+
+#define REG_A6XX_GBIF_PERF_CNT_HIGH3				0x00003ccb
+
+#define REG_A6XX_GBIF_PWR_CNT_LOW0				0x00003ccc
+
+#define REG_A6XX_GBIF_PWR_CNT_LOW1				0x00003ccd
+
+#define REG_A6XX_GBIF_PWR_CNT_LOW2				0x00003cce
+
+#define REG_A6XX_GBIF_PWR_CNT_HIGH0				0x00003ccf
+
+#define REG_A6XX_GBIF_PWR_CNT_HIGH1				0x00003cd0
+
+#define REG_A6XX_GBIF_PWR_CNT_HIGH2				0x00003cd1
+
 #define REG_A6XX_RB_WINDOW_OFFSET2				0x000088d4
 #define A6XX_RB_WINDOW_OFFSET2_WINDOW_OFFSET_DISABLE		0x80000000
 #define A6XX_RB_WINDOW_OFFSET2_X__MASK				0x00007fff
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 85f14fe..158a74c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Copyright (c) 2017-2018 The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */

 #include <linux/clk.h>
 #include <linux/interconnect.h>
@@ -433,6 +433,8 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,

 static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
 	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
@@ -480,20 +482,34 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 4, 0x10108);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 4, 0x30000);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 4, 0x0);
+
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 8, 0x10108);
-	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30080);
+	if (adreno_is_a618(adreno_gpu))
+		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30090);
+	else
+		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30080);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 8, 0x0);
+
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD_ENABLE_BANK, 7);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD_WAIT_FOR_CMPL_BANK, 0);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CONTROL, 0);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID, 0x10108);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR, 0x30010);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA, 2);
+
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
-	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
+	if (adreno_is_a618(adreno_gpu))
+		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);
+	else
+		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
+
+
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 8, 0x10108);
-	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30080);
+	if (adreno_is_a618(adreno_gpu))
+		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30090);
+	else
+		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30080);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 8, 0x3);

 	/* Setup GPU PDC */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index dc8ec2c..6fdffae 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Copyright (c) 2017-2018 The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */


 #include "msm_gem.h"
@@ -378,6 +378,18 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	int ret;

+	/*
+	 * During a previous slumber, GBIF halt is asserted to ensure
+	 * no further transaction can go through GPU before GPU
+	 * headswitch is turned off.
+	 *
+	 * This halt is deasserted once headswitch goes off but
+	 * incase headswitch doesn't goes off clear GBIF halt
+	 * here to ensure GPU wake-up doesn't fail because of
+	 * halted GPU transactions.
+	 */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
+
 	/* Make sure the GMU keeps the GPU on while we set it up */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);

@@ -406,12 +418,17 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_TPL1_ADDR_MODE_CNTL, 0x1);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_ADDR_MODE_CNTL, 0x1);

-	/* enable hardware clockgating */
-	a6xx_set_hwcg(gpu, true);
+	/*
+	 * enable hardware clockgating
+	 * For now enable clock gating only for a630
+	 */
+	if (adreno_is_a630(adreno_gpu))
+		a6xx_set_hwcg(gpu, true);

-	/* VBIF start */
-	gpu_write(gpu, REG_A6XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
+	/* VBIF/GBIF start*/
 	gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
+	if (adreno_is_a630(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);

 	/* Make all blocks contribute to the GPU BUSY perf counter */
 	gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
@@ -724,6 +741,39 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_A6XX_CP_RB_CNTL),
 };

+#define GBIF_CLIENT_HALT_MASK             BIT(0)
+#define GBIF_ARB_HALT_MASK                BIT(1)
+
+static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+
+	if(!a6xx_has_gbif(adreno_gpu)){
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
+		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
+								0xf) == 0xf);
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
+
+		return;
+	}
+
+	/* Halt new client requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
+	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
+
+	/* Halt all AXI requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
+	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
+
+	/*
+	 * GMU needs DDR access in slumber path. Deassert GBIF halt now
+	 * to allow for GMU to access system memory.
+	 */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
+}
+
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -748,6 +798,16 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)

 	devfreq_suspend_device(gpu->devfreq.devfreq);

+	/*
+	 * Make sure the GMU is idle before continuing (because some transitions
+	 * may use VBIF
+	 */
+	a6xx_gmu_wait_for_idle(&a6xx_gpu->gmu);
+
+	/* Clear the VBIF pipe before shutting down */
+	/* FIXME: This accesses the GPU - do we need to make sure it is on? */
+	a6xx_bus_clear_pending_transactions(adreno_gpu);
+
 	return a6xx_gmu_stop(a6xx_gpu);
 }

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6439955..7239b8b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2017 The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2017, 2019 The Linux Foundation. All rights reserved. */

 #ifndef __A6XX_GPU_H__
 #define __A6XX_GPU_H__
@@ -42,6 +42,13 @@ struct a6xx_gpu {
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
 	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))

+static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
+{
+	if(adreno_is_a630(gpu))
+		return false;
+
+	return true;
+}

 int a6xx_gmu_resume(struct a6xx_gpu *gpu);
 int a6xx_gmu_stop(struct a6xx_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c7441fb..e12d5a9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -3,7 +3,7 @@
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  *
- * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2014,2017, 2019 The Linux Foundation. All rights reserved.
  */

 #ifndef __ADRENO_GPU_H__
@@ -216,6 +216,16 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
 	return gpu->revn == 540;
 }

+static inline int adreno_is_a618(struct adreno_gpu *gpu)
+{
+       return gpu->revn == 618;
+}
+
+static inline int adreno_is_a630(struct adreno_gpu *gpu)
+{
+       return gpu->revn == 630;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
--
1.9.1

