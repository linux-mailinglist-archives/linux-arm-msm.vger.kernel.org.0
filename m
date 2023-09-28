Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25DCD7B18DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjI1LDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbjI1LDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:15 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF08198
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:13 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c16757987fso125754421fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898992; x=1696503792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7ewwDA5rK2znaB44N+h4kM3uTy6kez9qLlohwFRQDU=;
        b=px8xoIw31fBwqCATUZsBdkFBybFXwyYz5kdewIann0Eah0rSfQ+F+6/fweZKwg3LXj
         wQ1bBnCKVUAxEJ/lHHTuuU/SawCOyLc/oYt3EXkoZrlB7htVSv15PlE8Cmzrd6aZ/tck
         gBptLEevQzdfbuIQiAIQJ5mVsmoYnt2nbqH4zRCs/d9zjMP1CWgCYH0DqrndBXv2HkT8
         EO4zJEUjbyBRJBNYP/LxbkgtcMRksJp+CnSNgp5xb3QlsgDzJ5EgFXDqYI2c3GJvg1+Z
         PJ2dVcouaxTZ9zALn79TmzgZ5pXWZcKUfj3m9lQsgtUoYz6YURifZ38OmGRCC5FRrlhZ
         WvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898992; x=1696503792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7ewwDA5rK2znaB44N+h4kM3uTy6kez9qLlohwFRQDU=;
        b=F6ijJajwHt39bJRgJDVzq/YDEv3RvAEeQZgJMp2Ej2qE9tkL6qRLUk8s1wJnI4F4ar
         R6CO1YavwyjGvjir6tZHcVhzGQgatfodlr0qB9q0NSvti94gnm1LcVUc7T82rbsygXxk
         bgd9aoEiByuvy+3pnzHchX+zHcsBciHNw1ktkxQ3Rv/jsKG4DqvDQyv/tW5mYw9KAzfC
         MtMdWZNuui9uAL4Oop/5sLDtkGRTWeOVb+hubyxpAC5dzWJnVG138XXn0w+i+kfGnC5p
         f07A/RxWHZDutPO/YwQoS3eSSvZf94bZNkKs8Lg8YKr8n2M6VSsTOG7aqHbrORaWvPrp
         b9SQ==
X-Gm-Message-State: AOJu0Yznb4WiZQJs9ZWJZu0ULWWQtRkRkyOhNhol4AiFvh8xBpGI+rBP
        hbVS+QeOjoG/WxPiIpYlsBAODA==
X-Google-Smtp-Source: AGHT+IGRR687Qz5BmoYZsS+wRWc3c9PMeT3aKkHcKC1MArc1STgx/loiWF0MNzyWRnLgtHkuIzITbw==
X-Received: by 2002:a05:6512:2253:b0:504:7e90:e05b with SMTP id i19-20020a056512225300b005047e90e05bmr903575lfu.14.1695898991607;
        Thu, 28 Sep 2023 04:03:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 02/36] ARM: dts: qcom: apq8064: correct XOADC register address
Date:   Thu, 28 Sep 2023 14:02:35 +0300
Message-Id: <20230928110309.1212221-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
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

The XOADC is present at the address 0x197 rather than just 197. It
doesn't change a lot (since the driver hardcodes all register
addresses), but the DT should present correct address anyway.

Fixes: c4b70883ee33 ("ARM: dts: add XOADC and IIO HWMON to APQ8064")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 516f0d2495e2..950adb63af70 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -738,7 +738,7 @@ pwrkey@1c {
 
 				xoadc: xoadc@197 {
 					compatible = "qcom,pm8921-adc";
-					reg = <197>;
+					reg = <0x197>;
 					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
 					#address-cells = <2>;
 					#size-cells = <0>;
-- 
2.39.2

