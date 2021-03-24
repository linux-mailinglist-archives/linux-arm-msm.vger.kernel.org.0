Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27087347B77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236372AbhCXPA5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbhCXPAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:41 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048A3C0613DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f26so30606090ljp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AHRJn3HeD8IJU2kEBHlBE7mssbK+pfVkIEgT2l1YUTM=;
        b=cxYmsvKjXhJjLy3e9DksD1CayKvLvTfTmZH0sVaTZ7cB7jjVCe9KeRuYSijoLFMyKZ
         X9v9Jp09fef0JVJiKf5rwZLtgN+k+4B14w1RQD0qS8cLZPKxHS3ULBIhUCJ/QG+fSpze
         I71JnFaX/hjoQsXf4O7PQ6p8u4BelyoJsr5IuKr/Berx4JNttfJvaCKtzRLJHjoG0HHu
         DSH+qzfRUH7LQr4ODgP2TeWHXBoJhDBWiFE4A2WbF59l6vCZZJC9nmy1Y+TYigEygOdA
         cdb58TQ0+SfWDyCYYpZEIriXa7mlYz5bBGrR2poKk9ToK62dCcooaoA71ejbqCu9JvaB
         CRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AHRJn3HeD8IJU2kEBHlBE7mssbK+pfVkIEgT2l1YUTM=;
        b=WJh45yrJxVzeDYQ7tp1S91WC2AjLvxk6Sv2GiqqpJuswrzAXYEQ1nAsmKCxzNIdrWg
         +sb9os84BTgfzZNQs9ZIw5gOUZ7TN/ibGTHbsCT9D0GBVCGvUH+PLZVjP64bIAW8TPis
         Of0dLjpdi/mYoHrbmkciHnVTSD+zjyGwY68yp3qsvv0RGF+hzQdyAgzMBnzMWkAZ7+hw
         qcHk5jNreNndbt2j7HNFfs9cvzDfbHovjyQGwcOQIh17vy9it/vWAllD9Jr9PAwxpQIh
         rIIrJOQhIoA6SaIyQf3zOrLjh1zqkj6esHyumW+ZGyjEOdaoTYu0QNWmM7bo/Kb0UT+e
         3/ow==
X-Gm-Message-State: AOAM530QUA/RsvoDFRXH4JkjycoC8yjWyu+bAPzKFX9YcLvQO9gwS+ur
        LFW0dqOdjXKRCeq85hPgyU7NKg==
X-Google-Smtp-Source: ABdhPJyVRmXnobLh21+0UZoLstd0UTYvuDgQT5sp6teUqBtBlDADaY3Q6uDvRmbOqLK4Uh4jE4EWZQ==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr2400673ljl.127.1616598039471;
        Wed, 24 Mar 2021 08:00:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 07/21] drm/msm/dpu: drop unused lm_max_width from RM
Date:   Wed, 24 Mar 2021 18:00:10 +0300
Message-Id: <20210324150024.2768215-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No code uses lm_max_width from resource manager, so drop it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7792dff60bcd..dbcf4929810b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -134,18 +134,6 @@ int dpu_rm_init(struct dpu_rm *rm,
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
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index a618c0ef43db..3f68a1c0dc1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -18,15 +18,11 @@ struct dpu_global_state;
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
-
-	uint32_t lm_max_width;
 };
 
 struct dpu_kms;
-- 
2.30.2

