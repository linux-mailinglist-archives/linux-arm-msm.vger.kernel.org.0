Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42256790FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 04:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350357AbjIDCFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 22:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350538AbjIDCFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 22:05:08 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F488106
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 19:05:01 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcc4347d2dso12734031fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693793099; x=1694397899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/rDp6IsMw91trU1zOp/Hjm/TPrfSTJ5k8RTiYBXbIA=;
        b=sSyHaadGJHqZ0iUR/+hlpud/aJfdkf2Ar6SVnpmlDrK1EspuiFd5pf1OhfQt/7t/WO
         3mx7uNd0udEhRHLe+9R5jllN6ORaXrJ4DvXK8eSiiO2w9LQyYIPfi9S3h6lLV0A6IC5L
         NPiChiYdZFLQlB1dwc9HV5JZgQBqAnzEFrRFTLRkmSShTEx0kzEPCgmGwNWJm4DzfCxo
         jmeVRe4GaFxeOoml36oqahsbqMa1PucSVfZIkURQs64xeHkLm5UwpsJ/xI1YBZGD5HWL
         RVTQeyCkuC94kyBZ496srFPdTQdJeU1kUeTVAUsA1fxXU615eBvHPrTp1NUrVqdh3lo6
         hFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693793099; x=1694397899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/rDp6IsMw91trU1zOp/Hjm/TPrfSTJ5k8RTiYBXbIA=;
        b=RnUEESKptZB0LkFq9LJeIHBshQ8MMHCKlyHmDs95bn2MvxN+oINh/nbWkgLkBEqtpJ
         tf5OR2PF6Szik0mpe215tqCOJZr3nSQE+Q55z0iLphKSSgb90Lu7shuA5YJRgKfb0Cfu
         nPsRlnU17vSs5xh/JRivBgAaYvQ5JryHFiqAPGJYNINFqT4mTsRIXv8rbL8K5DFjK5lS
         yNtfc0XrEBhQyTRnyhL+XW3xBKbqBUSboc5WxjDDkJBhkwuwX6QQ0OkUbMBe3r5rhYR+
         c01k/+FC4OSM0WoOiK6xh46BQtcyELGjw0lTbhUxsTEovcEYrj26SN5hViaYWIWmo91E
         CGnw==
X-Gm-Message-State: AOJu0YxL7StAfQYHju5eEql1Zvxq5GhNABNTU2CfSKiwHbj0OWwawWGb
        O+0Di7KS5ZqO1ATbuFLOzWLJig==
X-Google-Smtp-Source: AGHT+IGc6DjrSpswdTIrEcQhdnq2iRRuzXUIadPblyBTMgGfolFtfbD0pPK6ytUe2ccHrV35qZiVIg==
X-Received: by 2002:a2e:804e:0:b0:2bd:169e:3819 with SMTP id p14-20020a2e804e000000b002bd169e3819mr5684898ljg.17.1693793099632;
        Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
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
Subject: [PATCH v3 6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
Date:   Mon,  4 Sep 2023 05:04:52 +0300
Message-Id: <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace the only user of the DPU_INTF_TE feature flag with the direct
DPU version comparison.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index df88358e7037..e03b2075639d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -776,8 +776,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
-	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
-					 &phys_enc->hw_intf->cap->features);
+	/* DPU before 5.0 use PINGPONG for TE handling */
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
+		phys_enc->has_intf_te = true;
 
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d89bdd0dd27a..a1aada630780 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -100,7 +100,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9aac937285b1..e5add4384830 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -158,7 +158,6 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_TE                     INTF block has TE configuration support
  * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
  *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
@@ -166,7 +165,6 @@ enum {
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
-- 
2.39.2

