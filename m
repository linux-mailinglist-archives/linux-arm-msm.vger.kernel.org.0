Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0582347B70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbhCXPA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236360AbhCXPAf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:35 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB878C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w37so32406171lfu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wYt5A6aqxsEgILETx0qelKpbEQ4Wrji7w4lLAkB91ok=;
        b=pwmrdmb0IoyHHmOJEO939WC9Iv1n+Yjc452EC5VmjxtnQM+CzQ8gF99xqbyuKKRslR
         uUfh+eTq/PrGyTGDd5lgwIVns6Olec6g8CT5KIwWpKm82zGWumXozASffCVQdzPe1E88
         +yIUzvWvgtNdFI1FIeUPZLe5ZQY4mfyWRuHhqRUO4Jms0eKNkfbEt3X9dlyetAerFcTN
         NQ1zw2E58SsLdyJDYcSA7N7qsnAgg0QQpz00JxJIPbYrwRrKjpLdBDZZ1j21zAXHb7Lc
         /Yq+L3sWxrSAVubxwjt72tcQ9kplJ34dNPeqzyhaTGTVKq9Ah5X24GEZ9bneKf6AQR3D
         Gw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wYt5A6aqxsEgILETx0qelKpbEQ4Wrji7w4lLAkB91ok=;
        b=MNHhnJ/igjIMet3A7x49Z6Oi+P0ZAvfeO57wE4L7ZgJj8A9tNyBzjrTBcAIVhK77sC
         B2tdPnRQMRZjug2Bvvij31KtZ72u4jq90O7Whe7x1ISn9Y1QK6tp5ShFtFNPifS/FRHx
         4+yIXrv1UCz988sTG9s4yjpgTnAFYIyZFz9MKotXQUtbN6E8Pp+wD0AhqH3nCqYcrhPA
         W7YgR7IuoGArrNumFXfLv9rHD+P7K1aFhPr3DbBBNAtMEk+3M48Q/ek85hK86+zICFcS
         cMq0vT9z1spyaSEl3AQR5kTYOKouQkquHGdl3esIGJ6UGDPsgB3umXpRqiXN/FgFpi8H
         RKxg==
X-Gm-Message-State: AOAM532y1jxYPxG4RFvbIJgJ5Uza9zq2vw/di1KoxH0gG5+8m6GROIZp
        1fwFcOAx1Tq92gyNWR8Mh2NAwQ==
X-Google-Smtp-Source: ABdhPJyb2px8p8Bw/1HYUNAfSXofxhsDrbqmwG3pNDouzsiD2G2SgWm/7QYjbAaakHQ+/ogrjhHdAA==
X-Received: by 2002:ac2:53a1:: with SMTP id j1mr2286941lfh.298.1616598033077;
        Wed, 24 Mar 2021 08:00:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 03/21] drm/msm/dpu: drop dpu_hw_blk_destroy function
Date:   Wed, 24 Mar 2021 18:00:06 +0300
Message-Id: <20210324150024.2768215-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dpu_hw_blk_destroy() function is empty, so we can drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c      | 13 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h      |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c     |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c       |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c      |  2 --
 10 files changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
index abad043f35f5..1f2b74b9eb65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
@@ -22,16 +22,3 @@ void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id)
 	hw_blk->type = type;
 	hw_blk->id = id;
 }
-
-/**
- * dpu_hw_blk_destroy - destroy hw block object.
- * @hw_blk:  pointer to hw block object
- * return: none
- */
-void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk)
-{
-	if (!hw_blk) {
-		pr_err("invalid parameters\n");
-		return;
-	}
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
index fb3be9a36a50..7768694b558a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
@@ -24,5 +24,4 @@ struct dpu_hw_blk {
 };
 
 void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id);
-void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk);
 #endif /*_DPU_HW_BLK_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index ad60d59d3106..ac0f10dd0490 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -591,7 +591,5 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
 
 void dpu_hw_ctl_destroy(struct dpu_hw_ctl *ctx)
 {
-	if (ctx)
-		dpu_hw_blk_destroy(&ctx->base);
 	kfree(ctx);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index d2f1045a736a..977b25968f34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -117,9 +117,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 
 void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp)
 {
-	if (dspp)
-		dpu_hw_blk_destroy(&dspp->base);
-
 	kfree(dspp);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index db78842e3999..8df75936d906 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -322,8 +322,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 
 void dpu_hw_intf_destroy(struct dpu_hw_intf *intf)
 {
-	if (intf)
-		dpu_hw_blk_destroy(&intf->base);
 	kfree(intf);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 554bb881de3a..76f8b8f75b82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -189,7 +189,5 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 
 void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm)
 {
-	if (lm)
-		dpu_hw_blk_destroy(&lm->base);
 	kfree(lm);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 863229dd0140..406ba950a066 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -86,7 +86,5 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
 
 void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *hw)
 {
-	if (hw)
-		dpu_hw_blk_destroy(&hw->base);
 	kfree(hw);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 334d5b28f533..92cd724263ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -289,7 +289,5 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 
 void dpu_hw_pingpong_destroy(struct dpu_hw_pingpong *pp)
 {
-	if (pp)
-		dpu_hw_blk_destroy(&pp->base);
 	kfree(pp);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index ceb2488ea270..8734a47040aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -740,8 +740,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 
 void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx)
 {
-	if (ctx)
-		dpu_hw_blk_destroy(&ctx->base);
 	kfree(ctx);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 5d2c33ec1de7..dae77d9c2c74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -329,8 +329,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
 {
-	if (mdp)
-		dpu_hw_blk_destroy(&mdp->base);
 	kfree(mdp);
 }
 
-- 
2.30.2

