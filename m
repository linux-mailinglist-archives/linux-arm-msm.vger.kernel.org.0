Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C629E1D3762
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 19:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgENREr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 13:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgENREr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 13:04:47 -0400
Received: from mxa2.seznam.cz (mxa2.seznam.cz [IPv6:2a02:598:2::90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D27C061A0C;
        Thu, 14 May 2020 10:04:46 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc11b.ng.seznam.cz (email-smtpc11b.ng.seznam.cz [10.23.14.75])
        id 3ef2742065fc20493f5bb87e;
        Thu, 14 May 2020 19:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1589475878; bh=U1RHpu2MQPEcxje/nVWl8eQg+lZOAKfXx2Xs659abiQ=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=IHFWVTxhrun3hvhbMkMoKgl8/SzmQYKKtSjGwdKu8F8i01OT5l2iSyAAFYzv2uE+W
         YG6i5jEDUQo5ch5HdgRiU6ciO5592O2rU8TMOKWrDEKTVPR+b8VlcZ149rfg6WpsKo
         bnKaKtsGbVsNal2IuKclpn8OQkm552aKfxpVvzCM=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
        by email-relay9.ng.seznam.cz (Seznam SMTPD 1.3.114) with ESMTP;
        Thu, 14 May 2020 19:04:33 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <michael.srba@seznam.cz>
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-a3u: add nodes for display panel
Date:   Thu, 14 May 2020 19:01:29 +0200
Message-Id: <20200514170129.10902-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <michael.srba@seznam.cz>

This patch wires up display support on Samsung Galaxy A3 2015.

Signed-off-by: Michael Srba <michael.srba@seznam.cz>

---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 44 +++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts | 54 +++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index af812f76e8be..2a64aa269f52 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -72,6 +72,24 @@ phy {
 			};
 		};
 
+		mdss@1a00000 {
+			dsi@1a98000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				vdda-supply = <&pm8916_l2>;
+				vddio-supply = <&pm8916_l6>;
+
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&mdss_default>;
+				pinctrl-1 = <&mdss_sleep>;
+			};
+
+			dsi-phy@1a98300 {
+				vddio-supply = <&pm8916_l6>;
+			};
+		};
+
 		wcnss@a21b000 {
 			status = "okay";
 		};
@@ -172,6 +190,32 @@ pinconf {
 			bias-disable;
 		};
 	};
+
+	pmx-mdss {
+		mdss_default: mdss-default {
+			pinmux {
+				function = "gpio";
+				pins = "gpio25";
+			};
+			pinconf {
+				pins = "gpio25";
+				drive-strength = <8>;
+				bias-disable;
+			};
+		};
+
+		mdss_sleep: mdss-sleep {
+			pinmux {
+				function = "gpio";
+				pins = "gpio25";
+			};
+			pinconf {
+				pins = "gpio25";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+	};
 };
 
 &smd_rpm_regulators {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index d10f7ac5089f..b46c87289033 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -7,4 +7,58 @@
 / {
 	model = "Samsung Galaxy A3U (EUR)";
 	compatible = "samsung,a3u-eur", "qcom,msm8916";
+
+	reg_panel_vdd3: regulator-panel-vdd3 {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vdd3";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&msmgpio 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_vdd3_default>;
+	};
+};
+
+&dsi0 {
+	panel@0 {
+		reg = <0>;
+
+		compatible = "samsung,s6e88a0-ams452ef01";
+
+		vdd3-supply = <&reg_panel_vdd3>;
+		vci-supply = <&pm8916_l17>;
+		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			dsi0_out: endpoint {
+				remote-endpoint = <&panel_in>;
+				data-lanes = <0 1>;
+			};
+		};
+	};
+};
+
+&msmgpio {
+	panel_vdd3_default: panel-vdd3-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio9";
+		};
+		pinconf {
+			pins = "gpio9";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
-- 
2.24.0

