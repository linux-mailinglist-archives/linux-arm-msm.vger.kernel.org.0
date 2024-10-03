Return-Path: <linux-arm-msm+bounces-33033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5898F3E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351B51F221F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C5D1AB535;
	Thu,  3 Oct 2024 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLk2vEiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FCA1AAE33;
	Thu,  3 Oct 2024 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971992; cv=none; b=Y244YK3rY0Zpt7TfS99nroHPGU+UIQ93U++OcTD5gTwUgtvgIrENyOQGgBjaiTfO+p2p3JvBj4GVjGwug1LT5YYI2jMugiSeXm+5dJGalcluwWh3H8VGLk5jFc3ML1ZBkdmaX6AI1qpzktz3Ppg6g2lW+7pQbkpOxKeXR+40uc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971992; c=relaxed/simple;
	bh=la2yYs2rvztdmbAN8YutY92BLRLI4ynYhLnG47NiSsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8Dp8tC7kzoynJBO9Nc2jibzdLICA4tz8ojWTsnZSVv+lRMpxMz35lLiYWYpFzk8tX2F8JyUJ6TQQfiD626Zr17+qQfPotLO6u+uTKNvKFc4cFk43BnAkOPaQ4WQP8OvJr0RQ48ItW0ABqBpJs0kr0E38DVDyfG/JbhM4HkRJP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLk2vEiw; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a93b2070e0cso131040266b.3;
        Thu, 03 Oct 2024 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971988; x=1728576788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGm16tBc/mYoL2p/kWnBQEKJKKAd6HTwsmMI5nBn7Bk=;
        b=OLk2vEiwVKgdMAk5HnMbTXP2dUF4W+ndtIsNGex2JewJ/aHgZPj/MVwNPS10R6cmLG
         KK3ALTTLD0EgcO9avjw1gd5mWx+M4jyg4Uo/e7MU4uMYp6jaVot7KC87KA0dNY/YuBPl
         ewDIfCQriLV4YWpg7VN3muAxvcQ1zqo/xDqRyEnPV4cMyTnL1oYJ5zVcHmPtGtaSiWfT
         AinAeZQk84aCt2VmbmEsjZZL7a0HieASyUwcF2lJwMjeK77HIqusL30O2oRqyfG/oI+9
         9ZACyMRv93yYy9p+LAXEbbNqgyJ5Pbolzcs/5iEl+9N/ubhPagrtqYtgP2ZzpBesi2nl
         ebyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971988; x=1728576788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGm16tBc/mYoL2p/kWnBQEKJKKAd6HTwsmMI5nBn7Bk=;
        b=d8fAK/EeYyjqXpCKh5T6eyRw7Tm13SZWXLbcUAbBZLm59nQQ7BBr2pQzUzwLunlWar
         9HP44WMuvSfL35GgrHZM/jKqD+IL/253JgfR26bkAxe1Z17DDiez+QHzD0vyn6gUf4kL
         f4puPT/UNjujoIVcDNft5MV6G2CB2KZoFfXl8vZ0zUPoBJLUy3WoAOul2CZE2In4CToh
         CGJHTcOE10GDazNzD4zCF/yVI7fE2EBYUaHe51uVIiduTYTAK1sME3jQYC8u/9vgKnSq
         viMNLfjDRrdCK1h6nNZaDrswJZcZYsov0ykl9PPuU61xQsLgRDFuXCUM85PYUO06dFQI
         Qa6w==
X-Forwarded-Encrypted: i=1; AJvYcCV0cfk3RW2NdYJ99FB6EzNczqcmNyPv7U5oO7SzTaHf54WvYB/G9dKERuNUru6aT8A6grQCZpvv1FLiPi9r@vger.kernel.org, AJvYcCWaCh4SNMolJ+sKlizqN9O4RUPFUJ37/22EjMxZ2cyLdPMuGg5OjytDVa/ccOACQYebIzV7O+G1JT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKj+itrrdGCptjrNUy61VUUw/trclPbwA7edQH8cuXAemDWNn6
	buFkI6P9QtgXlzQmlaeKj9ROsBhS+vmHm2yBxXuhflOLV2q+DSMG
X-Google-Smtp-Source: AGHT+IGU2wGGnYVupdpyh9eqhQTWhrq+gn/ZAkdGHvwZQ5LmyECDH4oikNfbN4uIkX5j5KFMnomK1Q==
X-Received: by 2002:a17:907:3f1c:b0:a8e:a578:29df with SMTP id a640c23a62f3a-a98f81ffdc1mr676977966b.6.1727971987423;
        Thu, 03 Oct 2024 09:13:07 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:07 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:55 +0200
