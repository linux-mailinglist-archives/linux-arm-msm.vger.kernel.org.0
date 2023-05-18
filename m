Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C49D708B71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjERWWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjERWWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEEE1A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:47 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f380cd1019so3092880e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448566; x=1687040566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ74luLnCVG8ItNGMCpx+IHJrGu05F/jibO8nm+Z6ZU=;
        b=EbpiOHECbghJcqD6/9LkxU2moIgdUMQ569nAGrV91tKfWdd7Rlm95swiLPuFEfZ7dU
         iN390tSNEGtM/hUjLX3QEZgtrUdjPvZcOhfr5nboQ0ETrmt1Ask4eE7N6bMG4T/u5ENo
         k1/rIYXA9FuOvqkLsBvRkFgR+WaGNqh0oWg6rBGMpUZdzMNlYJuRY522BCvFDQbXoIWp
         e+njHRe5orfBvE20JoyKaaeyTfx1XrubvQkEiWtE5h1mwkHNI0eSOhvVhKI1B5XcH4S9
         Z3DFFfKZ9Gwt2Ai0tV41C+UHRo7G7OVqjXC33PqyRmv6QTmEXiaGhRJvgjdmDC4ChrJ/
         62sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448566; x=1687040566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJ74luLnCVG8ItNGMCpx+IHJrGu05F/jibO8nm+Z6ZU=;
        b=gfix0tDOvY+YzHPB/4pA/MwqzfnqYxKYFyF/VCcWH/yb2ci/ivjJUv5g0S7TOAyKc6
         4Ukm+VnREuoXdqlx2TK+2y/cPOXkrmfAbCOpe7qBJqGeANgiiypGkoemZdp4LR/dDDaO
         3YV6ZpKyjM6DemHs+pb3X7XRCcsnv6MutkD9lH2N2pyq6NUo1+yaQaThQhhz7Az6cFbD
         hSg/yRZ1hTjHyiAYVCykSS+QPIyX8aC4bWiFn46ykXRF9po68aZ6DckPZFpZNJKiep9o
         wJVLNJTJcuALr+t9uLscjP7ZPYNhrRcOoz9j/0WfgNOFw9UA0PipRrrjcYNNKpoJDcjj
         YQKw==
X-Gm-Message-State: AC+VfDw4dq7TpGACpLQmNgeUtuRyRxPz9ott+7gKwU6k2MA1/7ufAtTT
        Lga2ofNcsaP8UWIQ0AuwxyfZQQ==
X-Google-Smtp-Source: ACHHUZ6Sliz+KLLfDJhwBTHITknDATdLS/yrPe2+hs3mNPNeX+fIUfKsWxnXZg1mklkUs+tmdCWgAA==
X-Received: by 2002:ac2:43cd:0:b0:4f2:6f55:2d6c with SMTP id u13-20020ac243cd000000b004f26f552d6cmr163072lfl.5.1684448565980;
        Thu, 18 May 2023 15:22:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: [PATCH v3 8/9] drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
Date:   Fri, 19 May 2023 01:22:37 +0300
Message-Id: <20230518222238.3815293-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the struct dpu_hw_pipe_qos_cfg consists of only one bool field,
drop the structure and use corresponding bool directly.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 13 ++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 11 +++--------
 3 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 925689dc77f0..1abe1eca4f42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -566,17 +566,13 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
 }
 
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_pipe_qos_cfg *cfg)
+				       bool danger_safe_en)
 {
-	u32 qos_ctrl = 0;
-
 	if (!ctx)
 		return;
 
-	if (cfg->danger_safe_en)
-		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
-
-	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL, qos_ctrl);
+	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL,
+		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index aaf6f41d546c..4278c421b6ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -163,14 +163,6 @@ struct dpu_sw_pipe_cfg {
 	struct drm_rect dst_rect;
 };
 
-/**
- * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
- * @danger_safe_en: enable danger safe generation
- */
-struct dpu_hw_pipe_qos_cfg {
-	bool danger_safe_en;
-};
-
 /**
  * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
  * @size: size to prefill in bytes, or zero to disable
@@ -285,11 +277,10 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_qos_ctrl - setup QoS control
 	 * @ctx: Pointer to pipe context
-	 * @cfg: Pointer to pipe QoS configuration
-	 *
+	 * @danger_safe_en: flags controlling enabling of danger/safe QoS/LUT
 	 */
 	void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_pipe_qos_cfg *cfg);
+			       bool danger_safe_en);
 
 	/**
 	 * setup_histogram - setup histograms
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d1443c4b2915..c8837d0aa0c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -343,22 +343,17 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
-
-	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
-
-	pipe_qos_cfg.danger_safe_en = enable;
 
 	if (!pdpu->is_rt_pipe)
-		pipe_qos_cfg.danger_safe_en = false;
+		enable = false;
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
-		pipe_qos_cfg.danger_safe_en,
+		enable,
 		pdpu->is_rt_pipe);
 
 	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
-			&pipe_qos_cfg);
+				       enable);
 }
 
 /**
-- 
2.39.2

