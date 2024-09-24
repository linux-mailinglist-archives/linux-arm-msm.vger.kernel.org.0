Return-Path: <linux-arm-msm+bounces-32284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE529844C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00209281FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAAB1ABEAD;
	Tue, 24 Sep 2024 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjH7RS/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02D1AB6E8;
	Tue, 24 Sep 2024 11:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177456; cv=none; b=Hdn/ctqlcLREMHF85Xhsvw9jLIa993ZGUTUofXZFtYWl9mZgU+4Zh1Ii3R1oLaW1l9YlKqqpjDz7stHKKsaRfv5PmPdDRO3IaBWyGfOlIc6ETkgb0A69UmRhIU8mESXfJV/LTNmhf1GxyLMxJ6ME4OjtWA8WRNKD5YEwG4DCUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177456; c=relaxed/simple;
	bh=e8NI1sPsjgdaczPyb6uHIaB/U/4w86fcwHEFY+OeNMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZ9+pBoHcOnKM48jf3dT0te6tgWCsQSEuncyGeG0Vu1AxtHUKktIBVFzrCr0z0iNV2RCyVwpD6eJczksoUV60Oagul71e8IEOCG4kp2kh9VsTUplC4kr8gudNeq3aiIqICvLAeZkmDz79QZgN6aWcaRfULvefvvBvdJLrbUjPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjH7RS/O; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso489480866b.3;
        Tue, 24 Sep 2024 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177453; x=1727782253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
        b=bjH7RS/O+xtqQbUbyXWTFMh/HQKNEw6YRxl1So8eSn6GLtwWTtB34U/J8+TB25iPZd
         R/Q8/IIUR62q1LY63hKJu0VIrSgZ1oV+KO5edxUdLALjVEzLkeHCtDopwqV6XNd8s6/J
         edcHl9Mx+t11S1TQp/xMg1dEZwOzxPo3Os/sTruXMFobHKjlAzJnwNFcve8wvieW8w9Z
         nyBdcOFXHhUp0g8UcZ8Hzwe0ocU+CSYO2VzH/FUM4pIBKXx/h6SYG1aE2/xU2T3tj3DM
         vKvuExHWtduFdOdNtlJF+iuoeS5Mtbw0rVbNcyBvAM13wvq2o1jPsHI8/6aw6VO4j/XK
         waCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177453; x=1727782253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
        b=kr4EPrGeiw29SQxcvNZO0nffN7zLEn11FrpkvNc+m11cnfppYuSDLm1lx1lRaeVuKj
         yzODvwjymJAOTY2prfgQvSAztsorzsXHg/2tQe4t9x2Tc0sASu29m3EhN7+HbeL2n7rC
         px38RQYDfMNiQROi3YUFbELmHEd2CIRzFf5IsnqsRdIkVfWyyhbz5FLHXbiDSUAYS66m
         9z2nzOvvsLuzkCKBzK2jZGuzL3cguy9eq1xwSYJaOaomF5G/NJJDzoXK4DdcaoDPFSHV
         er3gTVeQS8ALgstULWM3CKtDVfIBVWBDcWwZBaDLigKxBIYSqJ6NUxzbdETkbN+0GFh5
         cM5g==
X-Forwarded-Encrypted: i=1; AJvYcCX2VFSzH0dunQNY3Ktlhglndgkw0U8MANOD62gSgYMdckkissNhs+Wui7s7ntji2u2435o+X7qKUDA=@vger.kernel.org, AJvYcCXu3M/AqnWU6bvKlfqTIKt7zXAYOj3TaB/ToQ3WxYih+oFJNMU55uADi7I6JuNCCEaXScN/FSUZok7WqjGX@vger.kernel.org
X-Gm-Message-State: AOJu0YwZiIX6AxvEmupK/pYL98xsZDXIzp3ZqHwzRE72k48ChVs4OP/F
	GGznXiZWCpLOilaODqLcfZHZVNfxeiHGgzzzlE09nE3DXzYJIC/o6YKVfxL0
X-Google-Smtp-Source: AGHT+IHQBo0k9Sv2Yl2rMpaMsnAE86hTAwNupBRmv0/SY5Bzs2msqLq0LfSee62mPHG/7tB3TKfgsA==
X-Received: by 2002:a17:907:c894:b0:a8a:822e:44c6 with SMTP id a640c23a62f3a-a90d55e1025mr1581092166b.4.1727177453088;
        Tue, 24 Sep 2024 04:30:53 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:52 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:43 +0200
Subject: [PATCH v5 08/11] drm/msm/A6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-8-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=2841;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=e8NI1sPsjgdaczPyb6uHIaB/U/4w86fcwHEFY+OeNMM=;
 b=QCyhBwbISNJCKhTR8VJ4GsTt/NhlYeXaAt2E+ICoHh44vuNC41Voq60skiPjufx2xQy0ome7o
 a5eWFPDFlZQD5YqC7aKnUPs/2Twq+AEEFg0k2bPzl4ZE10XW2tIzVjs
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


