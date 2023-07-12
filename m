Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AF27507B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 14:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbjGLML4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 08:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbjGLMLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 08:11:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165FFE6F
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:53 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so106571131fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689163911; x=1691755911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNZFmX7gcXRBmp8B+5W4dnLTGHdcrGFIl5CEA8Bzego=;
        b=iCePqPPCMPLuUzlqxQ+lKSUAeSsYTM+SCHjJeNcu6bNOZ37iYIKoaNjUexmxSz3zOe
         SIZdRD9oOcrRDVmdXmdMw1imzGon/cy7x/Ty72lH6+MLI+QdEaqkWixbEgCsb05bIsRZ
         P7avd/cUPPxsQyBpKwcAwczf4guqnjmsXIwmoo/Vq2AK1Wx7SEKRCDSaZRW5pcLv+4ey
         QwqfFaBJUtZuqqWR1CdifoSMrojRyotiabzTGYKY38Nghe54+cWqzmCxYpEtZ0ay3ucx
         Trnmbtl/9+N8fyihdmn/L5aTvW/Wmq7/x8Xmt40ZfKqIvxavFlmzM6cKOPK4qrMUwsSo
         LlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163911; x=1691755911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNZFmX7gcXRBmp8B+5W4dnLTGHdcrGFIl5CEA8Bzego=;
        b=HYkFHcXldLTnA+AvONrxv7dZtXL0vRGus9WdxIgBlOAtBMjsLhwi14ziE7QHfoEghY
         bwDPgNEJ1dhEiv77TUGSJpczJJW+ivfqFC40rM0tQ2qtcnDGTJ4k//hY6IoWIgQZcFAm
         CsmQwuu2gBWY3mSp94jztmQ0RiXYWOUe+DjKAckZ4k2c5RwI9TPMyvSZY6KXxplQYToJ
         SbFh9rS2rb0u2J9DCMg1CGWE5pkfjyNdLYa5dbps6jkC2+Uq1QAOOl+BX7pkYoLlgmBL
         AXi3BVOh4QXQfYVqkmo8ZHlPi8I8UyBhd2maXdg4zMAQA5zrKXrM+DZQXeO7hMeM1TSl
         tCDg==
X-Gm-Message-State: ABy/qLbeJhrrDsB85TYAZ//3ohMjG81VQzcLFsNL1TsXs78aDwzIiDhX
        q0a+4OsPzePK1Q3CQ/ZB25uRWQ==
X-Google-Smtp-Source: APBJJlGTHLWHCt+uPNQGZcuNVTTt5bfMQ8LwlI5HzJnPrZf5Ef2Zp3hT55dvGsAQA6XF/k5rA9i6VQ==
X-Received: by 2002:a2e:91d7:0:b0:2b6:e0b8:946e with SMTP id u23-20020a2e91d7000000b002b6e0b8946emr16285134ljg.51.1689163911242;
        Wed, 12 Jul 2023 05:11:51 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/msm/mdss: populate missing data
Date:   Wed, 12 Jul 2023 15:11:43 +0300
Message-Id: <20230712121145.1994830-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we are going to use MDSS data for DPU programming, populate missing
MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
programming, so skip them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index eed96976e260..b7765e63d549 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -252,6 +252,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * UBWC_n and the rest of params comes from hw data.
 	 */
 	switch (msm_mdss->mdss_data->ubwc_dec_version) {
+	case 0: /* no UBWC */
+	case UBWC_1_0:
+		/* do nothing */
+		break;
 	case UBWC_2_0:
 		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
@@ -491,10 +495,22 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data msm8998_data = {
+	.ubwc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 1,
+};
+
+static const struct msm_mdss_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 0x2,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
+	.highest_bank_bit = 0x3,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -547,6 +563,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
+	.highest_bank_bit = 0x1,
 };
 
 static const struct msm_mdss_data sm8250_data = {
@@ -571,8 +588,8 @@ static const struct msm_mdss_data sm8550_data = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss" },
-	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.40.1

