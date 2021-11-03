Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7EB4449F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 21:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhKCVBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 17:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhKCVBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 17:01:44 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5301C061714;
        Wed,  3 Nov 2021 13:59:07 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id b4so3432018pgh.10;
        Wed, 03 Nov 2021 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pcxuBvGjhUEmKd0khQGqkYMjXGdoop0TDNGStK9eQI=;
        b=JKYKg8toBVT2byo8HteiLk3miwnA0QtFnEzJyBw8Gt5NkhxvEcMoZlCllzPOB63NgM
         LmXj6EZNpMOr4Nflimx4AjPQ8dAX6PhGTwWHTGXvU1cQtCrncUGh+rmYpxowYl7R1kBJ
         0WWPlwL/9I5wah2sPkFQSonsLi+6lZRgF/yY7nhYKqYQRcsciQnajyIvMxOySLkU9I+u
         0V3MWRGtTK1Z0MutzTCze+QR+rG211g+zhUTe3lJnFt6FjKdixFdZXOaCgsF5tqPcyLv
         Gw5b2mpD3H5rxn1IFm/N4ej4ULs9afxgkakSTxMb7FOsGmHvd3JIpyr6xyFKQnzN4C7R
         2kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pcxuBvGjhUEmKd0khQGqkYMjXGdoop0TDNGStK9eQI=;
        b=OFHUCxGkR5nXmZLaOE95wToAcI/ot01e46Sgol1uajB/lSmGniyaYsqt93r0G1yBIt
         zYGMidXL2zu2JuRG2kwBFTEivxKsKsG76kip9cJ+vKmyGq2ghVIw1B45eVgmrCXkwXOo
         k9y2RJ0jU80xZCIT/e95x8vHE2OP/HFEm5E4ikPqckSS8Gq0ZgkTLJJVUvQ0k+aWC5oh
         Cv3+WeNUQljnzMb+fj32TYVraG72kx3fayapo1iVxtiVd8TA0uPZaSA5l61JOxxqydTX
         WZA7r+rO8obNN9jj7retQ0VDTduiO1Fcsr0Ez++FbDoeAqyRcShbaKVPR2GWHztgDEwY
         38Qg==
X-Gm-Message-State: AOAM531Z1PfMOwSNheEEqphwhpQ9pCgVYK1dBIiRlCOyBMkrHrcENJKT
        3ESmNMHyFAbdeEH/+2+xxXE=
X-Google-Smtp-Source: ABdhPJy90OawVNmed6HjBzFdRIvX8XirbPVjXZCTukl8/vQMr3evDKQWlVqaP6AANmE2qGw9WFtqtg==
X-Received: by 2002:a62:1707:0:b0:480:f85a:f3b0 with SMTP id 7-20020a621707000000b00480f85af3b0mr30495683pfx.43.1635973147232;
        Wed, 03 Nov 2021 13:59:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id e14sm2568406pga.76.2021.11.03.13.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 13:59:05 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/devfreq: Add some locking asserts
Date:   Wed,  3 Nov 2021 14:04:01 -0700
Message-Id: <20211103210402.623099-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 47b3cf2df230..b24e5475cafb 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -20,6 +20,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
+	WARN_ON(!mutex_is_locked(&gpu->devfreq.devfreq->lock));
+
 	opp = devfreq_recommended_opp(dev, freq, flags);
 
 	/*
@@ -63,6 +65,8 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	ktime_t time;
 
+	WARN_ON(!mutex_is_locked(&gpu->devfreq.devfreq->lock));
+
 	status->current_frequency = get_freq(gpu);
 	status->busy_time = gpu->funcs->gpu_busy(gpu);
 
@@ -75,7 +79,11 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
-	*freq = get_freq(dev_to_gpu(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+
+	WARN_ON(!mutex_is_locked(&gpu->devfreq.devfreq->lock));
+
+	*freq = get_freq(gpu);
 
 	return 0;
 }
-- 
2.31.1

