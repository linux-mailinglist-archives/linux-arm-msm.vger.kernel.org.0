Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F42867768D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 09:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjAWInY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 03:43:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjAWInQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 03:43:16 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936341E9E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 00:43:14 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so7932576wmc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9ZYwRA2fIhXBOI9yCXs02WUBD5VW4Olt97ohAsC1bg=;
        b=SlCxRF6O622HxsHHm4eVc7IFrPpV9pM5X7mEPPIBWP00Mu7XQH0Rm/hSs409p3yY3i
         YMbuQc0rHV7hL9zw41shyFjyXya5xxCWuNJ4hZXPDageUvx7xwtpSU7E62RbgZvWkBQC
         CrGb8/r8OkV3DQ4RvIM3Eew/3A7usMXQ84P6ZADEwnLPNmDWrXgi0eu5tXkK4XMZlM53
         RRg5Kv3AyajNKo/7fZXMAjGo7UHVqDu5Dxb6dpHfTi+fl6fbT4KmxhCr6its+lSPazPo
         IOEuHSYVeMu02pFM7J2DLX2R4s9tnneI3Vt1SJJ1YUX3MrDAVWHY8KkTClHHVSoG/d3S
         NpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9ZYwRA2fIhXBOI9yCXs02WUBD5VW4Olt97ohAsC1bg=;
        b=zwcCkQfzO4mFPSfOB2DbS4+Fe95LnAOL0N8eJO71qrEdbpE8dcN5wdGUiL2vzAhUkw
         PkV+4TbyfOXT5YHFqjcAzsfSoQ3SoPAE+zePwJ5yn4Vh51L23xyk76VHqwTrEZunFQp3
         361JOJFcGqjUkeJ8ta8baV17cAc7W9Ra676iJY2ZsLbE/rmzpDf1qgvsKu+yBqQnKtf9
         G8P3jg7kxHJ+Nn/QAIgpL33HOZs6EAMn8MoZAdrb5MEIWsfM6cU9HWeCSUHFZGBoU9QM
         qmhzEQmic+sNzfv9AW9oafcNtJduslE42CzZkYh+kOITCP5LUt4OGTHEHOWgkh5m8IPA
         jL4w==
X-Gm-Message-State: AFqh2kqZDbxnpgZxBIQFKFW7PMz5uE4qrvAH9wSqpFlRTDUAyqScd1/7
        VOqIeGxPdZdw4uy5AoOHIBEihw==
X-Google-Smtp-Source: AMrXdXs2AnpVzZsJcBL8Vltj8I9orBuuNbhldLt1a1IkCno4rDMNRudJfZwrJoWkC+1EBaksUrrl5w==
X-Received: by 2002:a05:600c:1f0e:b0:3db:2098:17c0 with SMTP id bd14-20020a05600c1f0e00b003db209817c0mr14882305wmb.29.1674463393081;
        Mon, 23 Jan 2023 00:43:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l30-20020a05600c1d1e00b003c6b70a4d69sm10974120wms.42.2023.01.23.00.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 00:43:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v3 5/6] arm64: dts: qcom: sdm845-audio-wcd9340: commonize pinctrl
Date:   Mon, 23 Jan 2023 09:42:59 +0100
Message-Id: <20230123084300.22353-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123084300.22353-1-krzysztof.kozlowski@linaro.org>
References: <20230123084300.22353-1-krzysztof.kozlowski@linaro.org>
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

Pin configuration fow WCD9340 is the same in all users, so move it to
common file to reduce the code duplication (which still allows further
customizations per board).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v2:
1. None

Changes since v1:
1. Add Rb tag.
2. Split from previous patchset.
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts        | 11 -----------
 arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi      | 15 +++++++++++++++
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi  | 11 -----------
 .../arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 10 ----------
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts     | 11 -----------
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts  | 11 -----------
 6 files changed, 15 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 118cc50ce49b..c7a12257ac75 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -973,15 +973,6 @@ sdc2_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
-
-	wcd_intr_default: wcd-intr-default-state {
-		pins = "gpio54";
-		function = "gpio";
-
-		input-enable;
-		bias-pull-down;
-		drive-strength = <2>;
-	};
 };
 
 &uart3 {
@@ -1087,8 +1078,6 @@ &venus {
 };
 
 &wcd9340 {
-	pinctrl-0 = <&wcd_intr_default>;
-	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi b/arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi
index 5bcce7d0d709..33718cb95c83 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi
@@ -32,6 +32,10 @@ wcd9340: codec@1,0 {
 			#clock-cells = <0>;
 			clock-frequency = <9600000>;
 			clock-output-names = "mclk";
+
+			pinctrl-0 = <&wcd_intr_default>;
+			pinctrl-names = "default";
+
 			qcom,micbias1-microvolt = <1800000>;
 			qcom,micbias2-microvolt = <1800000>;
 			qcom,micbias3-microvolt = <1800000>;
@@ -67,3 +71,14 @@ swm: swm@c85 {
 		};
 	};
 };
+
+&tlmm {
+	wcd_intr_default: wcd-intr-default-state {
+		pins = "gpio54";
+		function = "gpio";
+
+		input-enable;
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index a472c716f966..57f1c5925cb0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -466,15 +466,6 @@ sdc2_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
-
-	wcd_intr_default: wcd-intr-default-state {
-		pins = "gpio54";
-		function = "gpio";
-
-		input-enable;
-		bias-pull-down;
-		drive-strength = <2>;
-	};
 };
 
 &uart6 {
@@ -543,8 +534,6 @@ &venus {
 };
 
 &wcd9340 {
-	pinctrl-0 = <&wcd_intr_default>;
-	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index ea2a1a9fb3ff..468867363f18 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -616,14 +616,6 @@ sde_dsi_suspend: sde-dsi-suspend-state {
 		drive-strength = <2>;
 		bias-pull-down;
 	};
-
-	wcd_intr_default: wcd-intr-default-state {
-		pins = "gpio54";
-		function = "gpio";
-		input-enable;
-		bias-pull-down;
-		drive-strength = <2>;
-	};
 };
 
 &uart6 {
@@ -700,8 +692,6 @@ &venus {
 };
 
 &wcd9340 {
-	pinctrl-0 = <&wcd_intr_default>;
-	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 6d253fbe0267..a461cb7f6bd2 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -628,15 +628,6 @@ i2c11_hid_active: i2c11-hid-active-state {
 		drive-strength = <2>;
 	};
 
-	wcd_intr_default: wcd-intr-default-state {
-		pins = "gpio54";
-		function = "gpio";
-
-		input-enable;
-		bias-pull-down;
-		drive-strength = <2>;
-	};
-
 	lid_pin_active: lid-pin-state {
 		pins = "gpio124";
 		function = "gpio";
@@ -747,8 +738,6 @@ &venus {
 };
 
 &wcd9340 {
-	pinctrl-0 = <&wcd_intr_default>;
-	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index 6758b0698acc..d4ae2788bada 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -552,15 +552,6 @@ pen_rst_l: pen-rst-l-state {
 		 */
 		output-high;
 	};
-
-	wcd_intr_default: wcd-intr-default-state {
-		pins = "gpio54";
-		function = "gpio";
-
-		input-enable;
-		bias-pull-down;
-		drive-strength = <2>;
-	};
 };
 
 &uart6 {
@@ -656,8 +647,6 @@ &venus {
 };
 
 &wcd9340 {
-	pinctrl-0 = <&wcd_intr_default>;
-	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

