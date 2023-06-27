Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC4D73F06A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjF0BYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjF0BYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD81D1991
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:31 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso39860971fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829070; x=1690421070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMvlN7j0Lwo662fOROZNKE2wCNrYWi/fAfycDcziS5I=;
        b=YbJ0VmGaOfJBGC3r3dU5Pg5WuCH0ljY4QPQN5oMbakH8ju43hD85xm04VBRj6ca5em
         FF81HibqNImWQZLLlRUrakqdqgTiGWLy3DCp0kO2JCG6pOR0a0d2LbisdLVSbfbTZNl0
         DzArA0cnhXvnoTc1MjfEVKdP80Jy2aqTYtVMwVV+y+X8ILsLZjO1Y7vZ6WHJssQm6LSH
         8u9PhN6nwpMZKsRR8RqFjl8k9ZXlVwJ0irhlB7ZDphCs7SGbTS6tYoJ7UAz+HWFqJANF
         nGwVBTbD+uiOQnVPKbXArb39V2Z0yuBaYkKITlpVvEVp059Mc2pfHGp/6Skq9R+HLJL8
         w3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829070; x=1690421070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMvlN7j0Lwo662fOROZNKE2wCNrYWi/fAfycDcziS5I=;
        b=a83LL6/XrMfRoZjf4SeYPral4U/LJ8g3cbYfecivYaOHjknnPtjplHu/PqXYsTd7kS
         C1MfPgxpp7yI52uYJJWYT5SkM8udzdlP/nBO9i4KsKal80NCwDUsTf3hN3Ll7610ZOwO
         5Y4oAcLGQc0Fj42B816MqByhywEVbbSHYDR0aTd8deimzRDjrJJK121dMpFEmKS7iwf2
         mZ3ont1x7YYJSBWcaklm0D+l1uuF2tTS3EoiNfNpguzbeXKh2Mdo8P5gvvPawa3KpARS
         Wsxz2VOBgNlNiYWbEYNQ/ZwRQnAmrzA/Q14+pudhcZHH19A07+PT4U1k09mAHUuAzY9a
         SuYg==
X-Gm-Message-State: AC+VfDzoYuLo6pmAxBl3GbMCqt9bpgKHkRPN5XWN3YYuQaj+jbl3Ka65
        BwypzEIYq27MTZPnpWMGXPvlSA==
X-Google-Smtp-Source: ACHHUZ4e/3EqguN1xfPhnE+6aZjSCs7wxQWwUphd1dl9+LHCICVc0RWBtmuVE3yzzWyLkIDFyAzdoQ==
X-Received: by 2002:a05:6512:e9d:b0:4f9:b6f8:844f with SMTP id bi29-20020a0565120e9d00b004f9b6f8844fmr4500681lfb.39.1687829070125;
        Mon, 26 Jun 2023 18:24:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 08/15] ARM: dts: qcom: mdm9615: split PMIC to separate dtsi files
Date:   Tue, 27 Jun 2023 04:24:15 +0300
Message-Id: <20230627012422.206077-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMIC is not a part of the SoC, so move PMIC to a separate file and
include it from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi            | 57 +++++++++++++++++++
 .../boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |  3 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi      | 46 +--------------
 3 files changed, 61 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8018.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
new file mode 100644
index 000000000000..81c0ad29fe60
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Device Tree Source for Qualcomm PM8018
+ *
+ * Copyright (C) 2016 BayLibre, SAS.
+ * Author : Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+&ssbi {
+	pm8018: pmic {
+		compatible = "qcom,pm8018", "qcom,pm8921";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrkey@1c {
+			compatible = "qcom,pm8018-pwrkey",
+				     "qcom,pm8921-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8018>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8018_mpps: mpps@50 {
+			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8018_mpps 0 0 6>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		rtc@11d {
+			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			reg = <0x11d>;
+			interrupt-parent = <&pm8018>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			allow-set-time;
+		};
+
+		pm8018_gpio: gpio@150 {
+			compatible = "qcom,pm8058-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8018_gpio 0 0 6>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 92c8003dac25..cc264861afe5 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include "qcom-mdm9615.dtsi"
+#include "pm8018.dtsi"
 
 / {
 	model = "Sierra Wireless WP8548 Module";
@@ -76,7 +77,7 @@ reset-out-pins {
 	};
 };
 
-&pmicgpio {
+&pm8018_gpio {
 	usb_vbus_5v_pins: usb-vbus-5v-state {
 		pins = "gpio4";
 		function = "normal";
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index b40c52ddf9b4..ac2327bc4ec5 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -241,56 +241,14 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		qcom,ssbi@500000 {
+		ssbi: qcom,ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
-				compatible = "qcom,pm8018", "qcom,pm8921";
+			pmic {
 				interrupts = <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
 				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pwrkey@1c {
-					compatible = "qcom,pm8018-pwrkey", "qcom,pm8921-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
-					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-						     <51 IRQ_TYPE_EDGE_RISING>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pmicmpp: mpps@50 {
-					compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					reg = <0x50>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pmicmpp 0 0 6>;
-				};
-
-				rtc@11d {
-					compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
-					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-					reg = <0x11d>;
-					allow-set-time;
-				};
-
-				pmicgpio: gpio@150 {
-					compatible = "qcom,pm8018-gpio", "qcom,ssbi-gpio";
-					reg = <0x150>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					gpio-ranges = <&pmicgpio 0 0 6>;
-					#gpio-cells = <2>;
-				};
 			};
 		};
 
-- 
2.39.2

