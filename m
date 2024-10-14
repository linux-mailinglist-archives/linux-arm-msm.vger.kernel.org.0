Return-Path: <linux-arm-msm+bounces-34296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191F99C64D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8131F236CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF583146D55;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpUdPAgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E33154C0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899262; cv=none; b=OT8j/0CuS3gUWLwWr86FCB4iUOYbkso6Xcd1fUpWHwy2f6elSxtyvhdqRyBWEU0adI0Ic1wKYd2yrc9Hdwf0wJnTi87Oo7Qmt8vbLsbg8zMgPu2V/7gzfg0p1++RxaQD6hAgcCXK2O3688xTooCiA17+tbk9rUhiBNV/GxKHyKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899262; c=relaxed/simple;
	bh=vmO4n1cOBgCvGH2uI+qJjGDAwLP7jhXnSyRvNI/iouc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9i2DI2R/FKsDBCbZaKQQ9kun0i9desPf9hiLbXkHziKWL+GfoH94ceqVG2GnmB1abm20Eek3k/c5luLXnHGUOZaEKLjwROIuRa66OPbWnp3PzgknFNpq/zzzTbWID1svNbWYG9PjrshKBsaFfChBaQZRUoqjaeLcm/YHVNhLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpUdPAgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C83CC4CECE;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728899262;
	bh=vmO4n1cOBgCvGH2uI+qJjGDAwLP7jhXnSyRvNI/iouc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NpUdPAgLLBlfbJ9F1/+HeyXi/YzDuRLej05kqu3rfbJ+184A17Hl9SW3YgbCPhFgE
	 6AUNXnbX2vfxVWp2jg/D+3QUNNgNMM1PLVo3zyMQ31Rw0qZr4IKOY7ZOioAVbzxhko
	 aaoWwJ4F8IgJilAJKvXYwrBpu58F6IIi1W5Uck8DCkLEOxH1fufeg4pp5rEXtjOhNW
	 /hMWUI6v26TAeJ7uE74FvtdanRn/OqxccbUaOPknqn1U/yleP9DEpoWjvlL/7vWaCF
	 l0OiZp4mGjEmDu9SkJrhmsbZTr1Lk9O8tVIzs6hfhYnbkFzT3btua5f+bg87IcmemY
	 zEgeERUAeo4dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6728DCFC534;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
From: fangez via B4 Relay <devnull+quic_fangez.quicinc.com@kernel.org>
Date: Mon, 14 Oct 2024 17:47:28 +0800
Subject: [PATCH 2/6] arm64: dts: qcom: qcs615: Add display mdss and dsi
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-add_display_support_for_qcs615-v1-2-4efa191dbdd4@quicinc.com>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
To: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
 quic_xiangxuy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728899259; l=8031;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=jHkNmh97cTDPoebjoaJ+CHI2N7gxyKTWiYnJnyHjplo=;
 b=fC10BjkYcRl06z+nKCaQFncLx4OfRx4SzfMiz9wKBqf1XkUk7rDbtRU2XmBfQGSWAQEcyXtM4
 MKaKLUAsh+tAz6YfdmQ+YULoQZodPnDlvmeP8Ys6Y3tSdPdNfQKSErJ
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Endpoint-Received: by B4 Relay for quic_fangez@quicinc.com/20241014 with
 auth_id=245
X-Original-From: fangez <quic_fangez@quicinc.com>
Reply-To: quic_fangez@quicinc.com

From: lliu6 <quic_lliu6@quicinc.com>

Add display mdss and dsi configuration for QCS615 SoC.

Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 101 ++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 195 +++++++++++++++++++++++++++++++
 2 files changed, 296 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index d05a881d7ffeca9de175af2a9062f5bccadcbdfd..f275145c395aedb71bdcd8a88b82917db53e7167 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -207,6 +207,107 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&qup_i2c2_data_clk &ioexp_intr_active &ioexp_reset_active>;
+	pinctrl-names = "default";
+	status = "okay";
+	ioexp: gpio@3e {
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <58 0>;
+		gpio-controller;
+		interrupt-controller;
+		semtech,probe-reset;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi0_hpd_cfg_pins &dsi0_cdet_cfg_pins &dp_hpd_cfg_pins>;
+		dsi0_hpd_cfg_pins: gpio0-cfg {
+			pins = "gpio0";
+			bias-pull-up;
+		};
+		dsi0_cdet_cfg_pins: gpio1-cfg {
+			pins = "gpio1";
+			bias-pull-down;
+		};
+		dp_hpd_cfg_pins: gpio8-cfg {
+			pins = "gpio8";
+			bias-pull-down;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9542";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			anx_7625_1: anx7625@2c {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupt-parent = <&ioexp>;
+				interrupts = <0 0>;
+				enable-gpios = <&tlmm 4 0>;
+				reset-gpios = <&tlmm 5 0>;
+				wakeup-source;
+			};
+		};
+	};
+};
+
+&anx_7625_1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			anx_7625_1_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l11a>;
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&anx_7625_1_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a>;
+};
+
+&tlmm {
+	ioexp_intr_active: ioexp_intr_active {
+		pins = "gpio58";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+	ioexp_reset_active: ioexp_reset_active {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 8e2199bb180d85a86a882c4253778c7e8f34798b..2a6c08220e6c4ded49861754d81d0924389dd93e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1266,6 +1266,201 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,qcs615-mdss";
+			reg = <0 0x0ae00000 0 0x1000>;
+			reg-names = "mdss";
+
+			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x800 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,qcs615-dpu";
+				reg = <0 0x0ae01000 0 0x8f000>,
+				      <0 0x0aeb0000 0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+						 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+						 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+						 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+							  "iface",
+							  "lut",
+							  "core",
+							  "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf0_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,qcs615-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae94000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+						 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+						 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+						 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+						 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+							  "byte_intf",
+							  "pixel",
+							  "core",
+							  "iface",
+							  "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+							 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-225000000 {
+						opp-hz = /bits/ 64 <225000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-262500000 {
+						opp-hz = /bits/ 64 <262500000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,qcs615-dsi-phy-14nm";
+				reg = <0 0x0ae94400 0 0x100>,
+				      <0 0x0ae94500 0 0x300>,
+				      <0 0x0ae94800 0 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,qcs615-dispcc";
 			reg = <0 0xaf00000 0 0x20000>;

-- 
2.25.1



