Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5833BB4C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhGEB2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhGEB2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:28:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C687FC061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r26so12024801lfp.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Pu7+dqTzZbkt2YgBElREbnaQXKS8GXHzOUm46jFcp4=;
        b=EWiPcUk2ilVB0g/D+ZdTh3buVWSo3uy72vObBLpv2sAIu6LMOQyvJ9Hr1hp/0OtkRC
         dRbyfS2Cca/tg+xYFeAHkyKAaTDnliH/P9Kc7KEMrZgPZh2T6xIEdYsVmShCbpXIKUdC
         Vd6d6LCfFJ8NdM4D7stjHsOHCww/BIfJwt9B5eIxxYtVVbqe6Nbpp2ibRkoNwD6WzGH3
         hD+aFEzPAYVq5i0PGhU1idwl6zWJSquO7rrqRNMNF5IRNcaNJRrUD1iB8zulhjz1q9kK
         68YsycnMtxgtbPFrU2gUepyuFsgWSvZRtkCS2Ed4wLNi04E58B+mUh11z9StFuV4gq7O
         mz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Pu7+dqTzZbkt2YgBElREbnaQXKS8GXHzOUm46jFcp4=;
        b=jIqub34VYkE6jFcm7arO4ZxtvoNe3czNgGIEoHC89BcnjxTIEFwJfjvbq4BAO/aPLS
         Oyvx2It1sOpWxT3USSoAB341hHNFLlt7qx5N7SAHBbzIR4iEBz3bDPCWkldyEXVrs3qp
         wDkxa91NBjI8ONuyO/DiLjDFSeo4RmV24JvFI7uWmH5QzNOhYVzGdW+rMOG334IYf6h5
         YxkeifAE361AUWDyPsLJZFze8wwIa3H+RFuEPtsNwlxx4vwBLFBqH6DRfB+jFIo7pvWT
         Wta9K0K8Cvhw+EgJQqEuENPiyogZ0jYBrlvz+pIaSZRjz/Kx0ngz3g0KrrTTZL+haRd+
         pAvA==
X-Gm-Message-State: AOAM530NhJesHsbrziWvcQIfosgFoVyZLiNjlLFrTicVwSCBB8rbub7Z
        2a/GNKU6jfyq0wRhfCY6swYYUg==
X-Google-Smtp-Source: ABdhPJxo72oW5dTX2LSzYKC/ejYUIC3SD9jaHNlys8V48kRcGBR0Bfxjz1QUp66jxXz0p1yN+xGTVg==
X-Received: by 2002:ac2:4570:: with SMTP id k16mr8651752lfm.263.1625448323206;
        Sun, 04 Jul 2021 18:25:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 21/22] drm/msm/dpu: fix CDP setup to account for multirect index
Date:   Mon,  5 Jul 2021 04:21:14 +0300
Message-Id: <20210705012115.4179824-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Client driven prefetch (CDP) is properly setup only for SSPP REC0
currently. Enable client driven prefetch also for SSPP REC1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 12 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f93cdeb08ac7..96f2f3f12f34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -75,6 +75,7 @@
 #define SSPP_TRAFFIC_SHAPER                0x130
 #define SSPP_CDP_CNTL                      0x134
 #define SSPP_UBWC_ERROR_STATUS             0x138
+#define SSPP_CDP_CNTL_REC1                 0x13c
 #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
 #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
 #define SSPP_TRAFFIC_SHAPER_REC1           0x158
@@ -624,10 +625,12 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cdp_cfg *cfg)
+		struct dpu_hw_pipe_cdp_cfg *cfg,
+		enum dpu_sspp_multirect_index index)
 {
 	u32 idx;
 	u32 cdp_cntl = 0;
+	u32 cdp_cntl_offset = 0;
 
 	if (!ctx || !cfg)
 		return;
@@ -635,6 +638,11 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
+		cdp_cntl_offset = SSPP_CDP_CNTL;
+	else
+		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
+
 	if (cfg->enable)
 		cdp_cntl |= BIT(0);
 	if (cfg->ubwc_meta_enable)
@@ -644,7 +652,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
 		cdp_cntl |= BIT(3);
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_CDP_CNTL, cdp_cntl);
+	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
 }
 
 static void _setup_layer_ops(struct dpu_hw_pipe *c,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index c5ac8defa073..19c5358b962c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -358,9 +358,11 @@ struct dpu_hw_sspp_ops {
 	 * setup_cdp - setup client driven prefetch
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to cdp configuration
+	 * @index: rectangle index in multirect
 	 */
 	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_cdp_cfg *cfg);
+			struct dpu_hw_pipe_cdp_cfg *cfg,
+			enum dpu_sspp_multirect_index index);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d692136884ad..420cdd90e89b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1241,7 +1241,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg);
+			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg, pstate->multirect_index);
 		}
 	}
 
-- 
2.30.2

