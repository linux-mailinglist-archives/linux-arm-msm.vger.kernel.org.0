Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B3D22E6FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 09:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgG0Hzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 03:55:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgG0Hzn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 03:55:43 -0400
Received: from localhost.localdomain (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0AA320672;
        Mon, 27 Jul 2020 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595836542;
        bh=klIYZ3z3AZ82e3hAd5ya/zhpvWBojtO3/DLyBwGwpHA=;
        h=From:To:Cc:Subject:Date:From;
        b=fcx2rUQXA8HJhCYavhUebUtAby8I1DMdXZV1YYeNYIHbB0QCfO6xAo1G/ywddtxcg
         Nsb55Ip7/oiqwz13Z/c0TKnTV5QC1NrfucD90T1VuptwznRdQ95njxQYlBxi7iOPRj
         /rMVqBb5ldQ+YVYhCunj7CYj+uootpc6l3akxsEE=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: Add hdmi bridge nodes
Date:   Mon, 27 Jul 2020 13:25:32 +0530
Message-Id: <20200727075532.1932134-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Enable MDSS and DSI and add the LT9611 HDMI bridge. Also add the HDMI
audio nodes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c00797bd3b07..a2a98680ccf5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -74,6 +74,17 @@ bt {
 		};
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v8: lt9611-vdd18-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V8";
@@ -382,6 +393,25 @@ &cdsp_pas {
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
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
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l1a_0p875>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -395,6 +425,48 @@ zap-shader {
 	};
 };
 
+&i2c10 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v8>;
+		vcc-supply = <&lt9611_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin>, <&dsi_sw_sel>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+		};
+	};
+};
+
 &i2c11 {
 	/* On Low speed expansion */
 	label = "LS-I2C1";
@@ -407,6 +479,14 @@ &i2c14 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
@@ -612,6 +692,21 @@ cpu {
 		};
 	};
 
+	hdmi-dai-link {
+		link-name = "HDMI Playback";
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai =  <&lt9611_codec 0>;
+		};
+	};
+
 	slim-dai-link {
 		link-name = "SLIM Playback";
 		cpu {
@@ -686,6 +781,21 @@ mclk3 {
 		};
 	};
 
+	dsi_sw_sel: dsi-sw-sel {
+		pins = "gpio120";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	lt9611_irq_pin: lt9611-irq {
+		pins = "gpio84";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie0_default_state: pcie0-default {
 		clkreq {
 			pins = "gpio36";
@@ -943,6 +1053,14 @@ pinmux {
 	};
 };
 
+&qup_i2c10_default {
+	pinconf {
+		pins = "gpio55", "gpio56";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &qup_uart6_default {
 	pinmux {
 		pins = "gpio45", "gpio46", "gpio47", "gpio48";
-- 
2.26.2

