Return-Path: <linux-arm-msm+bounces-26628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD193783E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 091AB1C21AF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541C2140E29;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoXiZRCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B713C681;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395049; cv=none; b=T79gNkyl7LOO+2lPA7X6lI9BNlocp4iiwdij5vpUcGYPzIzBGpvF30UBWOkok7vukZ1sdPiKE2kYJ29yA+OWXOBX2mM2ElVMOC2aRI+VUO8fPdU2puEszlwW/WkRCF3OENUiijv5DP2+kq4IqmD2Of9skFXVQ8FbYOpO0zrqb8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395049; c=relaxed/simple;
	bh=TrDClakR9x7IBNsa1UNQebotcE2wpGouhqU8Jgr42yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6bT0FY2aA84NpPquHT8yd63EM5ZxoriYHXsH3gMSxQmoMvVwJtvl8h9qndqdOj1fv/Sg9Nv6LYB1NEsvg+X2YuIZZgti8f1dQ6ry4g4XE6Hv9EDghktN9vGith8T1bcoBh9yYvHJezfgICrkQz/rQNVXSsUdsO04vjDvFdXBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoXiZRCz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C450AC4AF0B;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395048;
	bh=TrDClakR9x7IBNsa1UNQebotcE2wpGouhqU8Jgr42yo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WoXiZRCznFJTCOIzwaYcwQ+t84UarJ3DO1r6iHpyTwjDd+aVgYYiFEtWMDkPMlsCJ
	 L/GmxpplF1MduaUaLunYOQ2fcp4CTxUx6VjnE9VV/gYCN/71iPn9RGySgrGaXpHfV2
	 DzCvqqPGr9C+9q5ZTEFE45/R7ZIAkYfbwBcfMWt5GavrE5G0Roy/ame03tg2pGWGsW
	 Y4XWtRvS6jTMbpjUhxg2PvhzpEykg9v4LsgA3rKee31QzlQoUz8y3vOq3nHXXDPIC4
	 LmKl8n81gcIlBIOc8PRqTZy8vBrZ+v9p3DiP7oCzrcg9ZyJr0TL92OxqZnzFidHH/v
	 9CbhAAoDToCuw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUnUO-000000002BM-3UJA;
	Fri, 19 Jul 2024 15:17:36 +0200
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
Subject: [PATCH 6/7] arm64: dts: qcom: x1e80100: add PCIe5 nodes
Date: Fri, 19 Jul 2024 15:17:21 +0200
Message-ID: <20240719131722.8343-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719131722.8343-1-johan+linaro@kernel.org>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
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

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 121 ++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 07e00f1d1768..e8acb1180857 100644
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
@@ -3014,6 +3014,125 @@ pcie6a_phy: phy@1bfc000 {
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


