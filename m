Return-Path: <linux-arm-msm+bounces-30269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA19665B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96F90280E6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DAB1BB6B5;
	Fri, 30 Aug 2024 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEavEwoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0FA1BAEFB;
	Fri, 30 Aug 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032007; cv=none; b=IpVMU0hJUimMpGaC6fWP4AVdZubWQnHsN/afpzIr6jJa+eUthpzmPbUTzBgO5g/i9JkpmuICtAY7FiG7a6NynACxluEUkpBImNQ/ONJh4eSHhdxM1sXuQ2/Kn+1zr/0YnvHL0E+yeKZ57nM6PIU09yTuZS4IE3M1uJ+lwwE3JSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032007; c=relaxed/simple;
	bh=EiKGi3pOzD93PnaCLs4jgX0bjNxlneKGRkE5Fa5MRdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnaEGMHQy6sY3BViwyAkvgSvAj/LPVBi4P4TRKsyrApdO0zTfBK96X1sIGsyRYn8FDzmMUi4Zmoka1UJEGhypdHRybU8oQ2JCYBgDqF//p5wrowO2yoKX5sZAbnfkZO2OpXluGupHO2lXeV5MXXCeqWFIEmQugz7YroJaA74r/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEavEwoj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5beb6ea9ed6so2006669a12.1;
        Fri, 30 Aug 2024 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725032003; x=1725636803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ApHm6HSqmijZR4RQErF/7FvUVBd6HKuz4S//PSSZhg=;
        b=SEavEwojQcMjzqY5x+r82kCW2OBSmaoA/fTaJz0er/+Zh6FgXqE9/2oMcDOAF57+I1
         x/YxD59hac5l3Udn1NvSi01MeKgBCSB1xnvP0Ym8Jw4RSzmmqMLEm7BGHClLSOqSMCA/
         QDqK4fat4IH/d/Qd9uQSQf9M1IvXJI6PA39Y7DGipc/I7dq6jrHzXglhLMbMq6N9VNNH
         phO8HDAsYquYbuRxDbW/Mk5svCmLjzXJEw8eFtEAGuQupW46YS0FCrWjzstjZ4YCjwWh
         bf/kTrln7J2nzfED6RAYwHUWu/ztk4cgaRzIVoDao5pz5XdWP3Jfyxez3v7yi5gjSPiF
         BxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725032003; x=1725636803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ApHm6HSqmijZR4RQErF/7FvUVBd6HKuz4S//PSSZhg=;
        b=WexMWf68hvdLvJBO28B3T+uaPFZdRz2HI3/n/DxNV+5x4ZOWQ3FpKhvmAW8M/bZ5vy
         oRpg8Vxjj7glMJfpqKud+mh6sak/G9zH4r2nSpmEOSUaKhgsKpea3tFNPuIJBBOpBWMy
         llLoFJyDAB6XJTA01i3RlvftP8faGUbU6mEsfFw+8CDOmaeX5H7wYGp7209pc+hPDODZ
         iJ85yBJI+XxP3h35Vivg+4GHb8uerlcYQVtFT7s5x69Fm+XWRZaM9cThi1CNtph0E8AI
         GVeLW8GX7ONapSA8VkVNb+ANbtlbGcxM2sgPVV1gma5B/Y883VkZ9TX5ekkYJcvNCRvZ
         xb1A==
X-Forwarded-Encrypted: i=1; AJvYcCUBbLpebV2xVoAeIywwj81Uuoqa+U048Hb+b5NhaOxYWeDSJ/0ra+xYYJw9/t7xCCOmvw+CdYP932cCc9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/cuJ943A3g4ZRbD9fJqv9LpCuMIDBX1ytCNldaRem2Oibsch
	IlKMfB3VNSipnN9qlPDSnjzObs36bgxN7uDHCgIDaIR5mExAtYieECZB2JYp
X-Google-Smtp-Source: AGHT+IGC537GLnbfsxjueR3ZbhMvYvp3vDaRWXgnYb1KzZDWz2DQSdrNTSnq+tJoTdOC+vh/d9AnFQ==
X-Received: by 2002:a17:907:9494:b0:a86:9487:f1d2 with SMTP id a640c23a62f3a-a89a379d05emr200856966b.40.1725032002102;
        Fri, 30 Aug 2024 08:33:22 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:21 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:48 +0200
Subject: [PATCH v2 6/9] drm/msm/A6xx: Use posamble to reset counters on
 preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=5369;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=EiKGi3pOzD93PnaCLs4jgX0bjNxlneKGRkE5Fa5MRdI=;
 b=jVCxqabafrVccFAojOJcW04or5sVe80w97svEb4yu2ucYytz+6eMOlmI/tbwaJmma8dRMtffr
 Pqi4RA1gB+yCVnE9rNHrGwK5qpRnTIsluijNGOnYm1Gifb4YmAvam60
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Use the postamble to reset perf counters when switching between rings,
except when sysprof is enabled, analogously to how they are reset
between submissions when switching pagetables.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1a90db5759b8..3528ecbbc1ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
 {
-	u64 preempt_offset_priv_secure;
+	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	u64 preempt_offset_priv_secure, preempt_postamble;
 
 	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
 
@@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 	/* seems OK to set to 0 to disable it */
 	OUT_RING(ring, 0);
 	OUT_RING(ring, 0);
+
+	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
+		preempt_postamble = SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu);
+
+		OUT_PKT7(ring, CP_SET_AMBLE, 3);
+		OUT_RING(ring, lower_32_bits(preempt_postamble));
+		OUT_RING(ring, upper_32_bits(preempt_postamble));
+		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
+					a6xx_gpu->preempt_postamble_len) |
+				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
+	}
 }
 
 static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 652e49f01428..2338e36c8f47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -66,6 +66,7 @@ struct a6xx_gpu {
 	atomic_t preempt_state;
 	spinlock_t eval_lock;
 	struct timer_list preempt_timer;
+	uint64_t preempt_postamble_len;
 
 	unsigned int preempt_level;
 	bool uses_gmem;
@@ -99,6 +100,11 @@ struct a6xx_gpu {
 #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
 	(a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
 
+#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
+
+#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
+	(a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
+
 /*
  * In order to do lockless preemption we use a simple state machine to progress
  * through the process.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 4b61b993f75f..f586615db97e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 	return 0;
 }
 
+static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POSTAMBLE_OFFSET;
+	u32 count = 0;
+
+	postamble[count++] = PKT7(CP_REG_RMW, 3);
+	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
+	postamble[count++] = 0;
+	postamble[count++] = 1;
+
+	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
+	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
+	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
+				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
+	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
+	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
+
+	a6xx_gpu->preempt_postamble_len = count;
+}
+
 void a6xx_preempt_fini(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	a6xx_gpu->skip_save_restore = 1;
 
 	a6xx_gpu->scratch_ptr  = msm_gem_kernel_new(gpu->dev,
-			gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
+			PAGE_SIZE, MSM_BO_WC,
 			gpu->aspace, &a6xx_gpu->scratch_bo,
 			&a6xx_gpu->scratch_iova);
 
+	preempt_prepare_postamble(a6xx_gpu);
+
 	if (IS_ERR(a6xx_gpu->scratch_ptr))
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6b1888280a83..87098567483b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
 	OUT_RING(ring, PKT4(regindx, cnt));
 }
 
+#define PKT7(opcode, cnt) \
+	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
+		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
+
 static inline void
 OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 {
 	adreno_wait_ring(ring, cnt + 1);
-	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
-		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
+	OUT_RING(ring, PKT7(opcode, cnt));
 }
 
 struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);

-- 
2.46.0


