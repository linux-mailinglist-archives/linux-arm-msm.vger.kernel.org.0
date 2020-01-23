Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECC0147528
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 00:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729841AbgAWX7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 18:59:43 -0500
Received: from mail-yb1-f225.google.com ([209.85.219.225]:34007 "EHLO
        mail-yb1-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbgAWX7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 18:59:43 -0500
Received: by mail-yb1-f225.google.com with SMTP id w17so86232ybm.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 15:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brkho-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zvp91oDfTO5JEbLl+0vB/VWGoX6Fo09EsCttVL/w5so=;
        b=SDDE6p5Uv0saoG5w8al+BsZzuZhQZRkbj39+0ueJ6gRLYtLLRHuMi7/EE5OYsH+YtA
         d4aQvHCI+Kd7+ucIl9TW6RVMTjnemxZAl5zJumSYpiZ8meniokDffXmHsmee7aRvjzLD
         5G6eMaG5lDT9O3l0aWAdBjh8kQgoOE5tQ/7AMouPfHQhFdtStWzVlHADBtYyizomkne8
         t9q0j0mJLniJLEvM19Ikh9ywLmee4eNzvwqntVlZiL8Uap6KqjV5mEGE4ieaIs6cRwjP
         7MNIPEssZq8qpBYJ1Eqydj7SUjGSrHWZKTFTHYJ6VTHO3diohnzpmX5aB2HaMM/ayvlX
         lmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zvp91oDfTO5JEbLl+0vB/VWGoX6Fo09EsCttVL/w5so=;
        b=RrUegpkG8DLjBa2CmLZp5OUjhkwrx4Un13JRf08Z6b8lTiz8RJOHZmySs0/LyWU2Gg
         KM68J9zoxsVlnAzJDTo/CQuVfFwtayn3T8vnagFMug2A0Q5lkJS5CaIJQY4UcaE6sEL9
         0G4u+kr5AuottRjJFmAQGa+3mOGBaLqL+IZYxepuIy3pfxqwf+BnhGxyzvlQt5DZKDkc
         gIvASrYfDI5UY7siaJCvMuzk1lXQ3H+LN6yMASEuiRhUEX4Mw4G+g5Jop+74mPVt86BQ
         i0b9p6QjCIG257ZWXNivhSjQbWvGNIYNspbZwYhyd9+Fib4jMzJhNIvZ4VwdUQKenUpA
         U69w==
X-Gm-Message-State: APjAAAUcan4giF/jW7clDUpBVyZ+pwZjHhygvPUOBESF2AHWPgYTiTLw
        nwAHDKLSzra7SRT3owdmVN0XnLWT9ubSdhkpkRMgZZ7Atuof7A==
X-Google-Smtp-Source: APXvYqwFRd5SEYNa4twj8KbvI5uBQGYGOmRAxdq9oHZ+fGUwIuMk48HZYtAsYd0J8WDqs8Vvx3SvxKiQnnq/
X-Received: by 2002:a25:cf08:: with SMTP id f8mr328295ybg.304.1579823981860;
        Thu, 23 Jan 2020 15:59:41 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
        by smtp-relay.gmail.com with ESMTPS id i82sm591239ywg.11.2020.01.23.15.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 15:59:41 -0800 (PST)
X-Relaying-Domain: brkho.com
From:   Brian Ho <brian@brkho.com>
To:     freedreno@lists.freedesktop.org
Cc:     hoegsberg@chromium.org, robdclark@chromium.org,
        Brian Ho <brian@brkho.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] drm/msm: Add a GPU-wide wait queue
Date:   Thu, 23 Jan 2020 18:57:37 -0500
Message-Id: <20200123235738.48182-2-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200123235738.48182-1-brian@brkho.com>
References: <20200123235738.48182-1-brian@brkho.com>
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
2.25.0.341.g760bfbb309-goog

