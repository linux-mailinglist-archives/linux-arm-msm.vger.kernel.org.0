Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD152596A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730569AbgIAQFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730547AbgIAPlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 11:41:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18844C061247;
        Tue,  1 Sep 2020 08:41:19 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 7so868402pgm.11;
        Tue, 01 Sep 2020 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7KqqN6K3kTsWHUwp2VvfDs43IyNlxmbh5Rz2H4DpXUY=;
        b=MvTcpkuWrabD04S1aEsSpjZHdD73NAt33h8AERs424BwAOPPWupOWGhDL8C4WysYQZ
         41ggRfkqK0UZfEMslBFKEbSzQSlVvulfxCMW2E8xy8hHHHhiiQGx3Ha3D1WYaa9sTc3X
         s/YwgBWcXjCh81KUhuirw1ap/a5dJKqgzvFkBGWkqZUUiYltChmcA5pNtKY66JE0QK5j
         C7fgThG8sVRMDUYVNo/tpLW7DsYRZkU8IHMcjqCStaOQdfkLIR/duqoLgVRLC3b+z595
         rojXUfSiBvSTUXpOs/l0T8gTL9JwVkWdLEbzoXC0wAD///WBr4JCzivhk11lGUsGqCGU
         C8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KqqN6K3kTsWHUwp2VvfDs43IyNlxmbh5Rz2H4DpXUY=;
        b=bJgK6gTn8kN+1apRo4M4KTLZ/S6HB4TOprVXEJLHuSN6eGnBRnP1emnE5jazXUixYn
         AqqCvJsIEWljunczNIG2uzMX2WjW9B6jsKiSerJA+fYrQMby+cI83BopzBDHHSxnO3Bi
         9x4IAzuF2gwTkcXu7JQdBnR9rhiDEnK67PVHuycGoXmF2yuRoGjtDrMcKCjbBp7SlRiO
         hyZyuKsmKV6Uia4b2OGOlIIS2877cJIOs7zFwa7FFiU3mWvLno9P9Uu03yCFT4AhixAI
         kUkiYEeIZtNXPgmVJGoRKTI4a0SNaeXAk61WD6y+Tlzd03EXCjiiSB1SWmt2VClpIcLj
         Erxw==
X-Gm-Message-State: AOAM532i0/ry0Kjb86st5waOC+XN954Ny+jJNuxunpc4KT8lXWo+KUKO
        FhnGnQL/YD5dYUxattWcNLc=
X-Google-Smtp-Source: ABdhPJx/KUf682r2Q/Pzf9hmQEXca9myE+iw7tLtWfLbi+QoMiwtNbP5nGWRrF9YVDIFr3rsJZy7dA==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr2393992pfq.245.1598974878560;
        Tue, 01 Sep 2020 08:41:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id w3sm2487343pff.56.2020.09.01.08.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:41:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] drm/msm/gpu: Add suspend/resume tracepoints
Date:   Tue,  1 Sep 2020 08:41:56 -0700
Message-Id: <20200901154200.2451899-4-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I'm not sure if there is a better way to do no-arg tracepoints?  The
trace framework seems to go out of it's way to make this difficult.
Or maybe there is a more obvious thing that I'm not seeing.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  4 ++++
 drivers/gpu/drm/msm/msm_gpu.c         |  2 ++
 drivers/gpu/drm/msm/msm_gpu_trace.h   | 26 ++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5a3e4d4c007..2de280e45077 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -923,6 +923,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	gpu->needs_hw_init = true;
 
+	trace_msm_gpu_resume(0);
+
 	ret = a6xx_gmu_resume(a6xx_gpu);
 	if (ret)
 		return ret;
@@ -937,6 +939,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
+	trace_msm_gpu_suspend(0);
+
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
 	return a6xx_gmu_stop(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b02866527386..5ceb2a966a87 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -202,6 +202,7 @@ int msm_gpu_pm_resume(struct msm_gpu *gpu)
 	int ret;
 
 	DBG("%s", gpu->name);
+	trace_msm_gpu_resume(0);
 
 	ret = enable_pwrrail(gpu);
 	if (ret)
@@ -227,6 +228,7 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	int ret;
 
 	DBG("%s", gpu->name);
+	trace_msm_gpu_suspend(0);
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 1079fe551279..03e0c2536b94 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -140,6 +140,32 @@ TRACE_EVENT(msm_gem_purge_vmaps,
 		TP_printk("Purging %u vmaps", __entry->unmapped)
 );
 
+
+TRACE_EVENT(msm_gpu_suspend,
+		TP_PROTO(int dummy),
+		TP_ARGS(dummy),
+		TP_STRUCT__entry(
+			__field(u32, dummy)
+			),
+		TP_fast_assign(
+			__entry->dummy = dummy;
+			),
+		TP_printk("%u", __entry->dummy)
+);
+
+
+TRACE_EVENT(msm_gpu_resume,
+		TP_PROTO(int dummy),
+		TP_ARGS(dummy),
+		TP_STRUCT__entry(
+			__field(u32, dummy)
+			),
+		TP_fast_assign(
+			__entry->dummy = dummy;
+			),
+		TP_printk("%u", __entry->dummy)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
-- 
2.26.2

