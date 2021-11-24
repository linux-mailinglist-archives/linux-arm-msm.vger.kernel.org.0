Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433CB45CF47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349578AbhKXVlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352082AbhKXVkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:43 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65EAC06173E;
        Wed, 24 Nov 2021 13:37:33 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id k4so2927541plx.8;
        Wed, 24 Nov 2021 13:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qEuZxidADOBw23/3kupMtjqPn3o7NQzLHLLQHmf3FeM=;
        b=T0SUzr7Artr0XrllJuBrdEh5IM1a/r9bzKEgEkp5xB7hkzRLgmeOKbIJeKyrO6jE4v
         GRA9QxLF6zvyZPKKzVX3fLtJ/FrL4XF50RJ4HCL6X3vmZSW3sawmyXuksZo/SX40IsWM
         9bTy+JQv33FmspNZenJ63+B+y+UkpvUfESJXHrpBZ5Rgy0d3tmkIwOscFKbwY+ozrEQu
         ZkSV2n5D8eB8++BvHZN+8KPdhZrqHRwJyXe87BNAg6bsixvLKJTZupH0vERla3erUxxH
         ZHQFRMhgfEQkTZqfyyCCsyfNUsRcT+p/W8bYQXfShx1iRIpzaItsrf4WU/HLegQrUa70
         nyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qEuZxidADOBw23/3kupMtjqPn3o7NQzLHLLQHmf3FeM=;
        b=hgruqREqh0YTJgQIxf6h2wBnsraKuo/4KWNe3dd0FnHboMIpyPV3cUb+QPAu9gPOh5
         7L1JUi1RqFYeLTriQSTR62AuputOIYLCOTSG0p7uC4KaHxsLTD32Zz2n+rEymlMawGJc
         3iGEWAuF8WYg4DbGsYWQsyzRVVEW5CQfl/9qKO5+eucIXxvYRsMfiSgTNdkjEUyOgZOd
         40KRwVp67por1NVfLolfSS6YeGL+xKe1WzoTsCGoqaCIkj8/NP7hm8N1iaYVzx+Li71V
         p36ZeSywd7RcG896TPo19udAxy6A/arsKjtm98ppAIIxECq2mgeLaitvdloPOCANAobG
         L2PA==
X-Gm-Message-State: AOAM530QV/tg+hr+AHRUzyZSKSvQBRbuDmrMhUG+GZ8hCnbGEVynjD8k
        BU/DtcgRGpYIZJpQ5MwPMsE=
X-Google-Smtp-Source: ABdhPJzu7YB4+bLwmamgnNHk2A87t19HIhVovCkN4g0/T9ZICzqw5VbC1bvMq8bq/D/tixK344oF9w==
X-Received: by 2002:a17:903:32c7:b0:141:eb39:30b7 with SMTP id i7-20020a17090332c700b00141eb3930b7mr22924057plr.41.1637789853162;
        Wed, 24 Nov 2021 13:37:33 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id r16sm502319pgk.45.2021.11.24.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:32 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Lee Jones <lee.jones@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/7] drm/msm/gpu: Also snapshot GMU HFI buffer
Date:   Wed, 24 Nov 2021 13:41:33 -0800
Message-Id: <20211124214151.1427022-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This also includes a history of start index of the last 8 messages on
each queue, since parsing backwards to decode recently sent HFI messages
is hard(ish).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 48 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c       | 10 +++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h       | 11 +++++
 3 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 1de103f29d25..a84ba8982cb8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -43,6 +43,9 @@ struct a6xx_gpu_state {
 	int nr_cx_debugbus;
 
 	struct msm_gpu_state_bo *gmu_log;
+	struct msm_gpu_state_bo *gmu_hfi;
+
+	s32 hfi_queue_history[2][HFI_HISTORY_SZ];
 
 	struct list_head objs;
 };
@@ -822,6 +825,25 @@ static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
 	return snapshot;
 }
 
+static void a6xx_snapshot_gmu_hfi_history(struct msm_gpu *gpu,
+					  struct a6xx_gpu_state *a6xx_state)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	unsigned i, j;
+
+	BUILD_BUG_ON(ARRAY_SIZE(gmu->queues) != ARRAY_SIZE(a6xx_state->hfi_queue_history));
+
+	for (i = 0; i < ARRAY_SIZE(gmu->queues); i++) {
+		struct a6xx_hfi_queue *queue = &gmu->queues[i];
+		for (j = 0; j < HFI_HISTORY_SZ; j++) {
+			unsigned idx = (j + queue->history_idx) % HFI_HISTORY_SZ;
+			a6xx_state->hfi_queue_history[i][j] = queue->history[idx];
+		}
+	}
+}
+
 #define A6XX_GBIF_REGLIST_SIZE   1
 static void a6xx_get_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
