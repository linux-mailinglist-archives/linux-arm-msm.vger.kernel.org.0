Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F9C45CF45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352007AbhKXVkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352029AbhKXVki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:38 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2441EC06175C;
        Wed, 24 Nov 2021 13:37:27 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id o14so2945180plg.5;
        Wed, 24 Nov 2021 13:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=czChcqf/rxB4kimdnpI9dF/QE+KTJ3jjbEBkb1K2GAo=;
        b=mDJoZcTxtlALueM3kotZUVp8k+AxPu6c+s02GN3ieQ45puheKUbcQ+lFNDNtozddQi
         jfzehP7hHasy0v6kPF+Np0AAKFsyMOjYTGxUQsQDD4RaSi2vFui0fS8aG/KKtFwUb4yL
         MMfxNeLTBDoRh8GvAbXO0WdE773xKeYFNc9Mu48LOTQSq5rHJjHyz53mRxRFGYcc/nCy
         aJ92utFLUswT4HgFDXEV1ddUns4dc99EKONHOui+4yetQkFzcShCAKHapXB09eGI5Aqn
         hxwOnpVdj+vdsZhl9I5QcoDFXfDK5aOnfUBk+WJgf+A8PLFN5fAF0Kv7Y+PrIxahIb6H
         kZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czChcqf/rxB4kimdnpI9dF/QE+KTJ3jjbEBkb1K2GAo=;
        b=mQog2/so0qw8tpMOfJMA1BShxahKqZ2z0T77RtxRxxpap4xpJr6ZHEKBDcz3jFIB2H
         vh34uY4q4dm2VE1Jmc4HgvtK2iS1Qm1u7DNy1sbERf25E26mT6n4iPmfPgVK414pJu4b
         HKxsUVILj4QuD7BERhryGcyna5ZnsqG6qGOQChM7BvrB7HpOKPzpbpkclqgkSgACldu3
         pWzveDInKONI66kR/QvEs9ML6AwlHKqAZW8TNORqBHrjMjewTaKhhmPsbEd3k3blJnMz
         k9lQEqL26l5X3QXndxNv3Lmg9Skl3PrLQKzDyDKtE5rlYG//Kxl+9IkFGsGIDE8HuWPF
         ge7g==
X-Gm-Message-State: AOAM530Ikiz5sVt+T/HUHj5DSUVPcRu+yhzad/PEdYOmZkL0tNi49aVb
        RGMXh8E+z4ZkNvgEbNAre5s0G3wZHW0=
X-Google-Smtp-Source: ABdhPJwJ0NpH8HpJZ7gegyvEYtGCYsD8uWHIH4g2Jw0js2r7vdkutX5FOS9zsjiXf747nDZrNa5jCg==
X-Received: by 2002:a17:902:d2cd:b0:141:fbe2:b658 with SMTP id n13-20020a170902d2cd00b00141fbe2b658mr22927678plc.49.1637789846668;
        Wed, 24 Nov 2021 13:37:26 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id h13sm481311pgg.16.2021.11.24.13.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:25 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/7] drm/msm/gpu: Make a6xx_get_gmu_log() more generic
Date:   Wed, 24 Nov 2021 13:41:32 -0800
Message-Id: <20211124214151.1427022-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Turn it into a thing we can use to snapshot other GMU buffers.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 34 +++++++++------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index f1b1a9bffb37..1de103f29d25 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -802,28 +802,24 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		&a6xx_state->gmu_registers[2], false);
 }
 
-static void a6xx_get_gmu_log(struct msm_gpu *gpu,
-		struct a6xx_gpu_state *a6xx_state)
+static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
+		struct a6xx_gpu_state *a6xx_state, struct a6xx_gmu_bo *bo)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	struct msm_gpu_state_bo *gmu_log;
+	struct msm_gpu_state_bo *snapshot;
 
-	gmu_log = state_kcalloc(a6xx_state,
-		1, sizeof(*a6xx_state->gmu_log));
-	if (!gmu_log)
-		return;
+	snapshot = state_kcalloc(a6xx_state, 1, sizeof(*snapshot));
+	if (!snapshot)
+		return NULL;
 
-	gmu_log->iova = gmu->log.iova;
-	gmu_log->size = gmu->log.size;
-	gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
-	if (!gmu_log->data)
-		return;
+	snapshot->iova = bo->iova;
+	snapshot->size = bo->size;
+	snapshot->data = kvzalloc(snapshot->size, GFP_KERNEL);
+	if (!snapshot->data)
+		return NULL;
 
-	memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
+	memcpy(snapshot->data, bo->virt, bo->size);
 
-	a6xx_state->gmu_log = gmu_log;
+	return snapshot;
 }
 
 #define A6XX_GBIF_REGLIST_SIZE   1
@@ -963,7 +959,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_get_gmu_registers(gpu, a6xx_state);
 
-	a6xx_get_gmu_log(gpu, a6xx_state);
+	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
@@ -1006,7 +1002,7 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 
-	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
+	if (a6xx_state->gmu_log)
 		kvfree(a6xx_state->gmu_log->data);
 
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
-- 
2.33.1

