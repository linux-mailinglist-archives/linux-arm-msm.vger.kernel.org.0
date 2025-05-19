Return-Path: <linux-arm-msm+bounces-58549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1CABC6CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BEA11B65988
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D62528ECC9;
	Mon, 19 May 2025 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhguchGk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3C28EA62;
	Mon, 19 May 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677534; cv=none; b=tvTRquT2qyEwc/fahMyH0uu7LteCEL3cPGTnRVKt8lTKMg4kVymWMvwGiCq0I0XF1niBn8+T81RL7zV6+wrbyCTDFXE4vucTPcgBgEx5p40KY6LI857dEezsm15NBliQdm+G7TrPrhykSrX7Cf5D5vxV6iZwrfOARxcI8y/mYNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677534; c=relaxed/simple;
	bh=C9zlyB2KOAVgg++Lt92d9JRcxin5HlXVkR/UdSjceQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYGLH/sERklUmweC+JI6Ha3U+vA0v1VzYa+NY4qC4+VNA1xpUixvBjEW7tiUebD5uz2nW+rmNe2s39DYrscc3NxcaRH4RXhQPkY6As8g0NoT3cOkGFx1qovOuyHUYZXsF4PVYVkERM7RcG6txKOIzfEEa61ZZTjwOParki3kzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhguchGk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6068054b3a.2;
        Mon, 19 May 2025 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677532; x=1748282332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
        b=EhguchGkkxVen9w3pxwD/FrD5s0q9QepH2267JC7kcwI+z7fPCX5gKvJ7kTFN0eLq7
         Ip0ypoYIp1x3ZNUasiOgWBBydKSQ0Jm2ghp4wB9tv4lvZ4W5ESNOaZev3IqCgj8BL4tz
         AZ8M6EitA1zN+Q5cD0AalI73BGEPpo+qDijX85NEX/9YX9mVkaFZkHPYZD/MUJUJknQm
         5YoEKCiDNG2YsdHqevuQRS8Jqb/dSNxgtJDwCCF9BrsBuFjvxrYiXODcgBzjTX62wlbj
         S1kkdmHkcxjjLJCRqVcaWblwzy1sQSMYidOEWJ4bKQMDWO7lRkgiNALj4va/GpzMUp2h
         w0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677532; x=1748282332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
        b=aqP0Y4iQyJxDSFDMoGaq6Sow17z+T2PzGmdaC7aAY+JkdYes5S468Azhm3xADNSatl
         M4BOPhBsxsVMHv1BrKynV5xEkI+627HHMSdyK9sYzqo+BEh5KTguuxJXMEyfRQAZqq9p
         w059C+t4YCInw3uqO7loq1kYBUcHxoUYoi+0x9bTlONbwj9PsE/POMeaQegGG0umiaAk
         AaiclzOJB6B9zTPBeK9XfNmeMkDibDD5fkbmrD5i21hVhA7WPa0u6ym2aqAoDVUxCL/I
         eP1BxjJjobaCldriZ8S4BOzFKMNoBMGiRpm2ll+aL/l21FbTJWJnrVZD02A0q0VvX4QY
         Xe0A==
X-Forwarded-Encrypted: i=1; AJvYcCUeXuFuYDiUOXk4uGHQhQQgE+Go9bqVHr4UACuQtsfcOl+dAAQy2fwqyLY5nMs18je629fkc7GMQmKVe9jx@vger.kernel.org, AJvYcCWRvi3nFQgEVHJROpau2PJwkkHV4bjwmu2q0JwX64pWlUo7WGXPK06FTLFsHGWI4mqEtwU4IxtE8gAIZnRq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8RaCjp0RUJo6QzZh2OmAoDQoso1vWvlt20Nm4obqnuI0MkIK+
	uL3Hr9WSoDr5c4UJ4yeQvy/yxAPKqcnRNuGY93gZQ8N0h4PJBn1P3PiM
X-Gm-Gg: ASbGnctCuEaBz4KTpsL7g3pKmSgFj7Uy4B3q4KNNTdPtdLgqRjP3MQg4TTWx0eQemYS
	+ra8cQQJvc63vu+zS1lL/SZvp823dekztXJ5nV4aA/ksPHMv4G8W1z3kx3dAtcVfLqPVdrPybES
	qWIJ67gKTDjAQE+Xv1xSFxi1jPdXuEWl14eNFiiYtdAD+/NruQns98uH4yZDrny0AoOiEUKX8DF
	q/+M3McfWfgObKk4ZO7qXrqLxMK+X0bNCD8HsELE+ehcxKvrbHZEUzKK1vOsyURd8Cet3kgkLzG
	xWb6K3V/274SFRLaN80r/q0sLGdQdISYeglqxJghe40pULHFT5KWduHSm7bGOowHIBsymyLJGqD
	dhmEHQDhHxceheCnk0hgOnVjm3g==
X-Google-Smtp-Source: AGHT+IGRr3wC6zNEkbbZIOqB63IqRXMNCh4mPcpqHYlPlc47+qmcazwgSDB4ccUJf9IGlUSasHlnXw==
X-Received: by 2002:a05:6a20:6a2b:b0:215:dfee:bb70 with SMTP id adf61e73a8af0-2170cde519dmr20916003637.29.1747677531712;
        Mon, 19 May 2025 10:58:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e28sm6726150b3a.139.2025.05.19.10.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 38/40] drm/msm: Add mmu prealloc tracepoint
Date: Mon, 19 May 2025 10:57:35 -0700
Message-ID: <20250519175755.13037-26-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_trace.h | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c     |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 7f863282db0d..781bbe5540bd 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -205,6 +205,20 @@ TRACE_EVENT(msm_gpu_preemption_irq,
 		TP_printk("preempted to %u", __entry->ring_id)
 );
 
+TRACE_EVENT(msm_mmu_prealloc_cleanup,
+		TP_PROTO(u32 count, u32 remaining),
+		TP_ARGS(count, remaining),
+		TP_STRUCT__entry(
+			__field(u32, count)
+			__field(u32, remaining)
+			),
+		TP_fast_assign(
+			__entry->count = count;
+			__entry->remaining = remaining;
+			),
+		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d04837461c3d..b5d019093380 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/io-pgtable.h>
 #include <linux/kmemleak.h>
 #include "msm_drv.h"
+#include "msm_gpu_trace.h"
 #include "msm_mmu.h"
 
 struct msm_iommu {
@@ -346,6 +347,9 @@ msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_preallo
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	uint32_t remaining_pt_count = p->count - p->ptr;
 
+	if (p->count > 0)
+		trace_msm_mmu_prealloc_cleanup(p->count, remaining_pt_count);
+
 	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
 	kvfree(p->pages);
 }
-- 
2.49.0


