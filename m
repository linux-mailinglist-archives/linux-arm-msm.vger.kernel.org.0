Return-Path: <linux-arm-msm+bounces-26748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D825938C4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20FB31F21DF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982B216DC18;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxt5l6uD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655816D9C3;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641426; cv=none; b=ExQaF5+6PWpm4IDIz/ZaaUNq+wYTLxQw69txyfpPTeRjtt5Tiy50+6ywg3mGhGrSMcXBtT91dkD8jfu/V4Kb9gMHHBX4hCVS9EKFvudKkfYkUcx/bVxbBjJctbNZBBZfZ6unSsI7cWG9shJInDQlZJQP8CRQaqfVkviX87R0JfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641426; c=relaxed/simple;
	bh=Ug8X4WMtUv8ZNb30dneLhKbZIh5vFqz+F1Skjyn9+x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xc8qeqbVyGEj7FMETMRz3z9Snm0NY5Bth2TPhi7bkHyTFzrf1vsmaFU90PrtuTpT60UEVTZhZ045JDDYJ4rbuI+FiIdy546fuXGpZNSzj3s14iPCENeXK1UGy5iwe9rnezbr0CrYNpmzSi+PBBX5ceKfY/JIHjJ31X6vGKAX68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxt5l6uD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7005C4AF63;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=Ug8X4WMtUv8ZNb30dneLhKbZIh5vFqz+F1Skjyn9+x8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mxt5l6uDNGDhkQMUy6JRo26HkvjYFf6RU/QewWckcrL88Pg/rLaJjjrRyKQuQlwD9
	 BpG4l0Uugk0IW8gnbKwq11lVQmios9IbYHBq0zhkvxOmIBou/jx5xFE9Nd6DM7PAi9
	 UI+52FisxqLoVHYR/PTb1Q2HsSp7XvMF7CIfhCuY4iLxdWgdaa5MTHaeU8KE6ELsYt
	 r7voD05A2GnpjsWNLAcLAJLrokbxNO9sJOblCeWVzM26dAMN94mF3KHFw0jZJp1+pF
	 W4ioJBpre4bGpVsY6834MgwfmIKUHhjRkrOL8KJ9HiLOji1heoOJ52oGyqiTRi/N6L
	 DVJ3wSiTrTJTQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uS-3fme;
	Mon, 22 Jul 2024 11:43:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 7/8] arm64: dts: qcom: x1e80100: add PCIe5 nodes
Date: Mon, 22 Jul 2024 11:42:48 +0200
Message-ID: <20240722094249.26471-8-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the fifth PCIe controller and its PHY.

Note that using the GIC ITS with PCIe5 does not work currently so the
ITS mapping is left unspecified for now.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 122 ++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 2c10532d4f60..2e2b50acfcca 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -760,7 +760,7 @@ gcc: clock-controller@100000 {
 				 <&sleep_clk>,
 				 <0>,
 				 <&pcie4_phy>,
-				 <0>,
+				 <&pcie5_phy>,
 				 <&pcie6a_phy>,
 				 <0>,
 				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
@@ -3015,6 +3015,126 @@ pcie6a_phy: phy@1bfc000 {
 			status = "disabled";
 		};
 
+		pcie5: pci@1c00000 {
+			device_type = "pci";
+			compatible = "qcom,pcie-x1e80100";
+			reg = <0 0x01c00000 0 0x3000>,
+			      <0 0x7e000000 0 0xf1d>,
+			      <0 0x7e000f40 0 0xa8>,
+			      <0 0x7e001000 0 0x1000>,
+			      <0 0x7e100000 0 0x100000>,
+			      <0 0x01c03000 0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x7e200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x7e300000 0x0 0x7e300000 0x0 0x1d00000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <5>;
+			num-lanes = <2>;
+
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 70 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 71 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 72 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 73 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
+				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_5_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_5_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_5_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
+				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "noc_aggr",
+				      "cnoc_sf_axi";
+
+			assigned-clocks = <&gcc GCC_PCIE_5_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_south_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &cnoc_main SLAVE_PCIE_5 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_5_BCR>,
+				 <&gcc GCC_PCIE_5_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc GCC_PCIE_5_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			phys = <&pcie5_phy>;
+			phy-names = "pciephy";
+
+			status = "disabled";
+		};
+
+		pcie5_phy: phy@1c06000 {
+			compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy";
+			reg = <0 0x01c06000 0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
+				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_5_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe";
+
+			resets = <&gcc GCC_PCIE_5_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			power-domains = <&gcc GCC_PCIE_5_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie5_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		pcie4: pci@1c08000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
-- 
2.44.2


