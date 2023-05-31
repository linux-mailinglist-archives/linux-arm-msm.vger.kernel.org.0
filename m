Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC917717306
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbjEaBQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbjEaBQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0B1184
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so503476e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495802; x=1688087802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woCXnH6ZX399DdZ3p/jsAqXyUxOtUCvlbTzMc78ahto=;
        b=sn9JqEvP89KkQBTcgGG4c/utardQA8OulXb/6wzToQPfjyuCVZLc0rjGENXEYl1+JY
         4h0SVzEtSns6eP8FH3M75rRvSUA6j3dHmv2jiUxHxP7cZ7AWDNPnZ6GImriqo2qsy5P3
         TwceSQS/WOvh/iY9ucIMDH9wpZjFkSW8Jnb6+9fH5Fa6RrqCEEHotK7YuyDb8crldus/
         G3ACdet4pvsXE3qKP1AMqrnm81InCaUddAPO8q4fq/alJJdnpTJLuFBLYda5e2qBjXQY
         k4uw0HudcuXAi4rozaW6Mb2HXUW63VSFIcUviUQ6hx+SBCUmqmnMCGBzzOPO6Z7HZPzT
         YLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495802; x=1688087802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woCXnH6ZX399DdZ3p/jsAqXyUxOtUCvlbTzMc78ahto=;
        b=ZiVgVNsB6i+IXQVp9fltghRMqJctFEe1Gt0WjLdLelITiNw3389lp9lV7sd6j+Lwi6
         iRwTyljmopwaUnv6U7RgXDgbcHeYLyH2aCUDmBykQPVBMAnT2kpJmgKUECgToQkSVpxJ
         PpQpqBNaaljguWOwgrphooZuHOwuEprL655s7YoqI/64qIeQsjYc7HrnUtge5HY3Qq6p
         1X5y8a19BQ9++z+sbgc/IH7WmFmzNT49C1jmQDzyfPEO0AAnY3oiMWoRd8FcjvGo+lhG
         J/FtLEQB2G5+4hBSNh2b/2X+Pna1vyIiL53ZXGtrkouuHMC87Bkog2BV3zbsM8MB0eOv
         /d2g==
X-Gm-Message-State: AC+VfDy56HWOqLgNIpYUlKLqK0a8ZQzNxzRSjD+0c3wSyxy7UcZPoo+4
        blHGmeEVUC1sv6NnPgDvG3xQ2Q==
X-Google-Smtp-Source: ACHHUZ5kMIq5U8eyFFK13ecC+zqqAJLVuB7ABierQG4uCyzxZs9zfF/tb5+fk/8SOHVxO9sVVpH1Fw==
X-Received: by 2002:ac2:41c5:0:b0:4f3:b9c8:5da with SMTP id d5-20020ac241c5000000b004f3b9c805damr1279364lfi.33.1685495802077;
        Tue, 30 May 2023 18:16:42 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 14/14] ARM: dts: qcom: msm8974: rename labels for DSI nodes
Date:   Wed, 31 May 2023 04:16:23 +0300
Message-Id: <20230531011623.3808538-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently in board files MDSS and HDMI nodes stay apart, because labels
for HDMI nodes do not have the mdss_ prefix. It was found that grouping
all display-related notes is more useful.

To keep all display-related nodes close in the board files, change DSI
node aliases from dsi_* to mdss_dsi_*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 24 ++++++-------
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 16 ++++-----
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 36 +++++++++----------
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts | 24 ++++++-------
 4 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 72f7e09a5bbf..72f6611bbe49 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -48,7 +48,15 @@ eeprom: eeprom@52 {
 	};
 };
 
