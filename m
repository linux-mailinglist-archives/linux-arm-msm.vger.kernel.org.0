Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3E645CF27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345094AbhKXVkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344930AbhKXVkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:20 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D553FC06173E;
        Wed, 24 Nov 2021 13:37:09 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so5038010pjj.0;
        Wed, 24 Nov 2021 13:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
        b=T3rGlQWhA9dMgzhwxjwybLi5abgIwTOqcDalv2g7bUFxDvEuLCmyh4zYTzM5xC1jO6
         MlMs2XJF8SzQWMEAn8pLboEaZd5/MWEWxtVey28ecaG2ESrq84sbwOhF7SRqBErqZ8lg
         5AsWoDJS00qAD2y81PTr00MNkHWH9doUBMsMTLGAfw4pJ4e4+voQO19lHDAsqR0yXy7C
         HZveZTVdbv5TGr92qTN3Z7Rpyv4rhA5xF26XSkolYMUUxVpbsybq/96EECMH7vYrAaBb
         9vCGm3iQwrdGv75JSWDiMrXqiZjSSP43Dq+UYAawHjDxTUU7u98bVRyHhTXIFnfcWG1c
         9F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
        b=MQ7ZZw4iKdcRgTt2ZCEZiPPTWOvZcYEN9b+qI3bykhYMYFl9+DESPjMrXdOQVpNWIG
         MefYqibFJwG/ehmWgXo+QiAxa5K6XnqnrjPnmHjc8bc1MfE+/P/rPf27AL0aYEkgdbOK
         jckx4B8mPbxoFp3BhUx1Q8w6njm1rkVcofv2RxXO16boB7DDtk1N1nWQ77hnLPrzPBqr
         6xcj6VweCo5s7o4atztSftwQoNE123WA61Mu4wyp0yBUwxsmn5MsVWBAZ4sUEvoR8g5y
         rTU5tXu4NcGvvfeoI/9d3QjubYGS/tjLoC5dSgMaZ6NIkhAJDHMm2XyAXC+6E9IUOC1Y
         OWkg==
X-Gm-Message-State: AOAM530WfZebwUTTAk0FE0SzLGcd5YeAWLv9wAMWpAK7jmr3ku73n33j
        cUTl5J4VrcOyKwcin13ryEA=
X-Google-Smtp-Source: ABdhPJwe/lRaJSe0GFu+WGWCDcRFHEa/gNdXvQ4MfPOvkizc8B007dmK8onv9kIv9NgcsOsS/5eJzQ==
X-Received: by 2002:a17:903:2283:b0:141:f858:f9af with SMTP id b3-20020a170903228300b00141f858f9afmr22475416plh.80.1637789829386;
        Wed, 24 Nov 2021 13:37:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c6sm722654pfv.54.2021.11.24.13.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:08 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm/gpu: Fix idle_work time
Date:   Wed, 24 Nov 2021 13:41:27 -0800
Message-Id: <20211124214151.1427022-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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

