Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C61629D5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 16:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238008AbiKOP1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 10:27:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237906AbiKOP1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 10:27:45 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5422D769
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:45 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id gv23so4169148ejb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDy57A29Jt3nxCLhxNQpZVWPQDSpsEBiQXxsa3bo3/k=;
        b=RxdALIPTtYhXTstVZXgSd4oEU21AFN2VEZmRurhvVup+lE6qFQaKvN5pqQw/2YH2if
         ORcuRT9/dfuo/vevGoU6yxwHB1aAEhkwLlbnP5bEIZumhuN4i0msmHdnvoe44fEBGhtq
         ko59dPLrMZs9+tpRHk9c9FiaJzmKKDOAiZYfvgfMkweNWMCQ7QdCGts3KHRQfH11aaif
         9AYfNYjxpKfxmY7VYlJxWsdick6HgmBqjCyyRFk4yWvg2B04La4d/29efruFmcHrhMfN
         1UXlMqmqweT8x2WNT7s5v6/GfFFb5ySMhwzhrg2A1ybXdz16k9i8owFrqM2WKBZwkmPE
         WOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDy57A29Jt3nxCLhxNQpZVWPQDSpsEBiQXxsa3bo3/k=;
        b=NFfO0vfc8NDlrQERkQheKG3Kx2xCQxfN6cVZl+/qAF+1qBdNWiUj2o7CZHvnFFdU7q
         u7S7/QqXOCkE345Z797HPaBnogUf4PjZ37uM0AN0DadVLhH8stFrIvHfjA1tgkV6SYTo
         dI/aOISBGRGnEKH1MvZQ8Iz+OY1FFjdWeWEVgDN0fatuJ+59oQ7XgqwJEUjaGBh7RSbe
         Sp5gBGrk4G2MV8XWBFRzQlhaG8sqzJ6Q2yfzwZPY9Kb9qnEH8FVvC/CRf4ZO//cfaV/A
         zyUE6wSaJnKhhR78ch84josazcGIEd0FDW1gZkyM0ub6LK2SCgjpjv8+GiZcgJjPPHY4
         56rg==
X-Gm-Message-State: ANoB5pkpfNPK7WPOIIyBn28ETXVoNZZnBPsloHEhWqrgYtO5gQl2akfk
        EUQqq4uCO61W4rjMzdHx7S6BU/du3632Uu5g
X-Google-Smtp-Source: AA0mqf6S+Uqp4lh6c7e9CUWZIbyfWgEhaifaYY+nfablc/OOnmerNtvMN7+v9epSDSV/UMdQW6jvIw==
X-Received: by 2002:a17:906:4ad1:b0:78d:a3ca:586c with SMTP id u17-20020a1709064ad100b0078da3ca586cmr14704178ejt.287.1668526063293;
        Tue, 15 Nov 2022 07:27:43 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id ku21-20020a170907789500b007ae1ab8f887sm5750679ejc.14.2022.11.15.07.27.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Nov 2022 07:27:42 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
Date:   Tue, 15 Nov 2022 16:27:22 +0100
Message-Id: <20221115152727.9736-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221115152727.9736-1-konrad.dybcio@linaro.org>
References: <20221115152727.9736-1-konrad.dybcio@linaro.org>
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

Add the pin setup for SPI/I2C configurations that are supported
downstream. I can guesstimate the correct settings for other buses,
but:

- I have no hardware to test it on
- Some QUPs are straight up missing pin funcs in TLMM
- Vendors probably didn't really care and used whatever was there in
the reference design and BSP - should any other be used, they can be
configured at a later time

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 62a64dd731a0..952156891476 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -519,6 +519,49 @@ tlmm: pinctrl@500000 {
 			gpio-controller;
 			#interrupt-cells = <2>;
 			#gpio-cells = <2>;
+
+			qup_i2c0_default: qup-i2c0-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup00";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c1_default: qup-i2c1-default-state {
+				pins = "gpio61", "gpio62";
+				function = "qup01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c2_default: qup-i2c2-default-state {
+				pins = "gpio45", "gpio46";
+				function = "qup02";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c8_default: qup-i2c8-default-state {
+				pins = "gpio19", "gpio20";
+				/* TLMM, GCC and vendor DT all have different indices.. */
+				function = "qup12";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c10_default: qup-i2c10-default-state {
+				pins = "gpio4", "gpio5";
+				function = "qup10";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi0_default: qup-spi0-default-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "qup00";
+				drive-strength = <6>;
+				bias-disable;
+			};
 		};
 
 		gcc: clock-controller@1400000 {
-- 
2.38.1

