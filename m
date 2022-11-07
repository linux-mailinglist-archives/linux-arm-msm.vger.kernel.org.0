Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519D8620440
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbiKGX5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbiKGX5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:21 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF93D2871C
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5so7826900wmo.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=950ZKmKhad8aMrZOtshFiSVQfwA+V/urByaO2QTWaYE=;
        b=eKB49N6KK7qkJjTz9Ws5RGtm9BjGoX2rvhRcKDjagCF7DkY0EfS0MGcXAZOGkKpw6J
         nS6+9eIneNq/YzMtyUgQiuwelivJm0D5ws6vu6wNSuHyhiYteQFi7Mv0/5A69ZROAQ4t
         BH0bpsN3EU4IGB6rP0ufHfg/Pr1QxTXyvVV1q+Rt2UCJp/ONWRn1Kw6i70/QVbRiGPcL
         T15A3ALxzyD7BSckicSBVtbD3Xrg6TbT3dJ2YLrgjN9pTpmcPPhY8jG61kd1d7Ca5m9X
         AHng2juXuNOpzizo//N+3swh1e5DkI67FpR7JJ2rK8hvsKL6NeYp0aLuaBCJiSfy2ukn
         7Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=950ZKmKhad8aMrZOtshFiSVQfwA+V/urByaO2QTWaYE=;
        b=wff+jAtQt52CE9uyFtrVc7127jaSmptljTt2bNePEozq2KSW176J4WE1fc7KNSscVW
         arQ+HHjISR9hmfmJn4f8uwAgq1KUZorEz+OImXT4MQJ7k8shOGblBeMtjnw75/xvZ7SV
         02+3+8Z9ejOikKnUDs4h35vBb9ILbiJjQgp/zR783PTaTdDwHjM+twUhit6ZzfpbcKEa
         CJazgUOcrz7aBKyxXlB4ekvJTyKDRy05AVTMaqdFVuDFw7rfQSo1FikFnDc53t9z6zhv
         ZHNaZQYBTAgyQyagv0APWh1Buk34WAbRPD4wcyFRlGs8GmzhAvyWs9xsK+dzjR0p7S7m
         tBjQ==
X-Gm-Message-State: ACrzQf06kta6ExiBnO1GC/rhuhu5/zqpoDk0ARXHfC0D9CzBpMBxtXf0
        xR/bj9UOa1dtqX08l9oU20o4YA==
X-Google-Smtp-Source: AMsMyM6wRuGahgebs4+VP7pZUyTF9LppxABLhZ4io1IbcJqT+xRrSyOZ+xdVk4QaPzk4oXTnVxKRFQ==
X-Received: by 2002:a1c:730e:0:b0:3b4:b0c0:d616 with SMTP id d14-20020a1c730e000000b003b4b0c0d616mr35222105wmb.72.1667865430588;
        Mon, 07 Nov 2022 15:57:10 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:10 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH v2 13/18] arm64: dts: qcom: sc7180: Add compat qcom,mdss-dsi-ctrl-sc7180
Date:   Mon,  7 Nov 2022 23:56:49 +0000
Message-Id: <20221107235654.1769462-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add silicon specific compatible qcom,mdss-dsi-ctrl-sc7180 to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d2c374e9d8c03..07acb7f843d62 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2985,7 +2985,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,mdss-dsi-ctrl-sc7180",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

