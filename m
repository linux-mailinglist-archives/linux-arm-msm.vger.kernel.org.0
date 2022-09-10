Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8CB5B4657
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 14:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiIJMrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 08:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiIJMrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 08:47:10 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468AE578AB
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 05:47:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f11so7247792lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 05:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=E42nL0SnLuu/advWVSA0exITSa9nePRzRLUKZ/sijPQ=;
        b=SJxt8lNR5AHZZUvEoZhMSYNUIElaFZyRNFubRnBVFbp+C/s57x29zwFeMdkT65bM0O
         R0gihKvGO1FoKu6u3OqISgtPtJz8LZaQly4mMwmG8Iw1nrRnOFUiKzwezcXyppKaJJUW
         rempBnSkgEULIXFnC6HXeN5q7k5yElGCZGfwgCWONi+jPLuyvbhdPi5ChFdc+E/Orp8Y
         rwHQDBr14qQ6eB5IrCWSdMGkiCSvHcc92gHEUx/xc4TTngz0HCHKfpN0WhNx0nfKk+ra
         f8R6D1uDLc87lelFS+NPJynk2YklUANxpeqHiOmtVeVcYVB2/2+TaV47RlPLP7+nkBUU
         d9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=E42nL0SnLuu/advWVSA0exITSa9nePRzRLUKZ/sijPQ=;
        b=x7hIrb623q6bhnSQ5D2gic8EiuM01P225ZrL8GuGAuFhPlpccIDg5e3hk1Q5shtWs6
         EOQCyf8xFQK9cs55umK5sO78VbtYfwiRpOsj6LumPcAQ9LouMOz8Xmz9yNPeXUcthiL7
         Zo6oiQjynNK0Olbz1siNOPwDKOQA7zJyK5Xl/38aprjNF11uLc1YDhbYU2luRBt+ZLae
         9pCplkcgoR8Sp2cF+LOZrrxyOwo9NHdJwpHxaFrWEAqnkHtjugeEsK6vunyrEPLMs74r
         hCtWcVEb44uSD+cRJ30EV3ahyLINIcPf9zS37gSWKdF6XxxXZpmjTnMy/9FyCcEA2fZS
         3CPQ==
X-Gm-Message-State: ACgBeo0qXIuq0h+/y/CQZy/MP8VeqbL3TMllv3hNEsJn4sITDEQs2bR+
        pXaeNjUI3/z8GWJqVDGdFkXxQg==
X-Google-Smtp-Source: AA6agR5eonv7R5b5BupEFDATrPIP336R2/jmJGZrzWiWVO3yhpxHO/1WNnkHTD3CLeycM+YZkShCtA==
X-Received: by 2002:a19:505e:0:b0:497:abf6:1115 with SMTP id z30-20020a19505e000000b00497abf61115mr5632021lfj.36.1662814026639;
        Sat, 10 Sep 2022 05:47:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k14-20020a2e920e000000b002677a3ad1d9sm327463ljg.76.2022.09.10.05.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 05:47:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
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
Subject: [RFC PATCH 05/10] thermal/drivers/tsens: drop msm8976-specific defines
Date:   Sat, 10 Sep 2022 15:46:56 +0300
Message-Id: <20220910124701.4060321-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org>
References: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop msm8976-specific defines, which duplicate generic ones.

Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v1.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 868d7b4c9e36..e6ef3bacfc39 100644
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

