Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60F6465984
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353714AbhLAWzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353715AbhLAWzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:55:12 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08106C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:51:50 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bu18so66893394lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7uia5p7FpJ6FhJvovwEFuE5jTgtrwEvm9hq5sHRfsao=;
        b=PgwEtvI9kE93H3hOhQhgfzf+gv8KHEeRsHnqy2wL9BaV7mdJnmcVEGS/oEfonE5FnV
         5jpmnhcapqJ5insRwv8i8ZNbczNhJqWqLG+VcZMB7kzQhU72o+6TX5mR2HN+TLRdf5W/
         yNOWfOwTsz5X3W0P+ctjWGI+iO+xbyiP8aCgM3M73KDOuaCSA+N6Sj+s2VWA1Hq8OqZI
         KLuTRrHpNwGuNP1ISYHWtuZLaQ0L1FL9fCcxfgcTF1pAGHaicNSHzvSVIHPy9gIdjPY3
         0KQNhYl9cv6QltzfiBI7tThTorzLOoobtncBG2meevzxiw4hV6JSJRsLdb3up5GviO+n
         hj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7uia5p7FpJ6FhJvovwEFuE5jTgtrwEvm9hq5sHRfsao=;
        b=Di7zcygzGS3AY5Ia9h8bbTaNEa2oPNOiPineaYA65iOnJVre4rTF5mMw8+8EYr5wdH
         lol8ZrbaRrJtSyOP/36wo4a60SydcJzPQhEdcTIfT2iBQh8uYLVTEboNev82i0Szu+Po
         sSkLwV0DsCXJe5Xc6/mLvZUrYh1Nsri4pM839AuRF8y3cks3uyBuWweJtOo0+Mhna9nw
         5cSKO//x0ZVOKP4ibDUF+r76dE8K2bEYSTQO/QXY7kl6KcJpc27QABUkxuybUASCcFlt
         ogu6jRKO1CvnNjiGz849YFLRKqTUUA9BGaaXxyWEj479a9ydY3DgzRCHo0ph9bqlF7ou
         Rf/Q==
X-Gm-Message-State: AOAM531EOuksSqmb+iCdD8AwB583SXNg+qWkWDD0C/r1zA0HB/yuspVs
        Vmk6uXRK4bxamS2GvwQLH/u+pQ==
X-Google-Smtp-Source: ABdhPJyV6aXB2B/ea3M3KpreXTvEZVMtsKBTzWxDvdn1CNWx4Pr3i4/K4dLxCbzd+lFOZOIMtDsgBA==
X-Received: by 2002:ac2:4d5b:: with SMTP id 27mr8702045lfp.596.1638399108311;
        Wed, 01 Dec 2021 14:51:48 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:51:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/msm/dpu: fix CDP setup to account for multirect index
Date:   Thu,  2 Dec 2021 01:51:40 +0300
Message-Id: <20211201225140.2481577-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
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
index 7235605bfc9e..75aa47835214 100644
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
index 3c53bd03bdeb..227b09fa4689 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -356,9 +356,11 @@ struct dpu_hw_sspp_ops {
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
index 911f5f0b41d8..1134171f4d1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1191,7 +1191,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg);
+			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
 		}
 	}
 
-- 
2.33.0

