Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42E8347B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbhCXPA7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236389AbhCXPAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:47 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6982C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:46 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 184so30595817ljf.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=InxB8LW00zB5UoFHTCsqm7Ebz3Ngcyc7bbqEDUAHS2E=;
        b=f5bNMXa/zhnBJ1YDuk4EwV081W0yUX2F6G0S73I3Qj2+wCqTQFjLy3f51+T9eOBxDJ
         kjmFubN/MpCdTjx21EhK9kQNtrzmLALB+5RrMAWnVhMdYEIuwMsnS17kvfaE7S0aFt7O
         Vn4xoKbKTRNHUxwRTzzZ31y3+cwDOoyUl+l4ggY4H6QKJBwdtKdJTnr/d7KowTmBbhPm
         3WQ468Wb7aobtpxGCtm6cMSFhpafOQi5iO0t10IXUKN5l0ksIDnTJXN64T0hF2GOB1qd
         llkxvZ5sNpscxQo97C+pUN5nEmbGYAcs40tcUUv0OXT9xQiyniYJiKjjEyOg3ocdHuYk
         OJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=InxB8LW00zB5UoFHTCsqm7Ebz3Ngcyc7bbqEDUAHS2E=;
        b=Oo8jjm8blTz00bJGFyMoFOISzAFa6Vvnyssz5GkZnsrmb/wo4EwQvlD8ctsz34YsYm
         hrVmV8To9xgcqvBO37i/h50DCairg0A2+Yh8lBEiDzFIv5psDr+Mbww2vcfqYo0EJVvx
         XJ8ZmFVQXh1JdeiDZeb6E4w2djON04jIB2uHYekEHGkyzOAKt3EdkKd4n2aEPKeTbPru
         sS55xN+J4t/Fy9yH/iylq27QIVcKbB0wzy8nduLoUKiOLL+NfxRBcoVWE7o57e6W6XZ8
         3bDNBVc9AVi55nGBbC4FBvNOaEzdxtcCC3Xy9cZcvRpqK3aqMh960DxgOzHL2T4Lnmdw
         R0Cg==
X-Gm-Message-State: AOAM531K2S0w0cad/Vtu6Q2JqlP61ryzVRcb6oyI/vKHd4ctnZmbM6zx
        LvcudkFO8nOzAMwQV1sZ54ZJrw==
X-Google-Smtp-Source: ABdhPJwmTkykf0MLHiVcPBQgtPtjq0/TeGKif/1s6wyjV7Rl6VlCjHX1VZrdFZvUep3sAUo+JDZIeQ==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr2305388ljl.348.1616598044960;
        Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 12/21] drm/msm/dpu: call hw_dspp ops directly
Date:   Wed, 24 Mar 2021 18:00:15 +0300
Message-Id: <20210324150024.2768215-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace dpu_hw_dspp callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 15 ++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h | 19 ++++++-------------
 3 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5a0a6741a431..bf3048e44001 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -462,14 +462,14 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 		ctl = mixer[i].lm_ctl;
 		dspp = mixer[i].hw_dspp;
 
-		if (!dspp || !dspp->ops.setup_pcc)
+		if (!dspp)
 			continue;
 
 		if (!state->ctm) {
-			dspp->ops.setup_pcc(dspp, NULL);
+			dpu_hw_dspp_setup_pcc(dspp, NULL);
 		} else {
 			_dpu_crtc_get_pcc_coeff(state, &cfg);
-			dspp->ops.setup_pcc(dspp, &cfg);
+			dpu_hw_dspp_setup_pcc(dspp, &cfg);
 		}
 
 		mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 977b25968f34..c17f2bf3324f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -22,7 +22,7 @@
 #define PCC_BLUE_G_OFF 0x24
 #define PCC_BLUE_B_OFF 0x30
 
-static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
+void dpu_hw_dspp_setup_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
 
@@ -33,6 +33,11 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		return;
 	}
 
+	if (!test_bit(DPU_DSPP_PCC, &ctx->cap->features)) {
+		DRM_ERROR("called for wrong DSPP block\n");
+		return;
+	}
+
 	if (!cfg) {
 		DRM_DEBUG_DRIVER("disable pcc feature\n");
 		DPU_REG_WRITE(&ctx->hw, base, PCC_DIS);
@@ -54,13 +59,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -108,7 +106,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 	/* Assign ops */
 	c->idx = idx;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 7fa189cfcb06..e712e3e4c67b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -36,19 +36,15 @@ struct dpu_hw_pcc_cfg {
 };
 
 /**
- * struct dpu_hw_dspp_ops - interface to the dspp hardware driver functions
  * Caller must call the init function to get the dspp context for each dspp
  * Assumption is these functions will be called after clocks are enabled
  */
-struct dpu_hw_dspp_ops {
-	/**
-	 * setup_pcc - setup dspp pcc
-	 * @ctx: Pointer to dspp context
-	 * @cfg: Pointer to configuration
-	 */
-	void (*setup_pcc)(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
-
-};
+/**
+ * setup_pcc - setup dspp pcc
+ * @ctx: Pointer to dspp context
+ * @cfg: Pointer to configuration
+ */
+void dpu_hw_dspp_setup_pcc(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
 
 /**
  * struct dpu_hw_dspp - dspp description
@@ -65,9 +61,6 @@ struct dpu_hw_dspp {
 	/* dspp */
 	int idx;
 	const struct dpu_dspp_cfg *cap;
-
-	/* Ops */
-	struct dpu_hw_dspp_ops ops;
 };
 
 /**
-- 
2.30.2

