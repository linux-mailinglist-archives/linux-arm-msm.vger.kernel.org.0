Return-Path: <linux-arm-msm+bounces-79528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2BC1C70C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 390F434B54A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0983358CD;
	Wed, 29 Oct 2025 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV+H1s5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E422DAFC4;
	Wed, 29 Oct 2025 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761758991; cv=none; b=XLrRi9A4V3V0SROvCi53KExD9GTawBPieEO7l3s9fcBGF6ezo+Or3EjrxRCX43upR2KM0W7gYN8UAYfi8BjLIoalhoStgOefzwoSlEmkK4qKlPlepsfvIcqDMcMavh8afEohFA2tpl6Xv1faNTlU+i6mKt16lsKpm+N5yqoPSDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761758991; c=relaxed/simple;
	bh=6c2lRH79gPUfqUGUAT2Ahh0VCQFp9aMLWeaNEpTU2VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuQJUDHlUmpQDntwG0lJlNPOuoLW4OgII9J63SFzCEygYikh/THFQM4u2DsKTdC2NuxqLTrsGOwIDEzCXFu/aidc9xd20TNocfwdsijPNDHwM70e1fcg0+rE2//n+LW+nhX4GmYBomFcOy9FvQC5GU7emqurNqGXrhWYg3E4iJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IV+H1s5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9493C4CEF7;
	Wed, 29 Oct 2025 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758990;
	bh=6c2lRH79gPUfqUGUAT2Ahh0VCQFp9aMLWeaNEpTU2VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV+H1s5cA6+q0eMfmwxGdQll40rtEMuen9ODGoXJ0OyV1c7HlROjIDiHl6KG9b0cM
	 FSyPQD1mtMazchRKzcZKMw1h7JchjzQPcBc7nocjWzUmL4vSgLFvItd+Jaz0E+42LF
	 KmMKufHWsKhpeg1WlsfRIDF1IV0kh6aYcAOtiplt/PoA72VVW5roiYDDYtAXFP1jyG
	 +PtQEywQFP5nH85YlDKYPBQe1x5HqqGu4UVQgdYiTiGfGwEJDPXOkfYH+KNLBq5LiH
	 72EH3Yb1CURWbl9kIaes24S5Lqils3FF9J3gk0zDo74JmDpxq2QUXMv/H9L8AWBL1U
	 68B80NxBEviJA==
Date: Wed, 29 Oct 2025 12:32:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
Message-ID: <xjes5h45y44cahs7avj4xngprwnks3alnf25tsbptyvckajz3q@lhawlg5vamls>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-3-c4316975dd0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-3-c4316975dd0e@oss.qualcomm.com>

On Fri, Oct 24, 2025 at 01:21:03PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 

Please fix the subject prefix and drop the "for SM6150" suffix.

Regards,
Bjorn

> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> clock assignments for proper DP integration.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 115 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 113 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..9741f8d14c72ed7dd6a5e483c5c0d578662f1d31 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -14,6 +14,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> @@ -3717,6 +3718,7 @@ port@0 {
>  						reg = <0>;
>  
>  						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
>  
> @@ -3749,6 +3751,89 @@ opp-307200000 {
>  				};
>  			};
>  
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp";
> +
> +				reg = <0x0 0x0ae90000 0x0 0x200>,
> +				      <0x0 0x0ae90200 0x0 0x200>,
> +				      <0x0 0x0ae90400 0x0 0x600>,
> +				      <0x0 0x0ae90a00 0x0 0x600>,
> +				      <0x0 0x0ae91000 0x0 0x600>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel",
> +					      "stream_1_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>,
> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_qmpphy_2 QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_CX>;
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
> +						mdss_dp0_out: endpoint {
> +							data-lanes = <3 2 0 1>;
> +						};
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
> +				};
> +			};
> +
>  			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0x0 0x0ae94000 0x0 0x400>;
> @@ -3844,8 +3929,8 @@ dispcc: clock-controller@af00000 {
>  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
>  				 <0>,
> -				 <0>,
> -				 <0>;
> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> @@ -4214,6 +4299,32 @@ usb_qmpphy: phy@88e6000 {
>  			status = "disabled";
>  		};
>  
> +		usb_qmpphy_2: phy@88e8000 {
> +			compatible = "qcom,qcs615-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
> +				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> +				 <&gcc GCC_AHB2PHY_WEST_CLK>,
> +				 <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
> +				 <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
> +			reset-names = "phy_phy",
> +				      "dp_phy";
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
> +
> +			status = "disabled";
> +		};
> +
>  		usb_1: usb@a6f8800 {
>  			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
>  			reg = <0x0 0x0a6f8800 0x0 0x400>;
> 
> -- 
> 2.34.1
> 
> 

