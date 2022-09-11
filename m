Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6BF5B4E1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbiIKLOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiIKLON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:14:13 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6543DBD7
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:54 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q21so10451454lfo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Agf1+UyJe+fVcEGMvuo1mvU0w0VboU6bQsb5wGtqwzo=;
        b=aZaft94OTXKGR48Ftyd2ImJwsd2fXk749YSYN9nASR7mDdKv6B+5s+s2sL79RBAFJb
         vnz+OQCH6Tw+9Mw84kGxM7dV9Dp+UmC+dKYfnLOeXFZY/F4+UKO/fsDCGAne9bB/18zu
         ipRefuwWenjKtA/4A0aMSDCi7zbIp3w0P9Wd0T/UTq6ED4QVmL3xfc8aW1iffyjhPt5t
         IG5WAaFMb0XzzuyQVUp9YkMEIeILMyssyw9/vFiLqCbGxT3ST+ih1wCFSMWY2Ni0oF1Y
         g8kdwMutP/kdmw/+R4HHPc2igH2je+oDmuIE21D1rCz8ucoZg2IkRh76M6N5snMl0f3N
         jEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Agf1+UyJe+fVcEGMvuo1mvU0w0VboU6bQsb5wGtqwzo=;
        b=jitJciGeo8Ijaq9Hzd+XGnbMFCdX0m15digNQebK7pMpACpuT57HM5Ap3DV+zu0adk
         wF9Nm6OfJd4G2uVbXXyEYC6KSWybjq7aOxzP37j12EXqXCGpG5RRCv5XfrxOkQM+WfYR
         B8P0Jz2op1t9oIo8XTgGDDCqIAeeum6RjcjfSzKgk9d9GnU4iFVpK7WzcrHfXlpSq4W4
         CLYXWsTxp2xenD7O2bhQEijg0xrJ4kHleEhocPOLESdEnan5ccatC7Ug0Q67OBF3LERd
         JK7LqZakTBRvTaRHhAfnOiCfuKVOu3eUPwe/rj+3tyWCYgtnScF8tGjxbI/bjpMfT0lq
         epsw==
X-Gm-Message-State: ACgBeo2lw88x0vOEiKDYwXf7fk8xpY7xYaxvEdfgtbTZdrNcVppUXmFO
        +lkVT1jKfayojQ+RfMua7f8CkQ==
X-Google-Smtp-Source: AA6agR5tueT9iwPpPMc1OjRz6CzT/EI9yxWuHOuYmwtPctXn2OGcpl4VV5ldunR354zl7wsOKD/53Q==
X-Received: by 2002:a05:6512:6c8:b0:49a:1765:335d with SMTP id u8-20020a05651206c800b0049a1765335dmr948235lff.29.1662894773909;
        Sun, 11 Sep 2022 04:12:53 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 38/40] arm64: dts: qcom: sm8450: align TLMM pin configuration with DT schema
Date:   Sun, 11 Sep 2022 13:11:58 +0200
Message-Id: <20220911111200.199182-39-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with '-state'
suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../qcom/sm8450-sony-xperia-nagara-pdx223.dts |  12 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 152 +++++++++---------
 2 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
index 7fe582b92a61..d68765eb6d4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
@@ -572,27 +572,27 @@ &spi10 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>;
 
