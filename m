Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCCA457902
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 23:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhKSWuD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 17:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234549AbhKSWuD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 17:50:03 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF62BC061574;
        Fri, 19 Nov 2021 14:47:00 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id h63so9764820pgc.12;
        Fri, 19 Nov 2021 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oc0ol4V+6f1FUJ4tw/CYx1vddRWZjt85+l1yOQxtvDQ=;
        b=jSizSv4oOdRjv7BP02RkpKfuuEMos/m3sJYsGjimaXxyBBf8BUkOFlbFu6Ume4rVc6
         qryWpQkDCaYedMEa9UzM9eytzwNvGXq0vcelhJFJlnsv8UbTTJlTXHgl78nReskDZPzH
         c6qdE3AGRPoQ2XSQjo6icN92qJ50NmFvHq+7G6kI2wm7941CNv/YYb75JXLQ8P9v3N90
         FCqvrvOgVroizP4SXMc8rXetdJFSX2oJj2+9LVYZ1d0mORoUvxlz6nKHyp4V8RrTwpdP
         VJOaXyRv2TMFYiqh15V4teiK2MPO+TPJ8QRSC3t5z74RurpaYJ8bufUiK/jgtFE2bbt3
         LbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oc0ol4V+6f1FUJ4tw/CYx1vddRWZjt85+l1yOQxtvDQ=;
        b=v/Dl4i4u8pgz6i55koeMivwRdxLYdm3tZ7MZ1h1WuU7wBV6HxSVMT6k5M15TTDBzd/
         7De8+lgb5TStApeB/bcp+7RC0iq8vPQycKKTeeHHfXml3Oqog34Ne3qE4/ALt8pUi1p7
         xv2oCR49XjBx9Km+E2LyQqX4eatubMcDd0qyxZLfZbaeNQb0116NW3yLunoryjbSmkjJ
         FUQIaysQ30u+9PNp/eJJLYghTCq8b1mV1xKlM4AFSn8KiFXFTt3aFQrk+gNOpIF5VeSG
         G9AnuIueT4NSCc0mZb05IBc7rAzfVbTwRcX/IAHBRIubJXSuYmYF9lH7ZBidPzjAaAQO
         xujQ==
X-Gm-Message-State: AOAM531hJfzX4jX3LGeEiwSfFHIowidi7o3nJiJsMTbBARNiZGJgfL15
        bBXBhwJvS8wE9YS5bN1uFXs+m2h6w6M=
X-Google-Smtp-Source: ABdhPJwdZyLppiJ42MmyCru5whIXHzj7Wo0ZcF/f5JOkbefQ/XFrPGLKce6g4uJgG/fKJx88eX28Gw==
X-Received: by 2002:a63:494f:: with SMTP id y15mr19778226pgk.257.1637362020412;
        Fri, 19 Nov 2021 14:47:00 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id t67sm631440pfd.24.2021.11.19.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 14:46:59 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/gpu: Fix idle_work time
Date:   Fri, 19 Nov 2021 14:51:56 -0800
Message-Id: <20211119225157.984706-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This was supposed to be a relative timer, not absolute.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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

