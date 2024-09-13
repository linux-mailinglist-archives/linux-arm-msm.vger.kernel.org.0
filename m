Return-Path: <linux-arm-msm+bounces-31776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA4978923
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 21:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE9002831C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 19:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D161465A0;
	Fri, 13 Sep 2024 19:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8cWxaab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC0146D76;
	Fri, 13 Sep 2024 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257098; cv=none; b=NbM4e8QWW9dBx2oFsy3R3wEaNBWHOCN7Y+UrQ9K6it0dDOCI4TBzw918nI4G3XMgJwXyLdXuo5oPgPeR41F70YzdiLjkArDiAR7G3NTARk3LOdHN93dyP0Fm+VRJVrdY8u1gi8liDfF9jUUSOG5mhZizdhpvOASG8iDgsx9szXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257098; c=relaxed/simple;
	bh=4j4P8LD9JnCOCurh5UQmuPYLFoyTDeDzK7xfDStOvBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tajEeefMLzth4Y+SAJBHCzv9k4xUVDVZJpe8AyOqfGCQrDnJcY1776rhLF0hZRcr4w1Ft74C4R4uLJIbboVYp32OVwqMx0uLwhPRTBkd0YC0XhODlowvzMISA4L/D8vHLN0J0zCw8DHkIeTs/idYxZPF/LCczDktXJJ0ArsY8hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8cWxaab; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fee6435a34so23920715ad.0;
        Fri, 13 Sep 2024 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726257096; x=1726861896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CB8jZGjPjnOyT8KVsrlJmg/A4Cpb/kxqtggkRJsoV9U=;
        b=P8cWxaaba+GePvNW24yb5FKQRZaui614zc4x4t10BVOrZubGOo4AcEo3ce+OxKLUIz
         /0Wj7Hr6p8alIB2zA6Ae986+HwZLAiUsyJ/3E/DfJaFk6+Ju52e8S7zefN5HgGzM489A
         MLTvZbH7QtD0ng5AkbCqCq+FKq4huPTPW12zB58uP2W9KwQVEGZXTI5gCf4I74n3vxQM
         5lQy4ewJ3ukl/HwXpimPK3Kan+tibksbl3IXyotR3K7GDkIHks9CIfI5SuyqSgSsgaNj
         cY7MEMWkdeNR3Y1DMnJM/w57ZgY7kcE1YtggHW/PbEKoziLGXuJg9vN8BEOM0bzfBtPp
         aUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726257096; x=1726861896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CB8jZGjPjnOyT8KVsrlJmg/A4Cpb/kxqtggkRJsoV9U=;
        b=aW3Xcmg3KhgokMZ7k0PBFV/K0ksO/OW1Bc0xm+u3stwqseBVv5DJh+Hnz8l6jlanOc
         wm/N4e41yHKKeyvTsUKd2xh+aB/iZVTknW51hsYEQmQ/b5Q1u1lbDH/60TEU/I3hCuVt
         zFGt1Wlc0HE2NvMocwslcYRK4wREj+bFmB0BDOlmajDmrOTBVNrX4IGC2+5nJroltA5g
         O2DPQHIdwMlYTNspL/Rn3I0MdO+l7imPNPDVCo7Au/x1NMou8SmXTu2msaNvmiW7RGi9
         8GGTxK15r51E0u1DHis/so7eZr6x8kLIvL+PJrFW6Eug6/hkulXn78h8y33KNPlQ8eOX
         oXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnczX9E3xc21NGPZEakN8NNSy1MWnu4OFooop2WMk79k3mfbvL0EtouKZGkZfWNTHU3KgCz0XKvhzaM18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVFmco3eT8SiwhBA6Arut4iFujnPZDpG1BkCpI4CrGUtTKQ2Sn
	W8+zdPbojD9kKn4JpRajqGwuebeGe8EO+lKCOj/tiZl5Hf2bY4JJ
X-Google-Smtp-Source: AGHT+IF2m8yqpRXDRCpHC9T48pLfZDaKaeeZwKrb5xVVqT8J3uKIrDGq4EO2eV7HtkaI2gEwjhuChA==
X-Received: by 2002:a17:902:f693:b0:205:68a4:b2d8 with SMTP id d9443c01a7336-2076e3155e9mr125176375ad.11.1726257096201;
        Fri, 13 Sep 2024 12:51:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945daa86sm169925ad.61.2024.09.13.12.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 12:51:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table update
Date: Fri, 13 Sep 2024 12:51:31 -0700
Message-ID: <20240913195132.8282-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..ba5b35502e6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -101,9 +101,10 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
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
@@ -115,6 +116,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
 		return;
 
+	/* Wait for previous submit to complete before continuing: */
+	OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
+	OUT_RING(ring, 0);
+	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
+	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
+	OUT_RING(ring, submit->seqno - 1);
+
 	if (!sysprof) {
 		if (!adreno_is_a7xx(adreno_gpu)) {
 			/* Turn off protected mode to write to special registers */
@@ -193,7 +201,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
@@ -283,7 +291,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
-- 
2.46.0


