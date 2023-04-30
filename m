Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0371C6F2AC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjD3U5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjD3U5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:57:19 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF7D12F
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso2260718e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682888235; x=1685480235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IldrM6PVf7lolgGQLZs8CrARxItt7xmrIuooW70x7g=;
        b=LMg54sCY0oWs8jIE5/Nd8alwWe3DES37WCZeZtWgIxBcUd0ciQEuTxEf/i2Jkg5dac
         6dV3DdmILMfE/pyOMetkK11uMyhCJQafT1qvRp5Id166EIyz+K5NchcMxURcL0GU0R8h
         Wxs249SE/SNr/1IpfS2iLwp+jf7Ts9/L0Fa/2M8erS4ETHzGZcAR8rgeyNZieMHoX5NG
         v0y2ADqnYwsX57AJqrPIP8LPlG+Un1XJfqilqn8VxsPLrMT5AyJ+cr8MQ548sugJ8FzU
         2bgtY3giEh5Lcqk7Dm4WLLVfoG/cCDtCTBLXcHmw1bn5kmwvovi+1hhDxCdymi+UlY3u
         RxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682888235; x=1685480235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IldrM6PVf7lolgGQLZs8CrARxItt7xmrIuooW70x7g=;
        b=N5po+GVp6Sh8Py7IJh4uR31aYnAFZP8Mf9oNma92L+mroycHc9qJfoIMMDnWbQdYnB
         rdTRZ3xjXTNSR/3e+e99WXCBIeUOIopGXvKeQ5dukfBBVVKP4v7u4aCNwBO79FxQV/d9
         l/kUScf2PO+Z7koeljfAQyxy8cOhmjzbndkUwGrdlMMY6Bb0pWRQtHvy3JVe3ZX0KDit
         9lxpMQkdsGGmELBdcEallDwzqiq7nQOv6dtFxd0LiGUrPxIvBXcgE5CNjDqkQGr6elD+
         jqm1++9UpxiAja4KLZBv87E+jW9dXajwCI1TkaPq6Hgv+SbDimYpd+/pRwu9KO5Pm+N/
         FCrw==
X-Gm-Message-State: AC+VfDxMN4aX7BAz5VvWTJaPOXzU+s2l66xkEqhzW81JVwEI1VtbFHsd
        aZuGTa/GOQagLnLp6+zsTL0n8g==
X-Google-Smtp-Source: ACHHUZ6vYTRMjLtpGWm54O6d5niNUnuG6bx/OWBjOHrFNPdFpFQHi0PxClS/XRQTCx/Ia5av9SMEuA==
X-Received: by 2002:ac2:54ae:0:b0:4ed:d5ce:7df0 with SMTP id w14-20020ac254ae000000b004edd5ce7df0mr3292630lfk.7.1682888235585;
        Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
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
Subject: [PATCH 5/9] drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
Date:   Sun, 30 Apr 2023 23:57:06 +0300
Message-Id: <20230430205710.3188230-6-dmitry.baryshkov@linaro.org>
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

Drop support for DPU_PLANE_QOS_VBLANK_CTRL flag. It is not used both
in upstream driver and in vendor SDE driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 10 ----------
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b2831b45ac64..d47e7061a36b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -371,8 +371,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @creq_vblank: creq priority during vertical blanking
- * @danger_vblank: danger priority during vertical blanking
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
  * @smart_dma_priority: hw priority of rect1 of multirect pipe
@@ -387,8 +385,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 creq_vblank;
-	u32 danger_vblank;
 	u32 maxdwnscale;
 	u32 maxupscale;
 	u32 smart_dma_priority;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 731199030336..b198def5534b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -697,14 +697,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
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
index 4a5a58152fa8..d7ee4bdc752f 100644
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

