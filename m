Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034DF34865C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 02:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhCYBVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 21:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235529AbhCYBVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 21:21:13 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7EAC06175F;
        Wed, 24 Mar 2021 18:20:45 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id r17so212522pgi.0;
        Wed, 24 Mar 2021 18:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sa9rRO43y1B+/upjtWDeuqkMJ0Hr4TpHsHjlP2Qs1RM=;
        b=OYKe8fJM3o7gVtlVc70JmMSa5jnG/WHxJjuOzmSjN5bLrU6MhDs63YIEQHg/Y1X/ja
         WF5qqo2d7LhI1gBd0mWoSD7meICB8ueXBaHXsagciFHt55dnAW0kDb6g8RXh0QJ+NJRY
         GXY5hIF83xSmII8sAGN5Q1wpnhOfFl2AL23ey2KFefwGreplS6aspiwP72AtOMq9Cyi+
         osQ0BQ5hk31OCYbQAbQDxxFlz23U+URSQgL4pTqEkFfGFr72Tkf544zdOC38wyvJdnEh
         WBDSVfBvHSs9FXG8zW1+VtMO6QNysX4B9PkDHcSBFOqO51ZgPTdZL4hi/PDitD8ijlj1
         GRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sa9rRO43y1B+/upjtWDeuqkMJ0Hr4TpHsHjlP2Qs1RM=;
        b=Dk2LZUfcWCvtqlpoTlr4ab4aobi9FaEPvmD+6duAx943hZHD3aWZzrLsw2iNKtzCls
         Mygiy/ftW3pRm82ebe+kI7TWVQZMhUMmQFuLg02SpY9ZC+X1AFxwA/AGj3uL1kSYRHM4
         WuJqnX4BvjFKe9COVjKgD26ixyeBPsz8XfvG5asgZ8Ul3JNHMvXcmVhTX7FLnT9H9iP+
         lrJgdpgICIqOMC4HCy1L4YkODH3RMnMaMWAllyUToVG8zc1wvr88ZQsHB/0NElh/sgY5
         /45dItpbgmAJPuvKL65r4PDJDyrMCD/aO3qyVkuKzIPMmFN/wYDsS6e7n6Ugwib1mcta
         6TIw==
X-Gm-Message-State: AOAM530FI89QeJmNOXY+2mDsIUL1lG369L0sLvx196yt4HhW5xuRgPks
        PBbBfZUCp8FNYzoviA1Z8qE=
X-Google-Smtp-Source: ABdhPJwlvOpwfxlO1r3DymaRU532rmUPOXvwLwIDzeuogggJ73XJeQiliaTpUYUf8+v37mov4tt9jA==
X-Received: by 2002:a63:ea01:: with SMTP id c1mr5553114pgi.236.1616635244929;
        Wed, 24 Mar 2021 18:20:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id w23sm3283150pgm.64.2021.03.24.18.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 18:20:43 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Eric Anholt <eric@anholt.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Fix a5xx/a6xx timestamps
Date:   Wed, 24 Mar 2021 18:23:52 -0700
Message-Id: <20210325012358.1759770-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210325012358.1759770-1-robdclark@gmail.com>
References: <20210325012358.1759770-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

They were reading a counter that was configured to ALWAYS_COUNT (ie.
cycles that the GPU is doing something) rather than ALWAYS_ON.  This
isn't the thing that userspace is looking for.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a5af223eaf50..bb82fcd9df81 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1241,8 +1241,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 
 static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
-	*value = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_CP_0_LO,
-		REG_A5XX_RBBM_PERFCTR_CP_0_HI);
+	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
+		REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 130661898546..59718c304488 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1173,8 +1173,8 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	/* Force the GPU power on so we can read this register */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	*value = gpu_read64(gpu, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
-		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
+	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
+		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
 
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 	return 0;
-- 
2.29.2

