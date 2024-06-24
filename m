Return-Path: <linux-arm-msm+bounces-23829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC5F913F85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 02:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F7F1F219FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 00:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C925710E3;
	Mon, 24 Jun 2024 00:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAcGG52x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9563A7FD;
	Mon, 24 Jun 2024 00:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188518; cv=none; b=cEfHTethwP9QCtsQANF1SCHg/PttrxrEJvO26NiwTzUO5gCkA3ODggvzAzG4xtytayzY6QmEMDwkTOtp9Y3KVKYOFq45M64DAUtGndYSXM0aVxkaBvVlE4xv3qDIkEinB9TW89avsmPvnwU1Qb2dajrqo4NgJGiWLii2HPsIel4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188518; c=relaxed/simple;
	bh=uCPRT2E+EfB9PJdIfQTKp5PeAptuzL6IrbnRRcjc0HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6c6n+mfu4C4zK339auLJjvrXxxW9z0gOzpCwsjmN6MuYgKPJpcCzVAZRFBvsSFTELN0984QnYyDHlVuSsFsY3JFsqmrjMq07uCp7zWODRNY2QXqV/FFJ2uIYb1jwYdgRx5v0+WcfY55jnKsxzxWLwKPieGN+YsIEkJmr4c7sE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAcGG52x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552A4C2BD10;
	Mon, 24 Jun 2024 00:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719188518;
	bh=uCPRT2E+EfB9PJdIfQTKp5PeAptuzL6IrbnRRcjc0HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAcGG52x54XRwL4t/zWxcudJs6+YumbaK+yiTEudhk5sH+CCmGwLHY6uZbM9z4lpc
	 LnPPgX9bX6614niKIMC12ilREW+tdfsFjyWoL0qlzrFIfMnH8Ux8UwgACLne5j2GY0
	 4dVwXSBuU1G6IT/fgltSKj8UaoDnDGSchJHxT88pljX10tq7Gj4EJWXFwD1CLBbKQI
	 45oxccjwf/L345QrMLzcgw8qM/Ruji94LGUzn6HgxD7Q3v3Rm41RYVQisUauDsHNrL
	 BT3kCKBM3eUtsvVI17mV+HP+bns1RVCQ8uU7/pykDnqXGPiV20V3If/uY3yw/qBGHu
	 gJyRJkDYmNS9A==
Date: Sun, 23 Jun 2024 19:21:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, quic_kathirav@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: ipq9574: add PCIe2 and PCIe3
 nodes
Message-ID: <7j4ubdfrfcrmtnv4ljpzpxevlufkmkddbgfzgp44ky2cmpjmbv@uozhn5vgishd>
References: <20240501040800.1542805-1-mr.nuke.me@gmail.com>
 <20240501040800.1542805-18-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501040800.1542805-18-mr.nuke.me@gmail.com>

On Tue, Apr 30, 2024 at 11:07:59PM GMT, Alexandru Gagniuc wrote:
> On ipq9574, there are 4 PCIe controllers. Describe the pcie2 and pcie3
> nodes, and their PHYs in devicetree.
> 
> The pcie0 and pcie1 controllers use a gen3x1 PHY, which is not
> currently supported. Hence, only pcie2 and pcie3 are described. Only
> pcie2 was tested because my devboard only has conenctions to pcie2.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Seems the clock and phy got merged, but I don't see any feedback on the
PCI patches - and according to the msg-id there's 18 patches in the
series.

