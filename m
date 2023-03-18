Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3495C6BFA5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 14:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjCRNnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 09:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjCRNnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 09:43:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3A033CD5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:43:02 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g17so9774585lfv.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679146981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyfU1KJpQXcUs5jhogFBaoFTlgPH63DY/U4xjNHTWjQ=;
        b=j/SuZWK4hGzsjGSVxR7d8gdxnkenVxTgbXW9BWPte7dDWKjpvkRvb1DaNyfRBX4I0W
         G1bXkkbuItkcaCtiEuozT4vbyXYez0ODAylavTT9AO89s9TCGUCq52Q7v9U9emZ8ZGO8
         0ixeuALLMGp9IEpUREfGs5x88UQYFRFt6y8uYYsGi4TamiEBru8aSD7Fq54IkJ7wHUED
         Vt8ZH1TuoXEBaYTzzJsmhZBpBAIGNdEuTWEolCyfgUUSBnOpy6duLCJAafqlflsvYlNq
         KW3PjuXgCOhDRhkydqBFNjrTz/7OxQ/WGNlDaKSGDt7RD0EYbHaMidi6KEKKBkyM3jcv
         TIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679146981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyfU1KJpQXcUs5jhogFBaoFTlgPH63DY/U4xjNHTWjQ=;
        b=VJcjTFik3iJYY7gv7GiBdraSXQkvzEhYTbqPmU7vxDt3O8KfBDEX8a4AInEJQVOKL5
         bDBN7J48RnHiwIf/6XI+fD154wmKyXyFbj6FQp3AgRsHB+c7zgChKP3iEoH8wCp3pjwq
         0yB2ZtDymYtaOGQlVl7D1OEArdOFQkonqm4UOEXsy9BGsINvo9xJqS0hHa0x/rXAGj5Z
         P2d3U/eyyE4mI51OdsbQZWSkn67IMFY0vsb02gnIOhl/cWCSSroZaMwpILkwD58u/HJ0
         7WJEC8UozjieG7VoEBY+nkMHz5X9wMjgn4zBp1zwtKfi/1fbnz6F5v2aTWbA+AqXcXG1
         E60w==
X-Gm-Message-State: AO0yUKXsNeP1xtpDB5TIAKALsB8uj/pCVqduS0OfJC2ZS8kWW1pBPduK
        QKHQv4TEEgFc6t2/5yZMl+lmZA==
X-Google-Smtp-Source: AK7set+15GJfrf0vus0V2GKbcXZvMhIzBE9jo8AJG7qdkvGE/FNMZouJGBc1KhREYTpkILHyGw41Cw==
X-Received: by 2002:a05:6512:68:b0:4dd:a0f6:8f3b with SMTP id i8-20020a056512006800b004dda0f68f3bmr4918976lfo.15.1679146981212;
        Sat, 18 Mar 2023 06:43:01 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:43:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 18 Mar 2023 14:42:51 +0100
Subject: [PATCH v6 5/9] drm/msm/dsi: dsi_cfg: Merge SC7180 config into
 SDM845
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v6-5-70e13b1214fa@linaro.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=2206;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+ePdH/Gl1hrkxIW7hm63Vg7SPtBJUhhLLi5EVaR0ltI=;
 b=w5Qh/YigwR8zbCdmDXGOkZlPU3gF9O6EA79QXQ5pTEeLd1VBTvHZNJbYrKDsfGCO2AS16d1bFlvD
 uVp8tqA5CgXbiLvyhr8IITU9ATLjE8GSafvPJ5cCcflMzSIQK9/y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The configs are identical, other than the number of *maximum* DSI
hosts allowed. This isn't an issue, unless somebody deliberately
tries to access the inexistent host by adding a dt node for it.

Remove the SC7180 struct and point the hw revision match to the
SDM845's one. On a note, this could have been done back when
7180 support was introduced.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 039f503233d7..03d98cbcc978 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_v2_4_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 },
+		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
 	},
 };
 
@@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
-static const struct msm_dsi_config sc7180_dsi_cfg = {
-	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = dsi_v2_4_regulators,
-	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
-	.bus_clk_names = dsi_v2_4_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
-	.io_start = {
-		{ 0xae94000 },
-	},
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -291,7 +280,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
-		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,

-- 
2.39.2

