Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F07A306830
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 00:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhA0Xnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 18:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbhA0XlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 18:41:04 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FCBC06178B
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:39:52 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id jx18so2711398pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j6gSRxsto0OoacCmW8vC/THw0ezOInI46XhFUQdIUUY=;
        b=WrW11JHrwi6Rdu7L6Q0QlMcHzDZThKa7X1xOGpXGqHzIwBKNyT72EfMYRT8+0qcGUS
         2h/aeWkka+tpwufNG6SRP/YMZlWsKhfjVEYiSstpI4WoEKYqKoQ22jaN2lwkQwtbAwnd
         YZoF4NBrseF44FzdJ2Ga9l7qa574QkriSRrjBU+RREnOMv1GS511CqfaDbWPshpo7J17
         sX1elhBBTiT2tC52KBhLpVNrzUSebc+ygHRRR1/1rypakMQc6MqTsRfINPggB97VKw6f
         aXNw461c8ZaTafjIRyUJM27l3teO15r79v+9HXNesSAmUgKY2rQEg9LQYd95WKMJrlnN
         4Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j6gSRxsto0OoacCmW8vC/THw0ezOInI46XhFUQdIUUY=;
        b=eyqpN8PBHkVm6nUA5xGfQ7xaRoK1GzAD2zw+bE8IWcc5Gr2xMleNbSGr+69pjK58n5
         O8cCozfTmDva0rXpPFSChjnWMDriWOdbsRFiWVuxYDlTxHglPo6OabqCz+G3400ZEvHQ
         +5tAlJI5Xe5NmMLsxC/tTJ5INJiOBVj3RqC4r6jtjh84ajBg7bzGsLj3qn1ULbuYjUyU
         jJOqppMBBkXmoL1Ge/6Pl2xuHOXbi+38tFq5Bh8knF5itsucq5Cf6PJMYHuj3cPcIv0/
         PsmAaiOgi2jFaYZcOQ2+FJNlP3drXbFJvYeK10Pi1xAWILD2+I7zblagJNGASs+jvUdG
         U2jg==
X-Gm-Message-State: AOAM531c+w0LZTvL+YZdmwPRDD8bG6V1XoKIy0exau3ykjd0Ra5dYgMZ
        X288V9vdf5Pjf48WYrlu31S3Og==
X-Google-Smtp-Source: ABdhPJwXUYZTfEbe+4zg85+r5OVqPcneWX18LvbJMdFx5D72DChr1EkljueMW7FbUAExa9EKXfWeTA==
X-Received: by 2002:a17:90a:7e8d:: with SMTP id j13mr8206360pjl.37.1611790792005;
        Wed, 27 Jan 2021 15:39:52 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
        by smtp.gmail.com with ESMTPSA id q2sm3282382pfj.32.2021.01.27.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 15:39:51 -0800 (PST)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/3] drm/msm: Clean up GMU OOB set/clear handling.
Date:   Wed, 27 Jan 2021 15:39:46 -0800
Message-Id: <20210127233946.1286386-3-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127233946.1286386-1-eric@anholt.net>
References: <20210127233946.1286386-1-eric@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the bug is fixed in the minimal way for stable, go make the
code table-driven.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 124 +++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  55 ++++--------
 2 files changed, 77 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 378dc7f190c3..c497e0942141 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -245,47 +245,66 @@ static int a6xx_gmu_hfi_start(struct a6xx_gmu *gmu)
 	return ret;
 }
 
+struct a6xx_gmu_oob_bits {
+	int set, ack, set_new, ack_new;
+	const char *name;
+};
+
+/* These are the interrupt / ack bits for each OOB request that are set
+ * in a6xx_gmu_set_oob and a6xx_clear_oob
+ */
+static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
+	[GMU_OOB_GPU_SET] = {
+		.name = "GPU_SET",
+		.set = 16,
+		.ack = 24,
+		.set_new = 30,
+		.ack_new = 31,
+	},
+
+	[GMU_OOB_PERFCOUNTER_SET] = {
+		.name = "PERFCOUNTER",
+		.set = 17,
+		.ack = 25,
+		.set_new = 28,
+		.ack_new = 30,
+	},
+
+	[GMU_OOB_BOOT_SLUMBER] = {
+		.name = "BOOT_SLUMBER",
+		.set = 22,
+		.ack = 30,
+	},
+
+	[GMU_OOB_DCVS_SET] = {
+		.name = "GPU_DCVS",
+		.set = 23,
+		.ack = 31,
+	},
+};
+
 /* Trigger a OOB (out of band) request to the GMU */
 int _a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state, char *file, int line)
 {
 	int ret;
 	u32 val;
 	int request, ack;
-	const char *name;
 
-	switch (state) {
-	case GMU_OOB_GPU_SET:
-		if (gmu->legacy) {
-			request = GMU_OOB_GPU_SET_REQUEST;
-			ack = GMU_OOB_GPU_SET_ACK;
-		} else {
-			request = GMU_OOB_GPU_SET_REQUEST_NEW;
-			ack = GMU_OOB_GPU_SET_ACK_NEW;
-		}
-		name = "GPU_SET";
-		break;
-	case GMU_OOB_PERFCOUNTER_SET:
-		if (gmu->legacy) {
-			request = GMU_OOB_PERFCOUNTER_REQUEST;
-			ack = GMU_OOB_PERFCOUNTER_ACK;
-		} else {
-			request = GMU_OOB_PERFCOUNTER_REQUEST_NEW;
-			ack = GMU_OOB_PERFCOUNTER_ACK_NEW;
-		}
-		name = "PERFCOUNTER";
-		break;
-	case GMU_OOB_BOOT_SLUMBER:
-		request = GMU_OOB_BOOT_SLUMBER_REQUEST;
-		ack = GMU_OOB_BOOT_SLUMBER_ACK;
-		name = "BOOT_SLUMBER";
-		break;
-	case GMU_OOB_DCVS_SET:
-		request = GMU_OOB_DCVS_REQUEST;
-		ack = GMU_OOB_DCVS_ACK;
-		name = "GPU_DCVS";
-		break;
-	default:
+	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return -EINVAL;
+
+	if (gmu->legacy) {
+		request = a6xx_gmu_oob_bits[state].set;
+		ack = a6xx_gmu_oob_bits[state].ack;
+	} else {
+		request = a6xx_gmu_oob_bits[state].set_new;
+		ack = a6xx_gmu_oob_bits[state].ack_new;
+		if (!request || !ack) {
+			DRM_DEV_ERROR(gmu->dev,
+				      "Invalid non-legacy GMU request %s\n",
+				      a6xx_gmu_oob_bits[state].name);
+			return -EINVAL;
+		}
 	}
 
 	/* Trigger the equested OOB operation */
@@ -299,7 +318,7 @@ int _a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state, char
 		DRM_DEV_ERROR(gmu->dev,
 			"%s:%d Timeout waiting for GMU OOB set %s: 0x%x\n",
 			file, line,
-				name,
+				a6xx_gmu_oob_bits[state].name,
 				gmu_read(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO));
 
 	/* Clear the acknowledge interrupt */
@@ -311,36 +330,17 @@ int _a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state, char
 /* Clear a pending OOB state in the GMU */
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
-	if (!gmu->legacy) {
-		if (state == GMU_OOB_GPU_SET) {
-			gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
-				1 << GMU_OOB_GPU_SET_CLEAR_NEW);
-		} else {
-			WARN_ON(state != GMU_OOB_PERFCOUNTER_SET);
-			gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
-				1 << GMU_OOB_PERFCOUNTER_CLEAR_NEW);
-		}
+	int bit;
+
+	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return;
-	}
 
