Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D16B721890
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 18:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjFDQ2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 12:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbjFDQ2F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 12:28:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876BFBD
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 09:28:04 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f5f728c4aaso4383927e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685896083; x=1688488083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHzU3gPciXQqS8pKnJChvyqVjcebtMRzkeHmWRskWuE=;
        b=BGtPXrfolRuN+kZ6dEqhmkMds/1tiYx3KidU3BJotaRoHaajgiO6OZhxJ8trxF1EcG
         o+VOKLHjgHlMwbImElxgdzf9Dbl2eqWPBeWXEC0fB1lHYDlt9ob96FrNbmSWC7Q/YJ4K
         VAEdm7DmIJuRBMA0CrgAourAl1KjiIoUOBZAM3cHUiydPOTloXevGwHe29zU7/zL9Vs/
         d9pE9fzhnHlN04wgmTCbOO4sX2o6DPbo/w181U/NtXI2/y9qGdKCq/6hIAaosVfR5TzW
         SD6FZnfK3C0Gx6TQcfiHXEqM5oPQvWqK7xhJvaj0bmQCjSWkaKREkaL92Rcz9/hqqYzM
         9K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685896083; x=1688488083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHzU3gPciXQqS8pKnJChvyqVjcebtMRzkeHmWRskWuE=;
        b=chCVyz0qkOI8TRVMvW8C8d009346bRjqvTbIPe2Gahf4RrUAMPO+DQk7eBMLiXPacb
         HQNellLQlV5id/dwAMN8o0DWXreSQoTlfFClwRpvJW+EruurjY2nWK5J6Uz2zXeCFOzg
         PY9U48o7aM3qGN1SwLcWH8DJqUaiLFX06O+Rh3EYCh/iaNKT8jrpn2G3ULGCv/KqMSVs
         rspmIs2C7tzny+eh0nYQmtkWShRN//b4J/drQchR1TAKiWJQKBzxVarEXN8CvWgvbZdI
         Qdl/OUJJC5d0izNv8GdhIv5PYcAcnt/hI4r4LTNmG8Z3QGYh+ffbbNq9vw0kF88SYfeG
         MC7A==
X-Gm-Message-State: AC+VfDwLnvKieWUB+ARkl8O/PV+7ib7LlL6mdg8MdcPfeyS1srKHwlcb
        4wWMWFzFsFcLyp3K5X+lAAdc/g==
X-Google-Smtp-Source: ACHHUZ52WCf3jwLFnDMc0lLzJqbj/A1V/ZVkfc+whCGFo38BCWzS8blpkURTvl0LgrEn8NZVJJ4jSQ==
X-Received: by 2002:a05:6512:376b:b0:4f3:89e6:23c0 with SMTP id z11-20020a056512376b00b004f389e623c0mr2294567lft.31.1685896082774;
        Sun, 04 Jun 2023 09:28:02 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 09:28:02 -0700 (PDT)
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
Subject: [PATCH 2/8] drm/msm/dpu: use PP_BLK_DITHER for DPU 6.x
Date:   Sun,  4 Jun 2023 19:27:54 +0300
Message-Id: <20230604162800.1048327-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
References: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
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

DPU 6.x only have DITHER registers in the PINGPONG blocks. Stop using
full-featured PP_BLK and use PP_BLK_DITHER instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index daebd2170041..290fb33817a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -129,22 +129,22 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sm8250_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 			-1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 			-1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 			-1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 			-1),
-	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 			-1),
-	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 			-1),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 67566b07195a..ee4e2416e516 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -80,10 +80,10 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 			-1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 			-1),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index ba9de008519b..bda47b4f0a82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -60,7 +60,7 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sm6115_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		-1),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 92ac348eea6b..5a366dee16be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -57,7 +57,7 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg qcm2290_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		-1),
 };
-- 
2.39.2

