Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552166E8BC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbjDTHvd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234193AbjDTHv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:51:29 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31634C26
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:06 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id c9so4459610ejz.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681977062; x=1684569062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYQm9bqfWbGovdDlFs25QuaSojyrw56mcHye0Uo4Jns=;
        b=ZyNm3igKig/6Bjtxbz7YFIE2ARwWePlIrMjz9LgoU9obvwIQkmlb8+CFtmdbHlf6eY
         plvmvgUUCXNelZh1Bqsz58ZymGbjdDYggUU8tYyxJwk/MCW5DgyuedyaeE6csl3OETWj
         4w/AUbNfCRCMlvrAJ9CNQYm9K0HJp0ggOjV2hhugx8VFiTWC2b5JNu5zhncD1kX5QQs8
         fe3VKmSV4hCT1SWaA3HdIwYYDfTSmWi9zOQdBbIxebXn37sGQkL+fBUPcuA3PNqL/b04
         1UBntrCGT9lgURlzrayr1GNTYRnKxGxCwgnbzA8ufH4KfoW0itwYGkgSoiyT7GRnCT42
         5YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977062; x=1684569062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYQm9bqfWbGovdDlFs25QuaSojyrw56mcHye0Uo4Jns=;
        b=it2UaIXA1mmlyBvDM6tuCxAY1nOX0CH7bXo9MQEENACGUKeTWabkK5GdB4b5c0e9mJ
         uPjeg+w8CYrQjKzefWv8vUK3bhBrhnlnzvCeApKnHr/NeDGWlM99bBat7NHunY2oyb02
         m46cgDNTgp07aNwK6GSWE9rPm1Fbd1Ac4tC6oTH5nmde1Xe1v8Sjc+u6ZuIM+Z9tQDFm
         L3PimNeTvK6ph9gCWpASe/6zoGZTY3BvNQddVi42XkLfFWgsNnmQ5KeCvchlj0sq+p7g
         vVMRmaysXU4IpiT7QBwRNni2vEPf1+1qpiCGAc57zAwldBxROXRzS4GZjZvMzO4iverJ
         n1ZA==
X-Gm-Message-State: AAQBX9cCjy5eeFcgLW4wqxoBs2JdKUMjTGacfDvnrYPHdRw10ELtxsO7
        CaPwyLWnP7sh+B7r7BQhK4hxCw==
X-Google-Smtp-Source: AKy350avI9KqCaLthA6mKRxJ5xHFUmcS361QfzPf1Splwt09/yu8ixM47ih3GlKA6lZaogoZZdzSDg==
X-Received: by 2002:a17:907:2d8c:b0:94e:4fac:d92b with SMTP id gt12-20020a1709072d8c00b0094e4facd92bmr702396ejc.58.1681977062571;
        Thu, 20 Apr 2023 00:51:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id h25-20020a50ed99000000b00505060e4280sm447165edr.94.2023.04.20.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:51:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/10] ARM: dts: qcom: ipq8064: correct LED node names
Date:   Thu, 20 Apr 2023 09:50:49 +0200
Message-Id: <20230420075053.41976-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
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

GPIO LEDs is not a bus, so drop unit-address and also start suffix
numbering from 0:

  Warning (unit_address_vs_reg): /soc/leds/led@7: node has a unit name, but no reg or ranges property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts |  2 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
index 47a5d1849c72..52eadefd2fb4 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
@@ -203,7 +203,7 @@ leds {
 			pinctrl-0 = <&leds_pins>;
 			pinctrl-names = "default";
 
-			led@7 {
+			led-0 {
 				label = "rb3011:green:user";
 				color = <LED_COLOR_ID_GREEN>;
 				gpios = <&qcom_pinmux 33 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index 411c8d63c38e..c5abe7151f14 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -92,34 +92,34 @@ leds {
 			pinctrl-0 = <&leds_pins>;
 			pinctrl-names = "default";
 
-			led@7 {
+			led-0 {
 				label = "led_usb1";
 				gpios = <&qcom_pinmux 7 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "usbdev";
 				default-state = "off";
 			};
 
-			led@8 {
+			led-1 {
 				label = "led_usb3";
 				gpios = <&qcom_pinmux 8 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "usbdev";
 				default-state = "off";
 			};
 
-			led@9 {
+			led-2 {
 				label = "status_led_fail";
 				function = LED_FUNCTION_STATUS;
 				gpios = <&qcom_pinmux 9 GPIO_ACTIVE_HIGH>;
 				default-state = "off";
 			};
 
-			led@26 {
+			led-3 {
 				label = "sata_led";
 				gpios = <&qcom_pinmux 26 GPIO_ACTIVE_HIGH>;
 				default-state = "off";
 			};
 
-			led@53 {
+			led-4 {
 				label = "status_led_pass";
 				function = LED_FUNCTION_STATUS;
 				gpios = <&qcom_pinmux 53 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

