Return-Path: <linux-arm-msm+bounces-32784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783F98A628
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC1E1C22685
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD88319408B;
	Mon, 30 Sep 2024 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZyHH1Ht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F30193086;
	Mon, 30 Sep 2024 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704379; cv=none; b=ELr8u5ns3Ms70q3HtfRspdnTOB0nohenOna9RdVk0+IpsMYP7LpMNorxT8uegF3FW8fNWQPNrkLgmnaXNsbRIjYHA9pQh1tLtPFxNHlCqGnCw/sSvQp2Id82VaAA5s+LLWjj7Ptw5qZ0lVqc4dhksJpRNWNNKIxP4ZK13ZqJ5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704379; c=relaxed/simple;
	bh=ENWLkuWoPXJbSCb+Fdj53Lnk+HYvqRlKgvKGcqOgUfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hw7TN2QW5P8kHrw12z2F5vQBNRJIhDManst+cvTtx/2YRqReT3NKDRZ13IQXisVOgUUbfBki/I7HXwCJpdN3nWYzy0ltAtPlnCMaBwGbHboaKFhtGsQGE9YJmH0pjgjqlFz2CNyHVBQeCjFLRfrbg9SOc/BxBoEkbfBkw/QIEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZyHH1Ht; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2faccccbca7so9806571fa.2;
        Mon, 30 Sep 2024 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704376; x=1728309176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
        b=PZyHH1HtWFHMCxKEmNQ1Z6EBcCeupruk0aB4WEEyivOS4SwGftLTZvyKo8Vu3icYRZ
         ovG2OZRCHjJKlnjw6G3OquIpPWjz8+H4r+dEmfSTPEUflqnYQmzvKZroAuLjmpoBwfkS
         J7B5uSnlFOXKhKnJVzdHvaBqKoKOKXKGUbF65nKuZnyIMkqHOKWrHN6IeYcA1zi1K2IL
         Ku8FcTsBE0NfyHtj2RJzV9CFMTfMtoKeHL5bPsE1dSb+58D3nhaWZNHv/mxBeRNbcYgA
         +RsRVYXM6OmZX+O/XAJpbeyiAnmu1LqD3z9mADAhnsJjk89jpB5bGvSN+SF13j7q2qfU
         +k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704376; x=1728309176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
        b=sQK6gVPNyDEjHIeadhWg5Gvpjo/elLFtQgGVMYbXI5LfXFRtIUBOHXJpUe+fBQ+tPS
         Ad8/2mjDDDQnoy/4HAqwqtvS+TirKlBtd/2uVPFgzOm3/nruG6YWt54EqQ04Z5H29ZdK
         Pm1z7PoMat7L9mZw60UJh8pQXKOyxvWdrBA8VJbafM/nEcqmevydVTpEo+POtYTodwAq
         cyBLTEPuIPcoP6ylKeWdxQNcm42KmGRq8qVbCOgAGrmY8tR/OMiKLnelPWvPk2TcBAKL
         NsXwDZdY3gaec++4nTmdf9vyfaGY9ntx7hSZq23tu+4YG+ejWfxaKcMw2WrvxMK6w8v2
         3KDA==
X-Forwarded-Encrypted: i=1; AJvYcCWCvmxBlU71l45/FzQr5f84snkXVTCt0tDLIDv/94PjCYxyXUX/6QrxTepRgPJ6FpcjPUAq/T6UthDyGzwl@vger.kernel.org, AJvYcCX20sb901nVCeG9/fTu25OaJkPaRMeEMW1tVJebX8Xjen/ucuSH29uBXwQdCiQyxoLS308CFbQM9YI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1cZ9HGt+DKIGzN1Pxjfs+NZ4mJZOWBboklXZWkF9VaeBKpGr
	TtZMfWRu30AQTopcd2ov90SnwvTYHOPkKeSwERGV5U3tbh3VmFLQ
X-Google-Smtp-Source: AGHT+IFGoAUxFpUzjzZ69ApaiQy3fDLllDO8bezutMwJp4UWdL4qWG657xHrIpCGLq+qaUajJjeclg==
X-Received: by 2002:a05:651c:515:b0:2f7:7ef7:7434 with SMTP id 38308e7fff4ca-2f9d4199f7bmr61081891fa.37.1727704375606;
        Mon, 30 Sep 2024 06:52:55 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:55 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:44 +0200
Subject: [PATCH v7 09/12] drm/msm/a6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-9-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=2885;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ENWLkuWoPXJbSCb+Fdj53Lnk+HYvqRlKgvKGcqOgUfQ=;
 b=YFNzopmbpd1O+q/xF6aa6raF65mgy1NGwKXUjMhy8/KisJM+QfjmUhzMAkzGb/7V9XI9eNERp
 w3P5xXPjk4xAD0Qn+J2dhezifH6qeNukKOXWU5SEDUze8v8qpjpH2Mg
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


