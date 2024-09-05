Return-Path: <linux-arm-msm+bounces-30960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338E96DC90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57DA71C217BF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B1E19E7FE;
	Thu,  5 Sep 2024 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caWhNyoP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B444D19DF9E;
	Thu,  5 Sep 2024 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547901; cv=none; b=Rd8yYw4ylu4I2pCUR/+wblukGCsnr/umCmDx/jAfuSOothcbiWppr0RJh6W0OBiMb2BWDICXTtTYqYkXN27HYBObVNvEj2G64SWzgGiENjfdL6ELzCdI98YUKr3oT/cCQXWliCj+8uDxb//PGqrPVg+0g3CSU04kd+HYsSvbXPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547901; c=relaxed/simple;
	bh=Zsvr1247RtZPn1dRIbMfKgc5nWgYcEQdv2j7TsXQilg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTUooLVMHzvHEDN64nBS94gq6d1oxUhwBs9A+QF+Q4LmzWIqou0QdxX4SEJ6xzhqmZ0tj1oNcJBtMwiGpvsbY0VlfbrYOuARE/ElPZt8dzuI/3ecFwUvs4m1vPCEOoeIQPiYdIgY317VP3GmddgBLnp4o2Vc/kmz44N8mVJvB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caWhNyoP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c27067b81aso974585a12.0;
        Thu, 05 Sep 2024 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547898; x=1726152698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GC2fTRVdCYGtXlVRryRfUeAExC13fh4Kz3zelIUUr0=;
        b=caWhNyoP2yPcjgr87IMDPOrxtBbyhHRRM65/AUQ6Qw7GC/18MbkjsAa0dZOFanpIeB
         +sR3HlC2/XKBp4YeDMq2I3DWh07MetYYcmbogdXaYMQQtK5ac6wnsDaUQXX1mIF3JTip
         8UDUiJlzsX6tsSI+rgZDO4hXravDINokeMwL1z5y1qgsunLf+rbUlH/3x/Z06hkbXE9q
         17nHOSXfyokqfRvZWmDqFRCXBvcupTp9ugBz56GWnhOVQFSoVZBR5H16m3D5J+U9QGyw
         H5sg1QQ3UUVUVSwWgCVnsFDZod4/15iur8eDIX9DixLTBWIkhRYpL4yLzEdkV4IV5E5y
         ZKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547898; x=1726152698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GC2fTRVdCYGtXlVRryRfUeAExC13fh4Kz3zelIUUr0=;
        b=qes6pzITsTc8EfuSPihiGpax8ohTiVbjswWoEYWLuY12u6oWHl12b4gKgBytOzWzEF
         ULBXJR+5u6wBpWLjz/o6lmr9qUXZ/OQY9iUzcllzqgklXPMXjKMMV1aowBBN63j1mV2P
         t+YvX2wP/HZu6XaknUjCI5fPOfXexulqfqIm6GX41KDl1+NnzUnmtztpjj6VfPZ5enOD
         PIHu783YsW9VwgSUjj1LvVd1QtsrIGXIPHzZwgugllgqBfrp72tLV0bezjlHP+uDb/X7
         n6uo93GVKTEPQkmb1yJLFWH3YDTq48hY9rvXQ1eyXg97d9xbM0Hph7jO2aHLydPcZ4qo
         JDLg==
X-Forwarded-Encrypted: i=1; AJvYcCUpSCI5hVYvQjCTBpaDyoG3u5/9++Dx9bn4vB501ffrt5RffE+wVLePpKRvI4/cQH39qMdfj6WjI2k=@vger.kernel.org, AJvYcCX9yx7/R6pJ7S23xqtCjlnVPlHGJFL6gvmZhfSjWUxFJoQKIYQRDMr4GyPXWpmE4U/95NrKen+mKKZrtWLg@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQfzxJoQxhEloGjfzzSChpexzTkXY3lpoRhZ1DOrzNr5UOPP5
	BuCiOF+7vOYZwqEHC+nuFfC5oWJTtKreJngR0atxsSrffMaKKPbH
X-Google-Smtp-Source: AGHT+IHsZgu8qoe3CcENedpIvYZ3fmjD22EHKh5tU84tY4CjRaVCOh12fJig5JDX0DKY4f2u+bJaHw==
X-Received: by 2002:a05:6402:3595:b0:5c2:50a2:98a2 with SMTP id 4fb4d7f45d1cf-5c250a38f97mr10296600a12.6.1725547897944;
        Thu, 05 Sep 2024 07:51:37 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:37 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:25 +0200
Subject: [PATCH v3 07/10] drm/msm/A6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=2568;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=Zsvr1247RtZPn1dRIbMfKgc5nWgYcEQdv2j7TsXQilg=;
 b=d83hA0dLH41UeY5WvcoBmmo6Sy9sQ1Iw5if3rTnE6nPTIPAflaWdtJUw9Yjto+uHnWJpg70iG
 Pd+461fmPvRCTd4+jk1L5qkInthqjG2CHuCjVKKDAj+tXtLW+YKZ4Ro
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add trace points corresponding to preemption being triggered and being
completed for latency measurement purposes.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index ec44f44d925f..ca9d36c107f2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 /*
  * Try to transition the preemption state from old to new. Return
@@ -143,6 +144,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -264,6 +267,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->skip_inline_wptr = false;
 
+	trace_msm_gpu_preemption_trigger(
+		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,
+		ring ? ring->id : -1);
+
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	gpu_write64(gpu,
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc45..7f863282db0d 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -177,6 +177,34 @@ TRACE_EVENT(msm_gpu_resume,
 		TP_printk("%u", __entry->dummy)
 );
 
+TRACE_EVENT(msm_gpu_preemption_trigger,
+		TP_PROTO(int ring_id_from, int ring_id_to),
+		TP_ARGS(ring_id_from, ring_id_to),
+		TP_STRUCT__entry(
+			__field(int, ring_id_from)
+			__field(int, ring_id_to)
+			),
+		TP_fast_assign(
+			__entry->ring_id_from = ring_id_from;
+			__entry->ring_id_to = ring_id_to;
+			),
+		TP_printk("preempting %u -> %u",
+			  __entry->ring_id_from,
+			  __entry->ring_id_to)
+);
+
+TRACE_EVENT(msm_gpu_preemption_irq,
+		TP_PROTO(u32 ring_id),
+		TP_ARGS(ring_id),
+		TP_STRUCT__entry(
+			__field(u32, ring_id)
+			),
+		TP_fast_assign(
+			__entry->ring_id = ring_id;
+			),
+		TP_printk("preempted to %u", __entry->ring_id)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH

-- 
2.46.0