Please rebase on linux-next and submit v5, so we get clarity in what
remains to be merged.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 178 +++++++++++++++++++++++++-
>  1 file changed, 176 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 7f2e5cbf3bbb..c391886cf9ab 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -300,8 +300,8 @@ gcc: clock-controller@1800000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie2_phy>,
> +				 <&pcie3_phy>,
>  				 <0>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> @@ -745,6 +745,180 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		pcie2_phy: phy@8c000 {
> +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> +			reg = <0x0008c000 0x14f4>;
> +
> +			clocks = <&gcc GCC_PCIE2_AUX_CLK>,
> +				 <&gcc GCC_PCIE2_AHB_CLK>,
> +				 <&gcc GCC_PCIE2_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			clock-output-names = "pcie_phy2_pipe_clk";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			resets = <&gcc GCC_PCIE2_PHY_BCR>,
> +				 <&gcc GCC_PCIE2PHY_PHY_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +			status = "disabled";
> +		};
> +
> +		pcie3_phy: phy@f4000 {
> +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> +			reg = <0x000f4000 0x14f4>;
> +
> +			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
> +				 <&gcc GCC_PCIE3_AHB_CLK>,
> +				 <&gcc GCC_PCIE3_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			clock-output-names = "pcie_phy3_pipe_clk";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			resets = <&gcc GCC_PCIE3_PHY_BCR>,
> +				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +			status = "disabled";
> +		};
> +
> +		/* TODO: Populate pcie0/pcie1 when gen3x1 phy support is added. */
> +
> +		pcie2: pcie@20000000 {
> +			compatible = "qcom,pcie-ipq9574";
> +			reg = <0x20000000 0xf1d>,
> +			      <0x20000f20 0xa8>,
> +			      <0x20001000 0x1000>,
> +			      <0x00088000 0x4000>,
> +			      <0x20100000 0x1000>;
> +			reg-names = "dbi", "elbi", "atu", "parf", "config";
> +
> +			ranges = <0x81000000 0x0 0x20200000 0x20200000 0x0 0x00100000>,
> +				 <0x82000000 0x0 0x20300000 0x20300000 0x0 0x07d00000>;
> +
> +			device_type = "pci";
> +			linux,pci-domain = <3>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <2>;
> +			max-link-speed = <3>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			phys = <&pcie2_phy>;
> +			phy-names = "pciephy";
> +
> +			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 164 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 165 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 186 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 187 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE2_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE2_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_ANOC_PCIE2_2LANE_M_CLK>,
> +				 <&gcc GCC_SNOC_PCIE2_2LANE_S_CLK>,
> +				 <&gcc GCC_PCIE2_RCHNG_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng";
> +
> +			resets = <&gcc GCC_PCIE2_PIPE_ARES>,
> +				 <&gcc GCC_PCIE2_AUX_ARES>,
> +				 <&gcc GCC_PCIE2_CORE_STICKY_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_S_STICKY_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_M_STICKY_ARES>,
> +				 <&gcc GCC_PCIE2_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "aux",
> +				      "sticky",
> +				      "axi_m",
> +				      "axi_s",
> +				      "axi_s_sticky",
> +				      "axi_m_sticky",
> +				      "ahb";
> +			status = "disabled";
> +		};
> +
> +		pcie3: pcie@18000000 {
> +			compatible = "qcom,pcie-ipq9574";
> +			reg = <0x18000000 0xf1d>,
> +			      <0x18000f20 0xa8>,
> +			      <0x18001000 0x1000>,
> +			      <0x000f0000 0x4000>,
> +			      <0x18100000 0x1000>;
> +			reg-names = "dbi", "elbi", "atu", "parf", "config";
> +
> +			ranges = <0x81000000 0x0 0x18200000 0x18200000 0x0 0x00100000>,
> +				 <0x82000000 0x0 0x18300000 0x18300000 0x0 0x07d00000>;
> +
> +			device_type = "pci";
> +			linux,pci-domain = <4>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <2>;
> +			max-link-speed = <3>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			phys = <&pcie3_phy>;
> +			phy-names = "pciephy";
> +
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 189 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 190 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE3_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE3_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_ANOC_PCIE3_2LANE_M_CLK>,
> +				 <&gcc GCC_SNOC_PCIE3_2LANE_S_CLK>,
> +				 <&gcc GCC_PCIE3_RCHNG_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "anoc",
> +				      "snoc",
> +				      "rchng";
> +
> +			resets = <&gcc GCC_PCIE3_PIPE_ARES>,
> +				 <&gcc GCC_PCIE3_AUX_ARES>,
> +				 <&gcc GCC_PCIE3_CORE_STICKY_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_S_STICKY_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_M_STICKY_ARES>,
> +				 <&gcc GCC_PCIE3_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "aux",
> +				      "sticky",
> +				      "axi_m",
> +				      "axi_s",
> +				      "axi_s_sticky",
> +				      "axi_m_sticky",
> +				      "ahb";
> +			status = "disabled";
> +		};
>  	};
>  
>  	thermal-zones {
> -- 
> 2.40.1
> 

