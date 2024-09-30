Return-Path: <linux-arm-msm+bounces-32729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6739899A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 05:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6429A1F21557
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 03:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05BD224DC;
	Mon, 30 Sep 2024 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnu+o4S/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01421878;
	Mon, 30 Sep 2024 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727668520; cv=none; b=HnBlbMO9InbVoOGNuDgzCOc98Tyt8ZMOdn01+0Q4FzRHVxnfZmn6udmmc0loNGBOGlIHUvr2aY2lcXHdUPMFxZnGxwP8NaGlOMYMLsioaBz7XVvd9xRshbogtyS338pc7Xjm+K20glReJPo6hi0YL9g9AEeQKO43qqMFI+0+Ui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727668520; c=relaxed/simple;
	bh=IJa8Mg1aKbFf8WzwjqMhoot4wnFim9U6zMkwBTOCArY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnGKVUaN9kRUSrkZpje7VY9yvdXkGN5H3yaTBNQ+wWZ8L09s6w7paQBihwyab1Skq9E0+dl/QbW3ARkDK/tCKPscJ3PBcZXDEGesuQ8IAvSrnfiUCDenZ8mquLpe+eJ1fZywJdLGSadDHEfNRVz7urEbzk5zxgIHyhG4lGUid58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnu+o4S/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B64C4CECE;
	Mon, 30 Sep 2024 03:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727668520;
	bh=IJa8Mg1aKbFf8WzwjqMhoot4wnFim9U6zMkwBTOCArY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnu+o4S/ksubI4Bb4bxGIsPg0I0Ls0s/LFe4FiTfuXR9HoiHSv7O+jQN6NeeD6cI6
	 uvgJdLx7RcG385IAINmqVhz97uvR5baPAPLO+s1OOn7z5av3BS/bWoXeKDTIg3jfzZ
	 En9lw21nLQiZ71bt7zW8g2z9ZGprQopoihqdGb0De+s9x+3EygQmu0HrvxGXwTxTNh
	 I4BKNy8RNyssS9rLkbx6PIlSz6GlglWeLAs7d1aHleOITRohvrtFnmPMY4Cu0+mE4Q
	 AkEvwH7sp+gGhs+5apfOgJJEobUEQJCm6av/UVfngGH7Wq2Rb9PafOKGshsq4nqtVy
	 Xm1Dp8TyV4gFw==
Date: Sun, 29 Sep 2024 22:55:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: starqltechn: add graphics
 support
Message-ID: <cbsxqssei5lcsnnphk5cx77qpnnnjticvtzn2jemkm6h333llx@hzygsxsc6t22>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
 <20240926-starqltechn_integration_upstream-v5-11-d2084672ff2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-11-d2084672ff2f@gmail.com>

On Thu, Sep 26, 2024 at 05:22:11PM GMT, Dzmitry Sankouski wrote:

It would be much appreciated if we included "sdm845-starqltechn" in the
subject. That way it will help me when I try to write the pull request
later, and try to group sdm845 changes together...

> Add support for gpu and panel.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes for v5:
> - fix label names
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 230e984b5ba3..f7cb09734d2f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -203,6 +203,52 @@ vib_pwm: pwm {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l26a_1p2>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "samsung,s6e3ha8";
> +		reg = <0>;
> +		vci-supply = <&s2dos05_ldo4>;
> +		vddr-supply = <&s2dos05_buck>;
> +		vdd3-supply = <&s2dos05_ldo1>;
> +		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&sde_dsi_default &sde_te>;
> +		pinctrl-1 = <&sde_dsi_suspend &sde_te>;
> +		pinctrl-names = "default", "suspend";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +	status = "okay";
> +};
>  
>  &apps_rsc {
>  	regulators-0 {
> @@ -837,6 +883,27 @@ &tlmm {
>  	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
>  			       <85 4>; /* SPI (fingerprint reader) */
>  
> +	sde_dsi_default: sde-dsi-default-state {

I'd prefer we leave the "sde" out of here.

Also, 'sde' > 'sdc2', so in its current form this should be moved down a
bit.

Regards,
Bjorn

> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te: sde-te-state {
> +		pins = "gpio10";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	sdc2_clk_state: sdc2-clk-state {
>  		pins = "sdc2_clk";
>  		bias-disable;
> 
> -- 
> 2.39.2
> 

