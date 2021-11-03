Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E244449F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 21:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhKCVBw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 17:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhKCVBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 17:01:47 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242C2C061714;
        Wed,  3 Nov 2021 13:59:10 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t21so3615202plr.6;
        Wed, 03 Nov 2021 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JAvM+g0nOw8dXBaO8IEKfuu1DVB6ImeRwrNAg5nlgY0=;
        b=RwKDVJBJa9n/8X2oxiLeLyEYiId1ALn/wUwn2oHj4oVxJqTuQTFDcBVTDHFHNQSQ7s
         a70j/DZC96WaL5djXcWVstbJrdtmEoG9L78mQSp5cg8gWVlBYLUfCTz2AU1efCh5gS+j
         hRi04I4MD7umGlwsOB/l1WR5WMzxdzdYQ7Pmab9/rsFz7yxOuTiQcNQ6bQSzm8GfhtHV
         QWSzV07pET8XFqtzEUxh6DBz7demRWGkzjI5nUUNrUDVHjHNCvPO/r84gh2ed4zXuEXs
         bjenaUr1GijlAmfhhtckDfjrwxn0uiC76guULHgKtrFZMRpXnh4hXEY/ARsQDyUTVzXw
         dAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JAvM+g0nOw8dXBaO8IEKfuu1DVB6ImeRwrNAg5nlgY0=;
        b=ymMZsaA99ZHgWAbif2CxWmCvPtHTebxjDrhInZEbzJOCR0cN6IUGWF+Axn03I9nIBf
         koeE3QjDaeSlpTTPHkAupye1MlbVYhh/QILt47Xa1Ipnv7g6gmrxhllKMxd820clMBar
         7Qs5bWMkx1U1/XdXaBmaHUtM3gBHA68mEP+djw0J/11uXE/6z/HlNJ/o09KaO6lG9fmA
         kGXC8gtCzeHRTPNK4RjVxOdraxVnIjY3h/rUVkw2ZfpmgbZV2yTSLzIg011gvgEUmmsU
         ARgfpRRDyPiMkoxU6ek9csQsNV1DSlqJlF1MhcgsTFTe/13+WEaWDTJSeaJ3LLzAu9PC
         josA==
X-Gm-Message-State: AOAM532o9aIkqYh7NYgncmhOXrd8bVmDZYW7h7VaqBL+95TRdeXJuhNi
        AD/pKhQjjYs3eRH70ZF1cc8=
X-Google-Smtp-Source: ABdhPJzYneDeDjxADsHGJ8PHo5oX/urAKBo2bkfKMAOS6FV439NXqyc7lZkpu6FNyfnmDP+KPTS/eA==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id z10mr17675513pjn.20.1635973149661;
        Wed, 03 Nov 2021 13:59:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id d10sm3131569pfd.21.2021.11.03.13.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 13:59:08 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
Date:   Wed,  3 Nov 2021 14:04:02 -0700
Message-Id: <20211103210402.623099-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103210402.623099-1-robdclark@gmail.com>
References: <20211103210402.623099-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index b24e5475cafb..427c55002f4d 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -158,6 +158,33 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 }
 
+static void set_target(struct msm_gpu *gpu, unsigned long freq)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	unsigned long min_freq, max_freq;
+	u32 flags = 0;
+
+	/*
+	 * When setting the target freq internally, we need to apply PM QoS
+	 * constraints (such as cooling):
+	 */
+	min_freq = dev_pm_qos_read_value(df->devfreq->dev.parent,
+					 DEV_PM_QOS_MIN_FREQUENCY);
+	max_freq = dev_pm_qos_read_value(df->devfreq->dev.parent,
+					 DEV_PM_QOS_MAX_FREQUENCY);
+
+	if (freq < min_freq) {
+		freq = min_freq;
+		flags &= ~DEVFREQ_FLAG_LEAST_UPPER_BOUND; /* Use GLB */
+	}
+	if (freq > max_freq) {
+		freq = max_freq;
+		flags |= DEVFREQ_FLAG_LEAST_UPPER_BOUND; /* Use LUB */
+	}
+
+	msm_devfreq_target(&gpu->pdev->dev, &freq, flags);
+}
+
 void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
@@ -173,7 +200,7 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 
 	freq *= factor;
 
-	msm_devfreq_target(&gpu->pdev->dev, &freq, 0);
+	set_target(gpu, freq);
 
 	mutex_unlock(&df->devfreq->lock);
 }
@@ -212,7 +239,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 
 	df->idle_freq = 0;
 
-	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+	set_target(gpu, target_freq);
 
 	/*
 	 * Reset the polling interval so we aren't inconsistent
-- 
2.31.1

