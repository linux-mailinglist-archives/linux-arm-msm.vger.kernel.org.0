Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40279445C1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 23:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbhKDW00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 18:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbhKDW00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 18:26:26 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAFFC061714;
        Thu,  4 Nov 2021 15:23:47 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id p18so9589445plf.13;
        Thu, 04 Nov 2021 15:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SAjJe0L8rahemkypYUehC21SFtz7mEZThWWLPiWL/ro=;
        b=NzCVs6lNdX69wDrb2nMBBzD34Y/tsJPVI6tZWsiJCOxvoDvtDSENn/huD6z7kv+08l
         G9iOj0TeqIBrea+YwDGMeZ6jbbr6sTnh9mgSUQMWl+dW/IdmeFiNEmCgQ8Pqt1R0hQpq
         3O7JgIBvUhfdd1u1H5GDMGH2lCWjEGfPO5IJ/juwztKXa1cTmKsq9t2Xi3PsbeTpQn7G
         PBFafU3TixWAtSjq2EPHFSGH+7VcbMguCFwyUrOqDSYKOWOBKq1+Vby130DqEsBYIQZ2
         BpFco6dKebNmDvklIAwbsYFRHGbf+QtFcJ0aNpdIKY1WTAgxy2h73o3bAx2X5ZgjbPuL
         SZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SAjJe0L8rahemkypYUehC21SFtz7mEZThWWLPiWL/ro=;
        b=7+ve0Hl4duImEZLKOym26riL+dKyztpzF+aCu6YEXAjJp/sfvS2NeumCOqES9Cro8u
         MoXYa0GfaxYrNFoJvmYVBYrBdlci9qk2ph0LJ01gHEoRCbFr/+P51L4gbLj8PI4NIVte
         gpSH1uChxXriDzhvD7Qm3JYOTMxPQ6DV6i6C3zDZpyMf8ryZMMtnKo/ySZpCHWUvFLAk
         RFDNc6exVJkK+aUleyznDzie4tt0D6KU5igrYRWNQ63P2pdZkNWOtM5xJxwoveamwI+T
         //xLrzODchVpVA3uZLYcW3X8oB4Q6hZRUIPTdvI0wW6VH2GM5eUfvoPo1phUtuwD9z3j
         oUcA==
X-Gm-Message-State: AOAM531SZueqmx09NtOCWdnao7cafVHO84qMOH9st4MBm8/S/E2dGMIi
        /Nnow2b8ZtnyYaYiHdWrkxk=
X-Google-Smtp-Source: ABdhPJywWwxxya+abTTKcjBAKn/zhPdhspjq0C6veBnXpocuNuoJ+miPacjiMb70eXIDSP4U7I+1qA==
X-Received: by 2002:a17:902:db01:b0:141:ea12:2176 with SMTP id m1-20020a170902db0100b00141ea122176mr28246520plx.44.1636064627091;
        Thu, 04 Nov 2021 15:23:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id hg4sm8148128pjb.1.2021.11.04.15.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 15:23:45 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
Date:   Thu,  4 Nov 2021 15:28:40 -0700
Message-Id: <20211104222840.781314-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index d32b729b4616..9bf8600b6eea 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -20,8 +20,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
-	opp = devfreq_recommended_opp(dev, freq, flags);
-
 	/*
 	 * If the GPU is idle, devfreq is not aware, so just ignore
 	 * it's requests
@@ -31,6 +29,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		return 0;
 	}
 
+	opp = devfreq_recommended_opp(dev, freq, flags);
+
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
-- 
2.31.1

