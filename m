Return-Path: <linux-arm-msm+bounces-40038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 288859E164C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB369280A1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 08:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F411DDC26;
	Tue,  3 Dec 2024 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBHLegiJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F91DB527;
	Tue,  3 Dec 2024 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215953; cv=none; b=iva4yhzsboaywfkALCBOJ9FOZf1W//GVeSUK1ELNcU/NxxezBvNoyvY1zilRbuK/Ke/Gqq2CxYERcdAEXU3zIEkGg/P53S5giL+8O9mo2AB/QFbhEv1HyUiV3BoQtQEF8LinwRzXQbcOwsI0a2ppKznVeoLiW5+20P1HA710sBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215953; c=relaxed/simple;
	bh=X1Xzk01NBeV8Yhr3oboL9gGlhpV3s6C8B5gNfJERTZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCFlH8FoRNjMTriTEFu+hFTIeMLn7z3NAG3Ut/1g8xavWmTDzhWch8iHPCcrzlxEXhgXzA0tpb39pf0Qm8RxwRYtGsV9knUQAzHh6ENMHwEh8GjXy5SPmS6HLXiRYES91twavR/MIRfnIzFP60CSLfNh/E+tMUxosX6EJczStoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBHLegiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA283C4CECF;
	Tue,  3 Dec 2024 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733215952;
	bh=X1Xzk01NBeV8Yhr3oboL9gGlhpV3s6C8B5gNfJERTZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBHLegiJMLqkmlNu8eveIFvVxI7+hlxsCCM9flPKv5lXT407b2+7+4b6l2C+MoL+y
	 /zlovuHOITV6E3nGSye5k3h5sQcXvWlqda5sQE84F7DMnux83hplmP7prNK6Lee5mZ
	 K+Gx+/P0xhMxNS0CdB45MO0qHIt52E2RF6P+cvalXDK2R4P3TQzHb5mVKWNJy08rV/
	 BKy1sOsmAe857cCMsH9rsLWQzOoX91XuwB8Rj5GCs2gUInrdv8mNrGtSIILya4XDWw
	 4cJ+8gfjalBAcr7G/0kJZTbT+Ihke97Q0bfSHxC6YDNXjLiuDd+HzjUl5+mpgVghFK
	 LKO79+W5gYOag==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tIOdw-000000000Cf-2JRx;
	Tue, 03 Dec 2024 09:52:28 +0100
Date: Tue, 3 Dec 2024 09:52:28 +0100
From: Johan Hovold <johan@kernel.org>
To: maud_spierings@hotmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
Message-ID: <Z07GzL3suEjGlnwF@hovoldconsulting.com>
References: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
 <20241202-asus_qcom_display-v5-3-e0d3752ff71f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-asus_qcom_display-v5-3-e0d3752ff71f@hotmail.com>

On Mon, Dec 02, 2024 at 07:18:13PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add bluetooth for the asus vivobook s15
> Describe wlan configuration

I assume you copied most of these (effectively boilerplate) definitions
from somewhere so perhaps you can mention that here (e.g. if it was
copied from Stephan's patches [1]).

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 163 +++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index 7269f8e7709988657b363004875163a69142f16c..0774bd65ae8cddab81b98e27a116fd5adbe1363c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -18,6 +18,11 @@ / {
>  	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	aliases {
> +		serial0 = &uart21;

No need to add an alias for the console port which is likely not
accessible on this device (without some tinkering).

> +		serial1 = &uart14;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-0 = <&hall_int_n_default>;

> +	wcn_bt_en: bt-en-state {

Looks like you want a "wcn-" prefix on the node name here too.

> +		pins = "gpio116";
> +		function = "gpio";
> +		drive-strength = <16>;

Is this the drive-strength the firmware uses? The default 2 should be
enough, but you can leave it as-is if it matches the fw settings if you
prefer.

> +		output-low;

I don't think you should be setting the pin state already in the pin
configuration as this should be left up to the driver to control.

> +		bias-pull-down;

A pull-down should not be needed for this output either.

> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
> +		pins = "gpio214";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	wcn_wlan_en: wlan-en-state {
> +		pins = "gpio117";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};

Same question about the drive strength applies to these two.

> +};

Johan


[1] https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

