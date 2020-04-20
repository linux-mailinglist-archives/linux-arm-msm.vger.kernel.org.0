Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767301B0DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 16:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgDTOEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 10:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728792AbgDTOEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 10:04:01 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC24FC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:04:00 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id v7so10647824qkc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IfsQZuJ4wWjDiYtdhpH54Dn+qX8E3n2269XGb2jWTsQ=;
        b=wRcIYgKQKuPCk8p9ij74NVUjfLOrmLMI+H2qsgc6Gies+0VoI4pHOjnTorh4Aigm/h
         gNPKaF02Xz+0Afo9Gd4Z6+etxAFPgaFqcPm3am1cZiC93FGUrr3k82UYlZSIvHYAjZeT
         2EMxcIoLfm8Cw1DCQ6pOA6VKAz0CfRQ/Q3B1vqbEu9IGVoUxAH0cGxwmTiYFj4L1puFF
         AboPjzkPc8U44WGfdj4Zo1RSU7sPdICw1Bo2en+l+hsdTB6hDIUjVr0Lrz+JOIxI3Ah5
         QSDqdRAi9vB74XjOZxCNk3Gw86TZ0K7kTd/DD575tkV8QIctH7zzvDUokn9jLhdhciHE
         KPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IfsQZuJ4wWjDiYtdhpH54Dn+qX8E3n2269XGb2jWTsQ=;
        b=KquEXJmKcSAP+gcP/g6vqh6BSn2TMYOeZgu+pCxClxwFiiGxK1zGX4NRZ+/S6ECITO
         Gl38FOWo5tHutOfAgR15azYhNZtos7WMaJ4d+zykoabxRBIwxkG2xuAVhn+bR7NQwu2W
         1bgivaMM99vtgfOggVfpkh7Gj/z5KGhwqvDrdIleGHsBO0x/VNOndFn3NKV5NvPm1vhT
         WZvHgHvCrmluBGHdYM/kRuuxyuy4Kqb4H1N4lm3H0g8IGxna13f+41xm+oyzeIXVQsOm
         ZLq8ZY3FQ7QRbuK/BsSq/ZcHEKrVjU/YoZZncmF2dXXF4KbDeLhlvLVbNlVNN0MDRcUI
         k56w==
X-Gm-Message-State: AGi0PubdQ8H3cjg4qI+s3GeT4G8V2eYGCuJCdzNt6ri2zkikEgfBxut1
        d5sGqp5xNUSEukYU0DV1Fip3Ig==
X-Google-Smtp-Source: APiQypK6T6SHPQEOus1zvhfr3/Ry0B0WdG8lp3qd3a38djhWEuglvAu8NSC2BjWArQIGS0y7pMdhDg==
X-Received: by 2002:a37:7002:: with SMTP id l2mr16505886qkc.372.1587391439891;
        Mon, 20 Apr 2020 07:03:59 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 07:03:59 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/9] drm/msm/a6xx: add support for A650 gmu rscc registers
Date:   Mon, 20 Apr 2020 10:03:10 -0400
Message-Id: <20200420140313.7263-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some of the RSCC registers on A650 are in a separate region.

Note this also changes the address of these registers:

RSCC_TCS1_DRV0_STATUS
RSCC_TCS2_DRV0_STATUS
RSCC_TCS3_DRV0_STATUS

Based on the values in msm-4.14 and msm-4.19 kernels.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 68 +++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     | 10 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 38 ++++++-------
 3 files changed, 74 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6dffd1095a24..3e51939eb867 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -420,7 +420,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 		return ret;
 	}
 
-	ret = gmu_poll_timeout(gmu, REG_A6XX_RSCC_SEQ_BUSY_DRV0, val,
+	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_SEQ_BUSY_DRV0, val,
 		!val, 100, 10000);
 
 	if (ret) {
@@ -446,7 +446,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
-	ret = gmu_poll_timeout(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
+	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
 		val, val & (1 << 16), 100, 10000);
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
@@ -474,27 +474,35 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 		goto err;
 
 	/* Disable SDE clock gating */
-	gmu_write(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
+	gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
 
 	/* Setup RSC PDC handshake for sleep and wakeup */
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0, 1);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4, 0x80000000);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 4, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_OVERRIDE_START_ADDR, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_SEQ_START_ADDR, 0x4520);
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_LO, 0x4510);
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0, 1);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4, 0x80000000);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 4, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_OVERRIDE_START_ADDR, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_SEQ_START_ADDR, 0x4520);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_LO, 0x4510);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
 
 	/* Load RSC sequencer uCode for sleep and wakeup */
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xa7a506a0);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xa1e6a6e7);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e081e1);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xe9a982e2);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xeaaae5a0);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xe1a1ebab);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e0a581);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xecac82e2);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020edad);
+	} else {
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xa7a506a0);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xa1e6a6e7);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e081e1);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xe9a982e2);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
+	}
 
 	/* Load PDC sequencer uCode for power up and power down sequence */
 	pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0, 0xfebea1e1);
