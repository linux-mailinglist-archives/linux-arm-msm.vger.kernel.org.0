Return-Path: <linux-arm-msm+bounces-44483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3EA0693F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 00:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B551889217
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EB12046B6;
	Wed,  8 Jan 2025 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfIOAwu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717620408C;
	Wed,  8 Jan 2025 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377606; cv=none; b=iRFTrv0Td6NT5+TK4Izzy6iBZ6iuf19yDKzq7suhZ+3fffaH8MI/tIzciyUWUXvOhN8j7FNmkpLBrEXMXLXgYN9fWoSyuiuR99dSiz3ogjtfBVMEx9zf8U6QKNIJFtlAfHj4u1x6zo8SsrwkEvPCzov2AiKn2EwwAzww1JRQ5qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377606; c=relaxed/simple;
	bh=J+U+yhlYBX1Ru6IKBhFSVtiWh/39ZLzNukqrakBvyV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbryIOUhtO0ibjw6Q7+tVWu9C52UjM1rQM7QtEdjWpT6mv9ZHgcNWX96LfiDjDH5PHptiUUgRnGXonZDlNBeieyIrZeWU8Qajr4EgYpFVNYpVRgjuER7/zQw4EVYqDjMWR4aw8VycfOTYJnMnQq5xkbQjssZ7F95ReEvz6Yymmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfIOAwu5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3B9C4CED3;
	Wed,  8 Jan 2025 23:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736377606;
	bh=J+U+yhlYBX1Ru6IKBhFSVtiWh/39ZLzNukqrakBvyV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfIOAwu5x/SiplQFto5kc7hrNamCRgMGsBMYi/DsZ8fdumVpSNVyvphcCWgdmw8OC
	 buQIuXyKQX7ZZtYHXsmbUbkplm7nKdUhpZqSEfPb5axnMvYQvkiMXYWbnqAibMkzxJ
	 1WcgfdAoUNSBqZDnN+v81NiVDuIPDXsLw35JKFqfEK2cr+HiefanZgLSvbSV88F0ei
	 8FdLmNfEx5ZLOu7DdFYCman9epXASYLMZ732og/z3OO8VYKPoqG8m76+9Ue5Wxe4ym
	 Pb4szbfFqdvfXA4Ew+oA9WODZqbsFA+xPhVzEtBG/x0t8EBB6xyaQrW4R9dVURpUmN
	 Ln61dauaKzroQ==
Date: Wed, 8 Jan 2025 17:06:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ritesh Kumar <quic_riteshk@quicinc.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: add DisplayPort device
 nodes
Message-ID: <3kiih4tfuvr3lgczqnkrropmzs64na7nx37zo7bp3336cz5zje@22nwstjqwrvu>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>

On Wed, Nov 27, 2024 at 06:45:13PM +0800, Yongxing Mou wrote:
> Add device tree nodes for the DPTX0 controller with their
> corresponding PHYs found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>

Please rebase, test and resubmit this together, in the same series, with
the mdss patch.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 115 +++++++++++++++++++++++++++++++++-
>  1 file changed, 114 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 1642e2863affd5af0b4f68118a47b7a74b76df95..28deba0a389641b4dddbf4505d6f44c6607aa03b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -987,6 +987,19 @@ mdss_mdp: display-controller@ae01000 {
>  				interrupt-parent = <&mdss>;
>  				interrupts = <0>;
>  
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
> +				};
> +
>  				mdp_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> @@ -1011,6 +1024,104 @@ opp-650000000 {
>  					};
>  				};
>  			};
> +
> +			mdss_dp0_phy: phy@aec2a00 {
> +				compatible = "qcom,qcs8300-edp-phy";
> +
> +				reg = <0x0 0x0aec2a00 0x0 0x200>,
> +				      <0x0 0x0aec2200 0x0 0xd0>,
> +				      <0x0 0x0aec2600 0x0 0xd0>,
> +				      <0x0 0x0aec2000 0x0 0x1c8>;
> +
> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
> +				clock-names = "aux",
> +					      "cfg_ahb";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				status = "disabled";
> +			};
> +
> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,qcs8300-dp";
> +
> +				reg = <0x0 0x0af54000 0x0 0x104>,
> +				      <0x0 0x0af54200 0x0 0x0c0>,
> +				      <0x0 0x0af55000 0x0 0x770>,
> +				      <0x0 0x0af56000 0x0 0x09c>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dp0_phy 0>,
> +							 <&mdss_dp0_phy 1>;
> +				phys = <&mdss_dp0_phy>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp0_out: endpoint { };
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>  		};
>  
>  		dispcc: clock-controller@af00000 {
> @@ -1020,7 +1131,9 @@ dispcc: clock-controller@af00000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> -				 <0>, <0>, <0>, <0>,
> +				 <&mdss_dp0_phy 0>,
> +				 <&mdss_dp0_phy 1>,
> +				 <0>, <0>,
>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd RPMHPD_MMCX>;
>  			#clock-cells = <1>;
> 
> -- 
> 2.34.1
> 

