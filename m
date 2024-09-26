Return-Path: <linux-arm-msm+bounces-32616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7C987A8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06194283EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8098A188725;
	Thu, 26 Sep 2024 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qijhq5th"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC0188707;
	Thu, 26 Sep 2024 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385432; cv=none; b=Wj3Tl5wtlwrD6m6056XN8A2I7KlLy4Arkx87IMMEjQwHx4N1H6lj6G9trs1cICZb8bNbSbMfgQajP5m1RmGQC12NLfBcoIfbMblidW1hx+qFyd/JYVSVKQq6taznVw83ARG90jpvnrm2gsHStJg4ou7M43cuwz0kOtz2gzb2hd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385432; c=relaxed/simple;
	bh=e8NI1sPsjgdaczPyb6uHIaB/U/4w86fcwHEFY+OeNMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O343iEQ++OGcKcSAkaMJOeXTuhR+c5JOiOSywlnU79mulnh45/0KNEhDcVEpxlD/5SIuqgwKm5Pz4QbjvmscwLwXDdJjyF2OUIogQd5KjDodNk+n3yQE7LCtvDC4tA58hM9Iy7c9ay92Ya3JkcJTG8C8mpWos6N8iVWljSByGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qijhq5th; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365a9574b6so2431058e87.1;
        Thu, 26 Sep 2024 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385429; x=1727990229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
        b=Qijhq5thpObWR9y2unGfNvacIGmBrq6CwjL+LyvqvCvsXedSaJTQXXoe8zHHU10rmW
         pKHaV8/WoZvyd5zwWqfTXpr32ry308iJt3o0VinZF+wX+v7mnpyJe8K+2i/CV0ICgBmT
         pxQgupHpxojZKF5u4A52yyQPbbnwy5zSCaJEN7jgDI6C7Vwn0s/H9jT0qGohvzyMqPBV
         njCei79FwEAUs3jrQZPaC3BSPmTsaDi9UtxYJau5B99sHMxf8f7kU6KPWq4s+Vi42Yjl
         g3ASjlwDUnC2w0LNmEam6q/1U9m71TRNG9yJAzKZer5ocpVxJsyUqzJd+/6R/6XKyQ+2
         DRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385429; x=1727990229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
        b=YWpIgYgPlYfsYbyhQmtBkoeE4iwofgoPTGHlv4kfYMbG+JmIyYDGlFeV/3sx6hPGPB
         mV7ufrBlahSQ7zUvtuMuPRS49lvtEYUga0GuCyfKdankB75INqSJTsLyPsMKqBm1A5LS
         nAK+5GsZOIJsvvbGqWpeJhkrQHCtYgIIaA2AvPAZcpyd1mXrAJdA+kCahvUvlWVyjgsf
         +/uveNwwjXAa5wDSE0BAhtWtNY9ObW+ZGAOiDryQIb99lhk0mfrbsVyaA4pf90YKze+U
         QFUm+BtgN3XC1wYFqQQqmK0nL6ppmK1VJU+95uSWLDGCbflmtG46vJ2wGIXrI1b0AxSk
         gq2w==
X-Forwarded-Encrypted: i=1; AJvYcCV2DPjRgDphpPUqdzhLsSRrhzzy8VParoIi7prFAMYZ4eGOA2CnUyGrKOd52NA2vT+KQQMLbmlfnFf5BSCX@vger.kernel.org, AJvYcCWdvVzIAAmC82WIppzWSMeCU6qUcP0Fakvb9le4fHi8V/tM59HFtAUSjZIqPbhhRxSlB3zzDcSexsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFnFOq6s7WNYHgtx3ph/0Pg6TWJU1dKkncAkR6RXtbEJyGKchA
	2ruQW4fXOcXODU4GD4wo5169Nct2goc8lk1qSpdfkbllCuYG4Efi
X-Google-Smtp-Source: AGHT+IEwNNAB08ANCNV/wGne7cXNeEle3eZUTerFEgNElbRY0pDwuztkgBO/PdeOyRc+y/ceeL3eTA==
X-Received: by 2002:a05:6512:ba4:b0:538:9ef8:882c with SMTP id 2adb3069b0e04-5389fca4542mr893746e87.57.1727385428334;
        Thu, 26 Sep 2024 14:17:08 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:17:08 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:50 +0200
Subject: [PATCH v6 08/11] drm/msm/a6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-8-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=2841;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=e8NI1sPsjgdaczPyb6uHIaB/U/4w86fcwHEFY+OeNMM=;
 b=L/zsrWgyQ1WUnaU3njAXmCrXvxP69203oSucaP7nGVBVx0l5AGhEKUdnFZCCSDBoqOFudrkrd
 jhgMiTIYQf0AvgqygoRCcg50ZBqlBdswFhB5qkGr62Xg9Dsw7Xl1ne+
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add trace points corresponding to preemption being triggered and being
completed for latency measurement purposes.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index cf75f612edc15374f3d8238e3dc0297532569607..ae471a572a7100d8a3b86a7eaa0dcbea7a728fb1 100644
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


