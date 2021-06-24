Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2E53B31E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhFXPAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbhFXPAC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:02 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F532C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r5so10825472lfr.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
        b=zRkE9OGfJJ4nFYiDu1P5KaM4cDCELkftdGs2GKacA9JHQS9RlfHijtPn2Vq2PM5GlD
         +hAvTv7WDJ7mBZu76N39JRX7WwBS/1v3rnFuQoGxUdp3MbOCitwkISJs9j/1rjTB1Lit
         QtY/6JzO38InQ+sFdSPikB1FD35DZmdZYiDLiAMBzLC9vRfQ5PfLydBYcLG5r7n+Z6RJ
         aAUqVBFfFf+Z/QupclOWfkdSNMuf/1wjaTNPZpXgKUEbj5b4WCMs5cxj4fKyvFJrsFzV
         nNu8BhB0WlH98w40uKdoTS+Nahr2GH8fwO6Bnt66EBWRVsl0lFELdTPY9HJLxa9JaUpv
         HzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
        b=oy6I1KlfWU4bPtig5XdqKA6V2Jn3IOklzF7Tn2um6c2EIp0K2Y9LIa9OJPDthxSotF
         DrT92LMbKBBgyTvdWRh4mT10HmeyCN/Ps+PBGP4hjoRjMzDKPhT7UR6BKHANO/rXVolB
         qRPD/74SoxURJTNZwyX2ZStnrRi2MGOGJyJjT8Vn4xH8jZKlonl+AR3vkZo/vuaNRQGH
         GY/CPVP1R/KcrLPbcn29z+aJr2Gdek6mUB4NVkaQnC9mi6+9EA33rM/DfzExepOX2J+F
         oM8flzxif1uLc7/wGvdXtfOdEfxl6cdaPE5TPR+wagM8RCgMNvG99RY7r7NJFCWYeGky
         Em9A==
X-Gm-Message-State: AOAM530N8z46pkp2rNZ5beO5AArHANA6NS6y5Eba5o6SeSOKjBXgKJ4X
        ScUquz4UKRgofszyV9LbURwFfg==
X-Google-Smtp-Source: ABdhPJx/kJfCtet4fGDL3wGu+FwOoWTGqTUzJOs/TzpnGbn9Ox9ag+5FrcgHKhChPXN9L1FVwxNSxA==
X-Received: by 2002:a19:c749:: with SMTP id x70mr4215189lff.326.1624546660613;
        Thu, 24 Jun 2021 07:57:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 03/17] drm/msm/dpu: drop pipe_name from struct dpu_plane
Date:   Thu, 24 Jun 2021 17:57:19 +0300
Message-Id: <20210624145733.2561992-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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