Subject: [PATCH v8 06/12] drm/msm/a6xx: Implement preemption for a7xx
 targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-6-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=32233;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=la2yYs2rvztdmbAN8YutY92BLRLI4ynYhLnG47NiSsY=;
 b=evJfdR5Ggwy3OiiuYiKpP73tb8flcUL53pAYfsxaoF+gPiIKtSu02TpSmIJPCmtJtGbDP85Ql
 6tRqvdzpveXAuMZtJIXSMhJlUJGtZljy9oWUAdUIxF2IB3vsB7MDg+C
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

This patch implements preemption feature for A6xx targets, this allows
the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
hardware as such supports multiple levels of preemption granularities,
ranging from coarse grained(ringbuffer level) to a more fine grained
such as draw-call level or a bin boundary level preemption. This patch
enables the basic preemption level, with more fine grained preemption
support to follow.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/Makefile              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 193 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 162 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 393 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
 5 files changed, 745 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index f5e2838c6a76505b353f83c9fe9c997f1c282701..32e915109a59dda96ed76ddd2b4f57bb225f4572 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -23,6 +23,7 @@ adreno-y := \
 	adreno/a6xx_gpu.o \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
+	adreno/a6xx_preempt.o \
 
 adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6e065500b64d6d95599d89c33e6703c92f210047..b4cd562f1dd8660c77430e1aeac7e4b7af32bfc7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -68,6 +68,8 @@ static void update_shadow_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	uint32_t wptr;
 	unsigned long flags;
 
@@ -81,12 +83,17 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	/* Make sure to wrap wptr if we need to */
 	wptr = get_wptr(ring);
 
-	spin_unlock_irqrestore(&ring->preempt_lock, flags);
-
-	/* Make sure everything is posted before making a decision */
-	mb();
+	/* Update HW if this is the current ring and we are not in preempt*/
+	if (!a6xx_in_preempt(a6xx_gpu)) {
+		if (a6xx_gpu->cur_ring == ring)
+			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+		else
+			ring->restore_wptr = true;
+	} else {
+		ring->restore_wptr = true;
+	}
 
-	gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 }
 
 static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
@@ -138,12 +145,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 
 	/*
 	 * Write the new TTBR0 to the memstore. This is good for debugging.
+	 * Needed for preemption
 	 */
-	OUT_PKT7(ring, CP_MEM_WRITE, 4);
+	OUT_PKT7(ring, CP_MEM_WRITE, 5);
 	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
 	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
 	OUT_RING(ring, lower_32_bits(ttbr));
-	OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
+	OUT_RING(ring, upper_32_bits(ttbr));
+	OUT_RING(ring, ctx->seqno);
 
 	/*
 	 * Sync both threads after switching pagetables and enable BR only
@@ -268,6 +277,34 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush(gpu, ring);
 }
 
+static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
+		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
+{
+	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 12);
+
+	OUT_RING(ring, SMMU_INFO);
+	/* don't save SMMU, we write the record from the kernel instead */
+	OUT_RING(ring, 0);
+	OUT_RING(ring, 0);
+
+	/* privileged and non secure buffer save */
+	OUT_RING(ring, NON_SECURE_SAVE_ADDR);
+	OUT_RING(ring, lower_32_bits(
+		a6xx_gpu->preempt_iova[ring->id]));
+	OUT_RING(ring, upper_32_bits(
+		a6xx_gpu->preempt_iova[ring->id]));
+
+	/* user context buffer save, seems to be unnused by fw */
+	OUT_RING(ring, NON_PRIV_SAVE_ADDR);
+	OUT_RING(ring, 0);
+	OUT_RING(ring, 0);
+
+	OUT_RING(ring, COUNTER);
+	/* seems OK to set to 0 to disable it */
+	OUT_RING(ring, 0);
+	OUT_RING(ring, 0);
+}
+
 static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
@@ -285,6 +322,13 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
 
+	/*
+	 * If preemption is enabled, then set the pseudo register for the save
+	 * sequence
+	 */
+	if (gpu->nr_rings > 1)
+		a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);
+
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
 	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
@@ -376,6 +420,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, bv_fence)));
 	OUT_RING(ring, submit->seqno);
 
+	a6xx_gpu->last_seqno[ring->id] = submit->seqno;
+
 	/* write the ringbuffer timestamp */
 	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
 	OUT_RING(ring, CACHE_CLEAN | CP_EVENT_WRITE_0_IRQ | BIT(27));
@@ -389,10 +435,32 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x100); /* IFPC enable */
 
