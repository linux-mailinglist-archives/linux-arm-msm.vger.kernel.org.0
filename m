Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50006717300
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbjEaBQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233990AbjEaBQp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C457C12B
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso5853225e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495800; x=1688087800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQRQ+BN8mlCC4G1Zk0gOq8dFvyK0dyvR6upYQ2Wj8wc=;
        b=BzJabeceyqzipHkS8GCZXzIV1LxoqAB98uXTJLhkmUUm8LEHhLPOjw7FridTlnOb2J
         RWLimRCmk8EQZp4ThV5ktus10yc+F5MKzrUsrMtsHLY9Kd7mKvofJ6tzOq/NLSeWro6a
         OwTiyUic80ACNuWVLEU1ovFnbOvAqogZ2Ix35fA2oHF+GBz9hRNL5QE6NIloQIMT6Jhg
         amJL3/w+SI6nVSiW7W7jIK6FWAEHlu4+cRGP0Eez0PqpcyK1kSLlavyfZ0ZCCvzEQwVM
         pD/EbSFPHgkzb1b0oJKwtAdJ6xH7nRrDGoUNO0asREC52Mkz6UeJtD22lyY0f6KKyBNE
         Eqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495800; x=1688087800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQRQ+BN8mlCC4G1Zk0gOq8dFvyK0dyvR6upYQ2Wj8wc=;
        b=MzBrNM/j4bbmi7I1C99h0wCVIxBF48blKqLUcRN4KTwKkTrS//WQnP+g0U+kD3R1uf
         k5qgb0VqkWL+xH+/kXm7hjUyIdfzPgHiB8bNDLJ2pmqfykM+6Pe9wjjKrgqlzSFPo0tT
         5FcJji9Ib1wwwpZ6OuTwlwEvPJe8SwpfOq9sj234kaZl6mPwZx8TU4rmWV4fcVcHoM0C
         9UaZ58CwGH7zMeJN08l2/o+rIZbV4/Arpq1YYoaxDoUk4Sn6ii1vom+G64GYPgJhe2Fa
         Qxm2VxnL/T4PfoHo7KEWA3tFDIfyC+boDZi825ik+lVjvK/O6bubVlMyvnfWnR2D5i5g
         Zw5A==
X-Gm-Message-State: AC+VfDwOk4h6+tGqzdQErSy08KIxluP/qBduEzwdkraXaPCRG6Vo4LgB
        cEuoPXavgfT3mwXKVR1WlXRmLQ==
X-Google-Smtp-Source: ACHHUZ6l7gR75r+HAp+mG7Ygf1toHAgD5CuG8hCoOPytZCS5SIyuvLD+Gl7K7tsgTtm4h3PjwRyRPQ==
X-Received: by 2002:ac2:4d1a:0:b0:4f3:94b5:3272 with SMTP id r26-20020ac24d1a000000b004f394b53272mr1562418lfi.11.1685495800090;
        Tue, 30 May 2023 18:16:40 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 12/14] arm64: dts: qcom: sm8250: rename labels for DSI nodes
Date:   Wed, 31 May 2023 04:16:21 +0300
Message-Id: <20230531011623.3808538-13-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  52 +++----
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  40 ++---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 138 +++++++++---------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  36 ++---
 4 files changed, 133 insertions(+), 133 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dfcaac266456..9022ad726741 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -535,30 +535,6 @@ &cdsp {
 	firmware-name = "qcom/sm8250/cdsp.mbn";
 };
 
-&dsi0 {
-	status = "okay";
-	vdda-supply = <&vreg_l9a_1p2>;
-
-#if 0
-	qcom,dual-dsi-mode;
-	qcom,master-dsi;
-#endif
-
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&lt9611_a>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
-};
-
-&dsi0_phy {
-	status = "okay";
-	vdds-supply = <&vreg_l5a_0p88>;
-};
-
 &gmu {
 	status = "okay";
 };
