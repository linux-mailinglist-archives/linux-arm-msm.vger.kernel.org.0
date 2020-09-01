Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902DD2596B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731580AbgIAQFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727977AbgIAPlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 11:41:14 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9761C061245;
        Tue,  1 Sep 2020 08:41:12 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 7so868234pgm.11;
        Tue, 01 Sep 2020 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOpWZ0ELYdwerIMhBnjgWjf7bTpYIpZc4bq4YnoG+QE=;
        b=mA3uSmG9cowbsBaeHbRW48Au4E+lHsdQ0VQeLYF2rGLjvsP06Y3UeIkPHH6eBFTqLI
         sDIaPszTNO6DZ6YkQzzMWDK6okmQ3gBmm0ppC5Vix8DhFHm0rcxaSrm1OljLyUdT4ySV
         289XS8TTy7zBZcuZ55wbqnNJglQdXlcoeB1lb8ShsYjwRbqDftCEDFFjPaiQ7k0EPD99
         DXthn0T2mVCZZ8Kx7K0BQ1PP+Ei7ndlMST2NuIkQoyJjrA35nAeV5+3l4EFkXAkVowd+
         pCbPSyvEznK5ecz873Ckah50p7H8Z74mbzyECR3aKy8pGFzCZrK/wJg4mfst9BlOTr4Y
         58Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOpWZ0ELYdwerIMhBnjgWjf7bTpYIpZc4bq4YnoG+QE=;
        b=oqT127QDHqo2GeO/FSBmKmXT7T4UOqixvmCJNKwAFWAbEqEL2q9yc5L5Yd/9jvzRdr
         RxODcJen5P4ra4qO6NGkeEYCrhMnQPjs5GRfef1/Pvk9kMnKam5DAlGvxrxz3dUqBxND
         EXXq9b9IYnlHDgyJ5fOsvEeP3+ad9xmxziwPj1LmsvxGwjeO1cuthLZFF7apYMFiT9+p
         VQ63ahEU8ldlKDxY3tr0eQBbDrx07pVrK+KzfBVhbSwJLllcw8Q5Kui7L/CKziwwRFni
         FBrNN5s21uFTs46lmACHVSMPWHR+Yp2nFaux1DRSZhEz+1AwzWBK2fFOVcrgd4Y93wdj
         cFgQ==
X-Gm-Message-State: AOAM530EHfDeGZLCJtgcL7+cQ/n1Qh6XAhvGbf3x9Io7xlHcXXEIy1oB
        tRD6EAdI4CGbVuKL1VeZgxk=
X-Google-Smtp-Source: ABdhPJwtgd9Ek5sIobvbt+/pH9d9tOn+rALzHVWZVooH6IYDGTqv9IgLj3nad1MO5Ul36xMn84w7wQ==
X-Received: by 2002:a62:6547:: with SMTP id z68mr2393327pfb.286.1598974872309;
        Tue, 01 Sep 2020 08:41:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id h11sm1260709pfe.185.2020.09.01.08.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:41:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm/gpu: Add GPU freq_change traces
Date:   Tue,  1 Sep 2020 08:41:54 -0700
Message-Id: <20200901154200.2451899-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901154200.2451899-1-robdclark@gmail.com>
References: <20200901154200.2451899-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Technically the GMU specific one is a bit redundant, but it was useful
to track down a bug.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c         |  2 ++
 drivers/gpu/drm/msm/msm_gpu_trace.h   | 31 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 46a29e383bfd..ab1e9eb619e0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -11,6 +11,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_gem.h"
+#include "msm_gpu_trace.h"
 #include "msm_mmu.h"
 
 static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
@@ -124,6 +125,8 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 	gmu->current_perf_index = perf_index;
 	gmu->freq = gmu->gpu_freqs[perf_index];
 
+	trace_msm_gmu_freq_change(gmu->freq, perf_index);
+
 	/*
 	 * This can get called from devfreq while the hardware is idle. Don't
 	 * bring up the power if it isn't already active
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d5645472b25d..b02866527386 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -32,6 +32,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
+	trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
+
 	if (gpu->funcs->gpu_set_freq)
 		gpu->funcs->gpu_set_freq(gpu, opp);
 	else
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 122b84789238..07572ab179fa 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -83,6 +83,37 @@ TRACE_EVENT(msm_gpu_submit_retired,
 		    __entry->start_ticks, __entry->end_ticks)
 );
 
+
+TRACE_EVENT(msm_gpu_freq_change,
+		TP_PROTO(u32 freq),
+		TP_ARGS(freq),
+		TP_STRUCT__entry(
+			__field(u32, freq)
+			),
+		TP_fast_assign(
+			/* trace freq in MHz to match intel_gpu_freq_change, to make life easier
+			 * for userspace
+			 */
+			__entry->freq = DIV_ROUND_UP(freq, 1000000);
+			),
+		TP_printk("new_freq=%u", __entry->freq)
+);
+
+
+TRACE_EVENT(msm_gmu_freq_change,
+		TP_PROTO(u32 freq, u32 perf_index),
+		TP_ARGS(freq, perf_index),
+		TP_STRUCT__entry(
+			__field(u32, freq)
+			__field(u32, perf_index)
+			),
+		TP_fast_assign(
+			__entry->freq = freq;
+			__entry->perf_index = perf_index;
+			),
+		TP_printk("freq=%u, perf_index=%u", __entry->freq, __entry->perf_index)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
-- 
2.26.2