+	/* If preemption is enabled */
+	if (gpu->nr_rings > 1) {
+		/* Yield the floor on command completion */
+		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
+
+		/*
+		 * If dword[2:1] are non zero, they specify an address for
+		 * the CP to write the value of dword[3] to on preemption
+		 * complete. Write 0 to skip the write
+		 */
+		OUT_RING(ring, 0x00);
+		OUT_RING(ring, 0x00);
+		/* Data value - not used if the address above is 0 */
+		OUT_RING(ring, 0x01);
+		/* generate interrupt on preemption completion */
+		OUT_RING(ring, 0x00);
+	}
+
+
 	trace_msm_gpu_submit_flush(submit,
 		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
 
 	a6xx_flush(gpu, ring);
+
+	/* Check to see if we need to start preemption */
+	a6xx_preempt_trigger(gpu);
 }
 
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
@@ -588,6 +656,77 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
 }
 
+static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	const struct adreno_reglist_list *reglist;
+	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
+	struct cpu_gpu_lock *lock = ptr;
+	u32 *dest = (u32 *)&lock->regs[0];
+	int i;
+
+	reglist = adreno_gpu->info->a6xx->pwrup_reglist;
+
+	lock->gpu_req = lock->cpu_req = lock->turn = 0;
+	lock->ifpc_list_len = 0;
+	lock->preemption_list_len = reglist->count;
+
+	/*
+	 * For each entry in each of the lists, write the offset and the current
+	 * register value into the GPU buffer
+	 */
+	for (i = 0; i < reglist->count; i++) {
+		*dest++ = reglist->regs[i];
+		*dest++ = gpu_read(gpu, reglist->regs[i]);
+	}
+
+	/*
+	 * The overall register list is composed of
+	 * 1. Static IFPC-only registers
+	 * 2. Static IFPC + preemption registers
+	 * 3. Dynamic IFPC + preemption registers (ex: perfcounter selects)
+	 *
+	 * The first two lists are static. Size of these lists are stored as
+	 * number of pairs in ifpc_list_len and preemption_list_len
+	 * respectively. With concurrent binning, Some of the perfcounter
+	 * registers being virtualized, CP needs to know the pipe id to program
+	 * the aperture inorder to restore the same. Thus, third list is a
+	 * dynamic list with triplets as
+	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
+	 * stored as number for triplets in dynamic_list_len.
+	 */
+	lock->dynamic_list_len = 0;
+}
+
+static int a7xx_preempt_start(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct msm_ringbuffer *ring = gpu->rb[0];
+
+	if (gpu->nr_rings <= 1)
+		return 0;
+
+	/* Turn CP protection off */
+	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+	OUT_RING(ring, 0);
+
+	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
+
+	/* Yield the floor on command completion */
+	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
+	OUT_RING(ring, 0x00);
+	OUT_RING(ring, 0x00);
+	OUT_RING(ring, 0x00);
+	/* Generate interrupt on preemption completion */
+	OUT_RING(ring, 0x00);
+
+	a6xx_flush(gpu, ring);
+
+	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
+}
+
 static int a6xx_cp_init(struct msm_gpu *gpu)
 {
 	struct msm_ringbuffer *ring = gpu->rb[0];
@@ -619,6 +758,8 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 
 static int a7xx_cp_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->rb[0];
 	u32 mask;
 
@@ -656,11 +797,11 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
 
 	/* *Don't* send a power up reg list for concurrent binning (TODO) */
 	/* Lo address */
-	OUT_RING(ring, 0x00000000);
+	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
 	/* Hi address */
-	OUT_RING(ring, 0x00000000);
+	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
 	/* BIT(31) set => read the regs from the list */
-	OUT_RING(ring, 0x00000000);
+	OUT_RING(ring, BIT(31));
 
 	a6xx_flush(gpu, ring);
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
@@ -784,6 +925,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 	}
 
+	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
+							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
+							 gpu->aspace, &a6xx_gpu->pwrup_reglist_bo,
+							 &a6xx_gpu->pwrup_reglist_iova);
+
+	if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
+		return PTR_ERR(a6xx_gpu->pwrup_reglist_ptr);
+
+	msm_gem_object_set_name(a6xx_gpu->pwrup_reglist_bo, "pwrup_reglist");
+
 	return 0;
 }
 
@@ -1128,6 +1279,8 @@ static int hw_init(struct msm_gpu *gpu)
 	if (a6xx_gpu->shadow_bo) {
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR,
 			shadowptr(a6xx_gpu, gpu->rb[0]));
