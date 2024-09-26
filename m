Return-Path: <linux-arm-msm+bounces-32607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6859879C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A54F1C23C8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 19:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A27915C148;
	Thu, 26 Sep 2024 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epMkOT33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA127154C0A;
	Thu, 26 Sep 2024 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727380333; cv=none; b=r2Ucm6k29TVmZYpuKdT4TnI6OMgigT9F356iOz/d1KUtaLx7folG8VE07NeWhZGJO05BsZOZC0RU8Ltk+8ORI/6tniOD+jT6qO0seCjKPzoRCXTQNjl/oj5jD1YHRF506GdzgtWqj6LUTOFJ6jzy3g2fl24huqS4a3f/me/2Xdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727380333; c=relaxed/simple;
	bh=lhF1AKodDWkiBg0bmisK8hoHmrmK9hK38nbueXz3QJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PNpeX522cIrxQFXwGQE/SESE8La7136dlLeRvLNe53i+GR3/S5cT6cdEntfKZp4SKIhXRkv7ReWFE+16V56GmvdXG5scykFq+qXE9r6ilavWBT6msdrfBl5WBfYFSDgTqJtyi0G2ajVXbfT3T+t7QEF4KiTwdrXdLA3LhuqopR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epMkOT33; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71b00a97734so1192912b3a.1;
        Thu, 26 Sep 2024 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727380331; x=1727985131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2boR/MAZxOMOcOLaexaTOrvAmufg1KJH8ZtqOW93otY=;
        b=epMkOT33v583PWOKbB9qHQ32kWFuE1oBbdeD1p+AzDKuub8TpTIL2gUm46CcXDY5sw
         F/mmcLByLYz1jMVudxMX+jf9c6Jvp5t9zhe7FhfPbv6F1CUuyW6RPlu0ZLKKGoS4H+4N
         WreRCE11NK/jRH2Qahhl3tTU1v+IsTdt2WsvUREMxHGUts80zXWMOrC01VYSEV7jih+k
         poEkGTXcrLOJXdTprG2b16Ec9SaR4xc+8FcNqwzE9uqbH8lrO1+naBL9IslofphjJ1za
         fjO7EZEdL8HgiyiDLYyh59ph9CdWaW8MVnnybZpkpCRr2Fi0bKdbS3D7RvFhk/6dF04Y
         zbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727380331; x=1727985131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2boR/MAZxOMOcOLaexaTOrvAmufg1KJH8ZtqOW93otY=;
        b=OCBrS0a7EIDZD49ZVNaU9sDpuTaz9YxirEpbXMFFaCBckev5E74abGIt3LMT0dBwYt
         vYiPGsAMBiKF2oz3H1lKopQa+8V4PWbvGfaFnQN/4buGBdM8JC/382rGbiJXlbzCya85
         DKxIvfhRA0Ka5A8cb4O+wmH0thoHPIrsrrCtzwZgZuGApEelYS5q0kfQd8ud7SF6Jv/f
         AghzS2XRQ5sNobsyhHB/29bBwuKdrXr3NRbKnpwAr8OmtEx3kk+D2Iewvy2w4J9GI8cO
         Ru9KpAawIi4Y4rEEHcP8hvVWiF9HX3ifoRajkVD5dFU6+rZFH/Zg/tZydsnlb0ifCLvC
         juAg==
X-Forwarded-Encrypted: i=1; AJvYcCVrhiyPdvU3nMome93RnKwyKXsbKSNpNRWb/AAaKiSXLJKKyO/ZAfa96Knl8G8COiEsRdAhVGkT5c0Z3ZjF@vger.kernel.org, AJvYcCWKtw48720r0bOJNH5z1sEiQVQr4CQCEA6KZxtTZBJliN30O+or5D4JWMpr6IvBb5CRF0ruhZL5djoyVpcQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Y/UT6NY700F4IQh3Q0kRo60vvKMhwnHFtwTMrhW8PLQxpimw
	METgwlD6HKvfrenmSVhJlfBAYdwlqL11id0GMsuZET/nSsSWA34w
X-Google-Smtp-Source: AGHT+IHXD4NVVvmwpQW583+r6Op56I2A3DVsRxRoJfFYmFB6Wi1rxzA0Ag9AZ6U3fDRx0wcPISJcPQ==
X-Received: by 2002:a05:6a00:8c2:b0:710:bd4b:8b96 with SMTP id d2e1a72fcca58-71b26079af9mr1185111b3a.28.1727380330814;
        Thu, 26 Sep 2024 12:52:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d61sm278585b3a.171.2024.09.26.12.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 12:52:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/a6xx+: Insert a fence wait before SMMU table update
Date: Thu, 26 Sep 2024 12:52:06 -0700
Message-ID: <20240926195207.21369-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
devices (x1-85, possibly others), it seems to pass that barrier while
there are still things in the event completion FIFO waiting to be
written back to memory.

Work around that by adding a fence wait before context switch.  The
CP_EVENT_WRITE that writes the fence is the last write from a submit,
so seeing this value hit memory is a reliable indication that it is
safe to proceed with the context switch.

v2: Only emit CP_WAIT_TIMESTAMP on a7xx, as it is not supported on a6xx.
    Conversely, I've not been able to reproduce this issue on a6xx, so
    hopefully it is limited to a7xx, or perhaps just certain a7xx
    devices.

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4760f9469613..cdda8200d5a9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -186,9 +186,10 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 }
 
 static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
-		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
+		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	struct msm_file_private *ctx = submit->queue->ctx;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
@@ -200,6 +201,15 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
 		return;
 
+	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
+		/* Wait for previous submit to complete before continuing: */
+		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
+		OUT_RING(ring, 0);
+		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
+		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
+		OUT_RING(ring, submit->seqno - 1);
+	}
+
 	if (!sysprof) {
 		if (!adreno_is_a7xx(adreno_gpu)) {
 			/* Turn off protected mode to write to special registers */
@@ -280,7 +290,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
@@ -410,7 +420,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	/*
 	 * If preemption is enabled, then set the pseudo register for the save
-- 
2.46.1


