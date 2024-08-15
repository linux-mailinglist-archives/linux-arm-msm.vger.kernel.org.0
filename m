Return-Path: <linux-arm-msm+bounces-28663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACDE9539F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5B5288BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B71E13CABC;
	Thu, 15 Aug 2024 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWc5pXyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4226671747;
	Thu, 15 Aug 2024 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746467; cv=none; b=dKajFnHbpZIU/yur6WfjxYtXmIwaPXNWynFtCjfIHl55UTYWytrJJqxAaVUcLDN8YN7cGlhDbrXiwJqHo8Di0t9Ax72rR7nRLYX7AZnL+Js3YkryHgdVECom7SL9wDc/fX4Xw7AWCz/vOdpNgji9I+Je+R746MSaF/zwHpucqF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746467; c=relaxed/simple;
	bh=DLafHpP62zkOHtSD80kKPRoUh5A+Qyukl3VsQmH39Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9wjlV+9Y2+vQMZb5lifnMlUq616cYAdnaoQkzDqx9mPt45x2KZ6/U829tKaGUk4loO6+iDpIapz4dBf8WSoB4H3BXNlP3cLn2rR5mpXXDIrmdo60hei8C7aO+/IXbt1Aad1QgYKu0NIqujiKo6joGLue1Z8FYORxH9hUl9QiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWc5pXyT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a94aa5080so144600166b.3;
        Thu, 15 Aug 2024 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746464; x=1724351264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tg0KctwqLqyFAo+4ao7jjZ1lcNMm+hl+ZjYOpPS5yMA=;
        b=nWc5pXyT2QYkJisdIenTy8dIDLAfgxcSfe+xGZGeyta2LQx+h4R7r7lIsjKMEKa7lZ
         39uAFt5n0godGa8buBmL2HQHe2lJmu7ORbD4bbvrxzpw89c3WOwjzSgFLhPK8VYpZYI+
         SRi+kjg3s03m4D963gXJf1tWgJ6IrmB7n+xdpfbvrVcvP7zcpSyItOfg1eRJOjEXbERH
         XRGwO+NtF6y/Xg9aOAPLjfOdaeqXP6qt07ZU7uq/JZUTyvMpraWlWexVjVqdOkA2KN8j
         P4k+6i2mkieeJBjd/OjZ7YSFwH2abMsslqHPRQzlkUKRt+YIIgQ+hZcx/ki4uHse8nvu
         F6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746464; x=1724351264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg0KctwqLqyFAo+4ao7jjZ1lcNMm+hl+ZjYOpPS5yMA=;
        b=NHHRMakWEFQdGDpvM565loacYKTrU+0U4dEnQ7fLdQLrhoZN0GghS8Kxlp4vADOuQb
         zg/K/RufjESx+SPU5OEFBZiJjBx4u5XXiC7+iH7kcTJRwdV13bxJI8XajAfS71gjLZIc
         LsBFjf/S/8K2IIZgcBSCi56e7ytJkRNRlZVEp7m2RFq1BKwcmZeeh7Vnb0WKFsvBsItD
         r6dNbuQwTLlHAbMjC+0hlw0sZjuiCngihRpr276R+EJzyp+IKSX6tTOcCc8v8fb/N3fG
         tQIwL098+2bsWA1/8o90NYCvyP7Z97s9Lvp8jb9sfJoojrz2BWvdakuFPitvaGxaIS9m
         kh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC+97SGPNLLl7AkhY9pJ96tTZgqR7ilqd3yoSYDiG560TBqSOXbr4tA6RI3UYkYSoLLrg+Xe048o+Ss1aS8M3GwNZJINOPC9n4SOpO
X-Gm-Message-State: AOJu0YyOlsNoR5vVcL73+7gbUlq8O++PvdYwr59XQfmMIrYmz1PYlr/J
	AoyrGm1UikFSm1EcjN68lwmQuMm7gGu56Ih8T4ruQZNlj+/7l0LU
X-Google-Smtp-Source: AGHT+IFx/oFpTN7DjKnoRNWugjy0ykwyE+NteAI/sn+WwtRauwUVB8/OZuWOH38vkF2aAbfsnprrYw==
X-Received: by 2002:a17:907:7fa5:b0:a80:aefa:14d3 with SMTP id a640c23a62f3a-a8392a4128amr36267966b.63.1723746463495;
        Thu, 15 Aug 2024 11:27:43 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it. [79.35.172.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:27:43 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:15 +0200
Subject: [PATCH 5/7] drm/msm/A6xx: Add traces for preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-5-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
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
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2516;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=DLafHpP62zkOHtSD80kKPRoUh5A+Qyukl3VsQmH39Qc=;
 b=icdUKlpDMF2mVoh3JZqkgkjybL+RiUKZ0urWvjJ6sWmpBaEiMn7wHC4EkTZSN3u+1onK3gsCs
 +k8jqD6zTGCB/NV3x/BaC3XEyt+3NzIBzDusevWF8bGcHALiM3hTXlS
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add trace points corresponding to preemption being triggered and being
completed for latency measurement purposes.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 0d402a3bcf5a..2606835f3c6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 #define FENCE_STATUS_WRITEDROPPED0_MASK 0x1
 #define FENCE_STATUS_WRITEDROPPED1_MASK 0x2
@@ -146,6 +147,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -262,6 +265,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
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


