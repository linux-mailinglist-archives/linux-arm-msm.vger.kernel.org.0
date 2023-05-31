Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B974D7172F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbjEaBQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233978AbjEaBQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3045100
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso5853120e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495793; x=1688087793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFKNs5y/9R3ir6KgOPcsDSunLemhkazV+nId1D4ZPrw=;
        b=NwuTw7gTvQ8zVbOgXnG2UZJP/4Y/uIZNE4CAIST3RV/+2dkuRYx6GHW6ejyOIEIQZf
         BEs0DRBQnZIFo9Y01lOXrJfr5q/KhvdN+FmXYH5eZHkIWogJkxOWQJsmRJXvjf2Yqn2b
         re34ZABSlwWfRqzaZ42HMnIqN5esLVVAVy52WTNSFdIlRcLGt9ca62BB/4NwfrCjEP0T
         JyszODyIH+6TUc3FbCODeobRFJ3io0injJLGH0lL2YlG8dKgjkWP8d1/VAEBVVubPlje
         E4AKqlhQ/HquOsdgzRseuxdc65FSvF0gOzCWwWIB9t8bIWOOeryLbEOp+jDcJ/O1qJNK
         rt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495793; x=1688087793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFKNs5y/9R3ir6KgOPcsDSunLemhkazV+nId1D4ZPrw=;
        b=RwsQBI8qAcoIFajotVeS0ZsGZg/hpoz3HjdlXOkEx2ll57P6EMNfqZPMANNd+y+uRR
         01DjdYXNXrCdku2j8PgUYLYZntdvPa0UyVirwrdZtxSN4Q0KNaRNLvFhQ6c0W0nR4arc
         PRyBHAQ3EYkcwT33eN6RjOBG2Ie0Bp4baY/cgcqN5Y3fvDGcYaw5zOexklvkv/u2h/n1
         2dBRE9XNIDg3AK71AauP8tdmMnetzrfL7cqLz7Q7TZF9daMCi9UV3tYizorpjxotVUJH
         zEpuxsiEfMOvF1eZ/Q9kByTri6VwjPquKleARFYXPVSEsOT7FVpflcI9dsRGNE5P6cnu
         ylsQ==
X-Gm-Message-State: AC+VfDwVwcsYTK2L8m2y6ng4oZoywApbHRNoGltj298/YZPNIQPofoG/
        MkjAzBoz9CkJpqYZxxgwEGNevA==
X-Google-Smtp-Source: ACHHUZ5FkGGfW8P/xvDPkjMUJzC3XqMBdGz+nSb3V6zg4WUt+jkUfI2UPHt5gdI8JgOJ126SQ+mn9A==
X-Received: by 2002:ac2:4959:0:b0:4f4:cebe:a7aa with SMTP id o25-20020ac24959000000b004f4cebea7aamr1429609lfi.39.1685495793082;
        Tue, 30 May 2023 18:16:33 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 06/14] arm64: dts: qcom: msm8996: rename labels for DSI nodes
Date:   Wed, 31 May 2023 04:16:15 +0300
Message-Id: <20230531011623.3808538-7-dmitry.baryshkov@linaro.org>
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

Currently in board files MDSS and DSI nodes stay apart, because labels
for DSI nodes do not have the mdss_ prefix. It was found that grouping
all display-related notes is more useful.

To keep all display-related nodes close in the board files, change DSI
node labels from dsi_* to mdss_dsi_*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi | 30 ++++++++--------
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 22 ++++++------
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   | 18 +++++-----
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 36 +++++++++----------
 .../dts/qcom/msm8996pro-xiaomi-natrium.dts    | 18 +++++-----
 5 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 2adadc1e5b7c..ec5457508fe6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -164,21 +164,6 @@ &camss {
 	vdda-supply = <&vreg_l2a_1p25>;
 };
 
