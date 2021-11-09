Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9FC44B272
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 19:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242116AbhKISKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 13:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241826AbhKISJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 13:09:26 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7DBC061764;
        Tue,  9 Nov 2021 10:06:39 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id r5so26826pls.1;
        Tue, 09 Nov 2021 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ewu5OhDKta9tv0cj+vmNtgtEN7krYewINiiQiOGODF0=;
        b=Hz3G3Afbb/rY/XGlxsubGcd7n5QDeKiLAGHYPhciUQ18io5H6tC9yuVa0BHgIbtZN6
         Ubn9b1bPRCGW88lD1wVdSTyzLhjV874CD4RJS9in23QVB8UErtM8aooTsF4fbB9H34R6
         8o1q0R2n6cwZEA8GgjbiefS0G+5IrpoKulNX2DEoFjjDc/s2gbZiLB4nzqivtsMI2kEY
         TX2QQY67Q3hGg4kxCx4voWBYL4BKLKVzHJz8WOwtxx7y91Bb6YNpwKYOcs12Eb1Riocu
         eHzACDpX9r/zDuTKG0i/OE9JlM/C6iuKqWK3NOOZAeyUSw/7PYiKagMIgOd+pKMR0Yz8
         nyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ewu5OhDKta9tv0cj+vmNtgtEN7krYewINiiQiOGODF0=;
        b=jNXwT/0vsp5pW9jkfehBKbqpdiR3IRjWSzUhAE/JGLeSe5JP3RWh+74lZ9Xh7kS6ZW
         5YLoN++OwZJMTW3gRr8h5FEnsMxSEeeYZpZ43leOzrk7kCIFzxo0uAmZ/aHJfwgCiBTL
         2ifIDDjsfSUlQNhbg/r2YTRskneFNBJ5Tot6JfPdjbDZZP+gW5an6fn/EIyBnQ7Nefqi
         7q5l6x/Kdz++GqeDgDU0HZJXj5RBRkFaWZfjWN7TW5SxCksDQmqlPO6SUcEZAZvBZPUd
         s0+n/DNf1xtXo+owgCb55WKs4Y58rR9Ggsxd6OK+gBY1DyMAZAKWpwU2VwhucoR46YFM
         UBYw==
X-Gm-Message-State: AOAM532ySf13DKmKenVcysTj4avVrUMeA/BHD+9/yNJbpXhiAv3B/Nx2
        EBDGCOvbum5ukrO7iLEJZ8s=
X-Google-Smtp-Source: ABdhPJyPIFeaZn9nDNP9uLj4PVSpEaotzjlPNiEaPJMPzf4AQxOcA+A6MutdVsB81b5/rQZ9FKQ7/A==
X-Received: by 2002:a17:90b:1e45:: with SMTP id pi5mr9598315pjb.146.1636481198993;
        Tue, 09 Nov 2021 10:06:38 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u1sm6273840pfl.92.2021.11.09.10.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 10:06:37 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] drm/msm: Add debugfs to disable hw err handling
Date:   Tue,  9 Nov 2021 10:11:05 -0800
Message-Id: <20211109181117.591148-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add a debugfs interface to ignore hw error irqs, in order to force
fallback to sw hangcheck mechanism.  Because the hw error detection is
pretty good on newer gens, we need this for igt tests to test the sw
hang detection.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 drivers/gpu/drm/msm/msm_debugfs.c     | 3 +++
 drivers/gpu/drm/msm/msm_drv.h         | 9 +++++++++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6163990a4d09..ec8e043c9d38 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1252,6 +1252,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 
 static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 {
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	u32 status = gpu_read(gpu, REG_A5XX_RBBM_INT_0_STATUS);
 
 	/*
@@ -1261,6 +1262,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_INT_CLEAR_CMD,
 		status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
 
+	if (priv->disable_err_irq) {
+		status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
+			  A5XX_RBBM_INT_0_MASK_CP_SW;
+	}
+
 	/* Pass status to a5xx_rbbm_err_irq because we've already cleared it */
 	if (status & RBBM_ERROR_MASK)
 		a5xx_rbbm_err_irq(gpu, status);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3d2da81cb2c9..8a2af3a27e33 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1373,10 +1373,14 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
 
+	if (priv->disable_err_irq)
+		status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
+
 	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
 		a6xx_fault_detect_irq(gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 6a99e8b5d25d..956b1efc3721 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -242,6 +242,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
 
+	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
+		&priv->disable_err_irq);
+
 	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
 		dev, &shrink_fops);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2943c21d9aac..a8da7a7efb84 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -246,6 +246,15 @@ struct msm_drm_private {
 
 	/* For hang detection, in ms */
 	unsigned int hangcheck_period;
+
+	/**
+	 * disable_err_irq:
+	 *
+	 * Disable handling of GPU hw error interrupts, to force fallback to
+	 * sw hangcheck timer.  Written (via debugfs) by igt tests to test
+	 * the sw hangcheck mechanism.
+	 */
+	bool disable_err_irq;
 };
 
 struct msm_format {
-- 
2.31.1

