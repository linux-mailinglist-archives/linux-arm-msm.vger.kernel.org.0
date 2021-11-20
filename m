Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769E8458034
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 20:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhKTT7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 14:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhKTT7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 14:59:01 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F12C061574;
        Sat, 20 Nov 2021 11:55:57 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id l190so1037525pge.7;
        Sat, 20 Nov 2021 11:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
        b=nD/OFAmEjlXdlhnR0EIWcKCOjCOpynXRiCQ3L5b/NryZEFW7aGN27xk4nHOKfeuhse
         mZk0p5lIsEsob6VGHCAJPr/eoALBiLSDq62hlJNNKrCR2r9DpFVI1lIyMV9cLbXbV/CJ
         bHvSMVxvejnHY8y0jHPVRD1oZ1D9xSZ9GAP48Qwlp5Gpx2J33IrOqBl+5T/PYD2q7pAV
         Actp2SiKFF0pcq0+0JBkiGaV7FpnCxZP2GEsh2g0T5tfZGDwYYzB57jwDbQg2EX4rsR3
         Gaegv6w8zrw6oW7sQ81izSqO6kJRrldI4NjDCBOw3wDSYFMqMlVJZuY/+saKP7YRllL0
         x1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
        b=WpB2QlmWxSw3/oIgHy+GQh+RUQQgL+00cVXZ1aGOGTuKyDxo9jMruS5AGBnUh7dIyY
         Nc8k9SToSSmIsD4CzKdtATJGUhysXy8GKmR6JU2G6KHlzUWM26Xi4YUAyvatZiGUveTR
         a6W9OZ6YpqcHkmvsVuAHGigm/mW7HAz0iLL/V8Bt+vFNrqSSfJWlzT0aB/k85s0yPWw5
         JEf2fnIsJ079a8BlJyoOSG69Y7q+qyKMQKtXlh6bfK1ROG7eDoFSh5CH1nCMIZOJyZdl
         P7gffqDr2a6578HT/GKcrQ7OetLzITicN+ZWXIGJpH+o6/cpc6jMpEO56tzXhNAcDpvR
         WUlg==
X-Gm-Message-State: AOAM531EpJm9bLr2X7b8m7dmFZdvcyitG8762FMQK/GsFmuKD+5dLFXd
        j2Bhbpc1h3TFnLcv6x4m/6c=
X-Google-Smtp-Source: ABdhPJxrc0BlTm1p/mAREngPYj1AozJJkBDsUTlgiy4iQ8gEIX+Ko3GmA3AOSxR7OjuFJGd4WFiAVg==
X-Received: by 2002:a63:85c6:: with SMTP id u189mr23809628pgd.344.1637438157101;
        Sat, 20 Nov 2021 11:55:57 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y130sm3397659pfg.202.2021.11.20.11.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 11:55:56 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm/gpu: Fix idle_work time
Date:   Sat, 20 Nov 2021 12:01:01 -0800
Message-Id: <20211120200103.1051459-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This was supposed to be a relative timer, not absolute.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 43468919df61..7285041c737e 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -228,5 +228,5 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
-			       HRTIMER_MODE_ABS);
+			       HRTIMER_MODE_REL);
 }
-- 
2.33.1

