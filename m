Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19E172CE19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238485AbjFLS0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237883AbjFLSZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:25:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2DB113
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:37 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f624daccd1so5291747e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594336; x=1689186336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Wojx8CKa0fNsj3PWh9HoNqa1CUIodoAFt77duCrjQ=;
        b=nFgAZCUI/1tlMnEtguQZ4L2eUtklwJLryWFg4VXcDBpX1AieZuKajcF5QBL3D/HEBk
         tNB6rZaOAlO/wKSqoa7m+FJI/m2asfcl23y2xYuQLuLskk0nnn5L3UyW2OHt/IvdnW5S
         7K8JAoiq8tKDzsaBaxlxGuFSh6S984x2qVFHokyforSiSPos1YlYPCBWg1Ux9V4/qlvZ
         c6T/LB72ftaiAadxE5eD32wo51kyGW0H/EkSA/necv9SS9GPh+Iprfls5Xtj7mYmzsb7
         1A5GY9x3Cs2ABCu9B4NSzJmUT6aL0U3zUax6IEkwOjsNnhoY6NGGc1q5a8Sn/U4A2aMf
         ov9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594336; x=1689186336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9Wojx8CKa0fNsj3PWh9HoNqa1CUIodoAFt77duCrjQ=;
        b=Kv5Yg6xk8LKRL6mIqXIPyS7ASClXomhdgxS0E5VzQHgltvXCXgzVgH+qckLn+VuWRO
         kzm3PJyE3CagLgZioniED0+RaQBEP8t21QPHBWwx79x/wouS2ZuJJVF2JkIHS8bvUGHt
         S23/WHb6m7b7Ubn92iCShyRRlXKNVt/JBcF3PKW6/rnaIZI8Jb0PbZQBQNnD+lOgNF3j
         NGK/Ck++07FXx7SzPzUb9h33JwRdABP2+OVwaeRquTj2FOsGDRtuCJH+GiXLiGYx13B3
         IFtu42JWKyLpJRFUIBCVtqZY1/WKqcpY24eux5d0LddUbyty1c+Loq/ws4dzJQKFx7Dp
         EBlA==
X-Gm-Message-State: AC+VfDxxCF9LFiGNt3Rfe3D25RGc7/BrO9tZhWmgNynQaMpLMl1tUzXR
        Hvpb0B17S68H/R1yDt1+eJg2dQ==
X-Google-Smtp-Source: ACHHUZ6578JElAAJEDCsUrnC1f/XMi/IpFjcTFO30GFGBTTaAAIYCSZWM5flDs14jhM0MPgfoXrnRg==
X-Received: by 2002:a05:6512:44b:b0:4f2:6817:2379 with SMTP id y11-20020a056512044b00b004f268172379mr3843186lfk.23.1686594336223;
        Mon, 12 Jun 2023 11:25:36 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25930000000b004f63dd1dab0sm1503396lfi.98.2023.06.12.11.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:25:35 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/msm/dpu/catalog: define DSPP blocks found on sdm845
Date:   Mon, 12 Jun 2023 21:25:34 +0300
Message-Id: <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
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

Add definitions of DSPP blocks present on the sdm845 platform. This
should enable color-management on sdm845-bassed devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 36ea1af10894..b6098141bb9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -96,19 +96,30 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 
 static const struct dpu_lm_cfg sdm845_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_5, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
+		&sdm845_lm_sblk, PINGPONG_NONE, 0, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sdm845_dspp[] = {
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
 static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -193,6 +204,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.sspp = sdm845_sspp,
 	.mixer_count = ARRAY_SIZE(sdm845_lm),
 	.mixer = sdm845_lm,
+	.dspp_count = ARRAY_SIZE(sdm845_dspp),
+	.dspp = sdm845_dspp,
 	.pingpong_count = ARRAY_SIZE(sdm845_pp),
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm845_dsc),
-- 
2.39.2

