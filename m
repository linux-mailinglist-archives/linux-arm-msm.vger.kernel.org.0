Return-Path: <linux-arm-msm+bounces-31888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9236F97AC10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 09:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5BA01C203C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 07:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95815130AC8;
	Tue, 17 Sep 2024 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTKVgwuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCC7DA91;
	Tue, 17 Sep 2024 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726558199; cv=none; b=BnE6GBNkyAdocEfzMyyobw12l2XYI4wNbWrpOzKdxzHHotzBUsU/68aG3kHCmZBBG52YoBVRqSGYZvukdErF8kONq5j4sx9QtZqZiATSaF7UdpqbTrr9KYYMVkb35mkeajsef3wLhuZHCgNE4uYO6TKFSWAEGf7nY95FBMWDzwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726558199; c=relaxed/simple;
	bh=Z5NUsYcUClm/uE1LHjZj4eyucRsVWIllVFrJCeNFoRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQFBkcovAMRmxR+3whjOlVOcnsIoGtHyYhl+KY4K4B1A+wAy9mfZooWtJd61XkUDRoDXYuCKOTR5vst7j7t/nYfFtLE0D4ymWvj+F/+qo6ZNk1CAVJvk0QEbgs2AxDceqZINg+/sPljGq5+nmZZ5H1b2cWQqwdqnMHeMkGielIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTKVgwuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B398C4CEC6;
	Tue, 17 Sep 2024 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726558198;
	bh=Z5NUsYcUClm/uE1LHjZj4eyucRsVWIllVFrJCeNFoRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTKVgwuFxN4Xn9f+gqdGxPsksxaOc5UH3HhFDWdnCFE0IGvFjhdxXP/tjUTGFgmRH
	 5lPa8SSZm6T3SGbWs4a/IgVSHAOaSolpvzunVSBCEJmtttyNtSZc/JyykQIpi9yVmX
	 frHA12yeXUJCYgYa8/j8Ut64W3d8TiyG+Fh7fqflWXnFwT8uX/XN5gfqXgsSeiSLTG
	 tha3LsiZ45Sg1WIcsZc0prD52955Szu0SQUltJ66Qy015YVW5Gr0/Fi8nZM+pBl6vg
	 JrEOzni0J8z/Hx4iKSsRTDoGLCR8pIhCy4AXn79KZubPS34LnlmDmhI9wARW/FnWBG
	 5NwcOVv2WZeVw==
Date: Tue, 17 Sep 2024 09:29:46 +0200
From: Bjorn Andersson <andersson@kernel.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com, quic_vproddut@quicinc.com, 
	quic_abhinavk@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: add DisplayPort device node
Message-ID: <cofwijgk2dgg5i5xhvhq3exug4o77mttmozw5amtc3myn4zzq5@m5x44hswwsmt>
References: <20240916091344.27607-1-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916091344.27607-1-quic_mukhopad@quicinc.com>

On Mon, Sep 16, 2024 at 02:43:44PM GMT, Soutrik Mukhopadhyay wrote:
> Add device tree node for the DisplayPort controller
> and eDP PHY found on the Qualcomm SA8775P SoC.
> 

Please split this in a change for the platform (.dtsi) which defines
_all_ the DPTX and DP PHYs, and then a ride dts change which enables all
the ports available on the Ride.

If there are platform ports that are not accessible on any hardware,
state in the commit message which ones you tested and which ones you
didn't test.

> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> This patch depends on following series:
> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> https://lore.kernel.org/all/20240912071437.1708969-1-quic_mahap@quicinc.com/
> https://lore.kernel.org/all/20240913103755.7290-1-quic_mukhopad@quicinc.com/

Please hold off resubmitting this series until there's conclusion on
these dependencies.

>  
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  23 +++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 114 ++++++++++++++++++++-
>  2 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 0c1b21def4b6..728b4cda8353 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -421,6 +421,23 @@
>  	status = "okay";
>  };
>  
> +&mdss0 {
> +	status = "okay";
> +};
> +
> +&mdss0_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss0_dp0_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss0_edp_phy0 {
> +	status = "okay";
> +};
> +
>  &pmm8654au_0_gpios {
>  	gpio-line-names = "DS_EN",
>  			  "POFF_COMPLETE",
> @@ -527,6 +544,12 @@
>  };
>  
>  &tlmm {
> +	dp_hot_plug_det: dp-hot-plug-det-state {
> +		pins = "gpio101";
> +		function = "edp0_hot";
> +		bias-disable;
> +	};
> +
>  	ethernet0_default: ethernet0-default-state {
>  		ethernet0_mdc: ethernet0-mdc-pins {
>  			pins = "gpio8";
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 7747965e7e46..a04150c29565 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3339,6 +3339,18 @@
>  				interrupt-parent = <&mdss0>;
>  				interrupts = <0>;
>  
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss0_dp0_in>;
> +						};
> +					};
> +				};
> +
>  				mdss0_mdp_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> @@ -3363,6 +3375,106 @@
>  					};
>  				};
>  			};
> +
> +			mdss0_edp_phy0: phy@aec2a00 {
> +				compatible = "qcom,sa8775p-edp-phy";

Is this really a eDP PHY, not a DP/eDP combo phy?

I would prefer that we keep the label prefix "mdssM_dpN" on the DP TX
and DP PHY nodes, to keep them neatly sorted in the dts. (If you name
half mdssM_edp_phyN and half mdssM_dp_phyN we're going to have a mess)

> +
> +				reg = <0x0 0xaec2a00 0x0 0x200>,
> +					<0x0 0xaec2200 0x0 0xd0>,
> +					<0x0 0xaec2600 0x0 0xd0>,
> +					<0x0 0xaec2000 0x0 0x1c8>;
> +
> +				clocks = <&rpmhcc RPMH_CXO_CLK>,
> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
> +				clock-names = "aux",
> +					      "cfg_ahb";
> +
> +				vdda-phy-supply = <&vreg_l1c>;
> +				vdda-pll-supply = <&vreg_l4a>;
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				status = "disabled";
> +			};
> +
> +			mdss0_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				pinctrl-0 = <&dp_hot_plug_det>;

Don't make references from .dtsi to labels defined in .dts.

Regards,
Bjorn

> +				pinctrl-names = "default";
> +
> +				reg = <0x0 0xaf54000 0x0 0x104>,
> +					<0x0 0xaf54200 0x0 0x0c0>,
> +					<0x0 0xaf55000 0x0 0x770>,
> +					<0x0 0xaf56000 0x0 0x09c>;
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface",
> +						"core_aux",
> +						"ctrl_link",
> +						"ctrl_link_iface",
> +						"stream_pixel";
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_edp_phy0 0>, <&mdss0_edp_phy0 1>;
> +				phys = <&mdss0_edp_phy0>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
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
> +						mdss0_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss0_dp0_out: endpoint { };
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
>  		dispcc0: clock-controller@af00000 {
> @@ -3372,7 +3484,7 @@
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> -				 <0>, <0>, <0>, <0>,
> +				 <&mdss0_edp_phy0 0>, <&mdss0_edp_phy0 1>, <0>, <0>,
>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>  			#clock-cells = <1>;
> -- 
> 2.17.1
> 

