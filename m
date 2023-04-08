Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B56B6DB7CD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 02:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjDHA15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 20:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjDHA14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 20:27:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE4EA26F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:27:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i26so483288lfc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680913673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tES+k/2rCXVwYzByM5X66NR66DuAIeKGJOTQwb8XTGc=;
        b=gl2dOvy71b+fdy0GFm6gRo172Qs+i7rvStO2GKiK5Zn4LHpC7lXESGBa3BdXuz2/Tq
         3rcqQuiLhn07KYGLnZ/0B1ee070aOOII4mewBYnmhBTK05dWWRfZlODHglUmqKgAnN5w
         JhFCuFey+zy5FswvT7tF+k4CFwucDUUmIcZ9w1qZIKnCJO8JX//033LutoTTLljosEve
         npy+hjT2t1BdMF38QPJvG1KuF5AoIowbEb8K01SiRUxgFyP/2C4RgBualpm4nM+UQh/u
         JKubr6VugfSUhPieNZYT9l4TYhh9wWcbHZSz+fooNY2TrQcCImx5qUDvIg1WbraaSbx7
         u92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680913673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tES+k/2rCXVwYzByM5X66NR66DuAIeKGJOTQwb8XTGc=;
        b=ZIEa4oEbDdwfGgUBF1ZRM8P2/QoJ5hgRbv5cE0fvbHLzxCGnUCQ9ZM3ttdXIkh/RI5
         s6bJIePPn/ectU3530yp9lXlo1nGs8sqiHfCQufXaiOlZROyIxwKCcnXZ4IAju8ZXACf
         j4U+qtTaH57s0RWBG5tJBMsAM6KD85pqst6i7ogcqXf27T/NVCBWBDZcqpQR/e9ghatO
         7CF1sCZMiTS1uaQzXgOatstEHRvScq84cW8VKl0yPxUfKBimBbBXbm9ihka6Q3Hho9X9
         QUBumty8Cg72eraBacO7+hYLDvR7vK9QMyH/TJSJAXyZNqxWI/lg1kmjB14V1aI1i0U9
         +qSg==
X-Gm-Message-State: AAQBX9cunJjkZy7o+pdP4q1Rgz8TBABiPHu0CGMW8i/4FEMv3H6AhqML
        JitjdRDLNN1SwuyS/JwcA3Z0sg==
X-Google-Smtp-Source: AKy350bxJCx5CO9kEiOH+oHNMx6p+ge37Cpll9/xs1LeOAcl8bONpJoKkkTQc3L5ZTb428unrONxRA==
X-Received: by 2002:a19:c215:0:b0:4b5:23c4:ab1a with SMTP id l21-20020a19c215000000b004b523c4ab1amr1361811lfc.42.1680913673131;
        Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 3/4] drm/msm/dpu: enable DSPP and DSC on sc8180x
Date:   Sat,  8 Apr 2023 03:27:49 +0300
Message-Id: <20230408002750.2722304-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable DSPP and DSC hardware blocks on sc8180x platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c57400265f28..085db379083e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -102,9 +102,9 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 
 static const struct dpu_lm_cfg sc8180x_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
@@ -115,6 +115,17 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
+static const struct dpu_dspp_cfg sc8180x_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -142,6 +153,15 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
+static const struct dpu_dsc_cfg sc8180x_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
+};
+
 static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -190,6 +210,10 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.sspp = sc8180x_sspp,
 	.mixer_count = ARRAY_SIZE(sc8180x_lm),
 	.mixer = sc8180x_lm,
+	.dspp_count = ARRAY_SIZE(sc8180x_dspp),
+	.dspp = sc8180x_dspp,
+	.dsc_count = ARRAY_SIZE(sc8180x_dsc),
+	.dsc = sc8180x_dsc,
 	.pingpong_count = ARRAY_SIZE(sc8180x_pp),
 	.pingpong = sc8180x_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
-- 
2.39.2