-	switch (state) {
-	case GMU_OOB_GPU_SET:
-		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
-			1 << GMU_OOB_GPU_SET_CLEAR);
-		break;
-	case GMU_OOB_PERFCOUNTER_SET:
-		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
-			1 << GMU_OOB_PERFCOUNTER_CLEAR);
-		break;
-	case GMU_OOB_BOOT_SLUMBER:
-		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
-			1 << GMU_OOB_BOOT_SLUMBER_CLEAR);
-		break;
-	case GMU_OOB_DCVS_SET:
-		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
-			1 << GMU_OOB_DCVS_CLEAR);
-		break;
-	}
+	if (gmu->legacy)
+		bit = a6xx_gmu_oob_bits[state].ack;
+	else
+		bit = a6xx_gmu_oob_bits[state].ack_new;
+
+	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, bit);
 }
 
 /* Enable CPU control of SPTP power power collapse */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 9fa278de2106..71dfa60070cc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -153,52 +153,27 @@ static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
  */
 
 enum a6xx_gmu_oob_state {
+	/*
+	 * Let the GMU know that a boot or slumber operation has started. The value in
+	 * REG_A6XX_GMU_BOOT_SLUMBER_OPTION lets the GMU know which operation we are
+	 * doing
+	 */
 	GMU_OOB_BOOT_SLUMBER = 0,
+	/*
+	 * Let the GMU know to not turn off any GPU registers while the CPU is in a
+	 * critical section
+	 */
 	GMU_OOB_GPU_SET,
+	/*
+	 * Set a new power level for the GPU when the CPU is doing frequency scaling
+	 */
 	GMU_OOB_DCVS_SET,
+	/*
+	 * Used to keep the GPU on for CPU-side reads of performance counters.
+	 */
 	GMU_OOB_PERFCOUNTER_SET,
 };
 
-/* These are the interrupt / ack bits for each OOB request that are set
- * in a6xx_gmu_set_oob and a6xx_clear_oob
- */
-
-/*
- * Let the GMU know that a boot or slumber operation has started. The value in
- * REG_A6XX_GMU_BOOT_SLUMBER_OPTION lets the GMU know which operation we are
- * doing
- */
-#define GMU_OOB_BOOT_SLUMBER_REQUEST	22
-#define GMU_OOB_BOOT_SLUMBER_ACK	30
-#define GMU_OOB_BOOT_SLUMBER_CLEAR	30
-
-/*
- * Set a new power level for the GPU when the CPU is doing frequency scaling
- */
-#define GMU_OOB_DCVS_REQUEST	23
-#define GMU_OOB_DCVS_ACK	31
-#define GMU_OOB_DCVS_CLEAR	31
-
-/*
- * Let the GMU know to not turn off any GPU registers while the CPU is in a
- * critical section
- */
-#define GMU_OOB_GPU_SET_REQUEST	16
-#define GMU_OOB_GPU_SET_ACK	24
-#define GMU_OOB_GPU_SET_CLEAR	24
-
-#define GMU_OOB_GPU_SET_REQUEST_NEW	30
-#define GMU_OOB_GPU_SET_ACK_NEW		31
-#define GMU_OOB_GPU_SET_CLEAR_NEW	31
-
-#define GMU_OOB_PERFCOUNTER_REQUEST	17
-#define GMU_OOB_PERFCOUNTER_ACK		25
-#define GMU_OOB_PERFCOUNTER_CLEAR	25
-
-#define GMU_OOB_PERFCOUNTER_REQUEST_NEW	28
-#define GMU_OOB_PERFCOUNTER_ACK_NEW	30
-#define GMU_OOB_PERFCOUNTER_CLEAR_NEW	30
-
 void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
 void a6xx_hfi_stop(struct a6xx_gmu *gmu);
-- 
2.30.0