-&dsi0 {
-	vdda-supply = <&vreg_l2a_1p25>;
-	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
-};
-
-&dsi0_out {
-	data-lanes = <0 1 2 3>;
-};
-
-&dsi0_phy {
-	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
-};
-
 &hsusb_phy1 {
 	vdd-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
@@ -201,6 +186,21 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l2a_1p25>;
+	vcca-supply = <&vreg_l22a_3p0>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&vreg_l28a_0p925>;
+	status = "okay";
+};
+
 &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 1ce5df0a3405..47f55c7311e9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -235,7 +235,15 @@ bluetooth: bluetooth {
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
 
 	vdd-supply = <&vreg_l2a_1p25>;
@@ -246,26 +254,18 @@ &dsi0 {
 	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
 };
 
-&dsi0_out {
+&mdss_dsi0_out {
 	status = "okay";
 
 	data-lanes = <0 1 2 3>;
 };
 
-&dsi0_phy {
+&mdss_dsi0_phy {
 	status = "okay";
 
 	vcca-supply = <&vreg_l28a_0p925>;
 };
 
-&gpu {
-	status = "okay";
-};
-
-&mdss {
-	status = "okay";
-};
-
 &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index 100123d51494..bdedcf9dff03 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -93,7 +93,13 @@ synaptics@20 {
 
 };
 
-&dsi0 {
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/msm8996/gemini/a530_zap.mbn";
+	};
+};
+
+&mdss_dsi0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l2a_1p25>;
@@ -112,22 +118,16 @@ panel: panel@0 {
 
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
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/msm8996/gemini/a530_zap.mbn";
-	};
-};
-
 &pmi8994_wled {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f75932cc2a30..3855366ca89f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -891,10 +891,10 @@ mmcc: clock-controller@8c0000 {
 			clocks = <&xo_board>,
 				 <&gcc GPLL0>,
 				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
-				 <&dsi0_phy 1>,
-				 <&dsi0_phy 0>,
-				 <&dsi1_phy 1>,
-				 <&dsi1_phy 0>,
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi1_phy 0>,
 				 <&hdmi_phy>;
 			clock-names = "xo",
 				      "gpll0",
@@ -987,20 +987,20 @@ mdp5_intf3_out: endpoint {
 					port@1 {
 						reg = <1>;
 						mdp5_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 
 					port@2 {
 						reg = <2>;
 						mdp5_intf2_out: endpoint {
-							remote-endpoint = <&dsi1_in>;
+							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
 				};
 			};
 
-			dsi0: dsi@994000 {
+			mdss_dsi0: dsi@994000 {
 				compatible = "qcom,msm8996-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00994000 0x400>;
@@ -1024,9 +1024,9 @@ dsi0: dsi@994000 {
 					      "pixel",
 					      "core";
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
 
-				phys = <&dsi0_phy>;
+				phys = <&mdss_dsi0_phy>;
 				status = "disabled";
 
 				#address-cells = <1>;
@@ -1038,20 +1038,20 @@ ports {
 
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
 
-			dsi0_phy: phy@994400 {
+			mdss_dsi0_phy: phy@994400 {
 				compatible = "qcom,dsi-phy-14nm";
 				reg = <0x00994400 0x100>,
 				      <0x00994500 0x300>,
@@ -1068,7 +1068,7 @@ dsi0_phy: phy@994400 {
 				status = "disabled";
 			};
 
-			dsi1: dsi@996000 {
+			mdss_dsi1: dsi@996000 {
 				compatible = "qcom,msm8996-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00996000 0x400>;
@@ -1092,9 +1092,9 @@ dsi1: dsi@996000 {
 					      "pixel",
 					      "core";
 				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
 
-				phys = <&dsi1_phy>;
+				phys = <&mdss_dsi1_phy>;
 				status = "disabled";
 
 				#address-cells = <1>;
@@ -1106,20 +1106,20 @@ ports {
 
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
 
-			dsi1_phy: phy@996400 {
+			mdss_dsi1_phy: phy@996400 {
 				compatible = "qcom,dsi-phy-14nm";
 				reg = <0x00996400 0x100>,
 				      <0x00996500 0x300>,
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
index d18d0b0eda95..7957c8823f0d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
@@ -39,7 +39,13 @@ touchscreen@20 {
 	};
 };
 
-&dsi0 {
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/msm8996/natrium/a530_zap.mbn";
+	};
+};
+
+&mdss_dsi0 {
 	status = "okay";
 
 	vdda-supply = <&vreg_l2a_1p25>;
@@ -57,22 +63,16 @@ panel: panel@0 {
 
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
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/msm8996/natrium/a530_zap.mbn";
-	};
-};
-
 &mss_pil {
 	firmware-name = "qcom/msm8996/natrium/mba.mbn",
 			"qcom/msm8996/natrium/modem.mbn";
-- 
2.39.2

