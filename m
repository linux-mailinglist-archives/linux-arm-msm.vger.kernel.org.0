Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391A66D742F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 08:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbjDEGJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 02:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236711AbjDEGJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 02:09:18 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F06F2D4C
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 23:09:13 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id er13so97384393edb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 23:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680674952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLzJ91vWpN9IyjMXKJAhATnumWGrHofm/Hf4mx9Fam0=;
        b=x1DbqKiNPakW5L5a6Oes7i2uwXmcGkbdFrMKXqil0NJBoPXSZNle68hX2eR7RaGC3D
         9WxsPRqBRuUw/JMF7YvihHkdo0AlZdiPbbtw6TfMDDCxgTfqCK8oSBYM9dX6CjIpc8pT
         OeDFwy4PDWwpd+3jT6gY6edL3vMG2OwB8mLgE3A8auQboyg6zmuXQwbNsulXMfeuQ3uG
         YjT/obQQ1TFOE79KTOXYLqAcrLl+eos0V0ovE/REHBccY3eOYcNQKXdVbTiRmRfokVYl
         iPNXUku2He2MrPROATH12jkUzOSPSjyhLw64CHo1WZoYrLfi2lI3/v0lbiJMvN3pBTof
         kBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680674952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLzJ91vWpN9IyjMXKJAhATnumWGrHofm/Hf4mx9Fam0=;
        b=GvgvNL5kAU7pO0oEQURC2q98iGqoRIEHRHBghHIFx7Lm91PUg3OEfR1iiBx8q4yUFP
         mH7CY1Io1aJ5W4VwM83uyEA6aN6AyJAq3WipBuqCjY3FpHGIkr72kTwB9v+Uk7AzJQM2
         STSt1BHpnj85y7Tq6Ne8KhCI61eqHFYqPwdmofPc2uCqlIdOIIvSX9YNejb7qzcvnpYQ
         wDYj/Sbw2crNuxfo+cuYrlK3Gf0DkMYnhnWm7t8d1EJhp3S0t8V17SHL4nd4BA+E4LjP
         j8A7ta4AHMTCBj4ySRKwHXduLjEQXdAueeb2UTQqvMRLDLGvsBC2Y0dAzCpEt9HdXBwy
         SMog==
X-Gm-Message-State: AAQBX9cY28qm4u26/apcSQa/36BpOeuWq06XEMpOg0mU6+7JPAIQG8P6
        2ZODii5Q3H6cw/egLK0RS4xMrA==
X-Google-Smtp-Source: AKy350YEwNWVAzf7sB+p6lo/OkmZljcfimcem3//9qzcbYQGSEzYcUR/cIafIsLDnRDxRshSP98mjw==
X-Received: by 2002:a17:907:20bb:b0:93d:cffb:80ba with SMTP id pw27-20020a17090720bb00b0093dcffb80bamr1764113ejb.66.1680674952023;
        Tue, 04 Apr 2023 23:09:12 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id z12-20020a1709064e0c00b00882f9130eafsm6784643eju.26.2023.04.04.23.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:09:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] arm64: dts: qcom: sc8280xp: simplify interrupts-extended
Date:   Wed,  5 Apr 2023 08:09:04 +0200
Message-Id: <20230405060906.143058-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405060906.143058-1-krzysztof.kozlowski@linaro.org>
References: <20230405060906.143058-1-krzysztof.kozlowski@linaro.org>
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

The parent controller for both interrupts is GIC, so no need for
interrupts-extended.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index c195a57fd180..82c697118163 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2602,8 +2602,8 @@ swr0: soundwire-controller@3250000 {
 		swr2: soundwire-controller@3330000 {
 			compatible = "qcom,soundwire-v1.6.0";
 			reg = <0 0x03330000 0 0x2000>;
-			interrupts-extended = <&intc GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "core", "wakeup";
 
 			clocks = <&txmacro>;
-- 
2.34.1

