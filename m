Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBF1217985
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 22:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgGGUgx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 16:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgGGUgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 16:36:52 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F521C061755;
        Tue,  7 Jul 2020 13:36:52 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x8so16315231plm.10;
        Tue, 07 Jul 2020 13:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hZeUOpJQcEzlGIlg9oeO7yAlZJGbtEx7VcHRTHdaPHU=;
        b=gWh2/ziM4dgkXVl4R62ETmGK47WH9z9pI1OxYS/fPuNTPSw729Q8CqUHHwRh2Q1Jc7
         kAKXrPrjsrtGGQveWol+5BdvwVMO/08Ryzh1jzWuVpE8XuvkmbHblPXJkYRowrUSr4Nr
         T5q6y8KbmCQXldRgh9W5k4FwxiRQZvimCzAUIRDKdfkJF8ihgrci9e/gThaxPdS+gd1S
         P7ANwWYgsBOpZ7yCeJrEPV5j54iw15NEe5AA+t6H98xXV6fuH7kpHUiVRbXkZSvZVVwH
         qsOfNzq9q9pIsuwz96/Y6BZuk/yVoEa2jxjzcpMwd8hf+Fx5a7mF2/Cum24To9d5I6Ve
         q5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZeUOpJQcEzlGIlg9oeO7yAlZJGbtEx7VcHRTHdaPHU=;
        b=cXTgUYBVyscCRA0FVLXTOgAh6S6RtnyN/k9w2W+r3NO3TisiSQaS4i2bILm3CHLQqQ
         CyBb0X/7InmMmkX4mac2AIpxViv06VNSFFqzuEWrtQd+aSMm1XYRyjyMx8ztj/CULk5j
         kAIdcxD53kQtHVT6lM8o1eE5Op8ZnNl0o64iNqjdex2eQ5Zm+99BEy7KTt4z6eF5G5En
         VdSfZrlMBYjzs4Ue/xxd4HLrDJneeLC+ZVQqFRZohKaVmKDzMU33Gx8C73vPfZcU/8MV
         Z5KCE3gaGUtsYl2hEJzX6QGC5s4/znHZlPf3bUM4/Gv94E1OGJIvE6R4qItcMmfBp54l
         jJdg==
X-Gm-Message-State: AOAM532VFj0FfyI/9S+j9dys6Jecf77JhDHornXTvXZm4uDDvlOKDcbY
        EQ+eBpW1+3vDBYqNAXAVRuU=
X-Google-Smtp-Source: ABdhPJzLLECROxtVUUBHzDccmAZZ9FM/J/JHF97igPeg9tNrbfzr45IRJdns8aTkdIz+FrDboJGQ+w==
X-Received: by 2002:a17:90a:148:: with SMTP id z8mr6497903pje.197.1594154211785;
        Tue, 07 Jul 2020 13:36:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id u13sm3069925pjy.40.2020.07.07.13.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:36:50 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/adreno: un-open-code some packets
Date:   Tue,  7 Jul 2020 13:35:00 -0700
Message-Id: <20200707203529.2098979-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707203529.2098979-1-robdclark@gmail.com>
References: <20200707203529.2098979-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d95970a73fb4..7f4526b3283d 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -186,7 +186,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	 * timestamp is written to the memory and then triggers the interrupt
 	 */
 	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
-	OUT_RING(ring, CACHE_FLUSH_TS | (1 << 31));
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(CACHE_FLUSH_TS) |
+		CP_EVENT_WRITE_0_IRQ);
 	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
@@ -730,7 +731,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 */
 	if (adreno_is_a530(adreno_gpu)) {
 		OUT_PKT7(gpu->rb[0], CP_EVENT_WRITE, 1);
-		OUT_RING(gpu->rb[0], 0x0F);
+		OUT_RING(gpu->rb[0], CP_EVENT_WRITE_0_EVENT(STAT_EVENT));
 
 		gpu->funcs->flush(gpu, gpu->rb[0]);
 		if (!a5xx_idle(gpu, gpu->rb[0]))
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7768557cdfb2..1ed325bea430 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -74,7 +74,9 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 		u64 iova)
 {
 	OUT_PKT7(ring, CP_REG_TO_MEM, 3);
-	OUT_RING(ring, counter | (1 << 30) | (2 << 18));
+	OUT_RING(ring, CP_REG_TO_MEM_0_REG(counter) |
+		CP_REG_TO_MEM_0_CNT(2) |
+		CP_REG_TO_MEM_0_64B);
 	OUT_RING(ring, lower_32_bits(iova));
 	OUT_RING(ring, upper_32_bits(iova));
 }
@@ -102,10 +104,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 
 	/* Invalidate CCU depth and color */
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, PC_CCU_INVALIDATE_DEPTH);
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(PC_CCU_INVALIDATE_DEPTH));
 
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, PC_CCU_INVALIDATE_COLOR);
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(PC_CCU_INVALIDATE_COLOR));
 
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
@@ -139,7 +141,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	 * timestamp is written to the memory and then triggers the interrupt
 	 */
 	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
-	OUT_RING(ring, CACHE_FLUSH_TS | (1 << 31));
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(CACHE_FLUSH_TS) |
+		CP_EVENT_WRITE_0_IRQ);
 	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
-- 
2.26.2

