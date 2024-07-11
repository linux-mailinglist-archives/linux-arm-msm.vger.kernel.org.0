Return-Path: <linux-arm-msm+bounces-25945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED792E41C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E96D1F22403
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF4115884B;
	Thu, 11 Jul 2024 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+FznSBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEEC158D79;
	Thu, 11 Jul 2024 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692214; cv=none; b=n9wmeqDD5BDWrTQ5izt5dVZQr9VK3WaIR3/170XJUXLEFm8MeaaszT4U+doNgPqwZEP6Oxo5gdsk+1mhmXBqIv/fmwG199mJZ2UnFSkS6MxhNpTZSExcuNWqTbHXJTndWVXn5jPLWofGAQ8VP/sN7S+69QvoQPUMqEfBZhErxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692214; c=relaxed/simple;
	bh=8t+fBc/pg4GryIKzfQLBR+i5ja9eZ+VINDhMJdwG4oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Td75sySvOyhxF4GZ1sTMBG18Fw76/EFEg2MEa9EpO0cVWntUE4UKBpdrpChCB2ePnZLP+yrmNmWBvB2Rv4AMr686LPAgMFmbKIGLyxYlSgp3LKmMMu8rb8nskVmSxxNI9BdnIKhpLuEwMc3FkBEWLf1Yhl/2+XRd1CxsyxMEmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+FznSBs; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a77e7a6cfa7so89084866b.1;
        Thu, 11 Jul 2024 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720692210; x=1721297010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbWrWp1/ipfqZHe0g1+cQwdkUxN2iGN29opoxDd0Xq4=;
        b=T+FznSBsLOYp4t+ubtrwV8xffDIXF0xyhknKCymzRiCOE7TXJtEZpxnD64vus2DlmS
         Bf/0F7twouDFb5kmbLhmWK2jVUW7TG6Rkhz+NE2r/yJVrb3umabwXbUhl4NdNE10APM2
         9VgsF6hwpbGudR6ikZyE1xLNCUkgx22ifY6gRdC2VppEHJOXYdHtjsSmP0VI+Zpij3Ut
         74I+wr5HEwrkTYjQEUEvU+W9O2u0oHgOeo2LiBMvrS7iid32cuyonvSXJ8U5ex88tx9K
         hCcu6lLWHXg68PGIiTgDUXJgFdb39RQA1/SyYGmJpL31wnIZSg3Yv04i8RjE6fhnSKnG
         oYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720692210; x=1721297010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbWrWp1/ipfqZHe0g1+cQwdkUxN2iGN29opoxDd0Xq4=;
        b=hH50xYM/aBbKskx2//EhfxulIgvbvD32+C/8u2n9zeczKuX3uwFz11Kt3bABqLjeyz
         IeUnRMD4Am+ZHmeHZYK5viXuMRJiJZPwQWPIF/MOmqWdIo6v+ePGUyCNhh4Mg73IqLq1
         wN3e+iqfr7jNHlygwqbg85Vm4t0qesLacxa3c0fk1n5FsExJYDsvEWJiIkTknID3g6Mb
         GDLJqDZ0VVepJmkwkYQC8aoM7d45f5VnhC1CHp+SVZmsog9iobWX5hXIWdARXLCPj1TR
         WYuCUHv3SpBK+c99IAfW2Ko5VTyJFHhE9BNp34PrxowxIPSI0MM1Spg35R51iqmGq/mv
         5NYA==
X-Forwarded-Encrypted: i=1; AJvYcCV7LjmUmDDc3sG9+Uss1xhtkjeGph8L9oMOiiSNFhElSyalcOOmpncEh6XeVw7fNPfhaRpJ7h5pGLNAuJdHxt9hvv0DJF+SB5MYdR3umOutSOqqnmcUVbawQtc8ROLi4cOj9Mn0jVxrsBBpGg==
X-Gm-Message-State: AOJu0Yy+ofxH5yRpxGt+LLWrk2l3eKNutEioG1C7csf0Z0vjg45W5N9b
	DYNkZKGLiH5DGpS1RlQr4eMh4yKsZRmBO1YISl7oADTrAWkQ0qrk
X-Google-Smtp-Source: AGHT+IGluJ7ZgKVaqBpadtRgNKAiusoVX0uA8nM184IeXop66eo7WKEScUlvoqzE6P+9CgBLBTgpWQ==
X-Received: by 2002:a17:906:cb97:b0:a77:e55a:9e7e with SMTP id a640c23a62f3a-a780b89f4d6mr516656566b.73.1720692210253;
        Thu, 11 Jul 2024 03:03:30 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:03:29 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/msm/a5xx: workaround early ring-buffer emptiness check
Date: Thu, 11 Jul 2024 10:00:21 +0000
Message-ID: <20240711100038.268803-5-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is another cause for soft lock-up of GPU in empty ring-buffer:
race between GPU executing last commands and CPU checking ring for
emptiness. On GPU side IRQ for retire is triggered by CACHE_FLUSH_TS
event and RPTR shadow (which is used to check ring emptiness) is updated
a bit later from CP_CONTEXT_SWITCH_YIELD. Thus if GPU is executing its
last commands slow enough or we check that ring too fast we will miss a
chance to trigger switch to lower priority ring because current ring isn't
empty just yet. This can escalate to lock-up situation described in
previous patch.
To work-around this issue we keep track of last submit sequence number
for each ring and compare it with one written to memptrs from GPU during
execution of CACHE_FLUSH_TS event.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 4 ++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 266744ee1d5f..001f11f5febc 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -65,6 +65,8 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
 	struct drm_gem_object *obj;
 	uint32_t *ptr, dwords;
@@ -109,6 +111,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		}
 	}
 
+	a5xx_gpu->last_seqno[ring->id] = submit->seqno;
 	a5xx_flush(gpu, ring, true);
 	a5xx_preempt_trigger(gpu, true);
 
@@ -210,6 +213,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	/* Write the fence to the scratch register */
 	OUT_PKT4(ring, REG_A5XX_CP_SCRATCH_REG(2), 1);
 	OUT_RING(ring, submit->seqno);
+	a5xx_gpu->last_seqno[ring->id] = submit->seqno;
 
 	/*
 	 * Execute a CACHE_FLUSH_TS event. This will ensure that the
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 1120824853d4..7269eaab9a7a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -34,6 +34,7 @@ struct a5xx_gpu {
 	struct drm_gem_object *preempt_counters_bo[MSM_GPU_MAX_RINGS];
 	struct a5xx_preempt_record *preempt[MSM_GPU_MAX_RINGS];
 	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
+	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
 
 	atomic_t preempt_state;
 	struct timer_list preempt_timer;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index f8d09a83c5ae..6bd92f9b2338 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -55,6 +55,8 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 /* Return the highest priority ringbuffer with something in it */
 static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	unsigned long flags;
 	int i;
 
@@ -64,6 +66,8 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 
 		spin_lock_irqsave(&ring->preempt_lock, flags);
 		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
+		if (!empty && ring == a5xx_gpu->cur_ring)
+			empty = ring->memptrs->fence == a5xx_gpu->last_seqno[i];
 		spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 		if (!empty)
-- 
2.45.2


