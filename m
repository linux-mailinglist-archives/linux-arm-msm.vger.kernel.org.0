Return-Path: <linux-arm-msm+bounces-68399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846CB20D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 17:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0012D161452
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 15:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052922DECB9;
	Mon, 11 Aug 2025 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q02aehD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED572C17B6;
	Mon, 11 Aug 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925075; cv=none; b=CG9ffVXz+otla2Eer4216Mh7S4AYBB7YjCybkznsiaLve48wfpP0hBG7iO+BvndeuUqF+lyleeF90NAIrhphI4gPD6NMAc6Mqt/29wNfvadueGBh3MlMrzXTBjH4imk/3T6Qnvh7dy2GGyLGcbicEYWo4QCIGjIDURDilg6DB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925075; c=relaxed/simple;
	bh=7HZKE3O+WT6DDNM9/2drqU5rxj0lRkDaLvloQLzT5lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hR1eRenMhnnuLDWfl0ETAqQm6ENMQq/h8LhVUH/cuZ063HeVrIednz7NK6LUJkdZXKSy0pPWUJsAH9jSeB5wE3S0vbhGVKC9zi225pZXLd3bxQcTkO2A3TyCq4gBAGj4gTdfVmD0V0/OfOQJJcoBrhb76a8m7yZQqTdCoOz4rz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q02aehD2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93F6C4CEED;
	Mon, 11 Aug 2025 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925075;
	bh=7HZKE3O+WT6DDNM9/2drqU5rxj0lRkDaLvloQLzT5lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q02aehD2d6ncjMmY+jObE7v0Lyo+L5H3Xxy/XR80vOfJESLoOxs+i536u3aStBoX8
	 s8RTsDXRej/j4IxSVli8GBBOnZZ2Gq+hmeysLS15mrGtoKiO5H2vt28mYxV3nYdDaJ
	 48bIwUDFDO4E+3DVh73HPqg9i0mmZX8v/UqCEN8lJhPAFkA+zNWg8yh+WZpsrELdxq
	 aDn+8+zeaApIbAd94JXx0BWSnup4NdVIbCXd3kpBxIDXHXL4CbWyiA+xSf1/sVP2D4
	 atvuxZgKLZij9aVIUKwpEF4BY7aJuiMhtYy9Y0tpBz6sD4cSCFql6v4ltj6s7uglaF
	 HtmFfldHq9bIQ==
Date: Mon, 11 Aug 2025 10:11:12 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent
 data paths
Message-ID: <y6b5yqjbaz3sya5jg5fmcgivprtybj43eylpftd6z3mamrb737@kua5xzfonnpt>
References: <20250808-topic-7180_qmpphy_ports-v1-1-718d7c52921a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-topic-7180_qmpphy_ports-v1-1-718d7c52921a@oss.qualcomm.com>

On Fri, Aug 08, 2025 at 11:20:45AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Define ports {} for the DWC controller & the QMPPHY and connect them
> together for the SS lanes.

Sounds quite reasonable to me, but I can only guess why you think it's a
good idea. Please start with a paragraph documenting which problem
you're solving.

Regards,
Bjorn

> 
> Leave the DP endpoint unconnected for now, as both Aspire 1 and the
> Chromebooks (unmerged, see [1]) seem to have a non-trivial topology.
> Take the creative liberty to add a newline before its ports' subnodes
> though.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20240210070934.2549994-23-swboyd@chromium.org/
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/175462129176.394940.16810637795278334342.robh@kernel.org/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 48 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8f827f1d8515d6113c85a2ecacf7ac364e195242..a0df10a97c7f8aa5cd468c8983e74256490d1d06 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2897,6 +2897,31 @@ usb_1_qmpphy: phy@88e8000 {
>  
>  			#clock-cells = <1>;
>  			#phy-cells = <1>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_qmpphy_out: endpoint { };
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_1_qmpphy_dp_in: endpoint { };
> +				};
> +			};
>  		};
>  
>  		pmu@90b6300 {
> @@ -3070,6 +3095,26 @@ usb_1_dwc3: usb@a600000 {
>  				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  				maximum-speed = "super-speed";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						usb_1_dwc3_hs: endpoint {
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						usb_1_dwc3_ss: endpoint {
> +							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
> +						};
> +					};
> +				};
>  			};
>  		};
>  
> @@ -3384,8 +3429,10 @@ mdss_dp: displayport-controller@ae90000 {
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> +
>  					port@0 {
>  						reg = <0>;
> +
>  						dp_in: endpoint {
>  							remote-endpoint = <&dpu_intf0_out>;
>  						};
> @@ -3393,6 +3440,7 @@ dp_in: endpoint {
>  
>  					port@1 {
>  						reg = <1>;
> +
>  						mdss_dp_out: endpoint { };
>  					};
>  				};
> 
> ---
> base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
> change-id: 20250808-topic-7180_qmpphy_ports-e63404331685
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

