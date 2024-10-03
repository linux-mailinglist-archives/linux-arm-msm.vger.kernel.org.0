Return-Path: <linux-arm-msm+bounces-33036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21C98F3F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9B56B24126
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E8C1AC443;
	Thu,  3 Oct 2024 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jnrhce1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1111ABED7;
	Thu,  3 Oct 2024 16:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971997; cv=none; b=bN9DhdkTaUkCC8CoJQumcufrIn6flYKeLcoLIfnt/mbuNcbbKw05A+2BUDxVc3zQE5pkTtqWoWIfOjhJQ7g5hZ7hZwYpO7P6IqlBYBd/R7WSvlKdNRCToBVtdfs9cvEspaDmTvaQbwKnN11haWOMwNsfTvW88aFr8+H2vQIzu+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971997; c=relaxed/simple;
	bh=ENWLkuWoPXJbSCb+Fdj53Lnk+HYvqRlKgvKGcqOgUfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocIwEWJjjzZ7P+zudCZcoSo2uuZ6ACIDIowrBhWZuXVxkynOx74Tkb+/WvLgxfq9eKbb9iwHEQyyWQVwxJK+JVfFtA+/A3pAjJBZdQWfKmzv+Yi2BpjGu5BHKUKJuOnt8GyX4kfn50aHzL4Eg/HNId68a5xUutiNZBvtn6fFNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jnrhce1T; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fad6de2590so20490221fa.0;
        Thu, 03 Oct 2024 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971994; x=1728576794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
        b=Jnrhce1TmcN3Pwa4xUMXBF5Ae28tPMuUbQtD6U19H7EQn+Rw6Iqp64PSOOu6e9mqR0
         pH0D6UTyANC0ZwacYBkdhVLHC1/LfBlgS/hU6F38YF9FWwVWjjP+pUbYpTtNDPVdu6Mq
         1QMZxLzjEUb3TG7A64qekQOj2reRzkacLZXOPV8Hog6oJ1PNZ7QcD12R6vb9qqhpyy82
         6W5dolZeYat83X4GY20fpJXXYBTsUluooGXPkL1hUkjD07zLvQcieFyOzg/uNmGcH3i1
         ETLylYgVTNZTTJVl+c5PLlU+IXsv5xIfOH0riXDX4y7PrWuk4lOeMNztzpwZGGTs9TTU
         r54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971994; x=1728576794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
        b=A8w8PihBSIHqa4iSOX7UNkvXtPNrOZ74YREqyDQp/w/XUUmg9Qidug8ZcMWBd69dja
         rESr7Fsci0ESSy2EvfG5aUEDvo+IF5m8Rv7qK1gYqUE4oPcbMD4+kWvxhQfLxQTZqCgQ
         pEwgCftl1vEOB1eeRiE8dLO6bjaGsLebLJN4yziZ3IJNyKX9NCzWRStEa5raULRG/KGX
         X5kpejlkHD04NSi04Bv9fM++RoFerU0RVrUnrO5v0bmhmZcCBfOy72eC8MFLfNW31brw
         cycJTmifQZ7KuRU0if1eTFIWN/THdIevbj4PD7r6kW2KuVkR6Y6zIoKVqghTkwuRpd+m
         Po9w==
X-Forwarded-Encrypted: i=1; AJvYcCW5kEaXW0Llglsx71RAedHRSpE1dQxu9am2NEtkRWNIatoC4UqrrHHVxgMc5SkCeB83Fq1dgVPzEo8=@vger.kernel.org, AJvYcCWoiDyQsQuPJijw9n3XSGH/b/TP5IwLV6vzyuehWNFo86bysLqkY6050kZEwOB/Cghi2PuxQYD3HOFnPpBX@vger.kernel.org
X-Gm-Message-State: AOJu0YyrjBB4bmqha58E5JfvFm5qM7kdWLf+hJA96HKtIDDbPUZEe/3a
	GNGGwRKniMsd/OOt9pqC4etv9E4VpzJFk9d7KO+BAwjTA7c8Xpmi
X-Google-Smtp-Source: AGHT+IF0W5cRRFhRz/ah9lJzvn2RM4GExTrptijifL3rkfJYDQHgNksG3VO3zAeIK1oRD98+oVW+YA==
X-Received: by 2002:a05:651c:2105:b0:2fa:c0c2:d311 with SMTP id 38308e7fff4ca-2fae10226e4mr71691051fa.5.1727971993806;
        Thu, 03 Oct 2024 09:13:13 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:13 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:58 +0200
Subject: [PATCH v8 09/12] drm/msm/a6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=2885;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ENWLkuWoPXJbSCb+Fdj53Lnk+HYvqRlKgvKGcqOgUfQ=;
 b=BYifA0HCTnV1SBDxv2uh5cnFadSH3IylIrgK3MlTIoPv+MTNomU2AFUL2B3A7HFhIry6Q5KwA
 JCATRofw8tQA5WX6+rltgPYxwxLwlK4ZT/kfbTAGII1h6IdNjgugnHa
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add trace points corresponding to preemption being triggered and being
completed for latency measurement purposes.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
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
@@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->restore_wptr = false;
 
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
+		ring ? ring->id : -1);
+
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	gpu_write64(gpu,
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc4578377b03b4cedd138c87144997e4..7f863282db0d7812c8fd53b3f1fc0cd5635028ba 100644
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
2.46.1


