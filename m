Return-Path: <linux-arm-msm+bounces-20464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C668CF0D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E641C21066
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FB912EBD2;
	Sat, 25 May 2024 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o02yb0UK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8F812EBC4;
	Sat, 25 May 2024 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659960; cv=none; b=hapnOFyQYdRuAa1oCsxUBrMVG/31MzRWdRjHfSF2hnYdGKNRMAmypmjzRqd6uLEkRepcKMj2odQQYAcf+E0Izu42WGe5kPC9HxLDsmeu9TvPEd0kFOVqsgcBbbBjli2dBbrR+nqywL328DtDGYJklkKrUX2pBtmT5O0ebezLnpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659960; c=relaxed/simple;
	bh=fT5H+9k0dKw7ylUnpXt7G6BQhfF1fStNR237iT1CHY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnwMRj53i9ZAec80zJ8PPxkrf1mKUm8wXxMq08Yrdu5iv4YBFF5fIwuuxx1LSOyyHLu0KTesmhfuB8jR2RXu8v/EdjIHUlLa3vST9uO4L8rUlJ+shI21P0AQxOJaVhG7A+8ni4V1Grsx2UrRr9gRWCgekQgBxDf0Gr6IX2cjPoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o02yb0UK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99111C2BD11;
	Sat, 25 May 2024 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659959;
	bh=fT5H+9k0dKw7ylUnpXt7G6BQhfF1fStNR237iT1CHY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o02yb0UKPRXZxFxcEHmh8tMsjOm6BiAvD/893mJ893f/ZwQEyIIau/DS+CM1pEfTd
	 nC56c9jwM9H32u2z93g5C6AeMQ7WX8SQJ85s1PBkaG+eZwHo1jaiOjKr5Xs7Uxg2LX
	 xGM3XdwPn09hPoa8b3tpiLELe/tnrZOp4/hogknJrs2zU7bbInV4x1lWm3Z+opstA1
	 W6ZIFS3TnEZwRe/ej6iaLFWAFtGcieHQTqHLH47jAMn3S3XAM2OiNpT9jjqTIbapRd
	 Jy0Z6jRcu/vlLWObrEq5nL/cBpOJ/HlBnHfm4PsOspalGeaGVSdJhWo63oF5ybJ2/U
	 Ac4FSx7aQVJqQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:04:01 -0700
Subject: [PATCH 08/10] arm64: dts: qcom: sc8180x: Add USB MP controller and
 phys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-8-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5451;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=9MKZGUklgYXdQmJb0Ci7E4C65gPkhylXhTIui5TVewU=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMg+OuqInwHR3RI2Cbb/opRwyNFctoxU0Lg
 lxkKpgSqVKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWfsBAAriYmGV1MSfQ406DVeil3lKzAMNUvyEzswoSUrjA
 H1OvR34xU/YVI6XR2dhoK/2fQLLu+eAPCrJkYP2fl+sZQ9NlA0wKhIW7mmn2+/eFooE9w9y6Yo1
 wUg58YMdagu6B0Vwlv81uAn6ZMq3rrPfPArGwSE1IuOxlMsZU22kL2W92tJpNTqeDH+ji2usSr9
 CS9KhDso0t8c4yHtoD/IRlJ9LqsTu0vbivKqRg/dFsqybAVCPF3fjL+QJRU/q39NfxwCti+r1uL
 0CYjXXbL59FaSTyRgmlJ4ZemOESoiomy6jlkokZDjDaB8Mwilu98jimWeoq3dUXK4br4p8m6GMG
 ayC+4lCgtPX7NNLGhNJ+ysR/0RrT1bBdqJ2HSToXG+M89fjZqdBujar8L0EQZEULGRmbfUFFd7J
 pH0s0JyU8HeybUnm7gdF6Dx+eUzM1vsgvYg9FTzGRXjHuqF0dFA1cdsWjYL11AJi31p1x24DBdK
 ZRZWB9WEmJdF0GkYNXKy8lx6qE5889QmDNQ7eQgwjgSL1Jj+r1KAEIBvmnXbi0OR31c+FgRm5TM
 +aGKjbPKSGdy3Hf8NpQ9nVUbwZiN2/QYOZaURLPHnH/OnQ+7UQaUxC82q5ZSo3vEaw2hhMS5ZMG
 SL9um5RxXSPNJ9G4lVRUakJ134C80m7MDk7Q3MWbUzTU=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X platform comes with a multiport DWC3 controller with two
ports, each connected to a pair of HighSpeed and QMP SuperSpeed PHYs.

Describe these blocks.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 146 ++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 9ef3fa40e1d8..0950dc7adb20 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2511,6 +2511,34 @@ usb_sec_hsphy: phy@88e3000 {
 			status = "disabled";
 		};
 
+		usb_mp0_hsphy: phy@88e4000 {
+			compatible = "qcom,sc8180x-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e4000 0 0x400>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_MP0_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp1_hsphy: phy@88e5000 {
+			compatible = "qcom,sc8180x-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e5000 0 0x400>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_MP1_BCR>;
+
+			status = "disabled";
+		};
+
 		usb_prim_qmpphy: phy@88e9000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088e9000 0 0x18c>,
@@ -2577,6 +2605,54 @@ usb_prim_dpphy: dp-phy@88ea200 {
 			};
 		};
 
+		usb_mp0_qmpphy: phy@88eb000 {
+			compatible = "qcom,sc8180x-qmp-usb3-uni-phy";
+			reg = <0 0x088eb000 0 0x1000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+			clock-names = "aux", "ref", "com_aux", "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb2_phy0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_mp1_qmpphy: phy@88ec000 {
+			compatible = "qcom,sc8180x-qmp-usb3-uni-phy";
+			reg = <0 0x088ec000 0 0x1000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+			clock-names = "aux", "ref", "com_aux", "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb2_phy1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_sec_qmpphy: phy@88ee000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088ee000 0 0x18c>,
@@ -2662,6 +2738,76 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		usb_mp: usb@a4f8800 {
+			compatible = "qcom,sc8180x-dwc3-mp", "qcom,dwc3";
+			reg = <0 0x0a4f8800 0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			interconnects = <&aggre1_noc MASTER_USB3_2 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_2 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MP_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 59 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 46 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 71 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 68 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event_1", "pwr_event_2",
+					  "hs_phy_1",	 "hs_phy_2",
+					  "dp_hs_phy_1", "dm_hs_phy_1",
+					  "dp_hs_phy_2", "dm_hs_phy_2",
+					  "ss_phy_1",	 "ss_phy_2";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			resets = <&gcc GCC_USB30_MP_BCR>;
+
+			status = "disabled";
+
+			usb_mp_dwc3: usb@a400000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a400000 0 0xcd00>;
+				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x60 0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_mp0_hsphy>,
+				       <&usb_mp0_qmpphy>,
+				       <&usb_mp1_hsphy>,
+				       <&usb_mp1_qmpphy>;
+				phy-names = "usb2-0",
+					    "usb3-0",
+					    "usb2-1",
+					    "usb3-1";
+				dr_mode = "host";
+			};
+		};
+
 		usb_prim: usb@a6f8800 {
 			compatible = "qcom,sc8180x-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;

-- 
2.43.0


