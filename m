Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA19F30682A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 00:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhA0Xm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 18:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbhA0Xka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 18:40:30 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2F1C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:39:50 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id l18so2715661pji.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jzve5vckTHg7fjAKwv7GG9vOPjfc2/ZvoO6K92nijE8=;
        b=NCbiN+r97dsaQLltyBZ3gaFJvwPrqLjBmRpgTqLR5d0JdfmmTKkn3qb5HPPNGsuxH8
         KMEhEk/Tq9aQUJDeN5hXdSE8SSNmeJiUeEjSI0kfFkg12aXeWKG4sFu6f5g/6nR/5jsv
         3XrPdUe5XslusmQBZHpFQo9ld8goUvS3tRB6lKevCH0q0nQH5K4zPeUNITIycPeS5421
         74c0IkxDd4kGJjdR/bHDHY/MKnV2p3mWMwcIIkizPfZNrOxBXoJZDDHuD/lf47Fk7i/Q
         kf9QcmCMEalpaxdAvtt+XSjXwQgde29Qq4WRV6NHGMrjOBVzYOmIrAvyZRyok1MPZjEO
         SuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jzve5vckTHg7fjAKwv7GG9vOPjfc2/ZvoO6K92nijE8=;
        b=maUbvZnijCf/qXeZPo8ZzXPE7elHjYpL8jv/N5n6daYpvPMaIB5ZJ2ci2hyCL03uKc
         z2WXEqXgPk+IMPbTdYJ8+HNjSnglaYgsISTEsHDY8/hDjlH/JepOnnKQi0XpQfXX4nGx
         gP/aBOqKBOoZY2Y/kXlsC2tNPrTywZW4eMVwhy3o1aBLHs1dyqjqlmA1NrDK5he+0Drp
         qx/Ovc+Tcyl7ij90Pby+IdSgCqX3BgXsmUL6ztpViokrafvr/Q19vVN2s9I+AqWs90k+
         L9Wwd/8oaxxHvEx7EJZbkw6dlJEIlxMyDYX0V9mldkrxyoPzebOj/LpSnou/1t7U3dmK
         GKHg==
X-Gm-Message-State: AOAM533UkNq4FVd1HBy9IhIytkdMw1w4DATxgUmzLIg3ZDKjx1EGV03n
        H8gFaunt41qa+g7g7vz3XNH64A==
X-Google-Smtp-Source: ABdhPJyHdm4XvhFRofA7zneDyE3OCrjBFMuISqye3D0wUdgRQrhC7p6IojeYcxRmgEJXAxvXuWO4Tw==
X-Received: by 2002:a17:90a:4a0e:: with SMTP id e14mr8264413pjh.200.1611790790011;
        Wed, 27 Jan 2021 15:39:50 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
        by smtp.gmail.com with ESMTPSA id q2sm3282382pfj.32.2021.01.27.15.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 15:39:49 -0800 (PST)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
        stable@vger.kernel.org
Subject: [PATCH 1/3] drm/msm: Fix race of GPU init vs timestamp power management.
Date:   Wed, 27 Jan 2021 15:39:44 -0800
Message-Id: <20210127233946.1286386-1-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We were using the same force-poweron bit in the two codepaths, so they
could race to have one of them lose GPU power early.

Signed-off-by: Eric Anholt <eric@anholt.net>
Cc: stable@vger.kernel.org # v5.9
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  8 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  4 ++--
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 78836b4fb98e..378dc7f190c3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -264,6 +264,16 @@ int _a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state, char
 		}
 		name = "GPU_SET";
 		break;
+	case GMU_OOB_PERFCOUNTER_SET:
+		if (gmu->legacy) {
+			request = GMU_OOB_PERFCOUNTER_REQUEST;
+			ack = GMU_OOB_PERFCOUNTER_ACK;
+		} else {
+			request = GMU_OOB_PERFCOUNTER_REQUEST_NEW;
+			ack = GMU_OOB_PERFCOUNTER_ACK_NEW;
+		}
+		name = "PERFCOUNTER";
+		break;
 	case GMU_OOB_BOOT_SLUMBER:
 		request = GMU_OOB_BOOT_SLUMBER_REQUEST;
 		ack = GMU_OOB_BOOT_SLUMBER_ACK;
@@ -302,9 +312,14 @@ int _a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state, char
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
 	if (!gmu->legacy) {
-		WARN_ON(state != GMU_OOB_GPU_SET);
-		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
-			1 << GMU_OOB_GPU_SET_CLEAR_NEW);
+		if (state == GMU_OOB_GPU_SET) {
+			gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
+				1 << GMU_OOB_GPU_SET_CLEAR_NEW);
+		} else {
+			WARN_ON(state != GMU_OOB_PERFCOUNTER_SET);
+			gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
+				1 << GMU_OOB_PERFCOUNTER_CLEAR_NEW);
+		}
 		return;
 	}
 
@@ -313,6 +328,10 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
 			1 << GMU_OOB_GPU_SET_CLEAR);
 		break;
+	case GMU_OOB_PERFCOUNTER_SET:
+		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
+			1 << GMU_OOB_PERFCOUNTER_CLEAR);
+		break;
 	case GMU_OOB_BOOT_SLUMBER:
 		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
 			1 << GMU_OOB_BOOT_SLUMBER_CLEAR);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index c6d2bced8e5d..9fa278de2106 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -156,6 +156,7 @@ enum a6xx_gmu_oob_state {
 	GMU_OOB_BOOT_SLUMBER = 0,
 	GMU_OOB_GPU_SET,
 	GMU_OOB_DCVS_SET,
+	GMU_OOB_PERFCOUNTER_SET,
 };
 
 /* These are the interrupt / ack bits for each OOB request that are set
@@ -190,6 +191,13 @@ enum a6xx_gmu_oob_state {
 #define GMU_OOB_GPU_SET_ACK_NEW		31
 #define GMU_OOB_GPU_SET_CLEAR_NEW	31
 
+#define GMU_OOB_PERFCOUNTER_REQUEST	17
+#define GMU_OOB_PERFCOUNTER_ACK		25
+#define GMU_OOB_PERFCOUNTER_CLEAR	25
+
+#define GMU_OOB_PERFCOUNTER_REQUEST_NEW	28
+#define GMU_OOB_PERFCOUNTER_ACK_NEW	30
+#define GMU_OOB_PERFCOUNTER_CLEAR_NEW	30
 
 void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c8a9010c1a1d..7424a70b9d35 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1177,12 +1177,12 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
 
 	*value = gpu_read64(gpu, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
 		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
 
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
 	return 0;
 }
 
-- 
2.30.0

