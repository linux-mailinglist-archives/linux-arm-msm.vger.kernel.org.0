Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9E713CE64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 21:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgAOU5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 15:57:36 -0500
Received: from mail-ua1-f98.google.com ([209.85.222.98]:36113 "EHLO
        mail-ua1-f98.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgAOU5g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 15:57:36 -0500
Received: by mail-ua1-f98.google.com with SMTP id y3so6825930uae.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brkho-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
        b=JYjuVTSotuEa5LKchq1QwLvMiC0miS12YXda9sHdZclwC92lt8XOByu06EK7yqK9r4
         WCBYRHBwJdaS94EIh7jMaUWTVZZYvUhWL9XBklNDK6A8QC9DqQEpnz8v45Z9wC3EflW+
         gwoDaiKJbd4DfyNMo7Bq7JUudOlO+KZVDKdDCjnvAPhSHqmKfD/+2NvMg6rYunAXunQq
         iVwQl8EuDAxN9kmFZjdQhkRqyLfeN8m5DEHs2R9Y8iQmkfWay48vJc1Oa5KrF3tTeDLc
         dhDkGUXfDcG5x4C9tviRSMV0IbElyaH1E/d9I0UdlhbH1f9wRnYLlwq2fZylhxEr/IsU
         Fgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
        b=g3GYS70JcE3xtCqj2PuDib3cNGE+rikqdQ5o7sakxFtUBJlahsYavKnmOEmpjLfldy
         YDDlBmZyCx+y1+40exlNJbjwANOo4bcgFoFoAQo3+FfneNfX1SmqxO1a4lBZfbs3NtYy
         0E+jew4++Q6HLMLOrOryNtUqy7uW7Br4FNG34zxlkWAyS4XKT5+OIz92/Az5yQRS8TQS
         t8QxHd1fhJtJsdzYMUkGvw62EtxURwoCbaP3jH8WCK9nClZPXxTLd/P+N7mBJLlNbwYb
         xeMmwOYdtQj61/23g+PCcuOUwS9Ipi0otsT1WN34ZbIVWMC/ugctki3VQW3L0i/DmGaD
         dKNQ==
X-Gm-Message-State: APjAAAUqgE5vOZY/+RBf8HWaRq0pICBAuQSDdD+VzCgibfkmHWwfVEFW
        V0QmwDm3LmHc+rMPTBTWx1ociuoTTyVNDI6GAmmKvfPVApX1YA==
X-Google-Smtp-Source: APXvYqxjXDMjnFKkSryidbYnjPMiySJ2xbqbi1okq9jcW8s3Bi6lp++0JgkqqYp9Bkjvkqtrqnlfvge183NV
X-Received: by 2002:ab0:422:: with SMTP id 31mr17816176uav.98.1579121855091;
        Wed, 15 Jan 2020 12:57:35 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
        by smtp-relay.gmail.com with ESMTPS id j26sm1472756uak.1.2020.01.15.12.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 12:57:35 -0800 (PST)
X-Relaying-Domain: brkho.com
From:   Brian Ho <brian@brkho.com>
To:     freedreno@lists.freedesktop.org
Cc:     hoegsberg@chromium.org, robdclark@chromium.org,
        jcrouse@codeaurora.org, Brian Ho <brian@brkho.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm: Add a GPU-wide wait queue
Date:   Wed, 15 Jan 2020 15:56:48 -0500
Message-Id: <20200115205649.12971-2-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200115205649.12971-1-brian@brkho.com>
References: <20200115205649.12971-1-brian@brkho.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This wait queue is signaled on all IRQs for a given GPU and will be
used as part of the new MSM_WAIT_IOVA ioctl so userspace can sleep
until the value at a given iova reaches a certain condition.

Signed-off-by: Brian Ho <brian@brkho.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a052364a5d74..d7310c1336e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -779,6 +779,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 static irqreturn_t irq_handler(int irq, void *data)
 {
 	struct msm_gpu *gpu = data;
+	wake_up_all(&gpu->event);
+
 	return gpu->funcs->irq(gpu);
 }
 
@@ -871,6 +873,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	spin_lock_init(&gpu->perf_lock);
 
+	init_waitqueue_head(&gpu->event);
+
 
 	/* Map registers: */
 	gpu->mmio = msm_ioremap(pdev, config->ioname, name);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c9dc8..60562f065dbc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -104,6 +104,9 @@ struct msm_gpu {
 
 	struct msm_gem_address_space *aspace;
 
+	/* GPU-wide wait queue that is signaled on all IRQs */
+	wait_queue_head_t event;
+
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
 	struct clk_bulk_data *grp_clks;
-- 
2.25.0.rc1.283.g88dfdc4193-goog

