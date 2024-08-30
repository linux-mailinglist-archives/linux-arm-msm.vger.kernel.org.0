Return-Path: <linux-arm-msm+bounces-30270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D229665B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7B21F21732
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB8E1BBBC5;
	Fri, 30 Aug 2024 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW1hJsWD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED6B1BB68E;
	Fri, 30 Aug 2024 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032007; cv=none; b=mCJp5OUmc7pLd4ulp/XIwe5Fn1/ApT0/fLi2Vao0gJUmHlqU3V8P8gyLGkZ+FwOvOpOapZDcoB6t/amgRjr4uY0K+jhtrsK1oTmXqylUsCo894YS+MU4GU8WeH5QcY2/rCeAvSdFMld4lXV7sd0jlYfzFcf0ncRtx/FlJWrS57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032007; c=relaxed/simple;
	bh=/bmgkVC8rwc+TKtP3FRRWyhSKs+gBwS10uVvQNNUJKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNlgpjitQdi+SQ7Mfbbnr6LnrfxFxRZQu1jIgIcrZ2MbCxX8QWK3Xo7YViIXROh6r03SoRM6aWTH36VUv7107B2BmARpXfvvhqTmITwOYMtgL1Ysbvp2iZVWz05qmnDsnJnf3enezeQv1hI4/3E5g8k3C/bnLT+FcFrYyaT/WqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW1hJsWD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86e9db75b9so211144266b.1;
        Fri, 30 Aug 2024 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725032004; x=1725636804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onX9TgMztS+AtRtuVAlzrC/CqJy3l7QYXITQ0rkQ9ek=;
        b=GW1hJsWDPmgoyhX7wsNHxFS/8UXJA9XvKFE7j3gDKRNs++q+XGsjOGeWb83Gj9nUCX
         9HP7R0MHdd1bApKIR/sV84tezKenlaEsxL7bU0fTyLKmpQ48LtsHOIotLQObQI7z7mEQ
         0kfyXviN5hjbh+DddKhNzeHMwAbwZj0njK/vMpqNli/WbAfKI/6245ynNjKlzARtEMYX
         EGp3oX+SQKpJPdHbphEN9fABKJwbXJcB7I835KyxUi0mvtdQuEteAiHlX/LPsQfk/n5/
         zvXgDF1g/Fjg0tKxWClV7HOzfSs9Qj2nZGo2+GIqpP0PpCa/2zzt8N2yBdPrGsiyTczJ
         UnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725032004; x=1725636804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onX9TgMztS+AtRtuVAlzrC/CqJy3l7QYXITQ0rkQ9ek=;
        b=tU9yvkalNzxao9M016htkCphFa4mBHTveYbA479cI7NosUaX6ZcEXIy5IBacCNNu5c
         cM7dwGkwKwhcGcOYJy+Jrl8WQtN6i68Vc+UexhwFxrKePTBlZxX39lCdYXFoF4KTmLUm
         dxUMuoBUpIBjQajVqIuElCeczICkyl7Fe3giaZES2+6kyrs/zg9rM87bT3a+QYX+f5d7
         cwCcfcKIFBqSXHtPDcBK6m2ZKEvhG0Y2PfDa+NBvX2XccFMh6xRGZkaiSE5W4rSDRQkE
         glra//uJm7SuKBvDclFk333cBxMSuPSwGXYGjnEvSMwuakrSAXlKbnWvSo18pFSEZNbI
         3TaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrrxjSGKGeSTABBKJdRBnvEQO2tOJjFyWFABIu/4AjXUky4HtF1nIwoCq7ZqXdvgLDelhuHdapkPFzruo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL92HPthxxDbipbsLdw0QDAM9KBTujAxCzj5NThBZZrxjlS+jy
	9O3mhrZ3ZAa3Z8bpzwShnxBWDaQ1xP06cpsLBF7OxSHouS6mGUMcHzP8b2sB
X-Google-Smtp-Source: AGHT+IHB9ZPg55v/n2gXnxLNAL/25EVlhOMMgf95PotCactG2GY4cOFnR6rGlkPeRCLnJSMprzu+9w==
X-Received: by 2002:a17:907:7e92:b0:a86:7c6e:2bb9 with SMTP id a640c23a62f3a-a897f7892e8mr585327566b.2.1725032003525;
        Fri, 30 Aug 2024 08:33:23 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:23 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:49 +0200
Subject: [PATCH v2 7/9] drm/msm/A6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-7-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2568;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=/bmgkVC8rwc+TKtP3FRRWyhSKs+gBwS10uVvQNNUJKk=;
 b=cNQ1g0uB3jnEUtvQCKAHkyBnle3q4/z7/VO8HWkhRDPvCwPMksowqk5vCBIKbaf9+iaOyecmo
 zVTGu+CSJzLA6JWM+asHnoTbbVZ9rwCV4exkmNVQmBQSu2wv+naHf6k
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
index f586615db97e..bf05f987d3a2 100644
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
@@ -259,6 +262,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
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


