Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CBB30802C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 22:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhA1VFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 16:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhA1VE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 16:04:57 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FD8C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 13:03:42 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id gx1so5104947pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xNfBPwYfgsBSy1wDSz2WDgPZoXq5g0HMvo6xSOSu00M=;
        b=S6j/PqbkLtwEeSQpJ+aJEw7KBv2Mt/4WB2aag3aMYfR5dzhf+BknM5FUJYPzqZPTPz
         lguUYUBcInDBr177yL6Ba1Wmm8ywSj2BcKKAZLj8St7nJJHWxb26XjpoTaxa1GSbUEi0
         QeFl2aaEVdS2ZDR3SLOio7R3EYsCnQvm+lZAkdPxNimbhDwTR/3Jig6brSNwkO4x0sN5
         RMuXkx6vNP3rM8TUBAptJGpk+x6poUKq1ofgr0km/cUe1tNk19fGZ+cFJldMYzKsBoBF
         tl2kTdqNHBgcBJJ+tt0vzQQj5atOpf6M7FXYBHHP7/mJ+oKWxcGDjTyPYI/EWEgBECD2
         6k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNfBPwYfgsBSy1wDSz2WDgPZoXq5g0HMvo6xSOSu00M=;
        b=dIr1tv99UpzVYTAgYVBEVdKTBnA9dqMdwb2mjljKXhOc3uYnw1unSoWqGae6sxKQH2
         OSP3BE2uaS62aKZvxy51LS/1vroufUDW/38fTqihk2C+0rHQY8aSoGRb0cFOgESwtl59
         +KAqi/Sj7NVpYV0DgreXPCiqzsq/IAI0l2awvRk+VU8qgb+Mo9cW1lwcxbJOj/Msa902
         RFQsrGa+EVbMwJcmguXi/4XkRhTPmEx2I6a7JNfyAMvBqcNCqQ6/nFsu+F6pyC7Ep/mY
         3p2tO0IiN7C86dgULknX5lnJWwntvLOZtsJQoifwNzql1IyRnh3L4B10e71eOitjlNKb
         Es/g==
X-Gm-Message-State: AOAM533+ixvt7wa72fpnkW9fBhnv5UBqb+J0BqTgFdGiWWZU92F5hJ9N
        IkV9sWjICRWJABiIlrUcepNIqA==
X-Google-Smtp-Source: ABdhPJwvhskvFjE8OIpHytiQ+6Cvx25s2QGl06oPVWDhnPwd38ZARaeOvNGVc+5VJLo5XXd34+v7NQ==
X-Received: by 2002:a17:90b:309:: with SMTP id ay9mr1202817pjb.145.1611867822526;
        Thu, 28 Jan 2021 13:03:42 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
        by smtp.gmail.com with ESMTPSA id l2sm6753295pga.65.2021.01.28.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 13:03:41 -0800 (PST)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 1/3] drm/msm: Fix race of GPU init vs timestamp power management.
Date:   Thu, 28 Jan 2021 13:03:30 -0800
Message-Id: <20210128210332.1690609-2-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128210332.1690609-1-eric@anholt.net>
References: <20210128210332.1690609-1-eric@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We were using the same force-poweron bit in the two codepaths, so they
could race to have one of them lose GPU power early.

freedreno CI was seeing intermittent errors like:
[drm:_a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
and this issue could have contributed to it.

Signed-off-by: Eric Anholt <eric@anholt.net>
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  8 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  4 ++--
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e6703ae98760..b3318f86aabc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -264,6 +264,16 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
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
@@ -301,9 +311,14 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
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
 
@@ -312,6 +327,10 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
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

