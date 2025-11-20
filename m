Return-Path: <linux-arm-msm+bounces-82692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D7C748AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 03A6931640
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 14:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889A13491C7;
	Thu, 20 Nov 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khCfVV5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C519337BBA;
	Thu, 20 Nov 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648502; cv=none; b=Ftfv4UYbZql/IkivOxSoZN/iiOViYMIWQkGqxPD3FXM6qOZ7xrpFa70IJjZ8MyhPXgjJTj9g0+I/Tb/8Nk4sxEa5XFeQ5onkGg+rbBFYMMksbjZsqUOm5DofPcl0n0vloo6gBk5aQbvs6OdOsqy+JwH9j71cYdLndOOXgJ6mrrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648502; c=relaxed/simple;
	bh=y1OIh1u2LeSJHLZBleRaaxbUdu7kp1SIHpl+J+34nD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi0aSLLnPx/eCJ00IQWit4sSHRHL5ROnTh5j7kT6R5G8jvMPyr2L3uzBr/pT5BiENSwMzZ3VwdXBN3wLDJo1qlYbqfhyMftG1rjTCZ6KfyjY0LbZYQWEwWiQs0gWpstPZzb0dGtiWMoc0dnCyE9O+yRvJgAtBrip6+xcJfGdT64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khCfVV5r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DAFC4CEF1;
	Thu, 20 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763648501;
	bh=y1OIh1u2LeSJHLZBleRaaxbUdu7kp1SIHpl+J+34nD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khCfVV5rwzJh+rVbz+ZPLlJkifByrqQr0+OX7hMDORss15f2lsCt7kBx9aGV/AvrN
	 pFOphxT6Mohk0sdM1ReR1/4x7/BtG+8PWetMCoXfcX/E2odBNIqBb9cIC6OJGNpu6I
	 sObvzb+3mZ86uUAwWLJ/1ENxkt9P0n/L+esuMSPhhrF7cCo3Q5UZUk4XVQNO0JlERL
	 6AYF+K5xah60qtUHSdLZ0JD37JqPpc1GSodieC9t7MwYbI/sRQU0dbJIizZd6XnHnv
	 /b9w75Nu6DdE89zoNhQn8OotEeMrZxYcGInl4DiZpj+MAPJwmjzZWRG+c51Ylun7ie
	 8tlut2sfsuznw==
Date: Thu, 20 Nov 2025 08:26:40 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishnu Saini <vishsain@qti.qualcomm.com>, prahlad.valluru@oss.qualcomm.com, 
	Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <cjz47arpfbangtrzx6kw4ommph3zhn6xnroz34oqskafvmpnmi@xduotm2houzg>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>

On Thu, Nov 20, 2025 at 04:28:05PM +0530, Vishnu Saini wrote:
> Monaco-evk has LT8713sx which act as DP to 3 DP output
> converter. Edp PHY from monaco soc is connected to lt8713sx
> as input and output of lt8713sx is connected to 3 mini DP ports.
> Two of these ports are available in mainboard and one port
> is available on Mezz board. lt8713sx is connected to soc over
> i2c0 and with reset gpio connected to pin6 or ioexpander5.
> 

This is good, you're describing the role of LT8713sx and how it's
connected on the board. Thank you for taking the time to do so!

I think one aspect that's worth pointing out on its own is the
placement of the mini DP ports. You do capture it, but the fact that
we have two on the EVK and one on the expansion board is "hidden" there
in the middle of the paragraph.
I think extracting this part of the message into its own paragraph would
improve the commit message further.

> Enable the edp nodes from monaco and enable lontium lt8713sx
> bridge node.
> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index bb35893da73d..947807f8a9cb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -317,6 +317,20 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcs8300/a623_zap.mbn";
>  };
>  

Would it be possible to add dp-connector nodes and wire them up to the
&lt8713sx, like I did in sa8295-adp.dts?

> +&i2c0 {
> +	pinctrl-0 = <&qup_i2c0_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	lt8713sx: lt8713sx@4f {

This should be bridge@4f.

Also, unless we need to reference this from a overlay there's no need to
give it a label.

> +		/*Display bridge chip, DP1.4/HDMI2.0/DP++ hub*/

This comment explains what "lontium,lt8713sx" is. The binding call tell
me that, so the value of this comment would be for you to tell us what
it is used for on this particular board - and if that's obvious you can
omit the comment.

> +		compatible = "lontium,lt8713sx";
> +		reg = <0x4f>;
> +		reset-gpios = <&expander5 6 GPIO_ACTIVE_HIGH>;

In addition to using an of_graph to describe the connectors that this is
wired to, it would be nice to have a port describing the relationship to
the DP controller here as well - so we know where the signal is coming
from.

Would that be possible to add?

Regards,
Bjorn

> +	};
> +};
> +
>  &i2c1 {
>  	pinctrl-0 = <&qup_i2c1_default>;
>  	pinctrl-names = "default";
> @@ -396,6 +410,23 @@ expander6: gpio@3e {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp0_phy {
> +	status = "okay";
> +};
> +
>  &iris {
>  	status = "okay";
>  };
> @@ -435,6 +466,12 @@ &serdes0 {
>  };
>  
>  &tlmm {
> +	dp_hot_plug_det: dp-hot-plug-det-state {
> +		pins = "gpio94";
> +		function = "edp0_hot";
> +		bias-disable;
> +	};
> +
>  	ethernet0_default: ethernet0-default-state {
>  		ethernet0_mdc: ethernet0-mdc-pins {
>  			pins = "gpio5";
> @@ -451,6 +488,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> +	qup_i2c0_default: qup-i2c0-state {
> +		pins = "gpio17", "gpio18";
> +		function = "qup0_se0";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
>  	qup_i2c1_default: qup-i2c1-state {
>  		pins = "gpio19", "gpio20";
>  		function = "qup0_se1";
> 
> -- 
> 2.34.1
> 

