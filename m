Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8874A4EDE03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 17:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239392AbiCaP4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 11:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239389AbiCaP4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 11:56:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23D98A6E4
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 08:54:33 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lr4so184231ejb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 08:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rQA1SC+5wILa0uCwjAsPana/VKgoWviK4j2duLrJTD8=;
        b=w3eHKH0pjg8+QJSTQah2m/by+H1ypvZRiClXatkSgcIfBQotlQ1tEm9yimzoiL+1l+
         0jyilQ3EmoCivzI8yQmVis9hhodzkGfcjtdLhlpPe/zZOdPRrIvsxpYnhwrlJW4+ip11
         31VlkC4OHiFhphl/RMu0nesLMlRsjicQhygxTRLJwjjED02+f19sz1pDeLdI117gw+9y
         pYhpHK7AXxsTmoP3yxsXNebJNJx2bkJksT/W6eSq1HBdYhxaXppjZwPMN4EQk83rvsFD
         8nqvs/AjtRJvejYgpkrwxX6oAa46D1wa0DSjm33xQRrCd0XHPIb44neIduSwaSFkbLwG
         U+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rQA1SC+5wILa0uCwjAsPana/VKgoWviK4j2duLrJTD8=;
        b=m0QDr91oefYt7YvqUv+OFg+3Rho/q3jCZ8sJ3zhhM0BOP0jEsodEQ6elWbNfYqT2kN
         UsBaGJK5xEV+cMdGP6zNaUuNpQwJ/2zeYS6rF3Arv77l5NYVNzwrWmvtRFnP1QEkVo/N
         jnL/vp6PBlFvzKrq9v9UYbRzy+5SPnSuEa4spWhW9EUxA65X56ZFp1DO3r/4ctH6x+dY
         LSzP5CtC9ezxczUiG4Z7+H8CvhJrMKYLiHiFcbseGYTYvQ5ty1iyI54/hqhoalu9BfB/
         Mb//k80/RJ7rDRTJyGtiI1fTG1iyDcLgjBS2gY86p+Vp2gXG56Pwfh1QP7UmSPmQ+C9b
         3cug==
X-Gm-Message-State: AOAM531FdwLwq7nYYnucCQLSwHJa2KQl+JF3JVw77w9xIjS2PXIuKJ/B
        moD2ymKizPgNsCLH+6dcLbOHpA==
X-Google-Smtp-Source: ABdhPJxLcMCFjLOjURdPLVnXA7gZzUXnu+UmM9XZy0EXNkbb3DXwJVD0rn4NodHDJOF0AQM91pB0hA==
X-Received: by 2002:a17:907:160b:b0:6e1:116e:7a59 with SMTP id hb11-20020a170907160b00b006e1116e7a59mr5481791ejc.579.1648742072528;
        Thu, 31 Mar 2022 08:54:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a056402090a00b004196250baeasm11584077edz.95.2022.03.31.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 08:54:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcs404: align clocks in SPI with DT schema
Date:   Thu, 31 Mar 2022 17:54:24 +0200
Message-Id: <20220331155425.714946-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331155320.714754-1-krzysztof.kozlowski@linaro.org>
References: <20220331155320.714754-1-krzysztof.kozlowski@linaro.org>
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

The DT schema expects clocks core-iface order.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 36 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3f06f7cd3cf2..4af5065e830b 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -928,9 +928,9 @@ blsp1_spi0: spi@78b5000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b5000 0x600>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP0_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP0_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi0_default>;
 			#address-cells = <1>;
@@ -956,9 +956,9 @@ blsp1_spi1: spi@78b6000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b6000 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi1_default>;
 			#address-cells = <1>;
@@ -984,9 +984,9 @@ blsp1_spi2: spi@78b7000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi2_default>;
 			#address-cells = <1>;
@@ -1012,9 +1012,9 @@ blsp1_spi3: spi@78b8000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b8000 0x600>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi3_default>;
 			#address-cells = <1>;
@@ -1040,9 +1040,9 @@ blsp1_spi4: spi@78b9000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b9000 0x600>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi4_default>;
 			#address-cells = <1>;
@@ -1092,9 +1092,9 @@ blsp2_spi0: spi@7af5000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x07af5000 0x600>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP0_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP0_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp2_spi0_default>;
 			#address-cells = <1>;
-- 
2.32.0

