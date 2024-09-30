Return-Path: <linux-arm-msm+bounces-32783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC04398A623
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA60528400C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC4D19309C;
	Mon, 30 Sep 2024 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5ibCZSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140E19048C;
	Mon, 30 Sep 2024 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704378; cv=none; b=tAtdCVKPu1AjfVdEMsIskiOO+WMbVCMjnVmzbBrmeNTw1BnBPLyxJQ+P/gL4ICcTkQorOeCadMeupYQrkhEfIyXVssEh6ncYOgqkoEi4Yl1YdP9RNWvhFfEEgrowoWuDnIMYDB2cDHMc4EpjTn8eP6ExXNuOhVaVeBgyt4anEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704378; c=relaxed/simple;
	bh=GErpIvRW+n2p4qxh8jSzvjL7YV5XCXSAicPcG/Fe5FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGg947NcoPI9WoFrAt5z4qxTGsnzXcusEsF7pDCTrdM9d9R7V2kpRN6gMyy8V1UUj3CJ0sB61TpDJrkJhHIIh1orceGfrSQ0rccICxyqdXZiqdt5iWb6ssTOOLpccpquPGQ7+qO3EeImDzaEiQtQOIgVzwSADWJhYQpv0QbZdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5ibCZSm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398e53ca28so1735211e87.3;
        Mon, 30 Sep 2024 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704374; x=1728309174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcdhyLXjBdUnQH13HN5Z9aat7gLFfAqJVDn1uHZn7Is=;
        b=K5ibCZSmHteaYMgewy8VAI1sL1gSV6/IJ59zWifusgipbdE0IoJrw0vMvzEenBQMFQ
         VB5YW5okDOPJ7VBC0Ja91oz4CU4CTTtufy3Ipy4A4TofvC024tuY597KZNn4FveOR3ey
         YgfeuvC2zkAOtp1r49mKOvY+b4TmcS5prYAUEeAd/A/cCtaT20VhEIWQX/hdWw5MY+MJ
         KdZYbpv6YPTirgJ8tmp08PA1DgVlZjhTlUcjD1FwAYpqOd+IjH72ZMXbGUPav34+UGzB
         Ni9IlgwT/Mmbqd8zLWWcYHZ+gNcoNHSs8cvOLZSA3vw/afjZyAP/0kAi63TrIXcoqDPb
         HUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704374; x=1728309174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcdhyLXjBdUnQH13HN5Z9aat7gLFfAqJVDn1uHZn7Is=;
        b=JlI3SZ9gdSOQJ4rkBK03tbfkUNdHq5wWfTmWEP8E3cFrcbM742ydZ8dQaN7Ox2j9pU
         NrD3gxbWzjY6dR4fkoyPTwSDSTLTZyh1pcJ7339u810Rt4wXpSjrHiCvYg2TUl3K4oJe
         gE7wD925+pa4+U2tHRRHBuBIThvgWJ4DIBzAlFD0u5NxMXcfMAfr8xeQ11Va2LYJ2l20
         ZMlByc4cpmt64zYdUHqqjfapOJ3MCwKTj3NOYw7bLGdsQwVkm0bYvD49AqFJhoFp4SGA
         Om2Q9lNZVCB9wNOQhzLw+nGCzreEtx0k3MetcwP34ANeXPFKjD0P1yMLCqHuJzlkrF9f
         iUvg==
X-Forwarded-Encrypted: i=1; AJvYcCUcfYlEkcK2iF5zwAsgizCiDmJFXeTf02kMmY9DW57gQZkcH8wrTHrnom82rdZyZNvE8IEtJGTHdX1smoy/@vger.kernel.org, AJvYcCWlVoI7rp7UARILpeNZxCC6mFMYyJXt+2lF8HG6Pg7lMT8xINlIeT+3MXZeaYO3eQFJcGXiZonKJPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTmjLf7wXvE971a8s4oklx15BMQsS4a3Tmy4h0XJzZiqCZbcg
	vtO+3ATBCT8Q3xe6Y5wfimoJ4IiXQI/VASt+rtDvWHfFbAm5Tvzl
X-Google-Smtp-Source: AGHT+IEQXKkDrWv+7tRufuPodXpuV3QBPl7kFkmbFLnkXd1SgiJTxAhm7GbZMj/nnsjVcDLm35f7ZA==
X-Received: by 2002:a05:6512:68e:b0:539:948a:aadb with SMTP id 2adb3069b0e04-539948aac84mr2117902e87.42.1727704373961;
        Mon, 30 Sep 2024 06:52:53 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:53 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:43 +0200
