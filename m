Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49683DAAFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 20:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhG2Sfc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 14:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhG2Sfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 14:35:31 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC330C061765;
        Thu, 29 Jul 2021 11:35:26 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d17so7970976plh.10;
        Thu, 29 Jul 2021 11:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+RTAf1if9kR/bBSOyuGfXjWLcHINKu14ayzGStg6SfE=;
        b=hY+mHc5oqivPspA6jb1+QEF3sedyQxp/RsZmWYipznpgUXRVppN8fRaAxSBzGQ1wSh
         5rTxlCHefehRK6ll7UKz6wH3+ImTPSCtnk6h0pwc6cnigW+6Hvd92l5exAnn2hPyHZld
         9SwCvmQVVUEAee4yPtZ+AQnL9HLiJ33iEx3tb4AOJKdbvLNRw86Wt7huybZUEzQliZWb
         ndM50aYlsCQvc4EzSHvueGH1ilAd346Zm+QE8AlDPJlIfaKTdP5G9oIKUmcuQ+T9cOw8
         QCrwXLOs05NIq7DMx/sBkv/FW6WJOMp2cknJ26+/yskVR49cRQ7rrqmtEit4My1jyV60
         6aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+RTAf1if9kR/bBSOyuGfXjWLcHINKu14ayzGStg6SfE=;
        b=qGUE13uTRilOGseSamx0Zolft1KwEvZrQ2oYsDIrqWjri6cM8RukxWklfelLDVEsgw
         mqxBwnfDNA49/+Q36XrK+BjbjiwL0XCbeFadsA6Rx26Eu0BhoW6/NpsvAkpsG3K8WqfQ
         YZyTPBy7C8fZs5xonTifwmhWfO/+bPbIUWKYrgzjBvjv2ZVnBYOMCVK9A3oHdsVcdnfo
         C+OLz/YhvQX2z1rS7cVeKDPCF79Jhl+v/4tsCqEDcyia4eOZhzEgp3U+X6zX/+HQO7ro
         6QTuozYc4UC/LsOWrAP/fxYVrp8ItW0n/QnFLDY0wskQ7z3VVknkEneOeQc8kuGc5UQi
         ubLA==
X-Gm-Message-State: AOAM532qz3vxawRHTUsU7KcsfLFNEQkGG9uFjre9aOnKq1cQwg2aVmtv
        lxBAZgy31KxJTW18LPnNAQk=
X-Google-Smtp-Source: ABdhPJxNmT3hcGIrq1gXP5nW6zHSKx7R1o0nSuXgTMAMI2KqefkFX2c4bEbyy45SEtAPa5JPNW2xHA==
X-Received: by 2002:a17:902:ab05:b029:12c:3d3:cc93 with SMTP id ik5-20020a170902ab05b029012c03d3cc93mr6028576plb.74.1627583726460;
        Thu, 29 Jul 2021 11:35:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j3sm4259943pfc.10.2021.07.29.11.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 11:35:25 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Disable frequency clamping on a630
Date:   Thu, 29 Jul 2021 11:39:40 -0700
Message-Id: <20210729183942.2839925-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The more frequent frequency transitions resulting from clamping freq to
minimum when the GPU is idle seems to be causing some issue with the bus
getting voted off when it should be on.  (An enable racing with an async
disable?)  This might be a problem outside of the GPU, as I can't
reproduce this on a618 which uses the same GMU fw and same mechanism to
communicate with GMU to set opp.  For now, just revert to previous
devfreq behavior on a630 until the issue is understood.

Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.h           |  2 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 12 ++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 748665232d29..9fd08b413010 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
+	if (adreno_is_a630(adreno_gpu))
+		gpu->devfreq.disable_freq_clamping = true;
+
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			adreno_gpu->info->name, &adreno_gpu_config);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0e4b45bff2e6..7e11b667f939 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -112,6 +112,8 @@ struct msm_gpu_devfreq {
 	 * it is inactive.
 	 */
 	unsigned long idle_freq;
+
+	bool disable_freq_clamping;
 };
 
 struct msm_gpu {
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 0a1ee20296a2..a832af436251 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -94,6 +94,12 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	if (!gpu->funcs->gpu_busy)
 		return;
 
+	/* Revert to previous polling interval if we aren't using freq clamping
+	 * to preserve previous behavior
+	 */
+	if (gpu->devfreq.disable_freq_clamping)
+		msm_devfreq_profile.polling_ms = 10;
+
 	msm_devfreq_profile.initial_freq = gpu->fast_rate;
 
 	/*
@@ -151,6 +157,9 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	unsigned int idle_time;
 	unsigned long target_freq = df->idle_freq;
 
+	if (gpu->devfreq.disable_freq_clamping)
+		return;
+
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
@@ -186,6 +195,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	unsigned long idle_freq, target_freq = 0;
 
+	if (gpu->devfreq.disable_freq_clamping)
+		return;
+
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
-- 
2.31.1

