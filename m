Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D208570AF3C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 19:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjEURN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 13:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjEURKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 13:10:48 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BC7DD
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so1200897e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684689030; x=1687281030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jI7VDuf+wVk0mRAdywf1CkCHbY9wYZmWigDIurIrlRc=;
        b=yEuJsz0R4N4jUpU7qbl1T1cm+gRjwnF5uhNv7yiVyejSvlEu1+1ZrPXiIhbssKeqQM
         HJ/yEPW0WJ2jnyJL1jwvHQiq0TVeEvgGSt0lI+9NxlzHFhKG7DrLa16nLUBtcuLQHgT9
         2ZwEBRID1J6Ohad08tUx/uwD9U6mJow09jFj6gXzKsyDItYqYopdJikE1MCRNWgE/okY
         zzybXLwJ/Ezrc+trXHaQG7OOBbl46Eb0eLLV6rhJiKWizvJEIqjrqdczSVYL1llZAMUw
         drda8aCr4+C8m5NZoevs3dJU8IkHSm0BuMQ//lOwSbj+mmAIEajB1TbytFMx4MI21nal
         +ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684689030; x=1687281030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI7VDuf+wVk0mRAdywf1CkCHbY9wYZmWigDIurIrlRc=;
        b=EDpem2yiYn4IVSp/lupuA3+Wy/inIy+gtuaNYHi11FXLFP3vxigss0Lp62SX9fT6er
         o+jQDzb/IFnIq6xGzjRrzz7rEJDLxvktwnSquxWqRPb1iN2upU+qecnX3R0dJ8CPOJE3
         D7dx7K1KdfrQwT6rn1yj7nVXxQHWil0dkmfPCskouZmQIQhekPCMG4BVcWi2CnLXjAj7
         8WJG9zgQPC6tIRuBvtCfHehx3cJ3dHRJ66XsMzP6WJYa3PRXmefqlDqRUpFaeUWYszwh
         dAvbP761xpkVj7D6pc0PfRKhWI99c0nZ+WLYoh7EcXX569Mao+J9DPBqU3TSZq8oEmo3
         03PQ==
X-Gm-Message-State: AC+VfDyJeROGYHLYohrtpyMRyNWafVTpiJzEoRLlEzm1LTkNrO0D7JkC
        oeIpVwj9UtuTaDY4MHGsdRYQSw==
X-Google-Smtp-Source: ACHHUZ5chHgC9+Q8T7lmlsR5sggu9lK5opSGjKGFGPLKPUwSYG8GdhGtjedD7sTACl6VCVxkCczfHw==
X-Received: by 2002:ac2:5feb:0:b0:4f3:843a:7290 with SMTP id s11-20020ac25feb000000b004f3843a7290mr2218366lfg.52.1684689030081;
        Sun, 21 May 2023 10:10:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 10:10:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/6] drm/msm/mdss: rename ubwc_version to ubwc_enc_version
Date:   Sun, 21 May 2023 20:10:22 +0300
Message-Id: <20230521171026.4159495-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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

Rename the ubwc_version field to ubwc_enc_version, it denotes the
version of the UBWC encoder, not the "UBWC version".

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4ae6fac20e48..d1e57099b517 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -27,7 +27,7 @@
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
 struct msm_mdss_data {
-	u32 ubwc_version;
+	u32 ubwc_enc_version;
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
@@ -205,10 +205,10 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 		    (data->highest_bank_bit & 0x3) << 4 |
 		    (data->macrotile_mode & 0x1) << 12;
 
-	if (data->ubwc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= BIT(10);
 
-	if (data->ubwc_version == UBWC_1_0)
+	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= BIT(8);
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
@@ -224,7 +224,7 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
 
-	if (data->ubwc_version == UBWC_3_0) {
+	if (data->ubwc_enc_version == UBWC_3_0) {
 		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
 		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 	} else {
@@ -507,13 +507,13 @@ static int mdss_remove(struct platform_device *pdev)
 }
 
 static const struct msm_mdss_data sc7180_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
 };
 
 static const struct msm_mdss_data sc7280_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -522,14 +522,14 @@ static const struct msm_mdss_data sc7280_data = {
 };
 
 static const struct msm_mdss_data sc8180x_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 };
 
 static const struct msm_mdss_data sc8280xp_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -538,26 +538,26 @@ static const struct msm_mdss_data sc8280xp_data = {
 };
 
 static const struct msm_mdss_data sdm845_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm8150_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm6115_data = {
-	.ubwc_version = UBWC_1_0,
+	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 };
 
 static const struct msm_mdss_data sm8250_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -567,7 +567,7 @@ static const struct msm_mdss_data sm8250_data = {
 };
 
 static const struct msm_mdss_data sm8550_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
-- 
2.39.2

