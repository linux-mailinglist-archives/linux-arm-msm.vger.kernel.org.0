Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF1F641AE5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 06:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiLDF7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 00:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiLDF7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 00:59:16 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753E71A396
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 21:59:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id s8so13729913lfc.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 21:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPMgdZHDOqAyhpxC/THsxslCpnvDaahxJ1NO6H6KVzI=;
        b=UBpNO8OyWse5++vPsZ768qJocGT11hyTZ8OVPTBa/CQquiUyphocKsbL5gIXNhrGHm
         EMxOiguh60d8x9tPdJLm7rFHVeO3R1CMcGS+8+jmteWIcgxdpK7dxpiVa04/Husrsq2A
         QQb9Uvs8hHx7ZUcqht02p6gbgLtVYdnAhzgmkw1Z9kKBPC9saQl+OCtr5yYqrAa3LvNq
         waluFiGaFSSrfFCFq0fbXboTMa3xTo88/jolQ+GYT9/LAj+eWZ/FIk8YTvl6Ga9ic25Y
         jwVRV09IGsP90gfMm5IRQliwBbBRIZn+h3U9qHVYGw8OIY/6WFnOgVDDO4KE3LRuWis0
         n2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPMgdZHDOqAyhpxC/THsxslCpnvDaahxJ1NO6H6KVzI=;
        b=0R7DBY/DD9415aWWPFpoP1iavRtF5xpjfZ6t2BB1tYfw9/troTW/Dqmue5DBpVelGj
         UQfqqzWRCeglYHooSPwMzQv4qNPAog5Uax1YEp4AsIIpccwKXF69l+a5cuPYOiytYdzT
         qgxg9dbtNcOFRZiktfZAroNPLHOnkDJObhNeRJshV5bI6gfPYtzbg16f5fa2CXYmRt5k
         WSzhQ/L5GIkgl2yFq7QyqYoYyfwp+EqPk9QislP9a0WMZYpYcY8RhKaOXy/6ztsD+bNY
         12cYRx1jtDRkVBIi7k9bl9XRdSc0PC4t2q8n4mb2MaV2KYXK4AoMwQNx3HfFOTh7N4g/
         ORzw==
X-Gm-Message-State: ANoB5pnO+L0LyfPuhOUB+gjb3jpb8TH3ffZ5uUNTOYjFHPEnrBvhhJ1O
        Xu/TOPBv19QrJm62WcBR2IHCqg==
X-Google-Smtp-Source: AA0mqf55oeMmLRYP13t3CWW99O1gKmH5MWPwaq11SKpjVYLje12OEYIfAyoYMZTijC2PevdAl+Ai1g==
X-Received: by 2002:a05:6512:3187:b0:4b3:ec7a:6752 with SMTP id i7-20020a056512318700b004b3ec7a6752mr24221553lfe.79.1670133555044;
        Sat, 03 Dec 2022 21:59:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004917a30c82bsm1650028lfo.153.2022.12.03.21.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 21:59:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 05/15] thermal/drivers/tsens: Drop msm8976-specific defines
Date:   Sun,  4 Dec 2022 07:58:59 +0200
Message-Id: <20221204055909.1351895-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
References: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
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

Drop msm8976-specific defines, which duplicate generic ones.

Fixes: 0e580290170d ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v1.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 622d43d35076..5bceee535fc5 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -78,11 +78,6 @@
 
 #define MSM8976_CAL_SEL_MASK	0x3
 
-#define MSM8976_CAL_DEGC_PT1	30
-#define MSM8976_CAL_DEGC_PT2	120
-#define MSM8976_SLOPE_FACTOR	1000
-#define MSM8976_SLOPE_DEFAULT	3200
-
 /* eeprom layout data for qcs404/405 (v1) */
 #define BASE0_MASK	0x000007f8
 #define BASE1_MASK	0x0007f800
@@ -160,8 +155,8 @@ static void compute_intercept_slope_8976(struct tsens_priv *priv,
 	priv->sensor[10].slope = 3286;
 
 	for (i = 0; i < priv->num_sensors; i++) {
-		priv->sensor[i].offset = (p1[i] * MSM8976_SLOPE_FACTOR) -
-				(MSM8976_CAL_DEGC_PT1 *
+		priv->sensor[i].offset = (p1[i] * SLOPE_FACTOR) -
+				(CAL_DEGC_PT1 *
 				priv->sensor[i].slope);
 	}
 }
-- 
2.35.1