@@ -960,6 +982,9 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	a6xx_get_gmu_registers(gpu, a6xx_state);
 
 	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
+	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
+
+	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
@@ -1005,6 +1030,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	if (a6xx_state->gmu_log)
 		kvfree(a6xx_state->gmu_log->data);
 
+	if (a6xx_state->gmu_hfi)
+		kvfree(a6xx_state->gmu_hfi->data);
+
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
 		kfree(obj);
 
@@ -1223,11 +1251,29 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
 
 		drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
-		drm_printf(p, "    size: %d\n", gmu_log->size);
+		drm_printf(p, "    size: %zu\n", gmu_log->size);
 		adreno_show_object(p, &gmu_log->data, gmu_log->size,
 				&gmu_log->encoded);
 	}
 
+	drm_puts(p, "gmu-hfi:\n");
+	if (a6xx_state->gmu_hfi) {
+		struct msm_gpu_state_bo *gmu_hfi = a6xx_state->gmu_hfi;
+		unsigned i, j;
+
+		drm_printf(p, "    iova: 0x%016llx\n", gmu_hfi->iova);
+		drm_printf(p, "    size: %zu\n", gmu_hfi->size);
+		for (i = 0; i < ARRAY_SIZE(a6xx_state->hfi_queue_history); i++) {
+			drm_printf(p, "    queue-history[%u]:", i);
+			for (j = 0; j < HFI_HISTORY_SZ; j++) {
+				drm_printf(p, " %d", a6xx_state->hfi_queue_history[i][j]);
+			}
+			drm_printf(p, "\n");
+		}
+		adreno_show_object(p, &gmu_hfi->data, gmu_hfi->size,
+				&gmu_hfi->encoded);
+	}
+
 	drm_puts(p, "registers:\n");
 	for (i = 0; i < a6xx_state->nr_registers; i++) {
 		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index d4c65bf0a1b7..d73fce5fdf1f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -36,6 +36,8 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
 
 	hdr = queue->data[index];
 
+	queue->history[(queue->history_idx++) % HFI_HISTORY_SZ] = index;
+
 	/*
 	 * If we are to assume that the GMU firmware is in fact a rational actor
 	 * and is programmed to not send us a larger response than we expect
@@ -75,6 +77,8 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
 		return -ENOSPC;
 	}
 
+	queue->history[(queue->history_idx++) % HFI_HISTORY_SZ] = index;
+
 	for (i = 0; i < dwords; i++) {
 		queue->data[index] = data[i];
 		index = (index + 1) % header->size;
@@ -600,6 +604,9 @@ void a6xx_hfi_stop(struct a6xx_gmu *gmu)
 
 		queue->header->read_index = 0;
 		queue->header->write_index = 0;
+
+		memset(&queue->history, 0xff, sizeof(queue->history));
+		queue->history_idx = 0;
 	}
 }
 
@@ -612,6 +619,9 @@ static void a6xx_hfi_queue_init(struct a6xx_hfi_queue *queue,
 	queue->data = virt;
 	atomic_set(&queue->seqnum, 0);
 
+	memset(&queue->history, 0xff, sizeof(queue->history));
+	queue->history_idx = 0;
+
 	/* Set up the shared memory header */
 	header->iova = iova;
 	header->type =  10 << 8 | id;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 2bd670ca42d6..528110169398 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -33,6 +33,17 @@ struct a6xx_hfi_queue {
 	spinlock_t lock;
 	u32 *data;
 	atomic_t seqnum;
+
+	/*
+	 * Tracking for the start index of the last N messages in the
+	 * queue, for the benefit of devcore dump / crashdec (since
+	 * parsing in the reverse direction to decode the last N
+	 * messages is difficult to do and would rely on heuristics
+	 * which are not guaranteed to be correct)
+	 */
+#define HFI_HISTORY_SZ 8
+	s32 history[HFI_HISTORY_SZ];
+	u8  history_idx;
 };
 
 /* This is the outgoing queue to the GMU */
-- 
2.33.1

