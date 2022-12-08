Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C10E6465A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiLHAI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiLHAI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:08:57 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D018BD2B
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:08:56 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a19so22762993ljk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbAKHJWrOTkMAELbvt2QMnXAO5NByRRluyCbsXhWCPs=;
        b=jAl25flR7nlMAESp+VUdSq60nP/4NJRliKy7nLuYm0k6v0QZA8n/Jqoab30ZmYhmfT
         m/vCR9nw3EVb08VIhiJwt9LCzUQShMLJNUUQq9GlRt6Hh+MZ7N3BpCdBZxenc8RO3VeW
         56orTWP4d/jCXamGptBZ8pwv+xh44UCVtDcvGga/rW4KFXdYexs2MCCbfpREHRPVArB8
         i14AJ6bvVLYkWeaAB78VqZLoEj68WSI/52y1IW7zydgXM+aqAz9SEjABK3yPQ1dOrcTy
         6w3le9b1XJ5H6VgfHTywpm3dgwzMzaIkuJuKzn73XSqgrS17MWNlWk9p64RnM4P7zVcI
         Er1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbAKHJWrOTkMAELbvt2QMnXAO5NByRRluyCbsXhWCPs=;
        b=bcR6A6Ea3060wSvIJjUYjdGPM4pcJj8nIsmtb4twLGWkTEfFIJY+Vl8JoCqCdLBwsB
         31+R8xEzHlha+SR9V0CXd8qmAz9/F3zgfxNsTRg+KevGsDGh99b617KCJEs7DopCfp4B
         SuuIhUgeXRZ5c03mFAQiMW6cC37pIbQu6DeC0zoQDwRMlZ0GqbFb+cFETCKlQuNsIh6D
         5yJkxO+jJrSpwXehQkLweCiqE1EhXRDEcp/JoeTrjEBuFpylP2iKWqA+McdCIVHe93EF
         xDmmkpwX6a5EdzXPiI8BUeUipSHyVgjNLr1Ntq7pwHo7ZzWL772FuQMrTqYyn0cV6xOo
         pV7w==
X-Gm-Message-State: ANoB5pnZQRgrrTpD6WqMee8YcEWCptFoSmby6T55bosZa2Ylg4BeBF9k
        qGcHlwxEzc4HXUuX/ZPnQ2NO7g==
X-Google-Smtp-Source: AA0mqf6rg1/8mcTW/Evo411C8zTcTr3dplVLsHsFrB4xVnO0HLWXUW2rx18TnyUEHHMZp8ooRWO9bg==
X-Received: by 2002:a2e:a717:0:b0:27a:176f:5263 with SMTP id s23-20020a2ea717000000b0027a176f5263mr2232103lje.451.1670458134634;
        Wed, 07 Dec 2022 16:08:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:08:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 4/4] drm/msm/mdss: add the sdm845 data for completeness
Date:   Thu,  8 Dec 2022 02:08:50 +0200
Message-Id: <20221208000850.312548-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
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

Add the platform data for sdm845 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 5e19ec897670..b2c6e8b12469 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -532,6 +532,11 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm845_data = {
+	.ubwc_version = UBWC_2_0,
+	.highest_bank_bit = 2,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.highest_bank_bit = 2,
@@ -556,7 +561,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
-	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
-- 
2.35.1

