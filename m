Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940E441DBB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351629AbhI3OCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351626AbhI3OCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:14 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3556DC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g41so25746180lfv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uNVJNXTlb3jfg3nMyHjCyNqhUc3xWo2dy+1dRY+1kI=;
        b=ZjQInZWH6ToGckxaN6rHk2EVawVU9sdVb1WSPFkl3n5UUmntaoCbC7/3DOHL6LV6b0
         eErEiLj8z3p7hvn45vfMOAL5n7NiOH1Ai9boczHgjVDJC/rinZEv6lnKomCu3Tb/O14Z
         NQtAGyrupJF0+2gmkQnPSgDsEudELR/ro5FyeY5+RqWZn9AaUAscNknhUjUTXAYO/91Z
         KQOvtrz8wV00K4vBTKFeWvqi3MHmR6T69iRTudgg6hDBgs02B+AqvbYHcVif0Vtd+y98
         20Tdi4yl1JwsrUcwlQWYZb1j7Ft8gp9KJR5RdWkDkNRoSON5a3Nf/VeRvnv0Qz1hXogZ
         7kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uNVJNXTlb3jfg3nMyHjCyNqhUc3xWo2dy+1dRY+1kI=;
        b=w7IRI8/jIrDW8qe4gdERYY6nGt2narNBrRroGt7o+BZUzBa4LhksJl1hJtofcozWRf
         TB1L2rMGK6JyUWZQI+p/1y4LgEK4yiOVGXWSOZlUoB+2MBvE7WZteBj1gYqKMOO7I1eF
         1Q2eMXde1FD44LUb8wAec/6c98oC9EYrCoUXzRHIT2G9SL+rS295y0BfRd+g5/iHXwUl
         QIRUQimLBMr6WOOmv0GXnujsHrqyqgjeIJfzaGTCQGVqeR3wNFJo9PW9Injp+LkfX+8w
         tVE5EGzmlzk+rvFnMgzfG0BBkr3Mcjd9H29MkTCOQ7JonqCiaKCjT1IRzusqhzQI6R8W
         jkdQ==
X-Gm-Message-State: AOAM530xgnLNg00AeVVbfVpaUItRyzO/heKVieHNlpJ9gfqqnhy4KMxC
        MEOB8C28EWRWgvxOqll3QEYjtA==
X-Google-Smtp-Source: ABdhPJwGwzemg2UO6l8i7NrpGocpuRtlXgFrQ3XlNo6D+Tk3j2thUFYikQFN/1DwLtCN1xSPfxaCIQ==
X-Received: by 2002:a05:6512:2308:: with SMTP id o8mr3254105lfu.393.1633010422290;
        Thu, 30 Sep 2021 07:00:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 03/11] drm/msm/dpu: drop pipe_name from struct dpu_plane
Date:   Thu, 30 Sep 2021 16:59:54 +0300
Message-Id: <20210930140002.308628-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use plane->name instead of artificial pipe_name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 88d726133b8b..ef3737642b0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -115,7 +115,6 @@ struct dpu_plane {
 	struct dpu_csc_cfg *csc_ptr;
 
 	const struct dpu_sspp_sub_blks *pipe_sblk;
-	char pipe_name[DPU_NAME_SIZE];
 
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
@@ -1429,7 +1428,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 
 	/* create overall sub-directory for the pipe */
 	pdpu->debugfs_root =
-		debugfs_create_dir(pdpu->pipe_name,
+		debugfs_create_dir(plane->name,
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
@@ -1660,12 +1659,9 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	/* save user friendly pipe name for later */
-	snprintf(pdpu->pipe_name, DPU_NAME_SIZE, "plane%u", plane->base.id);
-
 	mutex_init(&pdpu->lock);
 
-	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", pdpu->pipe_name,
+	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", plane->name,
 					pipe, plane->base.id, master_plane_id);
 	return plane;
 
-- 
2.33.0

