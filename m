Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E942381AB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 21:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbhEOTKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 15:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234639AbhEOTK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 15:10:28 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CBEC061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 12:09:14 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id y9so2389711ljn.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 12:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pmJr7udGenhHroV8BhxM4TWBA/MGEM7jtLhmDnAa3/I=;
        b=qv80nCJXwOs0h3kQWAg3aKTuAJjKZpAU0wA6O6r0HcMzmYwxgnU6MKA7MiNl/oKAmK
         SpM7t1zRg7v3YdBxw5RA2VOE4k5qy/2OlvB7T+BjMPJa7eB420yrfVqrExDYSFTnVvVJ
         guSqmtppABHeQ3CPSlCcPCJrvwHDnFaT8ubnExXCqNa0+iA+FPA/sKrCBfgg3RblFH9V
         ZUqexMZfyThnK7H/VxtqvXpeaSxjb1sXwq9KV5rFlxPVXLlQaQRYWpoUweM5VLWmGe9P
         6ctYzeAQM46jZHQrX27VWinxXbFXZa0oNJO5HAFtu+L9r215jGEbe4ZXd3r0d2KWDm6/
         jxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmJr7udGenhHroV8BhxM4TWBA/MGEM7jtLhmDnAa3/I=;
        b=pVOYQUbaGNtujLLtj9ffwSyEBAs/rbS6e3lMvyq6eSkxtbu9YrhfoiogQeIECB5qMD
         ohIenAGM7vULtBRtVqhRwBPXiERGdXvL86nXjt4/092yFilJsFJGufA5wZ/PvClPEPXr
         LFZMl3snfYhGMOXzbqVuBbpworaWmCO/JV7xvErZ43ZFVuBC6II15mlKNlpmtfF6k+Rm
         syvxx6Y0rrrEvczZUCGm98DU4fJ9lY+CG4t+3BtZZxfrrrpPbSrueJMj+V8cVkGsRTKf
         bh6JESmnejbhGHL4cEdODqmzflspxf1s100p2r9kffUc8vHv7dFCHuMrIZr+hyz0gP0B
         bgyA==
X-Gm-Message-State: AOAM5330WvZGvUCB7+3i39Zpqwqdqe5WrRsznQQhjdtzNSWQQpbuK26g
        5CHDm54/wFSwIqwLdlUOWQ8bzg==
X-Google-Smtp-Source: ABdhPJz5yW689PxCmtLmpbqr/Hfhx5DBp+MzRaLQxAvnZk8a2ovkzeEzf5fQ0MBr9LF8nj8ljyaZ2A==
X-Received: by 2002:a05:651c:b07:: with SMTP id b7mr11197957ljr.218.1621105753214;
        Sat, 15 May 2021 12:09:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15sm2184107ljk.99.2021.05.15.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 12:09:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/msm/dpu: drop dpu_hw_blk_destroy function
Date:   Sat, 15 May 2021 22:09:07 +0300
Message-Id: <20210515190909.1809050-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
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
index 04a2c4b9a357..441f66a4fb37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -620,7 +620,5 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
 
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
index 6ffe97601716..17224556d5a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -332,8 +332,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 
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