+		for (unsigned int i = 0; i < gpu->nr_rings; i++)
+			a6xx_gpu->shadow[i] = 0;
 	}
 
 	/* ..which means "always" on A7xx, also for BV shadow */
@@ -1136,6 +1289,8 @@ static int hw_init(struct msm_gpu *gpu)
 			    rbmemptr(gpu->rb[0], bv_rptr));
 	}
 
+	a6xx_preempt_hw_init(gpu);
+
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
@@ -1145,6 +1300,11 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
 
+	if (adreno_is_a7xx(adreno_gpu) && !a6xx_gpu->pwrup_reglist_emitted) {
+		a7xx_patch_pwrup_reglist(gpu);
+		a6xx_gpu->pwrup_reglist_emitted = true;
+	}
+
 	ret = adreno_is_a7xx(adreno_gpu) ? a7xx_cp_init(gpu) : a6xx_cp_init(gpu);
 	if (ret)
 		goto out;
@@ -1182,6 +1342,10 @@ static int hw_init(struct msm_gpu *gpu)
 out:
 	if (adreno_has_gmu_wrapper(adreno_gpu))
 		return ret;
+
+	/* Last step - yield the ringbuffer */
+	a7xx_preempt_start(gpu);
+
 	/*
 	 * Tell the GMU that we are done touching the GPU and it can start power
 	 * management
@@ -1559,8 +1723,13 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
 		a7xx_sw_fuse_violation_irq(gpu);
 
-	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
+	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
 		msm_gpu_retire(gpu);
+		a6xx_preempt_trigger(gpu);
+	}
+
+	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
+		a6xx_preempt_irq(gpu);
 
 	return IRQ_HANDLED;
 }
@@ -2333,6 +2502,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 				a6xx_fault_handler);
 
 	a6xx_calc_ubwc_config(adreno_gpu);
+	/* Set up the preemption specific bits and pieces for each ringbuffer */
+	a6xx_preempt_init(gpu);
 
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 2f5f307ac3b6845197b06ca3754abc88d698007c..070bce058d3ff92aa7452b697763a16ab7e2faee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -12,6 +12,24 @@
 
 extern bool hang_debug;
 
