Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D45308030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 22:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhA1VFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 16:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhA1VFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 16:05:02 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0234AC06178C
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 13:03:45 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 11so4821303pfu.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 13:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wM2/b7QFWaQQI4UJf7JjD4AI6NPu+8JRBfTf4GHnnsg=;
        b=doC8UKoWa4GMZ92u8rldyh0wh50138AQWo3u4p2HuifyPY3rPX0T0RVm7hVy3y8L8+
         ZyvfIhWN836wYF17L8Jh3ShPACzXnZy4/vX51GOSXEjB5UeUPn5xBgH7LTNLYqkIHl6w
         WDQMHVl+hW86iOMw47NGgoKDLLeIsQ76zLNPIjuaIs2Pkhgpv0GLywLLQMSY69QN+Mog
         aIKTiAkFVwpnv9hPp56OcNkD9S3HMKwI1JLF3mQ8+O/BFknY4gacckxg0jUnyUn76nGp
         50KAuvE0NUoI1p6Pb2vF2jQ46LIj+6x9cii+TKPYNcvAR7SDmlsuXokeqS3r74Qrkf2E
         n5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wM2/b7QFWaQQI4UJf7JjD4AI6NPu+8JRBfTf4GHnnsg=;
        b=JGnxR3bc2qoUuyt/PURIa1hIF3OdEF+x+IcHAfNkIhTUIew/G8XWT9m6ZB58yQB5G9
         oXLPLyHyrSNIdnrMRGzNAOlHnLjiyFoJhAE8ctC++wa2QIZXEZGnpylYZdPBz0dleV5j
         dOItjKZDRXGnHyXqMxzLDFDFMD3sMQdHiZFaxBg4UyvdfShud2rK+u/G0NaQeN7gHHap
         swzAfYpvLkHA4qMSe039M9olNGzszRiXXpn/Sp3uyGZb30ZAFRXzri+9Vg+a91HwHN8m
         mA7/g93p2KOZ3wLGhzSwTRuzkx/hixJOHT4yEDDWItR14xCDcLjqAn8CuHHx973E5Iad
         7lpQ==
X-Gm-Message-State: AOAM5322okBKmi+jNtYVvOpGX3oze+nZiLDKAWMiH+1CMeEl3RiihGJR
        PKi1NtfIp+Pum4ZQtN1aQJ4dOw==
X-Google-Smtp-Source: ABdhPJze8ftVIa3bHsD35Xx0ylWBIT4/Eb83ZaXV//7B+Jzg0MRyuN8BNExk16VtA7m097XshVzsIA==
X-Received: by 2002:a63:5453:: with SMTP id e19mr1241358pgm.439.1611867824523;
        Thu, 28 Jan 2021 13:03:44 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
        by smtp.gmail.com with ESMTPSA id l2sm6753295pga.65.2021.01.28.13.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 13:03:43 -0800 (PST)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 3/3] drm/msm: Clean up GMU OOB set/clear handling.
Date:   Thu, 28 Jan 2021 13:03:32 -0800
Message-Id: <20210128210332.1690609-4-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128210332.1690609-1-eric@anholt.net>
References: <20210128210332.1690609-1-eric@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the bug is fixed in the minimal way for stable, go make the
code table-driven.

Signed-off-by: Eric Anholt <eric@anholt.net>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 124 +++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  55 ++++--------
 2 files changed, 77 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b3318f86aabc..9066e98eb8ef 100644
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
 int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
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
@@ -298,7 +317,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev,
 			"Timeout waiting for GMU OOB set %s: 0x%x\n",
-				name,
+				a6xx_gmu_oob_bits[state].name,
 				gmu_read(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO));
 
 	/* Clear the acknowledge interrupt */
@@ -310,36 +329,17 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
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

