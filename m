Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBA2708B70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjERWWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjERWWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0341E56
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:46 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso2923228e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448565; x=1687040565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWG+dBc4OhBc+8gyl7SYg9emICUPzaSysK5vU64noiU=;
        b=ayd4WDI0W8yKVKrsjBGacJH8IgTh/nLazeli8IskgZPocCCPgNpbTP09lRe0tBxkqs
         qvu/eBl3oZzQzYeZbogDBofn5USwHCL7fH0K6Alu+YOmArtdH7HLHWoqyzyY6t6D0B8L
         eDbiKOB/Gkx+of+irXoN1eSt6puQrjRUZMDr+TFQ/1PC7ogOP+lmgSChpkop6h30x5Hz
         3oWh1U5mm8/oinwR6agwpNQg7g/5rxYHrDCJDcXeBxtZpFQ5tWYZ9TKiFJyz47TqtdUt
         4hfPst3aSl2p0xcTFqEcNcSXY6BCUVSBBifx/zOrt2+/r2DiAlMMx9Zw4L4+hYpAStLe
         A4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448565; x=1687040565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWG+dBc4OhBc+8gyl7SYg9emICUPzaSysK5vU64noiU=;
        b=j3CkCvVraVuiJdiXaneswwqsiaBhbuilaiOX6NxxpIn1Cp1aqHFPeeAzgWVjNAkohY
         ZpqE82MqmEYElxxXBZH6CJvj5E4kUGfWe6Aurcjai/B9tRwT7lgQPhWoSNt+PgATS91k
         1m3hI95cwS5BLk3PfcA7jXU6hxEdbOVAvnbEu6x8MLE43aZAijaJgDi2ULKAW1hWgXgk
         9+qh99qwNiYgHlKen7y/thRMmWGHyPMuODIcb0pRsze+jHZZOPQiMDZQoIc+iKehXP53
         x0pKNbf53FfIRkm2YIToJy59T99vDyRC7uXzyQLwtFvJrrLgt31byghiSltSrCRbcDv8
         Q9RA==
X-Gm-Message-State: AC+VfDxz2C2juglYl+vkZSfP2Ts7L/7mxo4q74yZ1psKS+IFPbvJJwjx
        wgew3IK/6+Kus4JcHlDlYnIpBA==
X-Google-Smtp-Source: ACHHUZ6huHRAiAEe3WH9IkMjC0bu/37rcjCRUF6QwE5nxF2JaHFXvFWcCagmlQq0ylupoXrzEkcMHA==
X-Received: by 2002:ac2:555e:0:b0:4f3:96ac:6dd3 with SMTP id l30-20020ac2555e000000b004f396ac6dd3mr97244lfk.15.1684448565271;
        Thu, 18 May 2023 15:22:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:44 -0700 (PDT)
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
Subject: [PATCH v3 7/9] drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
Date:   Fri, 19 May 2023 01:22:36 +0300
Message-Id: <20230518222238.3815293-8-dmitry.baryshkov@linaro.org>
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

This flag is always passed to _dpu_plane_set_qos_ctrl(), so drop it and
remove corresponding conditions from the mentioned function.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 +++++++----------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0ed350776775..d1443c4b2915 100644
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
@@ -1104,8 +1094,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 	_dpu_plane_set_qos_ctrl(plane, pipe,
 				pipe->sspp->idx != SSPP_CURSOR0 &&
-				pipe->sspp->idx != SSPP_CURSOR1,
-				DPU_PLANE_QOS_PANIC_CTRL);
+				pipe->sspp->idx != SSPP_CURSOR1);
 
 	if (pipe->sspp->idx != SSPP_CURSOR0 &&
 	    pipe->sspp->idx != SSPP_CURSOR1)
@@ -1224,10 +1213,10 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 
 	if (pdpu) {
 		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
 
 		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
 		mutex_destroy(&pdpu->lock);
 
@@ -1384,9 +1373,9 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
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

