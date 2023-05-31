Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55174717303
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbjEaBQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234006AbjEaBQt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:49 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD69111C
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so6120626e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495801; x=1688087801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MrQuWe2JNY9qcSKpceygwRhIAhyc/EgGyuqGKJJDOQ=;
        b=mphHFARl+tVvCgAwM81c99V3dNNf/cKzAjl8uCTecxQqWD5CmDtS4wekPP6tI8X2BE
         cwhCQhD2g1kNn3V0LmGnHok/4VHKjjx/c6WEVhJNHCug445Qrbg+lwDWGysrxxG8GAsH
         wVhPoEIv/yrzmRY08FJezTf7AowJzbJflXG1vVf/VT58nVnt8GWjpO6TmLjOLmYlm/fM
         yGdvDSXdGAaV9sS+o6LpXz8cS+G6g43uTDDdjPHFevzFZ2xLGouDcdKcmIIbquP7Dgua
         3/X21iWp5rlmeGvQfWAPJ9dp62ZUOUBz/nJ1BN6NKzoQ0oUZgFB6BY1ihnPFAifOBbnc
         +XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495801; x=1688087801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MrQuWe2JNY9qcSKpceygwRhIAhyc/EgGyuqGKJJDOQ=;
        b=BbL/8354bYd4kqXhsHWTudcgtc+sHBmN0H/TBXD9+awW3l5kRQ74tCk9OeipIHO/SD
         OmI9Uczfhl7SyD5LHdVOFwKgm8KneZEVCdQy23a7HTcXslnPyeinGQpD2WC0iIzvJi6n
         +n56DAO79m276ZiEgJw+KFSyF/wT9B83e622taPCMaQ0FTvd9kJsc98VceDMPjWBr+fq
         CItpB9p64gjXnmXMh0HmsAJNwF2hhDy7ac876unMJiPGu73simmzsXuXUaW/x/Nce62Z
         o2zYs/55nU80O1oq6IZYICdRztLuoQQeb24ukbYkmiBxN1x8o5wSHaclQVrvRIHlZRFP
         T5OQ==
X-Gm-Message-State: AC+VfDymDFkzwb+tx8BklgIPyrx2J3cGT7mygAg5zmTq33uFxVnSh8/g
        9gDPYG8ZexAGzKrVN6JkU9s76A==
X-Google-Smtp-Source: ACHHUZ623riz1y1qDbvSXsDzfAORHwkuVERpTFa3gZIBt2SnwSslTqqp6kX2uFP1S1gCZ56OSkBCWw==
X-Received: by 2002:ac2:5598:0:b0:4f4:e744:2e71 with SMTP id v24-20020ac25598000000b004f4e7442e71mr1665636lfg.64.1685495801133;
        Tue, 30 May 2023 18:16:41 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 13/14] arm64: dts: qcom: msm8996: rename labels for HDMI nodes
Date:   Wed, 31 May 2023 04:16:22 +0300
Message-Id: <20230531011623.3808538-14-dmitry.baryshkov@linaro.org>
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

To keep all display-related nodes close in the board files, change HDMI
node labels from hdmi_* to mdss_hdmi_*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts  | 50 ++++++++++----------
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts |  6 +--
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts     |  4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 16 +++----
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index b599909c4463..537547b97459 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -208,25 +208,6 @@ &gpu {
 	status = "okay";
 };
 
