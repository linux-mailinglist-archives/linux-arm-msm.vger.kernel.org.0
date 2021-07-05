Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188FF3BB4A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhGEB1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE56C061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:10 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d16so29463618lfn.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
        b=H40YMwnG9yvl+IaF7LJbiLiZYbSv1lgwmyZVv123DAdm9e2glx1fo77kcuLtUJxRUX
         B5o055pt1/okMiavLp8lyvu3t5rGzd4WDZ+zKvSSVSNGH/rexn/grDkjHVTzS995VrcK
         QmX5u7vbISmXHyJk8IvXmnh+Uc3qeN++wxGr3imuDcGZbHGHJyLDG9TKZWqHlmibfMdY
         bpnJr+lFNeDWEmrzIvpED8RRUGVKrltjOvkaELfyTnwL2uEh2DalUNjU0MXPKAgXLP6o
         pHlDXtexlA1dbEum4fpifvWg0gCz5gl2h0gJWOoFZAa0bsBb7MfsL23cowetZiECPSuC
         cIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
        b=CrOlXPE3NBGZ5++6ipa1VWUhPZBUnq4jOROXxG+Z5XXUYWH9VCUkiRxlMu9DMXNcwu
         Py0dFY5/rmnZlO39+hE09gmnhTb5rrCK8l+++LhevsguNWjCTsM4793CBFj3be1909gT
         ZRJoOn53GVbATmtTqPYr50+XCSlFckTcArLNMZ9yCUinOyyNGHtAfjNhJ7Om+RKLY1ah
         g5B4jX4uQ2siAnOZ/CtOHefO6Ys5zktMJNwruIFANGdcpMjkFdkCibvD0L9SafAu42VL
         6DVpx1uAS4D8s/eAZIw8GMtum06clS5VrEaAT2aPP/6khB3/5gxHQPlwNgBYhE/03quw
         L0XQ==
X-Gm-Message-State: AOAM531D9YPP0DqVImc7e0Zbn3WY6H8mCTv60/fuRvRCeDL4M11vSuyb
        3Tq2N4pVa3bW3ukfMus5tuexeQ==
X-Google-Smtp-Source: ABdhPJz6j+jbe+RM4gULFuaTO5I+5RKKIMHiK1GqnIycLILEJV/DCDCczpaagYsAo/MCW6hAFC7+dw==
X-Received: by 2002:ac2:4208:: with SMTP id y8mr8460788lfh.27.1625448308857;
        Sun, 04 Jul 2021 18:25:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 03/22] drm/msm/dpu: drop pipe_name from struct dpu_plane
Date:   Mon,  5 Jul 2021 04:20:56 +0300
Message-Id: <20210705012115.4179824-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
index 20ff1832c958..97507e25f4f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -115,7 +115,6 @@ struct dpu_plane {
 	struct dpu_csc_cfg *csc_ptr;
 
 	const struct dpu_sspp_sub_blks *pipe_sblk;
-	char pipe_name[DPU_NAME_SIZE];
 
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
@@ -1431,7 +1430,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 
 	/* create overall sub-directory for the pipe */
 	pdpu->debugfs_root =
-		debugfs_create_dir(pdpu->pipe_name,
+		debugfs_create_dir(plane->name,
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
@@ -1656,12 +1655,9 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
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
2.30.2

