Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78269721891
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 18:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjFDQ2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 12:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjFDQ2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 12:28:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27787BC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 09:28:06 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f505aace48so4942324e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685896084; x=1688488084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNULruN3aRzxtXFBFAkxasq5H/434iooJY8eRnsPq70=;
        b=eU6b/zsN8LZBGKqbzNcSZ60q5RjeD2ZmP8eePYmt6yaA17jyVpOkvOeU50MX6dNpG+
         39AHYPotFJSAqlcdQWCJHFtfOIIwAx05ku0NivTFemsiPESm9HjizYocFKt3Zc/5VMmV
         nBq8fYLt5oW89ZEDeXT2v+v/RH+7j/lKpGNHTxMMrATelBNPkdG9fuSoMU9ArUJdqJse
         rIWQYJgmq4xp8KEb8nK6QF7U/Wu1mSTJCbQU6ZRBs5ozSEphNKrdxW8ENgq/YWPsRkSP
         5hPaFDnklSZ8l60C+4XhDuueda5qUmcf+lQ4+K2fLZD/R2xGANls5dJF71gHCdd4EvgR
         XwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685896084; x=1688488084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNULruN3aRzxtXFBFAkxasq5H/434iooJY8eRnsPq70=;
        b=Ptbkrdri2FEYd01J+vuc+MnsFnky1x+RTL7RAuw+QCqDIZ9KV03OV1M90L0Oy4KN+M
         Mh4PPGFVr/Od1ckXsDApEt0ZRNbYk9FDlbnu+zTnLPRK7FPBlSuft1A3jzMBmzz71Xcb
         MuhJLy+4UHxrgXWBNEArjpCH0uwrrH1hOwvo0R9x0ZjoSJU9Z3ViGkEuyU2SYoVTPyYg
         aEoqsgFs5zQmmnOl3dneQcQAV6vVm96pcK8eluPr3qxlN2cBX5mCEBXy95CP5aglX6s1
         6LEUs5D6WILQobMiLSt5xztrTpmXFurjkVVeJ+fCfhJUtAMpSREA3BJsg5z/Zj5fvfCN
         QAgw==
X-Gm-Message-State: AC+VfDzyLfHXO+E5QG0XUx6oKqPOPo/+4nDqIhSDpwi8KjeRK/W6VaFG
        8JdrQB86N36Q+VDKbBE/zu/Q0A==
X-Google-Smtp-Source: ACHHUZ4kL8YlOVYraqRC4RE4EiJZNh3xQvRYBNilNuN2FQE71Szewr/rVGnrv6NaSWnfQzZ3qSSfiQ==
X-Received: by 2002:ac2:4193:0:b0:4e8:5e39:6234 with SMTP id z19-20020ac24193000000b004e85e396234mr3506159lfh.16.1685896084316;
        Sun, 04 Jun 2023 09:28:04 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 09:28:03 -0700 (PDT)
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
Subject: [PATCH 4/8] drm/msm/dpu: split PP_BLK_NO_TE from PP_BLK
Date:   Sun,  4 Jun 2023 19:27:56 +0300
Message-Id: <20230604162800.1048327-5-dmitry.baryshkov@linaro.org>
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

Simplify PINGPONG blocks setup: add new PP_BLK_NO_TE, which does not set
RDPTR irq index. Also make sure that DPU_PINGPONG_TE is set for all
TE-enabled PINGPONG blocks by setting it explicitly in PP_BLK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 30 ++++++++-----------
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 30 ++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 14 +++++++--
 3 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index b5f751354267..d9a3432d4c13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -128,24 +128,18 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
-	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
-	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+	PP_BLK_NO_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
+	PP_BLK_NO_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
+	PP_BLK_NO_TE("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
+	PP_BLK_NO_TE("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
+	PP_BLK_NO_TE("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
+	PP_BLK_NO_TE("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 };
 
 static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 8ed2b263c5ea..60e82356f2f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -127,24 +127,18 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc8180x_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
-	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
-	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+	PP_BLK_NO_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
+	PP_BLK_NO_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
+	PP_BLK_NO_TE("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
+	PP_BLK_NO_TE("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
+	PP_BLK_NO_TE("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
+	PP_BLK_NO_TE("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 };
 
 static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9a0a8688848e..42f8c12c91a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -76,7 +76,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
@@ -491,7 +491,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_done = _done, \
 	.intr_rdptr = -1, \
 	}
-#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
+#define PP_BLK_NO_TE(_name, _id, _base, _features, _merge_3d, _sblk, _done) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0xd4, \
@@ -499,6 +499,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.merge_3d = _merge_3d, \
 	.sblk = &_sblk, \
 	.intr_done = _done, \
+	.intr_rdptr = -1, \
+	}
+#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0xd4, \
+	.features = _features | BIT(DPU_PINGPONG_TE), \
+	.merge_3d = _merge_3d, \
+	.sblk = &_sblk, \
+	.intr_done = _done, \
 	.intr_rdptr = _rdptr, \
 	}
 
-- 
2.39.2

