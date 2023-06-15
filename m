Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54E5731247
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244583AbjFOIel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244544AbjFOIea (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:34:30 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0154E2125
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:34:28 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b4420a8c44so9100661fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686818066; x=1689410066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf2LhhVsoVo8G/Q+39tVp5ZYmVz8VwbPVAt1Vy+crpk=;
        b=OESo0GBOKbdnIkneHjQMHRkwskNYusAWooXNfVOQapJOx0VzKOqrA0qvdZVf5WZb2L
         9t0USv+KzaROc4uX39mOh+6Pv/cv3pmtfXmVER8v4s70ANZZny36JC9QFqfgTNNtS+Pq
         bayvnrCQYvgbzKakud07/llkkuJv075mtZ7YbfPK/X+0XKwavF59vLwI6SPgKiq6Wov1
         rPFeRwf+DEIg9NhSnWBta2MurvsCX33WgRV5FjeSC2FQuO1y0KH+AIYbj0hihtO4k1mt
         PjfRvNfWqmj6AlFjulzcx2AyarzyhaHM/Zz3QoKdNGBeNMuYnkWtCQug/+eY8HCxyePb
         YNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818066; x=1689410066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf2LhhVsoVo8G/Q+39tVp5ZYmVz8VwbPVAt1Vy+crpk=;
        b=ICSAlttZ1lUI5a0HgXUiJPLQhw7dDFjR/VCktMxXVQAp2Z5/kYWjMdXLolpCJ3xxEX
         CD3R2oS9jE4lwI6GUoh2B8fDxmgnxyneOAT8xa5yGFyeoME4SbRtIRbsTcEavckR0q8N
         gtD2yuSb+RNoihZVuMTYQmgUHfyCef0ZGuTDolXny9SYeLoVd/ztz++XsSaBeI2GXXUH
         nSuuvfZrcg1VW6Jh/jBFmNrZuez98OP8+Fx46SogR6h3vTHxwNk2ojhVz+a8/FNiT0V4
         B+dN3KLVH9R98Kp/4wFuQR+lDOBvt98Dhyx+9ifWP2JsSVd59YKFTpauEuEbpn0Apou+
         8M5g==
X-Gm-Message-State: AC+VfDzjv0XiTdyZf1PKlhU1RO/lk6xb/Gj9GiAvziervjR0YkJgJehr
        Y6eKGOiEy+p6ExZVY2YdaD4Fqg==
X-Google-Smtp-Source: ACHHUZ7WUAsy7QYAEnK/mZq/FceTzpINri+7JBkZwG5PZV3Kr8seauwAt9jjcLyg4fE9Zu2z00foaw==
X-Received: by 2002:a2e:3a05:0:b0:2ad:8c4c:4459 with SMTP id h5-20020a2e3a05000000b002ad8c4c4459mr7952216lja.50.1686818066372;
        Thu, 15 Jun 2023 01:34:26 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a2eb173000000b002ad92dff470sm2971209ljm.134.2023.06.15.01.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 01:34:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: msm8996: rename labels for HDMI nodes
Date:   Thu, 15 Jun 2023 11:34:22 +0300
Message-Id: <20230615083422.350297-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
References: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In board files MDSS and HDMI nodes do not come next to each other,
because labels for HDMI nodes do not have the common mdss_ prefix.

Follow the DSI example and enable such grouping by changing the prefix
for HDMI labels to mdss_hdmi_*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts  | 40 ++++++++++----------
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts |  6 +--
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts     |  4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 12 +++---
 4 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index b599909c4463..39170c18c693 100644
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
+	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
+	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
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
index 3855366ca89f..40ac0a784a4a 100644
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
 
@@ -1136,7 +1136,7 @@ mdss_dsi1_phy: phy@996400 {
 				status = "disabled";
 			};
 
-			hdmi: hdmi-tx@9a0000 {
+			mdss_hdmi: hdmi-tx@9a0000 {
 				compatible = "qcom,hdmi-tx-8996";
 				reg =	<0x009a0000 0x50c>,
 					<0x00070000 0x6158>,
@@ -1160,7 +1160,7 @@ hdmi: hdmi-tx@9a0000 {
 					"alt_iface",
 					"extp";
 
-				phys = <&hdmi_phy>;
+				phys = <&mdss_hdmi_phy>;
 				#sound-dai-cells = <1>;
 
 				status = "disabled";
@@ -1171,14 +1171,14 @@ ports {
 
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
 				compatible = "qcom,hdmi-phy-8996";
 				reg = <0x009a0600 0x1c4>,
-- 
2.39.2

