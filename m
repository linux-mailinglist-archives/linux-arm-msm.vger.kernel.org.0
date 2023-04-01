Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED9E6D348D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjDAWIT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjDAWIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:17 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8AB7EFB
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id by14so7465815ljb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORNKgb+wSUzqo2LQNzeZPsMRlHgqol5isFCZrnYrBHY=;
        b=VUa6COaTvnSAo0xBGO88h2BDU9PcUlS+m3qjsrQOAFah7VkyJ/FHNMLs+KAcJhTtY5
         a1mqWh8XIX0mYVTJEBhuIHx/wFA9iPWypn4N9wWPKwnyrvqqUi3zANmaE5+xVbnyf03V
         RZa9qm4tEfH6xSA7r50TNBLxE11vV1n6rqur8xLVCJ1ICDAfp2f41YlRzv+jc83Rnmv9
         Xf0JD6au+9mn3nK3QAGJW5DLxCmHCZDgBTFPbJzyLDuooYujnR37JvbTbBnK+dErOf3R
         qKYVLTcST9BymZA3kbLMKsg5piOCwfBMDyu4z9h1pCCR1+rznKKa5C5Y52ZDy9iJFUog
         a5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORNKgb+wSUzqo2LQNzeZPsMRlHgqol5isFCZrnYrBHY=;
        b=mFaAQTg4dD7ogZfums5u9nma0XnMVt2i6F9DY2ttlFNxLfNWYhf3M7K7U2bnb6oRvC
         DPRA2OoLTbQ3e8J4nDMcMIILNP/qmP/n6HZmRr6glVMdqSX0LMoGOgIBJOM0+8MQ24U+
         d/BrS+X+JihRs9dkvBbWf4i9aCpmJcPMP1+J0+q4YAHPSUPHKgYcTxzLfi6BoMCbhKRX
         KuhFlndS2aXlKfT2JSZ1ZtQzhBmrAThoeD+x/QNBbyWMy+YxBjy/oBhik2TNpm5KMLUg
         UyJjsy/ze4uraGGWt2UxHnHFgLDT6XkeexmydfcCSZprbZFJSEgbcEHNWrYrKmlUIM2J
         ae8A==
X-Gm-Message-State: AAQBX9dX+rEM6U4Pmu4JplWXSv2NJycgo0hku/hVXRMCpFqNsSeeysyL
        YA+UJmaTjinXDTOWjpnMDKnoAA==
X-Google-Smtp-Source: AKy350aKPyTxIHA0YZTXUNlr20lCOtPS3TZ7L3OHWyb5q/H/F9SixqKiaUTEcIIkfA5hvB0pEMB+gg==
X-Received: by 2002:a2e:83d7:0:b0:29c:714e:57b5 with SMTP id s23-20020a2e83d7000000b0029c714e57b5mr9208976ljh.5.1680386893928;
        Sat, 01 Apr 2023 15:08:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 04/22] arm64: dts: qcom: sc8280xp-pmics: correct interrupt routing for pm8280_2_temp_alarm
Date:   Sun,  2 Apr 2023 01:07:52 +0300
Message-Id: <20230401220810.3563708-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMIC pm8280_2 has SID equal to 3, thus it interrupts-extended should
use 3 as the first argument value. Fix the interrupts-extended value for
pm8280_2_temp_alarm device node.

Fixes: 6c82f40ec94e ("arm64: dts: qcom: sc8280xp-pmics: Add temp alarm for PM8280_{1/2} PMICs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index a3c7369f9594..254337345e45 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -176,7 +176,7 @@ pmc8280_2: pmic@3 {
 		pm8280_2_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
-			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&spmi_bus 0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
 
-- 
2.30.2

