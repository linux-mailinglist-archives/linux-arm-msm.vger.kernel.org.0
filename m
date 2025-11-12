Return-Path: <linux-arm-msm+bounces-81472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04847C53BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F2AF4F4FB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355AD33F8D2;
	Wed, 12 Nov 2025 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiaWGWTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0434933F8A4;
	Wed, 12 Nov 2025 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762965788; cv=none; b=tnGmHkNvPxKTOMXPWix3ae2C+8lxx/OzW1P4L778tBCq9dS+hhPUSU7Ow+x4NrGtTWQDwd5oHu2X9onpxPfCOlBEntH/gGTtZGuM6ZkQeA+JZbc8kV1Q4avSQQOa7GaQL86xfLcdd7Wj+elZYsgA/rTvGyTywTLZrsXKeDLSC48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762965788; c=relaxed/simple;
	bh=GOi+JsMJ/pQ09hki72GvXw/xvo34Pc/13UXaEh5uSTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAJbhSS4wIJ+hLjP9AGW1/6cAxKyHzCp2bUIYICgh2FExr8joUmytsRNBAkosAaQUJttXwtOtV62Atro44N0poiNib6USSLRJFWfKd/4gLxd6sKUsJxOPD1VWoAjz/WHMJZNTRSRlWbJTs7mr9Bfqj9YRoSc5cGM98yN2iMlhII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiaWGWTl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B313BC4AF09;
	Wed, 12 Nov 2025 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762965787;
	bh=GOi+JsMJ/pQ09hki72GvXw/xvo34Pc/13UXaEh5uSTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DiaWGWTlXYsgKdBzuFLjoR8m0LtgC0KVmDvotC+PjBGaL+V7AMHX7hhecobgVMHWh
	 dY4nxynY1RocoyKFMiH1DAOfXEqMCVh/i1EcmiiCZ29RtLzgku3f6KOLPZm/Wt3vPu
	 PrlXhRbtIAn4qWQShQ30eAQK4qjp4i3xY/Vh0M7PFCw8bFWQQwZvwR/G6hXea6Do0g
	 SUQCoDfZIPdBNsMeDhnErT6R/ZEgDMbjqigLU3KzdgZQ/EyLPkx568BhFtMc+1gLgy
	 JOEomJSAQd8uy1plRxqUOZCORQZG/dunZJqdqIVLfLe8xqayK02QC6m9MrOG3/J37o
	 +Z6ha6Mua2N0g==
Date: Wed, 12 Nov 2025 10:47:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com, 
	Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 rb3gen2 industrial mezzanine
Message-ID: <wzx5s6xlphwnmbkm2ef2yqhseecxnr6mcq7up6uwlz2jyc2cwp@lmttpwq6m7rw>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
 <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>

On Wed, Nov 12, 2025 at 08:18:11PM +0530, Gopi Botlagunta wrote:
> Below is the routing diagram of dsi lanes from qcs6490 soc to
> mezzanine.
> 
> DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
>                  |
>                   --> SW2700.1 --> dsi connector
>                               |
>                                --> LT9211c --> LVDS connector
> 
> Disable hdmi connector for industrial mezzanine and enable
> LT9211c bridge and lvds panel node.
> LT9211c is powered by default with reset gpio connected to 117.

This is much better than the previous description, but it still doesn't
say when this happens. Are SW1403.4 and SW2700.1 two DIP switches?

I guess this is a logical diagram, but it's not clear. Are the signals
going through the DIP switches, or are the switches controlling some
switches?

> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>

The first signed-off-by needs to match the author of the patch, and as
Yi's isn't explicitly stated as author in your email, you're considered
the author. Perhaps a co-developed-by?

Regards,
Bjorn

> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 619a42b5ef48..cc8ee1643167 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -8,6 +8,112 @@
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
> +/ {
> +
> +	hdmi-connector {
> +		status = "disabled";
> +	};
> +
> +	panel_lvds: panel-lvds@0 {
> +		compatible = "panel-lvds";
> +		data-mapping = "vesa-24";
> +		width-mm = <476>;
> +		height-mm = <268>;
> +
> +		status = "okay";
> +
> +		panel-timing {
> +			clock-frequency = <148500000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hfront-porch = <88>;
> +			hback-porch = <148>;
> +			hsync-len = <44>;
> +			vfront-porch = <4>;
> +			vback-porch = <36>;
> +			vsync-len = <5>;
> +			de-active = <1>;
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				dual-lvds-odd-pixels;
> +				panel_in_lvds_odd: endpoint {
> +					remote-endpoint = <&lt9211c_out_odd>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				dual-lvds-even-pixels;
> +				panel_in_lvds_even: endpoint {
> +					remote-endpoint = <&lt9211c_out_even>;
> +				};
> +
> +			};
> +		};
> +	};
> +
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	lvds_bridge: lvds-bridge@29 {
> +		compatible = "lontium,lt9211c";
> +		reg = <0x29>;
> +		reset-gpios = <&tlmm 117 1>;
> +
> +		status = "okay";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9211c_in: endpoint {
> +					data-lanes = <0 1 2 3>;
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9211c_out_odd: endpoint {
> +					remote-endpoint = <&panel_in_lvds_odd>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				lt9211c_out_even: endpoint {
> +					remote-endpoint = <&panel_in_lvds_even>;
> +				};
> +			};
> +		};
> +	};
> +
> +
> +};
> +
> +&lt9611_codec {
> +	status = "disabled";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9211c_in>;
> +};
> +
>  &spi11 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> 
> -- 
> 2.34.1
> 

