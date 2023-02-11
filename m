Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69943692D10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjBKCLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjBKCLm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:42 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52317404F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:39 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ml19so20366866ejb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RuCDOUjOlRSYd/++eW3PBt5XoERBhclCxzplEdwpOk=;
        b=YtL8PkGcy6jiyJqUWXKhRcF9Pj3oAvwz7l/jZOOFBj8jKaLRzpTrRdnuUvz/U/fQ8j
         duMuC4vQHPzoJiqhNwvjepN2qICzcykqnBvz8cwKhrriZEm6mXiaSO7jekMLVMj7jRgq
         gMhV4qAzMhPYas5p/vvtxLtKAflR977q2yLS5LPcjHSQZHNjTtKjaL9EshRfy5Fts+Zs
         TbMAtOHw4SQUunOoXsdDuWGuqNvNW3xFJl2u9Ayjnl/5fnrwXkLTWdu7K3hCv/wef9lB
         uTlk10PZ1cUhNEOLVFoaMOxS55RAASydCzMcl2PX4TQdZGIwG/+e6eZropYD4dUMnKRn
         XTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RuCDOUjOlRSYd/++eW3PBt5XoERBhclCxzplEdwpOk=;
        b=xE3eo+jgJxw2cL70PPVVinArb1g7drJ8xBklYMT56/3/QvrXlxKpCPd4SzM4cyABWp
         n6BnjiW16El4viGBwufcmEtZcJzhsWe5oB6P5O8978YxFErvIICX9guyIdeX01AxM35a
         qfS/Uyfx57TVDMdOl+mhMOfg2CN+Q0ODdOWG/34tfL+conJ39gMqsAK8GQ8FqLvIk7rr
         r7jfgiNVUlDnkfL63yjETDHoAfewd9h6XWzMjuhID6hE5IsYI+bF/Okqcn12E/rBGdlt
         YzAb8b8NlH5+64Rb78uqqMNtYLnA3WMaZMS7ne+4tyJ6p9/GW/nz2MA9vpaX+R5XYD8C
         jISw==
X-Gm-Message-State: AO0yUKWiNLUmbr+g5ucb6z8SYoFbTbJY2YwdzBKvXGZPeLf/OiT0KKV3
        MW/b6JpVrXRgaMpNRQg17UwIrQ==
X-Google-Smtp-Source: AK7set/Er2+wGTEiwkBUxR3FJr0SEs66PqHYYvDygVP/ratiLdyIF01uCsBfWQLwcR4TU9ujvPH9IA==
X-Received: by 2002:a17:907:94c3:b0:8aa:c358:fc01 with SMTP id dn3-20020a17090794c300b008aac358fc01mr16145244ejc.67.1676081499344;
        Fri, 10 Feb 2023 18:11:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 42/43] drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
Date:   Sat, 11 Feb 2023 04:10:52 +0200
Message-Id: <20230211021053.1078648-43-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease review and reuse rename MIXER feature masks to contain base DPU
version since which this mask is used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h    | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h    |  3 +++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h    | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       |  9 +++------
 11 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 842acd32b5ec..87aeb6e8461f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -98,17 +98,17 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 };
 
 static const struct dpu_lm_cfg msm8998_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 5a572b00b1f1..cd558390b29d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -96,17 +96,17 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sdm845_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
-	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x0, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x0, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
index f6365604c607..8083e1713c2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
@@ -97,17 +97,17 @@ static const struct dpu_sspp_cfg dpu_5_lm6_sspp[] = {
 };
 
 static const struct dpu_lm_cfg dpu_5_lm6_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 3053e5b51198..6958b3980b4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -103,17 +103,17 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8250_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d2f327be6ca3..3b6b94124c5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -69,9 +69,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc7180_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
index 0a8920e92d21..db3ac78bf9a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
@@ -7,6 +7,9 @@
 #ifndef _DPU_6_LM1_H
 #define _DPU_6_LM1_H
 
+#define MIXER_QCM2290_MASK \
+	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+
 static const struct dpu_mdp_cfg dpu_6_lm1_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 05e7db7b6fc0..cff7e9154415 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -101,17 +101,17 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8350_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index b498988b71d3..172e847d7533 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -74,11 +74,11 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc7280_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
index a2a0f7062f37..8dbd3c93c9a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
@@ -96,12 +96,12 @@ static const struct dpu_sspp_cfg dpu_8_lm6_sspp[] = {
 };
 
 static const struct dpu_lm_cfg dpu_8_lm6_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
 static const struct dpu_dspp_cfg dpu_8_lm6_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 661f4c67eb4c..116e241f5854 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -107,17 +107,17 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8550_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 23fe5f1ce92d..45f9be9665ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -49,14 +49,11 @@
 #define DMA_DPU_4_CURSOR_MASK \
 	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
 
-#define MIXER_MSM8998_MASK \
+#define MIXER_DPU_3_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
-#define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
-
-#define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+#define MIXER_DPU_4_MASK \
+	(MIXER_DPU_3_MASK | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
 
-- 
2.39.1

