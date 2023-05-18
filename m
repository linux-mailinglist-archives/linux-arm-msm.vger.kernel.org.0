Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F489708B6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjERWWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjERWWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692571A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f13a72ff53so3037128e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448563; x=1687040563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NAtEUH/HdvpFuIjL0QXyox0ZfyP5rINrbBvY05iVko=;
        b=vQFaX46auuSXatpvG6QHb0qW7flHw7436QiA7WUZmJKfG3AKXcXurWDj4K2AH7y7yh
         x42vevVw0omB3+Z15hKSpR9QFWoq2OKowxrbrEmT7o6KHrGIwrxskJ/+wf3kDbaxAIiI
         cijLyKUY2VCCNNOqd8pbRIvU4ShfB9I3upn3VChdnopbHsKENiuj8ONfCSFV+fpOFd6T
         zA2Gn67iVmFuFc9ipwZLxv/W+5P1ov53sRPpO4smJlNLVrNvaLju7hwuUxRWNCuqIyxb
         4Gq3mxgeheqeGsYvLKS6jITNv5iMsnqz2JLUS9Dk7sMLG+trA3kCOEv0RYVBemQoOx3/
         gxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448563; x=1687040563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NAtEUH/HdvpFuIjL0QXyox0ZfyP5rINrbBvY05iVko=;
        b=Ju0hcZfbo5Odk+R8W/1Uehf6zbX+8xC0rI4vB88SHnomKJ3JgCXMcXz155ex4RGPSE
         bjNIUUzc0l8qAgGq3/nJRgI6z1md4HQkRhnT9qiY+vmJCsnik5wC1/LuDb8XGfxLUpRR
         BuXl5XAU4RNPXpQOg1OZWXWZY7pGo949KeCVHdIogzilWwFPjBQwkk2zv3WAnprE3zoB
         mk9Hihe4Xeb1YgBWxc1ZxkEplYfQkTYbjpByzoX9n8h9mRSz4fQ5ZWuBFFODjOcYMGpQ
         qwJRjYsXTo5DFAhd4QRK4oEmUVz3VDEEMIEXK+p47/w4FMtDPUxkXjYFAiDVrknFQbxn
         PkNA==
X-Gm-Message-State: AC+VfDyYto6s9hVYmrJyu53z9UmTO9JR1FIHlT9UO/6Ho7ckKeNu2Zjh
        AUTtK7vvFuY85AFCLvxa59K9sQ==
X-Google-Smtp-Source: ACHHUZ6TT9QahLvMI4SSd/Th4ybgzTnaRJbj9QT/hIWcLzGnEArJjmFezepu/9GBoHxL0Gp0dPSHvw==
X-Received: by 2002:ac2:55a7:0:b0:4ed:c64c:37b with SMTP id y7-20020ac255a7000000b004edc64c037bmr96963lfg.62.1684448563791;
        Thu, 18 May 2023 15:22:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:43 -0700 (PDT)
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
Subject: [PATCH v3 5/9] drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
Date:   Fri, 19 May 2023 01:22:34 +0300
Message-Id: <20230518222238.3815293-6-dmitry.baryshkov@linaro.org>
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

Drop support for DPU_PLANE_QOS_VBLANK_CTRL flag. It is not used both
in upstream driver and in vendor SDE driver.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 10 ----------
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3e92c2c66716..1c1e35e0da97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -375,8 +375,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @creq_vblank: creq priority during vertical blanking
- * @danger_vblank: danger priority during vertical blanking
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
  * @smart_dma_priority: hw priority of rect1 of multirect pipe
@@ -395,8 +393,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 creq_vblank;
-	u32 danger_vblank;
 	u32 maxdwnscale;
 	u32 maxupscale;
 	u32 smart_dma_priority;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 78d928065b7b..dde02278e006 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -695,14 +695,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			0400,
 			debugfs_root,
 			(u32 *) &cfg->clk_ctrl);
-	debugfs_create_x32("creq_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->creq_vblank);
-	debugfs_create_x32("danger_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->danger_vblank);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 586f089756fa..3cb891917b65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,13 +73,11 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 /**
  * enum dpu_plane_qos - Different qos configurations for each pipe
  *
- * @DPU_PLANE_QOS_VBLANK_CTRL: Setup VBLANK qos for the pipe.
  * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
  *	this configuration is mutually exclusive from VBLANK_CTRL.
  * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
  */
 enum dpu_plane_qos {
-	DPU_PLANE_QOS_VBLANK_CTRL = BIT(0),
 	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
 	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
 };
@@ -361,15 +359,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pipe->sspp->cap->sblk->creq_vblank;
-		pipe_qos_cfg.danger_vblank =
-				pipe->sspp->cap->sblk->danger_vblank;
-		pipe_qos_cfg.vblank_en = enable;
-	}
-
 	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
-		/* this feature overrules previous VBLANK_CTRL */
 		pipe_qos_cfg.vblank_en = false;
 		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
 	}
-- 
2.39.2

