Return-Path: <linux-arm-msm+bounces-19281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C893F8BD813
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 01:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04A51C21C47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 23:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8535215B126;
	Mon,  6 May 2024 23:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpWpx22D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC657C9A;
	Mon,  6 May 2024 23:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715037253; cv=none; b=YOcQjFj5XVLuo06gI10u88MKO01p6roN+xz0gE7pH8UnxcxXd8A6Z1pxR1umUVPGea7C+/RbQuTQMI0V211byWxqOkTKBBf00399B1XdRBOAXzjEtg2IVrbpVjcblnu/0hcJQtdjlZDg/8BC/DLJGKdOj2d8pyO89RIlqtiM0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715037253; c=relaxed/simple;
	bh=f+j7Sjoa7UvfSMX3qJFnPrlMFyhS/ZlGcojl7lrvd3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P86/SboLpSko6bcKm0HRgy+vFU7Wt0nUX4AWJKIBN1+krCuuvtkZtuzkfvd4fJtu6VP01lSNY++lsEMmPxLwwoH6vQvugvyULGO598rJslrg/JVRP4mmE1fx9kCQz+yXXaJ1EbgFfNsdHaqX5cULE5aXrJHjELFg1N/EI3Rtdn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpWpx22D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029BBC116B1;
	Mon,  6 May 2024 23:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715037252;
	bh=f+j7Sjoa7UvfSMX3qJFnPrlMFyhS/ZlGcojl7lrvd3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpWpx22DGV9SMd+D2G13Ifee1XYZ9/zU2nb0lQrFv96f9NyvyjWs1ebXq37x+f64f
	 FCYmBb9EVuCnBsVJiAo/c6/lLLECz0xqGtY+GrRD862Zfjm9At1m8ydgfs65aMxhpm
	 GTWn0hnT9VeOoAgoId9PuVZg7nLH3IegnuwJgSnnVgUGJyezd1H+ORuvBZNQKvbNws
	 YQZJJAQlJ7zucfGUlfRyxsW9IeNeeexlSANe5bKzJw44fHppgTn1AB4yied/P+Bnse
	 dCf3FRC4xhdU4zHEwXVG2l1wOlXdV1qEYU7e6Bv+OrtFEiCvcoh20yad3LF69A9S8R
	 MsM/tvQyjFP2w==
Date: Mon, 6 May 2024 18:14:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Prahlad Valluru <quic_vvalluru@quicinc.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, quic_nankam@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
References: <171405653305.2527744.3813895380659072690.robh@kernel.org>
 <20240426142442.7769-1-quic_vvalluru@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426142442.7769-1-quic_vvalluru@quicinc.com>

On Fri, Apr 26, 2024 at 07:54:42PM GMT, Prahlad Valluru wrote:
> From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> 

Please don't thread new versions off existing version. b4 helps you with
getting these things right, please check go/upstream for more details.

> Enable lt9611uxc bridge for qcs6490 rb3 gen2 platform.
> 

Even if it's clear what this is, I would prefer if you described the
hardware a little bit in your commit message.
"Rb3Gen2 has a HDMI connector, connected to DSI via a LT on i2cX.... reset and
irq pins comes from x and y. Describe this."

> Signed-off-by: Prahlad Valluru <quic_vvalluru@quicinc.com>
> ---
> v2: Addressed dtschema errors
> 	- Fixed lt9611-irq
> 	- vdd-supply error to be ignored, as it is connected to
> 	  input supply directly, on rb3gen2
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 86 ++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index a085ff5b5fb2..c14d4a4bb3ce 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -51,6 +51,18 @@
>  			};
>  		};
>  	};
> +	

There's a stray tab here, please run checkpatch --strict on your
patches.

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "HDMI";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
>  
>  	reserved-memory {
>  		xbl_mem: xbl@80700000 {
> @@ -530,6 +542,45 @@
[..]
> @@ -602,6 +653,21 @@
>  	status = "okay";
>  };
>  
> +&mdss_dsi {

We want to keep nodes sorted (by address if applicable, otherwise
alphabetically on node names and on labels). "mdss_dsi" < "mdss_edp".

So please move this up where it belongs.

> +        vdda-supply = <&vreg_l6b_1p2>;
> +        status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +        remote-endpoint = <&lt9611_a>;
> +        data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi_phy {
> +        vdds-supply = <&vreg_l10c_0p88>;
> +        status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -711,3 +777,23 @@
>  	function = "gpio";
>  	bias-disable;
>  };
> +
> +&pm7250b_gpios {
> +        lt9611_rst_pin: lt9611-rst-state {
> +                pins = "gpio2";
> +                function = "normal";
> +
> +                output-high;
> +                input-disable;
> +                power-source = <0>;
> +        };
> +};
> +
> +&tlmm {
> +        lt9611_irq_pin: lt9611-irq-state {
> +                pins = "gpio24";
> +                function = "gpio";
> +                drive-strength = <8>;

I'd expect a 2 here, so please document why this is 8.

Regards,
Bjorn

> +                bias-disable;
> +        };
> +};
> -- 
> 2.17.1
> 

