Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3428645CF2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345236AbhKXVk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:40:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346061AbhKXVkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:22 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7D6C061574;
        Wed, 24 Nov 2021 13:37:12 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u17so2924326plg.9;
        Wed, 24 Nov 2021 13:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
        b=EbBCcAzyZWm/Q6HMWYMKsq1Be407ENtQqcZASUE4eHvTa5BMm+1SPmG7vsMxWHXJqO
         tH563uBZZQXq2FEFTt94GS4rtnxqAqR9m4OXeIwNCaJAPbDjG513N5aC+NdBzT8Kv4rZ
         fQmYPzbjoIYw4/kDJtk+l7FwoJVIeJSwAmjFPKoucZ792mBhvOFHtNmGmg5ahr3QkEX6
         FktSXOaxUllHXfQf/lKwshYA5eiDOs1ILPVM05lIOUC9CqdpL6CxA1dCHByfb3nKMjVi
         ngfwM0P8pP9tVpSrogdYnx05KbcuYuWApPDl1aiM+FtF5G/GHixmLuGA+j+ck18bTx2B
         TGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
        b=hqGotdtu018KxL2bKkBY7/VxxkhDyy4Z2TNqvl8VgP+StktOP/MIMAgpqY7B5Wcnnb
         8QuaaW6TmDHbuTuKG4bQo0e/6EKSPEhUeQCCzVoSTJhKPVCA2E0KqR6GZGtmdJguozqm
         HFUPd4mEYWtWo4hmluwm/XCYIP6cH8EMaHb5Z44g4IJDGeCb1HDTecUHsfe8MugqRRlx
         67/cR8wdpXk+oipfIw3yeyESSjwF/LzmbEAlg6dI+Ehyv4rlpAomnLOiy7dDKrpynDYg
         g7QZzXIJnxneOiZaaVyEk7x3rF7SFoXxPnjVKNeDrTdHY7IGwpnizoyqcxoU/09rZ6ty
         czfg==
X-Gm-Message-State: AOAM531QwRoA+OO8jKPzF4nzU2x9FV+Zq6GyBMSuXpUA0GNXQtHfrcvH
        Mcq7bGtv+rt5NLho/vLDzJo=
X-Google-Smtp-Source: ABdhPJwtik0+mxhV8osmTBLsnQR8ryhgLzx+m9B+uUtLe8i1esQUgxePWXQCjhjrDguWIPgkLxfaVQ==
X-Received: by 2002:a17:90a:1b67:: with SMTP id q94mr200972pjq.119.1637789831907;
        Wed, 24 Nov 2021 13:37:11 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k91sm545748pja.19.2021.11.24.13.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:10 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/gpu: Fix check for devices without devfreq
Date:   Wed, 24 Nov 2021 13:41:28 -0800
Message-Id: <20211124214151.1427022-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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

