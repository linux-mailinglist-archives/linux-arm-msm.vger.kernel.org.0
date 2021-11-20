Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE64458037
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 20:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhKTT7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 14:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhKTT7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 14:59:03 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED803C061574;
        Sat, 20 Nov 2021 11:55:59 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso11740460pjb.0;
        Sat, 20 Nov 2021 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
        b=gK2AwHPNaUv5ITw79ZSC/UGT2HaxPBYEe7FXzSAQjtMcHhvfQm5Lg1iP2YyQHsLps+
         v47k/HkmgUiMWTDM0TwH9U1iKF2oQ7Q4NqKorGdI+eTBeba77N7B4SHVDS6eIYBKSXiq
         k+cYygXjWCiN7I2Dx9fL7LbLo3Tn78jAnX78yfDXdF0ewSPopNOoUpZKP9JJlvIuiapf
         9rHTCMG+ZdZ7jlxbzqV9l6upSGZiWleLPLykeixUqKnqS0hz8yGRDDGdMed8SEKwGFxO
         2P2azmIM8co9mqSCyHgB9O7EiLF/RR3XxaS/UFozFhQFUQzHOc9tKUcBft/SF7JiuH6E
         IpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
        b=nE46D53NEeatbdz62cGQkll4aQx9ybHyr8bhqluMmAZkJXF6DdkqmEErPh11v5v1E3
         j/YIkyOMdBCdg4Uuto4EV50MJaRueEOixsjv2SjdHsTDWvB9cPMJKOjBwiH8wl4XhL6R
         xTvS/BesKa2917hqcG57aw825lgKU/7M/3iZRtBenySQTsKH8K5E6iSgFZT4ivRDARvJ
         cDqmnlTlGGGqAhWVjHyAxz+He17dhAcYGfWOw6aKBXCrLFLesF50D2QFNwNYfE8h7F+R
         yQNQGZrUv5h2SrOQ8ZRtDJr/gHUV3cy62B29PPahFgK/nxpE/Ri+gPz2CnHN5CfyZj1P
         gZYQ==
X-Gm-Message-State: AOAM530IoHO107ZORelyLgOd7VYH/7/O1ZIYaWEUEE+/cMJR//Db27Zt
        +urG6pzHnHNe/w6DYnWV9N4=
X-Google-Smtp-Source: ABdhPJxkEV85PiqNOKmTRTBg/0gPmEVCe1tk2ZykCrFUfRWSsdVqyGSrh78AML/O54+H63tIu5x4bw==
X-Received: by 2002:a17:90a:db02:: with SMTP id g2mr13579182pjv.76.1637438159436;
        Sat, 20 Nov 2021 11:55:59 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id kx3sm3020916pjb.5.2021.11.20.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 11:55:58 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/gpu: Fix check for devices without devfreq
Date:   Sat, 20 Nov 2021 12:01:02 -0800
Message-Id: <20211120200103.1051459-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211120200103.1051459-1-robdclark@gmail.com>
References: <20211120200103.1051459-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Looks like 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before
clamping freq") was badly rebased on top of efb8a170a367 ("drm/msm:
Fix devfreq NULL pointer dereference on a3xx") and ended up with
the NULL check in the wrong place.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 7285041c737e..1f55242bb6a1 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -203,9 +203,6 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
 	unsigned long idle_freq, target_freq = 0;
 
-	if (!df->devfreq)
-		return;
-
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
@@ -227,6 +224,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
+	if (!df->devfreq)
+		return;
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }
-- 
2.33.1