-&hdmi {
-	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
-	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
-
-	core-vdda-supply = <&vreg_l12a_1p8>;
-	core-vcc-supply = <&vreg_s4a_1p8>;
-};
-
-&hdmi_phy {
-	status = "okay";
-
-	vddio-supply = <&vreg_l12a_1p8>;
-	vcca-supply = <&vreg_l28a_0p925>;
-	#phy-cells = <0>;
-};
-
 &hsusb_phy1 {
 	status = "okay";
 
@@ -251,6 +232,25 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_hdmi {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&mdss_hdmi_hpd_active &mdss_hdmi_ddc_active>;
+	pinctrl-1 = <&mdss_hdmi_hpd_suspend &mdss_hdmi_ddc_suspend>;
+
+	core-vdda-supply = <&vreg_l12a_1p8>;
+	core-vcc-supply = <&vreg_s4a_1p8>;
+};
+
+&mdss_hdmi_phy {
+	status = "okay";
+
+	vddio-supply = <&vreg_l12a_1p8>;
+	vcca-supply = <&vreg_l28a_0p925>;
+	#phy-cells = <0>;
+};
+
 &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
@@ -433,28 +433,28 @@ sdc2_cd_off: sdc2-cd-off-state {
 		drive-strength = <2>;
 	};
 
-	hdmi_hpd_active: hdmi-hpd-active-state {
+	mdss_hdmi_hpd_active: mdss_hdmi-hpd-active-state {
 		pins = "gpio34";
 		function = "hdmi_hot";
 		bias-pull-down;
 		drive-strength = <16>;
 	};
 
-	hdmi_hpd_suspend: hdmi-hpd-suspend-state {
+	mdss_hdmi_hpd_suspend: mdss_hdmi-hpd-suspend-state {
 		pins = "gpio34";
 		function = "hdmi_hot";
 		bias-pull-down;
 		drive-strength = <2>;
 	};
 
-	hdmi_ddc_active: hdmi-ddc-active-state {
+	mdss_hdmi_ddc_active: mdss_hdmi-ddc-active-state {
 		pins = "gpio32", "gpio33";
 		function = "hdmi_ddc";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
 
-	hdmi_ddc_suspend: hdmi-ddc-suspend-state {
+	mdss_hdmi_ddc_suspend: mdss_hdmi-ddc-suspend-state {
 		pins = "gpio32", "gpio33";
 		function = "hdmi_ddc";
 		drive-strength = <2>;
@@ -1043,7 +1043,7 @@ cpu {
 		};
 	};
 
-	hdmi-dai-link {
+	mdss_hdmi-dai-link {
 		link-name = "HDMI";
 		cpu {
 			sound-dai = <&q6afedai HDMI_RX>;
@@ -1054,7 +1054,7 @@ platform {
 		};
 
 		codec {
-			sound-dai = <&hdmi 0>;
+			sound-dai = <&mdss_hdmi 0>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index ed2e2f6c6775..ac6471d1db1f 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -92,15 +92,15 @@ &gpu {
 	status = "okay";
 };
 
-&hdmi {
+&mdss {
 	status = "okay";
 };
 
-&hdmi_phy {
+&mdss_hdmi {
 	status = "okay";
 };
 
-&mdss {
+&mdss_hdmi_phy {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
index 596ad4c896f5..495d45a16e63 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
@@ -24,10 +24,10 @@ &blsp2_uart2 {
 	status = "okay";
 };
 
-&hdmi {
+&mdss_hdmi {
 	status = "okay";
 };
 
-&hdmi_phy {
+&mdss_hdmi_phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 3855366ca89f..0cb2d4f08c3a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -895,7 +895,7 @@ mmcc: clock-controller@8c0000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi1_phy 1>,
 				 <&mdss_dsi1_phy 0>,
-				 <&hdmi_phy>;
+				 <&mdss_hdmi_phy>;
 			clock-names = "xo",
 				      "gpll0",
 				      "gcc_mmss_noc_cfg_ahb_clk",
@@ -980,7 +980,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						mdp5_intf3_out: endpoint {
-							remote-endpoint = <&hdmi_in>;
+							remote-endpoint = <&mdss_hdmi_in>;
 						};
 					};
 
@@ -1136,8 +1136,8 @@ mdss_dsi1_phy: phy@996400 {
 				status = "disabled";
 			};
 
-			hdmi: hdmi-tx@9a0000 {
-				compatible = "qcom,hdmi-tx-8996";
+			mdss_hdmi: mdss_hdmi-tx@9a0000 {
+				compatible = "qcom,mdss_hdmi-tx-8996";
 				reg =	<0x009a0000 0x50c>,
 					<0x00070000 0x6158>,
 					<0x009e0000 0xfff>;
@@ -1160,7 +1160,7 @@ hdmi: hdmi-tx@9a0000 {
 					"alt_iface",
 					"extp";
 
-				phys = <&hdmi_phy>;
+				phys = <&mdss_hdmi_phy>;
 				#sound-dai-cells = <1>;
 
 				status = "disabled";
@@ -1171,16 +1171,16 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						hdmi_in: endpoint {
+						mdss_hdmi_in: endpoint {
 							remote-endpoint = <&mdp5_intf3_out>;
 						};
 					};
 				};
 			};
 
-			hdmi_phy: phy@9a0600 {
+			mdss_hdmi_phy: phy@9a0600 {
 				#phy-cells = <0>;
-				compatible = "qcom,hdmi-phy-8996";
+				compatible = "qcom,mdss_hdmi-phy-8996";
 				reg = <0x009a0600 0x1c4>,
 				      <0x009a0a00 0x124>,
 				      <0x009a0c00 0x124>,
-- 
2.39.2

