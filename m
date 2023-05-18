Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B1A708B6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjERWWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjERWWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368F8E50
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso2995137e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448564; x=1687040564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JilLW5cODi65ymug591NRbLkch0N415dM0PCpDzpAxg=;
        b=xp9d02wM2sJS8Sys/5ybQT2uSnabCokm+mXd/hcl1lZszFMviFRKPkO+GzEBAK54fb
         dldW+ZvhVh9ySkhYt2mCNo1dq5PWa6T5qZtXYxsHzwkhrJYShiqVSRw9mhtFb2Ru+Rfh
         iHfR6IadVjV3sMTDmoBNVO272c8mSsNAJPOhUVFbm3cit850cC9BTuhwuuHmRX2M2MkN
         MFiP4G3molhN9hmvvGr1stXBNIZjt4pHRD8hJ33yU42sNcXgqUeL+Na/a0JtvXqyuQY+
         0zxKFC4wLtNdWBjf/rzpMi7KrHIzdwM+snlczRx9wIoJ3K7DiFAkZkg5Px5TfHP86fVI
         IDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448564; x=1687040564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JilLW5cODi65ymug591NRbLkch0N415dM0PCpDzpAxg=;
        b=HQ1aRGODRpz9OcLsiChNC+EjvWH9XWLaW37n3wzhIOmMtamUg2pGhuRtq0X6QkgVEJ
         kBTJqPISKbD7sH9eAEM6+R/OMiA7jTYaIXzOIQCfmKNJiUF4fMMU25bcVOYwZjrO31+v
         ozT/LDgWvdseyHIJ3A/p/c4yW2YhVV71462IcrUe+BDJHKWHdI7bmr209lsh1phQKswp
         G9dSyGRIIfy4usUkDUc3vTXwUESCB1uzNAycoPPfgr7JJnZtO7APV80yAVudCNIsYZWg
         +pVaNAjvCYbTwjpAa3jZ/2V/PKhUSnw2RD+pInNgQxsAUfDMijci6B98JjBx8LEDxnBK
         Wz+A==
X-Gm-Message-State: AC+VfDwwlMf1iqzpUPUPUurK6XYOd6ecsqeXFAxCV6Qwe6xQULaKhiWt
        swU1PLksjmoLgCzcUPwDvukRGw==
X-Google-Smtp-Source: ACHHUZ7KHVXvHjRux8yGBExiocYVe37kkuUUt4GNN08mwH7MRtvhQeRTRUi7Z8RYlRHpYjpYbXCUlQ==
X-Received: by 2002:a19:700c:0:b0:4ef:f1f7:eb8f with SMTP id h12-20020a19700c000000b004eff1f7eb8fmr128242lfc.42.1684448564506;
        Thu, 18 May 2023 15:22:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.43
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
Subject: [PATCH v3 6/9] drm/msm/dpu: simplify qos_ctrl handling
Date:   Fri, 19 May 2023 01:22:35 +0300
Message-Id: <20230518222238.3815293-7-dmitry.baryshkov@linaro.org>
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

After removal of DPU_PLANE_QOS_VBLANK_CTRL, several fields of struct
dpu_hw_pipe_qos_cfg are fixed to false/0. Drop them from the structure
(and drop the corresponding code from the functions).

The DPU_PLANE_QOS_VBLANK_AMORTIZE flag is also removed, since it is now
a NOP.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 17 ++---------------
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index dde02278e006..925689dc77f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -573,16 +573,6 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 	if (!ctx)
 		return;
 
-	if (cfg->vblank_en) {
-		qos_ctrl |= ((cfg->creq_vblank &
-				SSPP_QOS_CTRL_CREQ_VBLANK_MASK) <<
-				SSPP_QOS_CTRL_CREQ_VBLANK_OFF);
-		qos_ctrl |= ((cfg->danger_vblank &
-				SSPP_QOS_CTRL_DANGER_VBLANK_MASK) <<
-				SSPP_QOS_CTRL_DANGER_VBLANK_OFF);
-		qos_ctrl |= SSPP_QOS_CTRL_VBLANK_EN;
-	}
-
 	if (cfg->danger_safe_en)
 		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 86bf4b2cda77..aaf6f41d546c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -165,15 +165,9 @@ struct dpu_sw_pipe_cfg {
 
 /**
  * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
- * @creq_vblank: creq value generated to vbif during vertical blanking
- * @danger_vblank: danger value generated during vertical blanking
- * @vblank_en: enable creq_vblank and danger_vblank during vblank
  * @danger_safe_en: enable danger safe generation
  */
 struct dpu_hw_pipe_qos_cfg {
-	u32 creq_vblank;
-	u32 danger_vblank;
-	bool vblank_en;
 	bool danger_safe_en;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3cb891917b65..0ed350776775 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,12 +73,9 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 /**
  * enum dpu_plane_qos - Different qos configurations for each pipe
  *
- * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
- *	this configuration is mutually exclusive from VBLANK_CTRL.
  * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
  */
 enum dpu_plane_qos {
-	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
 	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
 };
 
@@ -359,25 +356,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
-		pipe_qos_cfg.vblank_en = false;
-		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
-	}
-
 	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
 		pipe_qos_cfg.danger_safe_en = enable;
 
-	if (!pdpu->is_rt_pipe) {
-		pipe_qos_cfg.vblank_en = false;
+	if (!pdpu->is_rt_pipe)
 		pipe_qos_cfg.danger_safe_en = false;
-	}
 
-	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
 		pipe_qos_cfg.danger_safe_en,
-		pipe_qos_cfg.vblank_en,
-		pipe_qos_cfg.creq_vblank,
-		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
 	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
-- 
2.39.2