+struct cpu_gpu_lock {
+	uint32_t gpu_req;
+	uint32_t cpu_req;
+	uint32_t turn;
+	union {
+		struct {
+			uint16_t list_length;
+			uint16_t list_offset;
+		};
+		struct {
+			uint8_t ifpc_list_len;
+			uint8_t preemption_list_len;
+			uint16_t dynamic_list_len;
+		};
+	};
+	uint64_t regs[62];
+};
+
 /**
  * struct a6xx_info - a6xx specific information from device table
  *
@@ -33,6 +51,23 @@ struct a6xx_gpu {
 	uint64_t sqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
+	struct msm_ringbuffer *next_ring;
+
+	struct drm_gem_object *preempt_bo[MSM_GPU_MAX_RINGS];
+	void *preempt[MSM_GPU_MAX_RINGS];
+	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
+	struct drm_gem_object *preempt_smmu_bo[MSM_GPU_MAX_RINGS];
+	void *preempt_smmu[MSM_GPU_MAX_RINGS];
+	uint64_t preempt_smmu_iova[MSM_GPU_MAX_RINGS];
+	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
+
+	atomic_t preempt_state;
+	spinlock_t eval_lock;
+	struct timer_list preempt_timer;
+
+	unsigned int preempt_level;
+	bool uses_gmem;
+	bool skip_save_restore;
 
 	struct a6xx_gmu gmu;
 
@@ -40,6 +75,11 @@ struct a6xx_gpu {
 	uint64_t shadow_iova;
 	uint32_t *shadow;
 
+	struct drm_gem_object *pwrup_reglist_bo;
+	void *pwrup_reglist_ptr;
+	uint64_t pwrup_reglist_iova;
+	bool pwrup_reglist_emitted;
+
 	bool has_whereami;
 
 	void __iomem *llc_mmio;
@@ -51,6 +91,100 @@ struct a6xx_gpu {
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
 
+/*
+ * In order to do lockless preemption we use a simple state machine to progress
+ * through the process.
+ *
+ * PREEMPT_NONE - no preemption in progress.  Next state START.
+ * PREEMPT_START - The trigger is evaluating if preemption is possible. Next
+ * states: TRIGGERED, NONE
+ * PREEMPT_FINISH - An intermediate state before moving back to NONE. Next
+ * state: NONE.
+ * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Next
+ * states: FAULTED, PENDING
+ * PREEMPT_FAULTED: A preemption timed out (never completed). This will trigger
+ * recovery.  Next state: N/A
+ * PREEMPT_PENDING: Preemption complete interrupt fired - the callback is
+ * checking the success of the operation. Next state: FAULTED, NONE.
+ */
+
+enum a6xx_preempt_state {
+	PREEMPT_NONE = 0,
+	PREEMPT_START,
+	PREEMPT_FINISH,
+	PREEMPT_TRIGGERED,
+	PREEMPT_FAULTED,
+	PREEMPT_PENDING,
+};
+
+/*
+ * struct a6xx_preempt_record is a shared buffer between the microcode and the
+ * CPU to store the state for preemption. The record itself is much larger
+ * (2112k) but most of that is used by the CP for storage.
+ *
+ * There is a preemption record assigned per ringbuffer. When the CPU triggers a
+ * preemption, it fills out the record with the useful information (wptr, ring
+ * base, etc) and the microcode uses that information to set up the CP following
+ * the preemption.  When a ring is switched out, the CP will save the ringbuffer
+ * state back to the record. In this way, once the records are properly set up
+ * the CPU can quickly switch back and forth between ringbuffers by only
+ * updating a few registers (often only the wptr).
+ *
+ * These are the CPU aware registers in the record:
+ * @magic: Must always be 0xAE399D6EUL
+ * @info: Type of the record - written 0 by the CPU, updated by the CP
+ * @errno: preemption error record
+ * @data: Data field in YIELD and SET_MARKER packets, Written and used by CP
+ * @cntl: Value of RB_CNTL written by CPU, save/restored by CP
+ * @rptr: Value of RB_RPTR written by CPU, save/restored by CP
+ * @wptr: Value of RB_WPTR written by CPU, save/restored by CP
+ * @_pad: Reserved/padding
+ * @rptr_addr: Value of RB_RPTR_ADDR_LO|HI written by CPU, save/restored by CP
+ * @rbase: Value of RB_BASE written by CPU, save/restored by CP
+ * @counter: GPU address of the storage area for the preemption counters
+ * @bv_rptr_addr: Value of BV_RB_RPTR_ADDR_LO|HI written by CPU, save/restored by CP
+ */
+struct a6xx_preempt_record {
+	u32 magic;
+	u32 info;
+	u32 errno;
+	u32 data;
+	u32 cntl;
+	u32 rptr;
+	u32 wptr;
+	u32 _pad;
+	u64 rptr_addr;
+	u64 rbase;
+	u64 counter;
+	u64 bv_rptr_addr;
+};
+
+#define A6XX_PREEMPT_RECORD_MAGIC 0xAE399D6EUL
+
+#define PREEMPT_SMMU_INFO_SIZE 4096
+
+#define PREEMPT_RECORD_SIZE(adreno_gpu) \
+	((adreno_gpu->info->preempt_record_size) == 0 ? \
+	 4192 * SZ_1K : (adreno_gpu->info->preempt_record_size))
+
+/*
+ * The preemption counter block is a storage area for the value of the
+ * preemption counters that are saved immediately before context switch. We
+ * append it on to the end of the allocation for the preemption record.
+ */
+#define A6XX_PREEMPT_COUNTER_SIZE (16 * 4)
+
+struct a7xx_cp_smmu_info {
+	u32 magic;
+	u32 _pad4;
+	u64 ttbr0;
+	u32 asid;
+	u32 context_idr;
+	u32 context_bank;
+};
+
+#define GEN7_CP_SMMU_INFO_MAGIC 0x241350d5UL
+
 /*
  * Given a register and a count, return a value to program into
  * REG_CP_PROTECT_REG(n) - this will block both reads and writes for
@@ -108,6 +242,34 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 
+void a6xx_preempt_init(struct msm_gpu *gpu);
+void a6xx_preempt_hw_init(struct msm_gpu *gpu);
+void a6xx_preempt_trigger(struct msm_gpu *gpu);
+void a6xx_preempt_irq(struct msm_gpu *gpu);
+void a6xx_preempt_fini(struct msm_gpu *gpu);
+int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
+		struct msm_gpu_submitqueue *queue);
+void a6xx_preempt_submitqueue_close(struct msm_gpu *gpu,
+		struct msm_gpu_submitqueue *queue);
+
+/* Return true if we are in a preempt state */
+static inline bool a6xx_in_preempt(struct a6xx_gpu *a6xx_gpu)
+{
+	/*
+	 * Make sure the read to preempt_state is ordered with respect to reads
+	 * of other variables before ...
+	 */
+	smp_rmb();
+
+	int preempt_state = atomic_read(&a6xx_gpu->preempt_state);
+
+	/* ... and after. */
+	smp_rmb();
+
+	return !(preempt_state == PREEMPT_NONE ||
+			preempt_state == PREEMPT_FINISH);
+}
+
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended);
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
new file mode 100644
index 0000000000000000000000000000000000000000..fd2a90360740591d45758f7311ec5cdda1855b20
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2023 Collabora, Ltd. */
+/* Copyright (c) 2024 Valve Corporation */
+
+#include "msm_gem.h"
+#include "a6xx_gpu.h"
+#include "a6xx_gmu.xml.h"
+#include "msm_mmu.h"
+
+/*
+ * Try to transition the preemption state from old to new. Return
+ * true on success or false if the original state wasn't 'old'
+ */
+static inline bool try_preempt_state(struct a6xx_gpu *a6xx_gpu,
+		enum a6xx_preempt_state old, enum a6xx_preempt_state new)
+{
+	enum a6xx_preempt_state cur = atomic_cmpxchg(&a6xx_gpu->preempt_state,
+		old, new);
+
+	return (cur == old);
+}
+
+/*
+ * Force the preemption state to the specified state.  This is used in cases
+ * where the current state is known and won't change
+ */
+static inline void set_preempt_state(struct a6xx_gpu *gpu,
+		enum a6xx_preempt_state new)
+{
+	/*
+	 * preempt_state may be read by other cores trying to trigger a
+	 * preemption or in the interrupt handler so barriers are needed
+	 * before...
+	 */
+	smp_mb__before_atomic();
+	atomic_set(&gpu->preempt_state, new);
+	/* ... and after*/
+	smp_mb__after_atomic();
+}
+
+/* Write the most recent wptr for the given ring into the hardware */
+static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	unsigned long flags;
+	uint32_t wptr;
+
+	spin_lock_irqsave(&ring->preempt_lock, flags);
+
+	if (ring->restore_wptr) {
+		wptr = get_wptr(ring);
+
+		gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+
+		ring->restore_wptr = false;
+	}
+
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
+}
+
+/* Return the highest priority ringbuffer with something in it */
+static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	unsigned long flags;
+	int i;
+
+	for (i = 0; i < gpu->nr_rings; i++) {
+		bool empty;
+		struct msm_ringbuffer *ring = gpu->rb[i];
+
+		spin_lock_irqsave(&ring->preempt_lock, flags);
+		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
+		if (!empty && ring == a6xx_gpu->cur_ring)
+			empty = ring->memptrs->fence == a6xx_gpu->last_seqno[i];
+		spin_unlock_irqrestore(&ring->preempt_lock, flags);
+
+		if (!empty)
+			return ring;
+	}
+
+	return NULL;
+}
+
+static void a6xx_preempt_timer(struct timer_list *t)
+{
+	struct a6xx_gpu *a6xx_gpu = from_timer(a6xx_gpu, t, preempt_timer);
+	struct msm_gpu *gpu = &a6xx_gpu->base.base;
+	struct drm_device *dev = gpu->dev;
+
+	if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_FAULTED))
+		return;
+
+	dev_err(dev->dev, "%s: preemption timed out\n", gpu->name);
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
+}
+
+void a6xx_preempt_irq(struct msm_gpu *gpu)
+{
+	uint32_t status;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct drm_device *dev = gpu->dev;
+
+	if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_PENDING))
+		return;
+
+	/* Delete the preemption watchdog timer */
+	del_timer(&a6xx_gpu->preempt_timer);
+
+	/*
+	 * The hardware should be setting the stop bit of CP_CONTEXT_SWITCH_CNTL
+	 * to zero before firing the interrupt, but there is a non zero chance
+	 * of a hardware condition or a software race that could set it again
+	 * before we have a chance to finish. If that happens, log and go for
+	 * recovery
+	 */
+	status = gpu_read(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL);
+	if (unlikely(status & A6XX_CP_CONTEXT_SWITCH_CNTL_STOP)) {
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+					  "!!!!!!!!!!!!!!!! preemption faulted !!!!!!!!!!!!!! irq\n");
+		set_preempt_state(a6xx_gpu, PREEMPT_FAULTED);
+		dev_err(dev->dev, "%s: Preemption failed to complete\n",
+			gpu->name);
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+		return;
+	}
+
+	a6xx_gpu->cur_ring = a6xx_gpu->next_ring;
+	a6xx_gpu->next_ring = NULL;
+
+	set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
+
+	update_wptr(gpu, a6xx_gpu->cur_ring);
+
+	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
+
+	/*
+	 * Retrigger preemption to avoid a deadlock that might occur when preemption
+	 * is skipped due to it being already in flight when requested.
+	 */
+	a6xx_preempt_trigger(gpu);
+}
+
+void a6xx_preempt_hw_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int i;
+
+	/* No preemption if we only have one ring */
+	if (gpu->nr_rings == 1)
+		return;
+
+	for (i = 0; i < gpu->nr_rings; i++) {
+		struct a6xx_preempt_record *record_ptr = a6xx_gpu->preempt[i];
+
+		record_ptr->wptr = 0;
+		record_ptr->rptr = 0;
+		record_ptr->rptr_addr = shadowptr(a6xx_gpu, gpu->rb[i]);
+		record_ptr->info = 0;
+		record_ptr->data = 0;
+		record_ptr->rbase = gpu->rb[i]->iova;
+	}
+
+	/* Write a 0 to signal that we aren't switching pagetables */
+	gpu_write64(gpu, REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, 0);
+
+	/* Enable the GMEM save/restore feature for preemption */
+	gpu_write(gpu, REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE, 0x1);
+
+	/* Reset the preemption state */
+	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
+
+	spin_lock_init(&a6xx_gpu->eval_lock);
+
+	/* Always come up on rb 0 */
+	a6xx_gpu->cur_ring = gpu->rb[0];
+}
+
+void a6xx_preempt_trigger(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	unsigned long flags;
+	struct msm_ringbuffer *ring;
+	unsigned int cntl;
+
+	if (gpu->nr_rings == 1)
+		return;
+
+	/*
+	 * Lock to make sure another thread attempting preemption doesn't skip it
+	 * while we are still evaluating the next ring. This makes sure the other
+	 * thread does start preemption if we abort it and avoids a soft lock.
+	 */
+	spin_lock_irqsave(&a6xx_gpu->eval_lock, flags);
+
+	/*
+	 * Try to start preemption by moving from NONE to START. If
+	 * unsuccessful, a preemption is already in flight
+	 */
+	if (!try_preempt_state(a6xx_gpu, PREEMPT_NONE, PREEMPT_START)) {
+		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
+		return;
+	}
+
+	cntl = A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL(a6xx_gpu->preempt_level);
+
+	if (a6xx_gpu->skip_save_restore)
+		cntl |= A6XX_CP_CONTEXT_SWITCH_CNTL_SKIP_SAVE_RESTORE;
+
+	if (a6xx_gpu->uses_gmem)
+		cntl |= A6XX_CP_CONTEXT_SWITCH_CNTL_USES_GMEM;
+
+	cntl |= A6XX_CP_CONTEXT_SWITCH_CNTL_STOP;
+
+	/* Get the next ring to preempt to */
+	ring = get_next_ring(gpu);
+
+	/*
+	 * If no ring is populated or the highest priority ring is the current
+	 * one do nothing except to update the wptr to the latest and greatest
+	 */
+	if (!ring || (a6xx_gpu->cur_ring == ring)) {
+		set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
+		update_wptr(gpu, a6xx_gpu->cur_ring);
+		set_preempt_state(a6xx_gpu, PREEMPT_NONE);
+		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
+		return;
+	}
+
+	spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
+
+	spin_lock_irqsave(&ring->preempt_lock, flags);
+
+	struct a7xx_cp_smmu_info *smmu_info_ptr =
+		a6xx_gpu->preempt_smmu[ring->id];
+	struct a6xx_preempt_record *record_ptr = a6xx_gpu->preempt[ring->id];
+	u64 ttbr0 = ring->memptrs->ttbr0;
+	u32 context_idr = ring->memptrs->context_idr;
+
+	smmu_info_ptr->ttbr0 = ttbr0;
+	smmu_info_ptr->context_idr = context_idr;
+	record_ptr->wptr = get_wptr(ring);
+
+	/*
+	 * The GPU will write the wptr we set above when we preempt. Reset
+	 * restore_wptr to make sure that we don't write WPTR to the same
+	 * thing twice. It's still possible subsequent submissions will update
+	 * wptr again, in which case they will set the flag to true. This has
+	 * to be protected by the lock for setting the flag and updating wptr
+	 * to be atomic.
+	 */
+	ring->restore_wptr = false;
+
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
+
+	gpu_write64(gpu,
+		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
+		a6xx_gpu->preempt_smmu_iova[ring->id]);
+
+	gpu_write64(gpu,
+		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
+		a6xx_gpu->preempt_iova[ring->id]);
+
+	a6xx_gpu->next_ring = ring;
+
+	/* Start a timer to catch a stuck preemption */
+	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
+
+	/* Set the preemption state to triggered */
+	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
+
+	/* Trigger the preemption */
+	gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
+}
+
+static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
+		struct msm_ringbuffer *ring)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct drm_gem_object *bo = NULL;
+	phys_addr_t ttbr;
+	u64 iova = 0;
+	void *ptr;
+	int asid;
+
+	ptr = msm_gem_kernel_new(gpu->dev,
+		PREEMPT_RECORD_SIZE(adreno_gpu),
+		MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->aspace, &bo, &iova);
+
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+
+	memset(ptr, 0, PREEMPT_RECORD_SIZE(adreno_gpu));
+
+	msm_gem_object_set_name(bo, "preempt_record ring%d", ring->id);
+
+	a6xx_gpu->preempt_bo[ring->id] = bo;
+	a6xx_gpu->preempt_iova[ring->id] = iova;
+	a6xx_gpu->preempt[ring->id] = ptr;
+
+	struct a6xx_preempt_record *record_ptr = ptr;
+
+	ptr = msm_gem_kernel_new(gpu->dev,
+		PREEMPT_SMMU_INFO_SIZE,
+		MSM_BO_WC | MSM_BO_MAP_PRIV | MSM_BO_GPU_READONLY,
+		gpu->aspace, &bo, &iova);
+
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+
+	memset(ptr, 0, PREEMPT_SMMU_INFO_SIZE);
+
+	msm_gem_object_set_name(bo, "preempt_smmu_info ring%d", ring->id);
+
+	a6xx_gpu->preempt_smmu_bo[ring->id] = bo;
+	a6xx_gpu->preempt_smmu_iova[ring->id] = iova;
+	a6xx_gpu->preempt_smmu[ring->id] = ptr;
+
+	struct a7xx_cp_smmu_info *smmu_info_ptr = ptr;
+
+	msm_iommu_pagetable_params(gpu->aspace->mmu, &ttbr, &asid);
+
+	smmu_info_ptr->magic = GEN7_CP_SMMU_INFO_MAGIC;
+	smmu_info_ptr->ttbr0 = ttbr;
+	smmu_info_ptr->asid = 0xdecafbad;
+	smmu_info_ptr->context_idr = 0;
+
+	/* Set up the defaults on the preemption record */
+	record_ptr->magic = A6XX_PREEMPT_RECORD_MAGIC;
+	record_ptr->info = 0;
+	record_ptr->data = 0;
+	record_ptr->rptr = 0;
+	record_ptr->wptr = 0;
+	record_ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT;
+	record_ptr->rbase = ring->iova;
+	record_ptr->counter = 0;
+	record_ptr->bv_rptr_addr = rbmemptr(ring, bv_rptr);
+
+	return 0;
+}
+
+void a6xx_preempt_fini(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int i;
+
+	for (i = 0; i < gpu->nr_rings; i++)
+		msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->aspace);
+}
+
+void a6xx_preempt_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int i;
+
+	/* No preemption if we only have one ring */
+	if (gpu->nr_rings <= 1)
+		return;
+
+	for (i = 0; i < gpu->nr_rings; i++) {
+		if (preempt_init_ring(a6xx_gpu, gpu->rb[i]))
+			goto fail;
+	}
+
+	/* TODO: make this configurable? */
+	a6xx_gpu->preempt_level = 1;
+	a6xx_gpu->uses_gmem = 1;
+	a6xx_gpu->skip_save_restore = 1;
+
+	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
+
+	return;
+fail:
+	/*
+	 * On any failure our adventure is over. Clean up and
+	 * set nr_rings to 1 to force preemption off
+	 */
+	a6xx_preempt_fini(gpu);
+	gpu->nr_rings = 1;
+
+	DRM_DEV_ERROR(&gpu->pdev->dev,
+				  "preemption init failed, disabling preemption\n");
+
+	return;
+}
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 174f83137a49940ec80b1fbf548e214fa3c32784..d1e49f701c8176e50d2b9a5cca35acee67f75209 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -36,6 +36,7 @@ struct msm_rbmemptrs {
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
 	volatile u64 ttbr0;
+	volatile u32 context_idr;
 };
 
 struct msm_cp_state {
@@ -101,6 +102,12 @@ struct msm_ringbuffer {
 	 */
 	spinlock_t preempt_lock;
 
+	/*
+	 * Whether we skipped writing wptr and it needs to be updated in the
+	 * future when the ring becomes current.
+	 */
+	bool restore_wptr;
+
 	/**
 	 * cur_ctx_seqno:
 	 *

-- 
2.46.1


