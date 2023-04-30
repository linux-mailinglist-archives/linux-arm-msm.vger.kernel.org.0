Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985EC6F2ACB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjD3U5Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjD3U5U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:57:20 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB76792
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:18 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8a5f6771fso17774411fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682888237; x=1685480237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp2KVskTj+w3RZoSBUCQlTQvdkRF9mTsmW6mEirMQN4=;
        b=gOLSbYcn0DeTvfy75v+C0m8upie3Ce/ttVaWa2chTlCkGTkbsSjc3Ulm1eCVdxE6Cu
         e67LFRi4RPsIV0VcLStHhXTQPLnHJetqxBS530175hST+o77mFy7aMVym4o/09HyZGiB
         uD4z5p3H7xWnezi7I7jbvjz9dyG2t1GlTPVN1OrPXC44ssxIwvRSkacnCTY8DFhl4Tkt
         ct0pkcdTLCcDkOHuZHwYkqQc7l4ubs7f6wFhcNmoMSktYOCaecuP6MmWfetwwfPeLFFx
         hfSyJ9enVRsh4LGxEiilrYzvKebrJStlcCcDkrqWbGofA9wOVERVnltHU1uHZXxcv1OM
         iIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682888237; x=1685480237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp2KVskTj+w3RZoSBUCQlTQvdkRF9mTsmW6mEirMQN4=;
        b=DFOoS0/2Auby8FABgEXM1yd8KN/hQZGChflh+vKiluHnTsc6UQrRXrAaw883e2kC1i
         oe8bFZhtShUoiP8IHPcGeo0EZJN69JM3Xt6+vFFadMEVgWJ1c20QN5yaByttf5UB0u+B
         rJkXbYvxS/C+P3+EMBxU908aJU1SuouKOcHpu73J90cEpzRF2+lEMgrmhZdcQXVyqAYE
         fqQfYv6OboQE5aBMcTK518kuGAHs4rQLvf8PHv3C0ykwcq7KMacUEAvr4rgdEUAm/pa8
         0rHoN2runov7YENkmDjeRXGCXSNXVYkfKVYsUIeNjzc1HxTFeC93uYzYHmxkCMydN1w/
         M4TA==
X-Gm-Message-State: AC+VfDzXPAzpmOzsvjKqO8bifnxhSbvt+B4OD6DmpeMM6F3+rBmAzZe2
        0rPanLZq6dvFQnE0ljn0GbWomw==
X-Google-Smtp-Source: ACHHUZ6QuQ7pT9sV9coIawlaZYpseUgXzvim7bDNlU0GqFOndDjYFkd0MIH/QsDi0AGc/j/UhPtsrA==
X-Received: by 2002:a2e:9f05:0:b0:2a8:ae7e:b9cb with SMTP id u5-20020a2e9f05000000b002a8ae7eb9cbmr2946462ljk.42.1682888237185;
        Sun, 30 Apr 2023 13:57:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:57:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 7/9] drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
Date:   Sun, 30 Apr 2023 23:57:08 +0300
Message-Id: <20230430205710.3188230-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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

This flag is always passed to _dpu_plane_set_qos_ctrl(), so drop it and
remove corresponding conditions from the mentioned function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 +++++++----------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f7656436f3f1..22273d0baf59 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -70,15 +70,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_P010,
 };
 
-/**
- * enum dpu_plane_qos - Different qos configurations for each pipe
- *
- * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
- */
-enum dpu_plane_qos {
-	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
-};
-
 /*
  * struct dpu_plane - local dpu plane structure
  * @aspace: address space pointer
@@ -349,15 +340,14 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
  */
 static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	struct dpu_sw_pipe *pipe,
-	bool enable, u32 flags)
+	bool enable)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
-		pipe_qos_cfg.danger_safe_en = enable;
+	pipe_qos_cfg.danger_safe_en = enable;
 
 	if (!pdpu->is_rt_pipe)
 		pipe_qos_cfg.danger_safe_en = false;
@@ -1058,7 +1048,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_qos_ctrl(plane, pipe, false);
 
 		/* skip remaining processing on color fill */
 		return;
@@ -1102,8 +1092,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 	_dpu_plane_set_qos_ctrl(plane, pipe,
 				pipe->sspp->idx != SSPP_CURSOR0 &&
-				pipe->sspp->idx != SSPP_CURSOR1,
-				DPU_PLANE_QOS_PANIC_CTRL);
+				pipe->sspp->idx != SSPP_CURSOR1);
 
 	if (pipe->sspp->idx == SSPP_CURSOR0 ||
 	    pipe->sspp->idx == SSPP_CURSOR1)
@@ -1222,10 +1211,10 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 
 	if (pdpu) {
 		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
 
 		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
 		mutex_destroy(&pdpu->lock);
 
@@ -1382,9 +1371,9 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
+	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
 	if (pstate->r_pipe.sspp)
-		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif
-- 
2.39.2

