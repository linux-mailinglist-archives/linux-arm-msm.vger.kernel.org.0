Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3553D2FBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 00:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbhGVVhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhGVVhL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:37:11 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D282C061575;
        Thu, 22 Jul 2021 15:17:45 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e14so944409plh.8;
        Thu, 22 Jul 2021 15:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
        b=SNpsbNBiLKHHFRQTP5JWRERPIA10ErY3XlI+V8RrayabzM9kXncvCEVClGWSAFG/rw
         0H0ZMkV/xtYjWs1ylY6DkKGZBYFRGrF8JHkcLLL7RGBZTShJPxS7VAAkWKwLcrFEMd5E
         jfScfcf1jJHeCwad258NJOmFklVGTv8zpuSAib1gnfM7NuQfuABFMyh3chceJdSfHbr9
         lu062tTXh9ntjt16QzfH7WKmcd/N906vaLnr/TyjsxMWzX2/QTkbHAxVa4fG4MYpYy6C
         nliAMGxLyWWlQ14OZegS32EZGdYvtv7wbinETTtYvupbfTaAE8zWqSkcmUcM4gsSRCvk
         cbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
        b=juMUxaimFKI/Kq6Fx8Vc1cNc208P295G334eGrOHAOHJ751vgBcGpSmn0Gq3H8tTex
         80m1RlKJ6X9e4F+8EQGdSbKx5FCksxtjOPIEpoKd5X/55OcNuu5mZpSQzg2NisGFLU7d
         SRD/Cs62cFcGX+9n36xYUue4PcAW/vVmyEdMlMU5PLm+7+GjD3Ni74FVtwj0ifeNY88C
         4iznx7odqLKCLdL6mKHqbHg01RedJzUtEUXKJY0Ees/jyPZFHneheEvJLNZQ2quFwM2n
         lSEJfmzielslheEmiO8833LEPdP0cUnas6MxLWj35PZUpt9cmG0Nz/glwj4hpBpFYNPT
         /n1A==
X-Gm-Message-State: AOAM533Iau+wvKXkhqL1j7Y+k1GiHIoK9ebi8rJ92u0bqxn6Vh9U1+pg
        VkregFsFhT7Ne8SflF6AYs0=
X-Google-Smtp-Source: ABdhPJzDw2jN1R+e7X9KNvqHxtRZDBRDujIR0CDelIocfLSDYbR3ug0aI+S90A9NQH5xZzCaLv1hyg==
X-Received: by 2002:a17:90a:7789:: with SMTP id v9mr1806135pjk.159.1626992264754;
        Thu, 22 Jul 2021 15:17:44 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id m34sm35739282pgb.85.2021.07.22.15.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:17:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/msm: Split out get_freq() helper
Date:   Thu, 22 Jul 2021 15:21:40 -0700
Message-Id: <20210722222145.1759900-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722222145.1759900-1-robdclark@gmail.com>
References: <20210722222145.1759900-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In the next patch, it grows a bit more, so lets not duplicate the logic
in multiple places.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 3bcea0baddab..2e24a97be624 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -37,17 +37,21 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	return 0;
 }
 
+static unsigned long get_freq(struct msm_gpu *gpu)
+{
+	if (gpu->funcs->gpu_get_freq)
+		return gpu->funcs->gpu_get_freq(gpu);
+
+	return clk_get_rate(gpu->core_clk);
+}
+
 static int msm_devfreq_get_dev_status(struct device *dev,
 		struct devfreq_dev_status *status)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	ktime_t time;
 
-	if (gpu->funcs->gpu_get_freq)
-		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
-	else
-		status->current_frequency = clk_get_rate(gpu->core_clk);
-
+	status->current_frequency = get_freq(gpu);
 	status->busy_time = gpu->funcs->gpu_busy(gpu);
 
 	time = ktime_get();
@@ -59,12 +63,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
-	struct msm_gpu *gpu = dev_to_gpu(dev);
-
-	if (gpu->funcs->gpu_get_freq)
-		*freq = gpu->funcs->gpu_get_freq(gpu);
-	else
-		*freq = clk_get_rate(gpu->core_clk);
+	*freq = get_freq(dev_to_gpu(dev));
 
 	return 0;
 }
-- 
2.31.1

