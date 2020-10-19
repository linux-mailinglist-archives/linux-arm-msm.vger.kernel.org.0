Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABFA292FF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730861AbgJSUqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730147AbgJSUqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:46:24 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EFEC0613CE;
        Mon, 19 Oct 2020 13:46:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h6so693163pgk.4;
        Mon, 19 Oct 2020 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lZOmjAfebeIR7qmEAaLdEquc4ZpzVD3xby9O6rpIYDw=;
        b=KaeucAx9Nj30YybE6s+Jf6uDf6b1cN+oLUXUan8AmuAChdfmpnDNN1NSm47rlazZtF
         TBpVKIftFGFBzbv2LbvpRLD23lBjLepiq1T866p9/tWxlECEVBK/WvA4cgNmQfY8dmlD
         xV5pdA1EwPp0n1zQYbcGQ8ckG+Ft4AIz7E6dTP0kynmdiEq5sElCaHk3uA7Lu0Lv1nal
         hUG3tZSSTuZMPBvcjOjSssYMfINLT83yU+s5ZWqsxJm+IDHy0/7yTy0cL+2dRxLg1VF+
         f6T11cHukNtctrIXRNDwmu99wPM1xlvZ1YghdQySzICISN2fTLAC70HhlIbDTD3ECEbM
         TbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZOmjAfebeIR7qmEAaLdEquc4ZpzVD3xby9O6rpIYDw=;
        b=Ss6ejEHY4MEeaxOVLjMMJi9hqfdGKgeGVfnvJZk5eOpjqA/B/RtcgOsyNnX5RDyQ4n
         hog0qegcO5Ndhl3D/D14kxBaUQ4m1oXKN0vijkIHQ9tGPJjmdmqRS3LEE/RPJoKqq0ci
         rQN0EifuW94Nj8h/0RBVC6oq4ncGKb5sMNt8z3GENK7/ri1n7KUXVMEBiVkwsoqp6eIz
         nGtGklN9/XnIAPEDB95P5/kzB5Wf24lAQuAXIG46esNbeniVMVqudzQFIgj7gAW9KqSY
         dYHxGMK+0DU7o9dpkIQoucpL03AbSQVyBrBnnHOg1ogHSEgDuSD+BEpWLomw7KsHNZbq
         XnGQ==
X-Gm-Message-State: AOAM532BjJabNTBV42N12JzVw4f5pdimErud2BBTMaN34r92SYFlUml5
        NC8yNQUz8g0cDd8Y1V45RIg=
X-Google-Smtp-Source: ABdhPJxTFXUNhuydkPVXKdX4h4Tx8iM7i4oIj42HJR551i80t3OhePRoJxTyglW8CodaOQ5oAL6aQw==
X-Received: by 2002:a63:1a64:: with SMTP id a36mr1328463pgm.153.1603140383538;
        Mon, 19 Oct 2020 13:46:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u15sm582027pfl.215.2020.10.19.13.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:46:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 23/23] drm/msm: Don't implicit-sync if only a single ring
Date:   Mon, 19 Oct 2020 13:46:24 -0700
Message-Id: <20201019204636.139997-24-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If there is only a single ring (no-preemption), everything is FIFO order
and there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d784e97f233f..96832debc3b6 100644
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