Subject: [PATCH v7 08/12] drm/msm/a6xx: Use posamble to reset counters on
 preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-8-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=6771;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=GErpIvRW+n2p4qxh8jSzvjL7YV5XCXSAicPcG/Fe5FM=;
 b=zCf1PygI6RVvv5Ms3abjdqY2wQoPreaSOarJgxeTjJn/MbarO9mPhcBHeuGzNuG/l7LGdkJSM
 BfNCY3vW6CUDVks10Bn38LcL5DXMCOshGHED8NzxXgHfEhP+IJk5Bhl
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Use the postamble to reset perf counters when switching between rings,
except when sysprof is enabled, analogously to how they are reset
between submissions when switching pagetables.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 12 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 58 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 ++--
 4 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b4cd562f1dd8660c77430e1aeac7e4b7af32bfc7..9b486ec08f77933c3666549a16d915aa2d2188b0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -280,6 +280,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
 {
+	u64 preempt_postamble;
+
 	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 12);
 
 	OUT_RING(ring, SMMU_INFO);
@@ -303,6 +305,16 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 	/* seems OK to set to 0 to disable it */
 	OUT_RING(ring, 0);
 	OUT_RING(ring, 0);
+
+	/* Emit postamble to clear perfcounters */
+	preempt_postamble = a6xx_gpu->preempt_postamble_iova;
+
+	OUT_PKT7(ring, CP_SET_AMBLE, 3);
+	OUT_RING(ring, lower_32_bits(preempt_postamble));
+	OUT_RING(ring, upper_32_bits(preempt_postamble));
+	OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
+				 a6xx_gpu->preempt_postamble_len) |
+			 CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
 }
 
 static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 070bce058d3ff92aa7452b697763a16ab7e2faee..a7fde9a27481f4f6d4efdde98a12ae4b62332f47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -69,6 +69,12 @@ struct a6xx_gpu {
 	bool uses_gmem;
 	bool skip_save_restore;
 
+	struct drm_gem_object *preempt_postamble_bo;
+	void *preempt_postamble_ptr;
+	uint64_t preempt_postamble_iova;
+	uint64_t preempt_postamble_len;
+	bool postamble_enabled;
+
 	struct a6xx_gmu gmu;
 
 	struct drm_gem_object *shadow_bo;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index fd2a90360740591d45758f7311ec5cdda1855b20..21e333cb6342d33425eb96f97bcc853e9b041b36 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -97,6 +97,43 @@ static void a6xx_preempt_timer(struct timer_list *t)
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
+static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
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
+
+	a6xx_gpu->postamble_enabled = true;
+}
+
+static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
+
+	/*
+	 * Disable the postamble by replacing the first packet header with a NOP
+	 * that covers the whole buffer.
+	 */
+	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
+
+	a6xx_gpu->postamble_enabled = false;
+}
+
 void a6xx_preempt_irq(struct msm_gpu *gpu)
 {
 	uint32_t status;
@@ -187,6 +224,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	unsigned long flags;
 	struct msm_ringbuffer *ring;
 	unsigned int cntl;
+	bool sysprof;
 
 	if (gpu->nr_rings == 1)
 		return;
@@ -271,6 +309,15 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	/* Start a timer to catch a stuck preemption */
 	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
+	/* Enable or disable postamble as needed */
+	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+
+	if (!sysprof && !a6xx_gpu->postamble_enabled)
+		preempt_prepare_postamble(a6xx_gpu);
+
+	if (sysprof && a6xx_gpu->postamble_enabled)
+		preempt_disable_postamble(a6xx_gpu);
+
 	/* Set the preemption state to triggered */
 	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
 
@@ -375,6 +422,17 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	a6xx_gpu->uses_gmem = 1;
 	a6xx_gpu->skip_save_restore = 1;
 
+	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
+			PAGE_SIZE,
+			MSM_BO_WC | MSM_BO_MAP_PRIV | MSM_BO_GPU_READONLY,
+			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
+			&a6xx_gpu->preempt_postamble_iova);
+
+	preempt_prepare_postamble(a6xx_gpu);
+
+	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
+		goto fail;
+
 	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
 
 	return;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 58c63d0fbbff9818393fc62ee3cf2703365bec23..2d8eef6c668b0da246edceba0c5d92041ea9a35b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -623,12 +623,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
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
2.46.1


