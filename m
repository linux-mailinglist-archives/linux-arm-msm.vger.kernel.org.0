Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFC66F46B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 17:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbjEBPGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 11:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbjEBPFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 11:05:55 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6AC2723
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 08:05:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8b082d6feso38125941fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039942; x=1685631942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uu1Ovv+9l8H4JgjijbWnBIyNknDQaOGn+zcE13beqg=;
        b=fbWNarVeL1jE19elx6oLPTWstU8BjrkyoXoPleOSrfE+INtgKb54aQhxeJIBMNqWUg
         uHWs363HXUVluQLo+18tTZq1IwMHrGTLKm3xDEgi5Fdn8NqIQumy/LDQLxa/1XXF+LTA
         946MD+HPB0EysoJpRDy7cHOWyP44KV7FW5gq3VSyxISYDLiVqQxy2DNe9WbQPIwJsTPG
         opzfeclpexUFXbdHtg1vkpdp+SeEVuEgmVoYNk+K2iDWgZDLgIN3sygMKNpNG7hE+zU7
         tWxVGH8xDZWKMkvFiIRgAei5qGrKk5tjdgp9TivPBGKmPK7ds65DSWqHty3kcLunM/pE
         H33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039942; x=1685631942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uu1Ovv+9l8H4JgjijbWnBIyNknDQaOGn+zcE13beqg=;
        b=gIQ+xLhuDWLj/RcET+cOxmIkzytR8rhAgmVog9+TQWqyYJ2PVBoxpE1VcymbRD7Uqb
         7yodGcunx5TRh/EHh9nEJIHtMOFJqb6mJujtKITh/Y6du2zKLTUaEz0M1bSJvL60RnFD
         //MlGbNj85qS7HvoPVcdwQCtao8HU3ZCS35SJZO282q5QMpPKRIKbwGuQemZr7r7eb6o
         SNN8Ex8c8TLG6Xbr3H/AsLp6t1YPtALuoBqWuQw5FlT6wamGkrgi9oXBPxfQ73ZYwhaF
         3IU1fZNb8v0iBWIpWqkx0ZdwwIWjZaiUtLdQMgYIfMKMsvO8xmzavQdqBZRtwo/90jY3
         DV5Q==
X-Gm-Message-State: AC+VfDwwpUNn+JVbOKRHNqHkvsaYhlh8qex1j9VAWIApSIR9Fy2HfcRr
        mecYs1qxPybczKlUODAOlEOWLw==
X-Google-Smtp-Source: ACHHUZ7HVT4RamikNKASltBFDq0IsNfpOdA9lhuE19uBg/Fmyq0VJPK9y/n7ppbZwU4ct/4lomXfHw==
X-Received: by 2002:a2e:9598:0:b0:2a8:bc08:a9a3 with SMTP id w24-20020a2e9598000000b002a8bc08a9a3mr5182333ljh.28.1683039942546;
        Tue, 02 May 2023 08:05:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:05:42 -0700 (PDT)
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
Subject: [PATCH v2 8/9] drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
Date:   Tue,  2 May 2023 18:05:32 +0300
Message-Id: <20230502150533.3672840-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 13 ++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 11 +++--------
 3 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 341e3a8fc927..2533c4629021 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -568,17 +568,13 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
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

