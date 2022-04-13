Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5CE50026C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 01:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239155AbiDMXUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 19:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239122AbiDMXUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 19:20:09 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E326D240B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:17:46 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b19so4644249wrh.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZnGL6g05ueGQJUWXo+crd1UmH1Z5NBIL0/wB7HAocqA=;
        b=e72KB5RhHtrfQ16AGd8TNnFJYr8Tjw7kpB7GaYecbISYwNHXl6G6Sz78GEdw6GyNBy
         omMppHekUDpPfe/HtMMDElsSGCSaZxHHp7vQOLxRSXsOC+gJlL2sKuttOIjoeBzJhBND
         a3aFv2UL0PePFjqgaa8eNRU3yjBYvVn7ZFaOlgSPvHu6VYD1EA4ZdIWhPbHp8i/gO40u
         LrfHc0Su+k0zAI/5yLIFEM8jb6ig0Z0mkA4sYF2FVjwWZrArCHVqHV4XUn7uMiypt7s7
         30SPurHgz0KSIN8xW/S81m52eO8Yj39D+xTDsnefqln+VSeCiIE2dG47hXLLsU1NhHBc
         RT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZnGL6g05ueGQJUWXo+crd1UmH1Z5NBIL0/wB7HAocqA=;
        b=16WaP9xlXAdePSmudgPsmGWzeXcqApeUQ4/BwCuaEzJJ9C/Q8diNl95wp0XpI2xltP
         IUAnbcNpwrSYhVgThn42ZExvHq/9QuAdfop7dv7os0NiH414xD1UsIdzDaz8TxXDeMw6
         hwbFW7L3JvcgGh0Aw47P7zl7oXShf6cM1U9za+yZcvs7yDQIGrHzGBsy62OXCr8twEyv
         36MF5lC5lBiduKjyWVDNBMTTXL0Z+sFarA2FOYerft8i9YFe/tL9ZKKhWy6qtVBEI9aH
         3x+pDJwOAFosOBrJsbYl1NbFFIgrfvIap+a2+2W5OKNqZdaho0ORPg/CuWOuhnfSIuwZ
         MI9g==
X-Gm-Message-State: AOAM5331aUgDBKseUgRAaymg0CpbNvQOk08yi01wuZptcgtqapQdKyLo
        OyKhatZp8tYD2NRbqegckv638Q==
X-Google-Smtp-Source: ABdhPJyEH4ZX1vS/fGWbVUBXu6zC1IGr5tLPbgOUNgcsVwglgDO4dQgWgFWpBwsb+iE0WQZnnVqKfw==
X-Received: by 2002:adf:db92:0:b0:205:9c92:f1e3 with SMTP id u18-20020adfdb92000000b002059c92f1e3mr732873wri.515.1649891865424;
        Wed, 13 Apr 2022 16:17:45 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b00381141f4967sm205184wmq.35.2022.04.13.16.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 16:17:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8250: camss: Add CCI definitions
Date:   Thu, 14 Apr 2022 00:17:36 +0100
Message-Id: <20220413231736.991368-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
References: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
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

sm8250 has two CCI busses with two I2C busses apiece.

Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 162 +++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c69a8a88657a..a05ad923bcab 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3150,6 +3150,88 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac4f000 {
+			compatible = "qcom,sm8250-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac4f000 0 0x1000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac50000 {
+			compatible = "qcom,sm8250-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac50000 0 0x1000>;
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
@@ -3687,6 +3769,86 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 181>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default {
+				cci0_i2c0_default: cci0-i2c0-default {
+					/* SDA, SCL */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default {
+					/* SDA, SCL */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
+			cci0_sleep: cci0-sleep {
+				cci0_i2c0_sleep: cci0-i2c0-sleep {
+					/* SDA, SCL */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep {
+					/* SDA, SCL */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default {
+				cci1_i2c0_default: cci1-i2c0-default {
+					/* SDA, SCL */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default {
+					/* SDA, SCL */
+					pins = "gpio107","gpio108";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
+			cci1_sleep: cci1-sleep {
+				cci1_i2c0_sleep: cci1-i2c0-sleep {
+					/* SDA, SCL */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep {
+					/* SDA, SCL */
+					pins = "gpio107","gpio108";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
 			pri_mi2s_active: pri-mi2s-active {
 				sclk {
 					pins = "gpio138";
-- 
2.35.1

