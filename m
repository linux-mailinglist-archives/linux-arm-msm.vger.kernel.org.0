Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E3F28ABED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgJLCJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbgJLCJn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:43 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00372C0613D0;
        Sun, 11 Oct 2020 19:09:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x13so9509002pfa.9;
        Sun, 11 Oct 2020 19:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fCvUZrMqyJzQQ14uf8jQABI7a2ChVtRsN/nTnfqUZZE=;
        b=WmJqGmK6lYy+ITsDu6cyf835lQJCk+kswy9EShZfZTjxTyPKJZhY/Nq2SnAR8mrYgn
         voh2SgimOlbEHSM1sgAXI6MZ4iiR+oMtHhvjjMSJyOoX8oBLsJd491F6BTdkDXY7mJQY
         sCyh4HdSgNCZxsDX3zlIfjqJ3s7llujnW5q30K9IOJGjeX+7f40WVNZYYOcN+T6OuxP2
         DGBhCy+FJBU19f7cVdussY0FQmhf4UoDc5xg+Ix6ifbWz/nwb6s/2fZePVULezLdQ1Qe
         GnF4QluzByU8B40DC+oMh5ynodygrx2lXvWCTq5Uo6wmei8o4u0UcHL6FXW7+PJvxuir
         dYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fCvUZrMqyJzQQ14uf8jQABI7a2ChVtRsN/nTnfqUZZE=;
        b=sSihDWW9YJBv7OGC1zBggFcjX4IpCnSCnNmg5ZUDel4zjBua9QRj2AkR7wZE3qdc6B
         X+7Acak5YLyLNWOPhtrAf6iJxlF84z1Xdvy2ISq20iTVcSuOrGs1z7D/cko5hV62gZUG
         vkzbNKp1a3Nlwio1x1jjXpmi3KkE5HUi7kp8WIFd6RfSDDBTzpKI115B6lX3I//BM6fP
         7Hf7Rzow5iFRlYlNlI/O04FV8I5JUUQt9wuE/A1759NMBTpISmGF22lUGiHnN8W3N9ph
         xU/yooT9N/IcG4ja2SF2lCGnSChMU1Z0BR4hL2K5uqW29UI0MQMtcSR6Zn06u0cAxGgI
         Wrog==
X-Gm-Message-State: AOAM530W0AZFIQrUCZ9Q0T8wsIH+BNpXKQCOOMvjaWrjmrsYCtN+PG3k
        mcg0GrOvoY/Xvh5YHfLhYzI=
X-Google-Smtp-Source: ABdhPJyvg9NYY3SSw3ECtdf96uoOyKdmHmuRhh+WcKRTDhDtAQOFmYqKak+UQH6tgAOrhK77M8YCMQ==
X-Received: by 2002:a17:90a:7d16:: with SMTP id g22mr17496646pjl.135.1602468581497;
        Sun, 11 Oct 2020 19:09:41 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q81sm18970519pfc.36.2020.10.11.19.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:40 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 22/22] drm/msm: Don't implicit-sync if only a single ring
Date:   Sun, 11 Oct 2020 19:09:49 -0700
Message-Id: <20201012020958.229288-23-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Any cross-device sync use-cases *must* use explicit sync.  And if there
is only a single ring (no-preemption), everything is FIFO order and
there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3151a0ca8904..c69803ea53c8 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
 {
 	int i, ret = 0;
 
@@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		if (!implicit_sync)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
@@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
+	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
+			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
 	if (ret)
 		goto out;
 
-- 
2.26.2