-	sdc2_default_state: sdc2-default {
-		clk {
+	sdc2_default_state: sdc2-default-state {
+		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		cmd {
+		cmd-pins {
 			pins = "sdc2_cmd";
 			drive-strength = <16>;
 			bias-pull-up;
 		};
 
-		data {
+		data-pins {
 			pins = "sdc2_data";
 			drive-strength = <16>;
 			bias-pull-up;
 		};
 	};
 
-	ts_int_default: ts-int-default {
+	ts_int_default: ts-int-default-state {
 		pins = "gpio23";
 		function = "gpio";
 		drive-strength = <2>;
@@ -600,7 +600,7 @@ ts_int_default: ts-int-default {
 		input-enable;
 	};
 
-	sdc2_card_det_n: sd-card-det-n {
+	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio92";
 		function = "gpio";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d0ebf61a0074..1d878256028f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2384,20 +2384,20 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 211>;
 			wakeup-parent = <&pdc>;
 
-			sdc2_sleep_state: sdc2-sleep {
-				clk {
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
 					pins = "sdc2_clk";
 					drive-strength = <2>;
 					bias-disable;
 				};
 
-				cmd {
+				cmd-pins {
 					pins = "sdc2_cmd";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
 
-				data {
+				data-pins {
 					pins = "sdc2_data";
 					drive-strength = <2>;
 					bias-pull-up;
@@ -2405,21 +2405,21 @@ data {
 			};
 
 			pcie0_default_state: pcie0-default-state {
-				perst {
+				perst-pins {
 					pins = "gpio94";
 					function = "gpio";
 					drive-strength = <2>;
 					bias-pull-down;
 				};
 
-				clkreq {
+				clkreq-pins {
 					pins = "gpio95";
 					function = "pcie0_clkreqn";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
 
-				wake {
+				wake-pins {
 					pins = "gpio96";
 					function = "gpio";
 					drive-strength = <2>;
@@ -2428,21 +2428,21 @@ wake {
 			};
 
 			pcie1_default_state: pcie1-default-state {
-				perst {
+				perst-pins {
 					pins = "gpio97";
 					function = "gpio";
 					drive-strength = <2>;
 					bias-pull-down;
 				};
 
-				clkreq {
+				clkreq-pins {
 					pins = "gpio98";
 					function = "pcie1_clkreqn";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
 
-				wake {
+				wake-pins {
 					pins = "gpio99";
 					function = "gpio";
 					drive-strength = <2>;
@@ -2450,350 +2450,350 @@ wake {
 				};
 			};
 
-			qup_i2c0_data_clk: qup-i2c0-data-clk {
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0";
 			};
 
-			qup_i2c1_data_clk: qup-i2c1-data-clk {
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup1";
 			};
 
-			qup_i2c2_data_clk: qup-i2c2-data-clk {
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
 				pins = "gpio8", "gpio9";
 				function = "qup2";
 			};
 
-			qup_i2c3_data_clk: qup-i2c3-data-clk {
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
 				pins = "gpio12", "gpio13";
 				function = "qup3";
 			};
 
-			qup_i2c4_data_clk: qup-i2c4-data-clk {
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
 				pins = "gpio16", "gpio17";
 				function = "qup4";
 			};
 
-			qup_i2c5_data_clk: qup-i2c5-data-clk {
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
 				pins = "gpio206", "gpio207";
 				function = "qup5";
 			};
 
-			qup_i2c6_data_clk: qup-i2c6-data-clk {
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
 				pins = "gpio20", "gpio21";
 				function = "qup6";
 			};
 
-			qup_i2c8_data_clk: qup-i2c8-data-clk {
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
 				pins = "gpio28", "gpio29";
 				function = "qup8";
 			};
 
-			qup_i2c9_data_clk: qup-i2c9-data-clk {
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
 				pins = "gpio32", "gpio33";
 				function = "qup9";
 			};
 
-			qup_i2c10_data_clk: qup-i2c10-data-clk {
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
 				pins = "gpio36", "gpio37";
 				function = "qup10";
 			};
 
-			qup_i2c11_data_clk: qup-i2c11-data-clk {
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
 				pins = "gpio40", "gpio41";
 				function = "qup11";
 			};
 
-			qup_i2c12_data_clk: qup-i2c12-data-clk {
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
 				pins = "gpio44", "gpio45";
 				function = "qup12";
 			};
 
-			qup_i2c13_data_clk: qup-i2c13-data-clk {
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
 				pins = "gpio48", "gpio49";
 				function = "qup13";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c14_data_clk: qup-i2c14-data-clk {
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
 				pins = "gpio52", "gpio53";
 				function = "qup14";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c15_data_clk: qup-i2c15-data-clk {
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
 				pins = "gpio56", "gpio57";
 				function = "qup15";
 			};
 
-			qup_i2c16_data_clk: qup-i2c16-data-clk {
+			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
 				pins = "gpio60", "gpio61";
 				function = "qup16";
 			};
 
-			qup_i2c17_data_clk: qup-i2c17-data-clk {
+			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
 				pins = "gpio64", "gpio65";
 				function = "qup17";
 			};
 
-			qup_i2c18_data_clk: qup-i2c18-data-clk {
+			qup_i2c18_data_clk: qup-i2c18-data-clk-state {
 				pins = "gpio68", "gpio69";
 				function = "qup18";
 			};
 
-			qup_i2c19_data_clk: qup-i2c19-data-clk {
+			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
 				pins = "gpio72", "gpio73";
 				function = "qup19";
 			};
 
-			qup_i2c20_data_clk: qup-i2c20-data-clk {
+			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
 				pins = "gpio76", "gpio77";
 				function = "qup20";
 			};
 
-			qup_i2c21_data_clk: qup-i2c21-data-clk {
+			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
 				pins = "gpio80", "gpio81";
 				function = "qup21";
 			};
 
-			qup_spi0_cs: qup-spi0-cs {
+			qup_spi0_cs: qup-spi0-cs-state {
 				pins = "gpio3";
 				function = "qup0";
 			};
 
-			qup_spi0_data_clk: qup-spi0-data-clk {
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
 				pins = "gpio0", "gpio1", "gpio2";
 				function = "qup0";
 			};
 
-			qup_spi1_cs: qup-spi1-cs {
+			qup_spi1_cs: qup-spi1-cs-state {
 				pins = "gpio7";
 				function = "qup1";
 			};
 
-			qup_spi1_data_clk: qup-spi1-data-clk {
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
 				pins = "gpio4", "gpio5", "gpio6";
 				function = "qup1";
 			};
 
-			qup_spi2_cs: qup-spi2-cs {
+			qup_spi2_cs: qup-spi2-cs-state {
 				pins = "gpio11";
 				function = "qup2";
 			};
 
-			qup_spi2_data_clk: qup-spi2-data-clk {
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
 				pins = "gpio8", "gpio9", "gpio10";
 				function = "qup2";
 			};
 
-			qup_spi3_cs: qup-spi3-cs {
+			qup_spi3_cs: qup-spi3-cs-state {
 				pins = "gpio15";
 				function = "qup3";
 			};
 
-			qup_spi3_data_clk: qup-spi3-data-clk {
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
 				pins = "gpio12", "gpio13", "gpio14";
 				function = "qup3";
 			};
 
-			qup_spi4_cs: qup-spi4-cs {
+			qup_spi4_cs: qup-spi4-cs-state {
 				pins = "gpio19";
 				function = "qup4";
 				drive-strength = <6>;
 				bias-disable;
 			};
 
-			qup_spi4_data_clk: qup-spi4-data-clk {
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
 				pins = "gpio16", "gpio17", "gpio18";
 				function = "qup4";
 			};
 
-			qup_spi5_cs: qup-spi5-cs {
+			qup_spi5_cs: qup-spi5-cs-state {
 				pins = "gpio85";
 				function = "qup5";
 			};
 
-			qup_spi5_data_clk: qup-spi5-data-clk {
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
 				pins = "gpio206", "gpio207", "gpio84";
 				function = "qup5";
 			};
 
-			qup_spi6_cs: qup-spi6-cs {
+			qup_spi6_cs: qup-spi6-cs-state {
 				pins = "gpio23";
 				function = "qup6";
 			};
 
-			qup_spi6_data_clk: qup-spi6-data-clk {
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
 				pins = "gpio20", "gpio21", "gpio22";
 				function = "qup6";
 			};
 
-			qup_spi8_cs: qup-spi8-cs {
+			qup_spi8_cs: qup-spi8-cs-state {
 				pins = "gpio31";
 				function = "qup8";
 			};
 
-			qup_spi8_data_clk: qup-spi8-data-clk {
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
 				pins = "gpio28", "gpio29", "gpio30";
 				function = "qup8";
 			};
 
-			qup_spi9_cs: qup-spi9-cs {
+			qup_spi9_cs: qup-spi9-cs-state {
 				pins = "gpio35";
 				function = "qup9";
 			};
 
-			qup_spi9_data_clk: qup-spi9-data-clk {
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
 				pins = "gpio32", "gpio33", "gpio34";
 				function = "qup9";
 			};
 
-			qup_spi10_cs: qup-spi10-cs {
+			qup_spi10_cs: qup-spi10-cs-state {
 				pins = "gpio39";
 				function = "qup10";
 			};
 
-			qup_spi10_data_clk: qup-spi10-data-clk {
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
 				pins = "gpio36", "gpio37", "gpio38";
 				function = "qup10";
 			};
 
-			qup_spi11_cs: qup-spi11-cs {
+			qup_spi11_cs: qup-spi11-cs-state {
 				pins = "gpio43";
 				function = "qup11";
 			};
 
-			qup_spi11_data_clk: qup-spi11-data-clk {
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
 				pins = "gpio40", "gpio41", "gpio42";
 				function = "qup11";
 			};
 
-			qup_spi12_cs: qup-spi12-cs {
+			qup_spi12_cs: qup-spi12-cs-state {
 				pins = "gpio47";
 				function = "qup12";
 			};
 
-			qup_spi12_data_clk: qup-spi12-data-clk {
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
 				pins = "gpio44", "gpio45", "gpio46";
 				function = "qup12";
 			};
 
-			qup_spi13_cs: qup-spi13-cs {
+			qup_spi13_cs: qup-spi13-cs-state {
 				pins = "gpio51";
 				function = "qup13";
 			};
 
-			qup_spi13_data_clk: qup-spi13-data-clk {
+			qup_spi13_data_clk: qup-spi13-data-clk-state {
 				pins = "gpio48", "gpio49", "gpio50";
 				function = "qup13";
 			};
 
-			qup_spi14_cs: qup-spi14-cs {
+			qup_spi14_cs: qup-spi14-cs-state {
 				pins = "gpio55";
 				function = "qup14";
 			};
 
-			qup_spi14_data_clk: qup-spi14-data-clk {
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
 				pins = "gpio52", "gpio53", "gpio54";
 				function = "qup14";
 			};
 
-			qup_spi15_cs: qup-spi15-cs {
+			qup_spi15_cs: qup-spi15-cs-state {
 				pins = "gpio59";
 				function = "qup15";
 			};
 
-			qup_spi15_data_clk: qup-spi15-data-clk {
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
 				pins = "gpio56", "gpio57", "gpio58";
 				function = "qup15";
 			};
 
-			qup_spi16_cs: qup-spi16-cs {
+			qup_spi16_cs: qup-spi16-cs-state {
 				pins = "gpio63";
 				function = "qup16";
 			};
 
-			qup_spi16_data_clk: qup-spi16-data-clk {
+			qup_spi16_data_clk: qup-spi16-data-clk-state {
 				pins = "gpio60", "gpio61", "gpio62";
 				function = "qup16";
 			};
 
-			qup_spi17_cs: qup-spi17-cs {
+			qup_spi17_cs: qup-spi17-cs-state {
 				pins = "gpio67";
 				function = "qup17";
 			};
 
-			qup_spi17_data_clk: qup-spi17-data-clk {
+			qup_spi17_data_clk: qup-spi17-data-clk-state {
 				pins = "gpio64", "gpio65", "gpio66";
 				function = "qup17";
 			};
 
-			qup_spi18_cs: qup-spi18-cs {
+			qup_spi18_cs: qup-spi18-cs-state {
 				pins = "gpio71";
 				function = "qup18";
 				drive-strength = <6>;
 				bias-disable;
 			};
 
-			qup_spi18_data_clk: qup-spi18-data-clk {
+			qup_spi18_data_clk: qup-spi18-data-clk-state {
 				pins = "gpio68", "gpio69", "gpio70";
 				function = "qup18";
 				drive-strength = <6>;
 				bias-disable;
 			};
 
-			qup_spi19_cs: qup-spi19-cs {
+			qup_spi19_cs: qup-spi19-cs-state {
 				pins = "gpio75";
 				function = "qup19";
 				drive-strength = <6>;
 				bias-disable;
 			};
 
-			qup_spi19_data_clk: qup-spi19-data-clk {
+			qup_spi19_data_clk: qup-spi19-data-clk-state {
 				pins = "gpio72", "gpio73", "gpio74";
 				function = "qup19";
 				drive-strength = <6>;
 				bias-disable;
 			};
 
-			qup_spi20_cs: qup-spi20-cs {
+			qup_spi20_cs: qup-spi20-cs-state {
 				pins = "gpio79";
 				function = "qup20";
 			};
 
-			qup_spi20_data_clk: qup-spi20-data-clk {
+			qup_spi20_data_clk: qup-spi20-data-clk-state {
 				pins = "gpio76", "gpio77", "gpio78";
 				function = "qup20";
 			};
 
-			qup_spi21_cs: qup-spi21-cs {
+			qup_spi21_cs: qup-spi21-cs-state {
 				pins = "gpio83";
 				function = "qup21";
 			};
 
-			qup_spi21_data_clk: qup-spi21-data-clk {
+			qup_spi21_data_clk: qup-spi21-data-clk-state {
 				pins = "gpio80", "gpio81", "gpio82";
 				function = "qup21";
 			};
 
-			qup_uart7_rx: qup-uart7-rx {
+			qup_uart7_rx: qup-uart7-rx-state {
 				pins = "gpio26";
 				function = "qup7";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_uart7_tx: qup-uart7-tx {
+			qup_uart7_tx: qup-uart7-tx-state {
 				pins = "gpio27";
 				function = "qup7";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_uart20_default: qup-uart20-default {
+			qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
-- 
2.34.1

