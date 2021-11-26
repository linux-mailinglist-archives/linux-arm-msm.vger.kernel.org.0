Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39E445E479
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 03:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242866AbhKZCcB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 21:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243262AbhKZCaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 21:30:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DD8C0613D7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:26:48 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l22so20473434lfg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjvwkpUPVxTN10HZUyOLDN4iEgATg5pex/yAH6C4wmk=;
        b=bE6gsDYcf3HpAMDe676F6s2AZyX7DtcqPXEUlAEp6XnSdElSjkBnJBq0zqFDuut5NT
         /+PV5yNx84b/VA0JbKoPCRepkemTp0gswj7w4CVkUkVVpwSuI9VNwvu3lYRMVLSKPSab
         tE/wAy9BNwefirBNHBpaaHUXFi0sL7f4zP4DVm2M+SmdzsDqqbkyv1fyf61GiEJPk09e
         b8bKM6lmldKzdrmHIm05TZmjvKTq8OFJ3FVAubMxvnIWrn/+vY8ZgZwMnRE0k7igRDy4
         l7BbKxTXTiMM5676Xj9eDn7vUgVIeBQHLE46ZNKlElFKGiHdTs2tiVYYLO1axY41Jtiw
         44AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SjvwkpUPVxTN10HZUyOLDN4iEgATg5pex/yAH6C4wmk=;
        b=VzYxZFnsd6KCOqXXr0RDeKyppdXvPqMHZaPBHnrRT0TYyKjamw99lTa9sOAVWiOF/6
         aP2jAUypWz33JuMiZA8VA2o2ZSEHcQX7upEqAUOpvrSn+fw7KUli521YxcyrZglKPMZO
         NO1t6cxLYX6dClruITnCwJVX2D65aDw0E34xDHW+/w8dZgq4GhZnxtyoBLZk6JL2jkTl
         OFCl23ZDvP1PzoenSxfqqnrSZj/CaKVQh9nznsbtx0IyzESJ254LW/FOOMjhnHQnb8lb
         km+5ksAy7cOE8MN7yeTQkWDtSmC3Ag/JDFQa7Ba8GWahbFJBwItvq0FuPYlBr0GadHvQ
         f/ug==
X-Gm-Message-State: AOAM530wbXUk9Ypcj4n9wM/A63CwObVaSr9QBryjzKQEVEGNTy9PkRbG
        aKc1FIjvdNPf92c7DaFCyAYwWw==
X-Google-Smtp-Source: ABdhPJyTq01BCevqYgd11aZ7SMNHpgd8O2RjgI/kfKWHlAz3ukSgwwEOOc/AYXFug6yZJQog/3qh1w==
X-Received: by 2002:a05:6512:3f86:: with SMTP id x6mr26665606lfa.616.1637893606803;
        Thu, 25 Nov 2021 18:26:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x6sm388764lff.125.2021.11.25.18.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:26:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/msm/dpu: drop unused lm_max_width from RM
Date:   Fri, 26 Nov 2021 05:26:42 +0300
Message-Id: <20211126022642.1105979-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
References: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No code uses lm_max_width from resource manager, so drop it. Instead of
calculating the lm_max_width, code can use max_mixer_width field from
the hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index d8d3f87a0ed2..bb69dcf2c13a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -105,18 +105,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 			goto fail;
 		}
 		rm->mixer_blks[lm->id - LM_0] = &hw->base;
-
-		if (!rm->lm_max_width) {
-			rm->lm_max_width = lm->sblk->maxwidth;
-		} else if (rm->lm_max_width != lm->sblk->maxwidth) {
-			/*
-			 * Don't expect to have hw where lm max widths differ.
-			 * If found, take the min.
-			 */
-			DPU_ERROR("unsupported: lm maxwidth differs\n");
-			if (rm->lm_max_width > lm->sblk->maxwidth)
-				rm->lm_max_width = lm->sblk->maxwidth;
-		}
 	}
 
 	for (i = 0; i < cat->merge_3d_count; i++) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 27afe55f1f55..90f5d1d9844f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -19,8 +19,6 @@ struct dpu_global_state;
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @dspp_blks: array of dspp hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -28,8 +26,6 @@ struct dpu_rm {
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
-
-	uint32_t lm_max_width;
 };
 
 /**
-- 
2.33.0

