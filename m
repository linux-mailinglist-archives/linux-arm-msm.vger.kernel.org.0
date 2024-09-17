Return-Path: <linux-arm-msm+bounces-31910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A575697AF7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92BFA1C226F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5409183CB2;
	Tue, 17 Sep 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3a90pkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B017C990;
	Tue, 17 Sep 2024 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571674; cv=none; b=NYnIc8fxmctoYkkZvBE+UFG7W+XrZC+vF26Ld5BgbKevYV6qiM0Ra7a+ZrUesszfaz9jlcWxdw1fSm1n4PYvRaKe0OLi/5qGzLQPrXbLZA0gRx5kGUZ2uzOPEScr6Xr559ucwolNGrpxSy2QpfrEujRAHpC6KE9uB4M8iJdJc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571674; c=relaxed/simple;
	bh=3DJAiPBLtnl8Urn+PIlflgyFDumnsqjD151UuFWc3mE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dr/s1qLma62WNUGn8I+qFY78NPhqejmvDhnuB7h4BLBlp6vEtKCtq/J2JHaXSk400vSNah8BJgfET3ZpV7RnCMNqJdP7pVFO/trljjv89f74gc8Zqme0TSgL4lhOY+uU7XgX/RfFVaK2Gh0i2m+mSlA7of3gm1/5+WN3UQi5f6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3a90pkt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f761461150so58272101fa.0;
        Tue, 17 Sep 2024 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571669; x=1727176469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvKesWW0P1em7NCkwV+X61LcizJYLoAIblBeFBNllk4=;
        b=N3a90pktpoatUS6XEykB3udsA6ENseB9sR1rQK8p1Lc3d+YUKk3QDmrf718qv/F0VD
         BqnihnN4381ltNBNAqwBzZYrSnNGd9dENI6uzTEVYYp/DbPyk6EO7VzBQrPeTHVnYheE
         0TTRk5kyisLUf+U9jTIcuPateoGbKqxmKFMsBueNJMVFVQ6lzkmTh50ePfcPwViO0+tU
         90bvIg9Hfr4NNvS7IYYYvrpUCbmxjxJgm7s3F6QxY3kQ5vPkhks/07yaZUbv2dcALEgn
         Uq3vi+50gAyyuELOo8WXsG2ocSrpovdBomRf7HvD9wbeNE2NAbCEqoIf236Vv4QDqzwK
         5zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571669; x=1727176469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvKesWW0P1em7NCkwV+X61LcizJYLoAIblBeFBNllk4=;
        b=rjsHsdzvDB955VlWTvAhaA895f0H0Pj6aQmrlhOfozZKPfjuzpFOYE4icT25yusMfE
         vzQyJgZlH0ldpwaoUsOPf6PDtlB6EBMABgF5NBuxXMIW3pK7oZQkfnV56hKGpBe3mdQU
         reNcH4hNr1QFlaPMDHKfpM2FWxSOV0Vz+m8HzqvL+DC6MzepcWskZKJTAykHf02TOY4J
         FNMK16kwWdg+NeLP9mRUzYro2nSi4rsDFTxLMk3ZxJf9AO/UoMMb/Sg2YWJly68Pz4vy
         6cQ4UesEqXKawZiRex8RyU5wxcFodrspnnEhKwp11VUYZri3PuVLULlqo4yez47Kzrdb
         BgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUayLJh+QNOO2RYxGI8/NfJ5eqwJHef3ZQWdyQ0Re0iOh6oUlwimKqHFBchK6RF5BLJwlJzWu5GVJI4nxOb@vger.kernel.org, AJvYcCWqGTo0dHec0Ep+EcE+W9T6y5FIqC6xVTzvZM+PI/N01JNm1ul9+1EleA21xZTYdn/sYq2wV586eGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4iH9HA1gc7s+p1d7VtQAcZ+IGb1a2+A7kLMr75KGvllo1A75L
	A5Q5zPbTDee3HnSvtcBYoart8fGPgIMRlSwvpWPdHQoB1RyEsK4y
X-Google-Smtp-Source: AGHT+IFVz8V30gt+6XPI3+b37Uj2JukhYBxVQOQOulgj09e9U4MrJkGUCUbhq/3xNdBr0UJHl8Y3wA==
X-Received: by 2002:a2e:bc06:0:b0:2f7:7be8:fd89 with SMTP id 38308e7fff4ca-2f7918e52damr102360211fa.6.1726571668472;
        Tue, 17 Sep 2024 04:14:28 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:28 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:18 +0200
Subject: [PATCH v4 08/11] drm/msm/A6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-8-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=2531;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=3DJAiPBLtnl8Urn+PIlflgyFDumnsqjD151UuFWc3mE=;
 b=fr59RWAnGDAY8SCsakLcWBh8Q+uMphqbK89CTU9utXhQNu1lI+FNoirfGlK4YlGU2bCC8Uz0g
 lN9GOOQ0gKKD9ATnHAGDZS/OyMak9dj6QjICMQJcvUUw+dBkuS83E+R
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add trace points corresponding to preemption being triggered and being
completed for latency measurement purposes.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 77c4d5e91854..4fbc66d6860a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 /*
  * Try to transition the preemption state from old to new. Return
@@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -295,6 +298,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->restore_wptr = false;
 
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
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