-&dsi0 {
+&gpu {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
 	vdda-supply = <&pm8941_l2>;
 	vdd-supply = <&pm8941_l22>;
 	vddio-supply = <&pm8941_l12>;
@@ -65,31 +73,23 @@ panel: panel@0 {
 
 		port {
 			panel_in: endpoint {
-				remote-endpoint = <&dsi0_out>;
+				remote-endpoint = <&mdss_dsi0_out>;
 			};
 		};
 	};
 };
 
-&dsi0_out {
+&mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 	data-lanes = <0 1 2 3>;
 };
 
-&dsi0_phy {
+&mdss_dsi0_phy {
 	status = "okay";
 
 	vddio-supply = <&pm8941_l12>;
 };
 
-&gpu {
-	status = "okay";
-};
-
-&mdss {
-	status = "okay";
-};
-
 &pm8941_wled {
 	qcom,cs-out;
 	qcom,switching-freq = <3200>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 205907c8670a..60bdfddeae69 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -230,7 +230,11 @@ bluetooth {
 	};
 };
 
-&dsi0 {
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
 	status = "okay";
 
 	vdda-supply = <&pm8941_l2>;
@@ -246,27 +250,23 @@ panel: panel@0 {
 
 		port {
 			panel_in: endpoint {
-				remote-endpoint = <&dsi0_out>;
+				remote-endpoint = <&mdss_dsi0_out>;
 			};
 		};
 	};
 };
 
-&dsi0_out {
+&mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 	data-lanes = <0 1 2 3>;
 };
 
-&dsi0_phy {
+&mdss_dsi0_phy {
 	status = "okay";
 
 	vddio-supply = <&pm8941_l12>;
 };
 
-&mdss {
-	status = "okay";
-};
-
 &pm8941_gpios {
 	gpio_keys_pin_a: gpio-keys-active-state {
 		pins = "gpio2", "gpio3";
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 58e144957c5d..aeca504918a0 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1837,10 +1837,10 @@ mmcc: clock-controller@fd8c0000 {
 				 <&gcc GPLL0_VOTE>,
 				 <&gcc GPLL1_VOTE>,
 				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
-				 <&dsi0_phy 1>,
-				 <&dsi0_phy 0>,
-				 <&dsi1_phy 1>,
-				 <&dsi1_phy 0>,
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi1_phy 0>,
 				 <0>,
 				 <0>,
 				 <0>;
@@ -1905,20 +1905,20 @@ ports {
 					port@0 {
 						reg = <0>;
 						mdp5_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
 						mdp5_intf2_out: endpoint {
-							remote-endpoint = <&dsi1_in>;
+							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
 				};
 			};
 
-			dsi0: dsi@fd922800 {
+			mdss_dsi0: dsi@fd922800 {
 				compatible = "qcom,msm8974-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
@@ -1928,7 +1928,7 @@ dsi0: dsi@fd922800 {
 				interrupts = <4>;
 
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,
@@ -1945,7 +1945,7 @@ dsi0: dsi@fd922800 {
 					      "core",
 					      "core_mmss";
 
-				phys = <&dsi0_phy>;
+				phys = <&mdss_dsi0_phy>;
 
 				status = "disabled";
 
@@ -1958,20 +1958,20 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi0_in: endpoint {
+						mdss_dsi0_in: endpoint {
 							remote-endpoint = <&mdp5_intf1_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi0_out: endpoint {
+						mdss_dsi0_out: endpoint {
 						};
 					};
 				};
 			};
 
-			dsi0_phy: phy@fd922a00 {
+			mdss_dsi0_phy: phy@fd922a00 {
 				compatible = "qcom,dsi-phy-28nm-hpm";
 				reg = <0xfd922a00 0xd4>,
 				      <0xfd922b00 0x280>,
@@ -1989,7 +1989,7 @@ dsi0_phy: phy@fd922a00 {
 				status = "disabled";
 			};
 
-			dsi1: dsi@fd922e00 {
+			mdss_dsi1: dsi@fd922e00 {
 				compatible = "qcom,msm8974-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922e00 0x1f8>;
@@ -1999,7 +1999,7 @@ dsi1: dsi@fd922e00 {
 				interrupts = <4>;
 
 				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,
@@ -2016,7 +2016,7 @@ dsi1: dsi@fd922e00 {
 					      "core",
 					      "core_mmss";
 
-				phys = <&dsi1_phy>;
+				phys = <&mdss_dsi1_phy>;
 
 				status = "disabled";
 
@@ -2029,20 +2029,20 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi1_in: endpoint {
+						mdss_dsi1_in: endpoint {
 							remote-endpoint = <&mdp5_intf2_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi1_out: endpoint {
+						mdss_dsi1_out: endpoint {
 						};
 					};
 				};
 			};
 
-			dsi1_phy: phy@fd923000 {
+			mdss_dsi1_phy: phy@fd923000 {
 				compatible = "qcom,dsi-phy-28nm-hpm";
 				reg = <0xfd923000 0xd4>,
 				      <0xfd923100 0x280>,
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
index eb505d6d7f31..3e2c86591ee2 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
@@ -329,7 +329,15 @@ bluetooth {
 	};
 };
 
-&dsi0 {
+&gpu {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
 	status = "okay";
 
 	vdda-supply = <&pma8084_l2>;
@@ -351,31 +359,23 @@ panel: panel@0 {
 
 		port {
 			panel_in: endpoint {
-				remote-endpoint = <&dsi0_out>;
+				remote-endpoint = <&mdss_dsi0_out>;
 			};
 		};
 	};
 };
 
-&dsi0_out {
+&mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 	data-lanes = <0 1 2 3>;
 };
 
-&dsi0_phy {
+&mdss_dsi0_phy {
 	status = "okay";
 
 	vddio-supply = <&pma8084_l12>;
 };
 
-&gpu {
-	status = "okay";
-};
-
-&mdss {
-	status = "okay";
-};
-
 &pma8084_gpios {
 	gpio_keys_pin_a: gpio-keys-active-state {
 		pins = "gpio2", "gpio3", "gpio5";
-- 
2.39.2

