Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818AE3D5BFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhGZOCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 10:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbhGZOCU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 10:02:20 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B73C061757;
        Mon, 26 Jul 2021 07:42:47 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c11so11803055plg.11;
        Mon, 26 Jul 2021 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
        b=ChcDtB/kxIXXTedMqyBkWFdJKgGXHSEEl8e4hMFgzXaG8W/+JMBOe1VRI4uF1NqLTj
         KJcBuItjYQpAyJJEfLrbcpvWnGGS5fi/VGaJxZmoHep0+sRvdoJ/vkTjKguE3XVrSahx
         Xo0Fqk7oPC0SrD1NhWtr84MByOX4i0IVEr7g2R7QtV1eEmlCAETKkniiAZovTp6NAW0R
         s2+dwCwAKu4Ie+QMCTgEb6hIPgU6BiQPeOhZGzWRb4l4lHqm8XEimQ8alzJVLs4SASJj
         E0GFAr3LSFtc5axCNmsm5mWUx1ViBi1C5/6oFsd6X+UWeAlv0nwppbUc+bMnINZ0TUnf
         7Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
        b=amDsE/1ZbfVS3ZgpdfWKbEKJisncQYlHwjklb7xpQnRaM2iu1+UY1m0miz+Zh8smNG
         OYqJj3hXZOEbwaXkjBkkBEG9QIrpkvXsoAxV8WCNTASCwb+UMkLgjIUHkQNkBhafQmUD
         eUurLo1Ilufh+jsiXApMG+lEtuZJhXOPKHSJKJpo+d0UNVFeEsKw9jRO3DTOOkuLf9Nc
         XhcakkVsYeMOO9XA2INXKOC22QPZyWMSzshYPzDgyKnzpeYN2T3U2e9XR3of6pGUCrQ3
         C2WCE8y49NOCKBGgxybZJ8wpycO7rTt2Ztb3UG2U/28IaE/77yXUS2TvaskTUEY/HEIJ
         Urdg==
X-Gm-Message-State: AOAM530x4koytcTwmopsipzJ8r5/DW1QAWM8LKUj+aBQS22tVKODMu6H
        H5R6Vs4OjmiOnzk6osoD7XE=
X-Google-Smtp-Source: ABdhPJz3zGdCxKIjdfgjhyaQKwvGv8VTrN2JA1XMA101kxTKicOrL4ZtEl4oonTOj8Kw7kbTic+20g==
X-Received: by 2002:a65:684d:: with SMTP id q13mr18358200pgt.24.1627310567478;
        Mon, 26 Jul 2021 07:42:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id r13sm3626970pgi.78.2021.07.26.07.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:42:46 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm: Split out get_freq() helper
Date:   Mon, 26 Jul 2021 07:46:49 -0700
Message-Id: <20210726144653.2180096-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726144653.2180096-1-robdclark@gmail.com>
References: <20210726144653.2180096-1-robdclark@gmail.com>
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

