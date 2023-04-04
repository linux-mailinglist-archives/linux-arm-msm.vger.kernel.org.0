Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C906D6232
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235057AbjDDNJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbjDDNJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:34 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650963588
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id z42so33730822ljq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh2RzkEWZT6Vaf3ZUPzZOx6JEXvwhpgS93jOZDErycg=;
        b=JWMHRK8qSbmPAreRgpzP+dyNmvpvqtapb4Jt8haRi1UOwz8KDsjDUHgvMowg85vgLR
         MPs+eA+aV0cDgNvJ/MKFDggLZePneFr+BK+uCCiLQp9H0687ptCtPKjkTyEN+5yyLxxI
         wKwoSk8MimuhSv8Nyx+k5zF10FxjYkPtWptgPSSx3YSx1+tgsp/uIORFkEoDuU7gBPY/
         ONKSryXFWOM8IE8xH+dapNd5Gt6FXoNAc33Cv8we1sSOToma3FxNV9elbZs/8KxgZaoF
         VrYWIsVLsufxx/qV+9gDx1Q9pC16GFHXTNGyB2M9T5lg/x1hQSEMQn4JkJ7bFPQNuI1E
         GTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xh2RzkEWZT6Vaf3ZUPzZOx6JEXvwhpgS93jOZDErycg=;
        b=rcKuacBXXyqzLgJDcJ+kSE0oYBvP+KjQL4M3VOidIwI39hOoLem9H2m4oaFwFJnYW0
         FEtu8zG33GLODRKBqa/Xi8v33wJ2Q+ywdx7GvP2eBVxs3I+NMkqb08T0Fa5c+tcrmdgN
         nYg/FfG4O6I6SWikGt+cTNz8+u4AWCg2SEv3/hg8FlSk6ulBouQT/td+rhFLFoHp2H2m
         MHv8VWm5pnGxbrDOymltMBOj8Rft2O4ZxRchtLtZP3O838vc5vyDoqnuImG3sUeYse4p
         cKjQgpNqC55bzpBBbMPONJd9GkZAqWEriCjDLTeRqh4moKgiWMEavxwvuyyhaauLStUG
         bE7A==
X-Gm-Message-State: AAQBX9fwYd/0gHdobRWZQ5T5R/wSzOBa22ggQFq5MeyhAT2AGlEfjHTP
        +MWyy7HFRL/BwpoWp/2pzP3uFw==
X-Google-Smtp-Source: AKy350ZzqdEg52SbWByuI7kggrc8tUeJyrsGF4Bae4V6tyyyYC5HVfx1xftLGy+qMttyQE0Krck+8w==
X-Received: by 2002:a2e:97c1:0:b0:29e:a3a0:ee2f with SMTP id m1-20020a2e97c1000000b0029ea3a0ee2fmr786611ljj.30.1680613769618;
        Tue, 04 Apr 2023 06:09:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 34/42] drm/msm/dpu: enable DSPP and DSC on sc8180x
Date:   Tue,  4 Apr 2023 16:06:14 +0300
Message-Id: <20230404130622.509628-35-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index fb8cdcd6bfe9..93d303cc0dc5 100644
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
@@ -142,6 +153,13 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
+static const struct dpu_dsc_cfg sc8180x_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+};
+
 static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -190,6 +208,10 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
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