@@ -604,7 +580,7 @@ port@0 {
 				reg = <0>;
 
 				lt9611_a: endpoint {
-					remote-endpoint = <&dsi0_out>;
+					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
 
@@ -613,7 +589,7 @@ port@1 {
 				reg = <1>;
 
 				lt9611_b: endpoint {
-					remote-endpoint = <&dsi1_out>;
+					remote-endpoint = <&mdss_dsi1_out>;
 				};
 			};
 #endif
@@ -639,6 +615,30 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l9a_1p2>;
+
+#if 0
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+#endif
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p88>;
+};
+
 &pm8150_adc {
 	xo-therm@4c {
 		reg = <ADC5_XO_THERM_100K_PU>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 1326c171fe72..cfbc4fc1eba9 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -311,25 +311,6 @@ &cdsp_pas {
 	status = "okay";
 };
 
-&dsi0 {
-	status = "okay";
-	vdda-supply = <&vreg_l26a_1p2>;
-
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&sn65dsi86_in_a>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
-};
-
-&dsi0_phy {
-	status = "okay";
-	vdds-supply = <&vreg_l1a_0p875>;
-};
-
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -422,7 +403,7 @@ ports {
 			port@0 {
 				reg = <0>;
 				sn65dsi86_in_a: endpoint {
-					remote-endpoint = <&dsi0_out>;
+					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
 
@@ -475,6 +456,25 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&sn65dsi86_in_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l1a_0p875>;
+};
+
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/sdm850/LENOVO/81JL/qcdsp2850.mbn";
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index eaac00085894..b841ea9192ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -470,75 +470,6 @@ &cdsp {
 	status = "okay";
 };
 
-&dsi0 {
-	vdda-supply = <&vreg_l9a_1p2>;
-	qcom,dual-dsi-mode;
-	qcom,sync-dual-dsi;
-	qcom,master-dsi;
-	status = "okay";
-
-	display_panel: panel@0 {
-		reg = <0>;
-		vddio-supply = <&vreg_l14a_1p88>;
-		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
-		backlight = <&backlight>;
-
-		status = "disabled";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				panel_in_0: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
-			};
-
-			port@1{
-				reg = <1>;
-
-				panel_in_1: endpoint {
-					remote-endpoint = <&dsi1_out>;
-				};
-			};
-		};
-	};
-};
-
-&dsi0_out {
-	data-lanes = <0 1 2>;
-	remote-endpoint = <&panel_in_0>;
-};
-
-&dsi0_phy {
-	vdds-supply = <&vreg_l5a_0p88>;
-	phy-type = <PHY_TYPE_CPHY>;
-	status = "okay";
-};
-
-&dsi1 {
-	vdda-supply = <&vreg_l9a_1p2>;
-	qcom,dual-dsi-mode;
-	qcom,sync-dual-dsi;
-	/* DSI1 is slave, so use DSI0 clocks */
-	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
-	status = "okay";
-};
-
-&dsi1_out {
-	data-lanes = <0 1 2>;
-	remote-endpoint = <&panel_in_1>;
-};
-
-&dsi1_phy {
-	vdds-supply = <&vreg_l5a_0p88>;
-	phy-type = <PHY_TYPE_CPHY>;
-	status = "okay";
-};
-
 &gmu {
 	status = "okay";
 };
@@ -607,6 +538,75 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+	qcom,master-dsi;
+	status = "okay";
+
+	display_panel: panel@0 {
+		reg = <0>;
+		vddio-supply = <&vreg_l14a_1p88>;
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1{
+				reg = <1>;
+
+				panel_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2>;
+	remote-endpoint = <&panel_in_0>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	phy-type = <PHY_TYPE_CPHY>;
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	data-lanes = <0 1 2>;
+	remote-endpoint = <&panel_in_1>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	phy-type = <PHY_TYPE_CPHY>;
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e5c60a6e4074..8cfb951f6a67 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4234,14 +4234,14 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
 						dpu_intf2_out: endpoint {
-							remote-endpoint = <&dsi1_in>;
+							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
 				};
@@ -4271,7 +4271,7 @@ opp-460000000 {
 				};
 			};
 
-			dsi0: dsi@ae94000 {
+			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm8250-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
@@ -4294,12 +4294,12 @@ dsi0: dsi@ae94000 {
 					      "bus";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-				phys = <&dsi0_phy>;
+				phys = <&mdss_dsi0_phy>;
 
 				status = "disabled";
 
@@ -4312,14 +4312,14 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi0_in: endpoint {
+						mdss_dsi0_in: endpoint {
 							remote-endpoint = <&dpu_intf1_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi0_out: endpoint {
+						mdss_dsi0_out: endpoint {
 						};
 					};
 				};
@@ -4344,7 +4344,7 @@ opp-358000000 {
 				};
 			};
 
-			dsi0_phy: phy@ae94400 {
+			mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -4363,7 +4363,7 @@ dsi0_phy: phy@ae94400 {
 				status = "disabled";
 			};
 
-			dsi1: dsi@ae96000 {
+			mdss_dsi1: dsi@ae96000 {
 				compatible = "qcom,sm8250-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
@@ -4386,12 +4386,12 @@ dsi1: dsi@ae96000 {
 					      "bus";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-				phys = <&dsi1_phy>;
+				phys = <&mdss_dsi1_phy>;
 
 				status = "disabled";
 
@@ -4404,20 +4404,20 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi1_in: endpoint {
+						mdss_dsi1_in: endpoint {
 							remote-endpoint = <&dpu_intf2_out>;
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
 
-			dsi1_phy: phy@ae96400 {
+			mdss_dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
@@ -4443,10 +4443,10 @@ dispcc: clock-controller@af00000 {
 			power-domains = <&rpmhpd SM8250_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&dsi0_phy 0>,
-				 <&dsi0_phy 1>,
-				 <&dsi1_phy 0>,
-				 <&dsi1_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi1_phy 1>,
 				 <&dp_phy 0>,
 				 <&dp_phy 1>;
 			clock-names = "bi_tcxo",
-- 
2.39.2