@@ -783,13 +791,13 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 	u32 val;
 
 	/* Make sure there are no outstanding RPMh votes */
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS, val,
 		(val & 1), 100, 10000);
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS, val,
 		(val & 1), 100, 10000);
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS, val,
 		(val & 1), 100, 10000);
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
 		(val & 1), 100, 1000);
 }
 
@@ -1385,6 +1393,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 
 	if (!gmu->initialized)
@@ -1398,7 +1407,10 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	}
 
 	iounmap(gmu->mmio);
+	if (adreno_is_a650(adreno_gpu))
+		iounmap(gmu->rscc);
 	gmu->mmio = NULL;
+	gmu->rscc = NULL;
 
 	a6xx_gmu_memory_free(gmu, gmu->icache);
 	a6xx_gmu_memory_free(gmu, gmu->dcache);
@@ -1488,6 +1500,14 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (IS_ERR(gmu->mmio))
 		goto err_memory;
 
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
+		if (IS_ERR(gmu->rscc))
+			goto err_mmio;
+	} else {
+		gmu->rscc = gmu->mmio + 0x23000;
+	}
+
 	/* Get the HFI and GMU interrupts */
 	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
 	gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
@@ -1513,6 +1533,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 err_mmio:
 	iounmap(gmu->mmio);
+	if (adreno_is_a650(adreno_gpu))
+		iounmap(gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 err_memory:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index ff5d9c61e487..abd425ca6682 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -45,6 +45,7 @@ struct a6xx_gmu {
 	struct device *dev;
 
 	void * __iomem mmio;
+	void * __iomem rscc;
 
 	int hfi_irq;
 	int gmu_irq;
@@ -127,6 +128,15 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
 		interval, timeout)
 
+static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
+{
+	return msm_writel(value, gmu->rscc + (offset << 2));
+}
+
+#define gmu_poll_timeout_rscc(gmu, addr, val, cond, interval, timeout) \
+	readl_poll_timeout((gmu)->rscc + ((addr) << 2), val, cond, \
+		interval, timeout)
+
 /*
  * These are the available OOB (out of band requests) to the GMU where "out of
  * band" means that the CPU talks to the GMU directly and not through HFI.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index eb2cd41dae6e..b4357ea550ec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -336,8 +336,6 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_AO_SPARE_CNTL				0x00009316
 
-#define REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0			0x00008c04
-
 #define REG_A6XX_GMU_RSCC_CONTROL_REQ				0x00009307
 
 #define REG_A6XX_GMU_RSCC_CONTROL_ACK				0x00009308
@@ -350,39 +348,41 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_CC_GX_DOMAIN_MISC				0x00009d42
 
-#define REG_A6XX_RSCC_PDC_SEQ_START_ADDR			0x00008c08
+#define REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0			0x00000004
+
+#define REG_A6XX_RSCC_PDC_SEQ_START_ADDR			0x00000008
 
-#define REG_A6XX_RSCC_PDC_MATCH_VALUE_LO			0x00008c09
+#define REG_A6XX_RSCC_PDC_MATCH_VALUE_LO			0x00000009
 
-#define REG_A6XX_RSCC_PDC_MATCH_VALUE_HI			0x00008c0a
+#define REG_A6XX_RSCC_PDC_MATCH_VALUE_HI			0x0000000a
 
-#define REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0				0x00008c0b
+#define REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0				0x0000000b
 
-#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR			0x00008c0d
+#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR			0x0000000d
 
-#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA			0x00008c0e
+#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA			0x0000000e
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0		0x00008c82
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0		0x00000082
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0		0x00008c83
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0		0x00000083
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_EN_DRV0			0x00008c89
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_EN_DRV0			0x00000089
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0		0x00008c8c
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0		0x0000008c
 
-#define REG_A6XX_RSCC_OVERRIDE_START_ADDR			0x00008d00
+#define REG_A6XX_RSCC_OVERRIDE_START_ADDR			0x00000100
 
-#define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00008d01
+#define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00000101
 
-#define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00008d80
+#define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00000180
 
-#define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00008f46
+#define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00000346
 
-#define REG_A6XX_RSCC_TCS1_DRV0_STATUS				0x000090ae
+#define REG_A6XX_RSCC_TCS1_DRV0_STATUS				0x000003ee
 
-#define REG_A6XX_RSCC_TCS2_DRV0_STATUS				0x00009216
+#define REG_A6XX_RSCC_TCS2_DRV0_STATUS				0x00000496
 
-#define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000937e
+#define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000053e
 
 
 #endif /* A6XX_GMU_XML */
-- 
2.26.1

