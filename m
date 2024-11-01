Return-Path: <linux-arm-msm+bounces-36697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA59B8CBB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 09:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A73BA1C2137D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B20153BFC;
	Fri,  1 Nov 2024 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZhHuI21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152484A5E;
	Fri,  1 Nov 2024 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448869; cv=none; b=d6t6Y1F6kX1iaym8JeJjkuGHtm47Yz/tzGXZPUHtsUXubVQkqeVzDYWYFEu3vOGvYxs4iatSzUFXNowZPstXrmORR2NvfR25J4mP4vHRXtaielgnojX8FN6bmCZp3PVteagaT/SbIcg7TezZgVBboq5d2clWubUcSiAICb6uQ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448869; c=relaxed/simple;
	bh=TeFuD4EkGsPleD8hJkslZxcZRg6USTXrl/FwyS9Z094=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0LCYwYCXw45K7f0Xa2LEiiwIG8qJiqI6iR02xa29u9c05gqzD7qD8dOyZDzkwA9ZNzKOZFEq94E3u4L/XG/yIrgQ2eZPPiCjCB2IHVrll4E4DlN082IQ6XSbHfq7dLKE0XgKMjbVY1NqvscIq4hfDASga9Nr0EhBJG9c01mD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZhHuI21; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D065EC4CECD;
	Fri,  1 Nov 2024 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730448868;
	bh=TeFuD4EkGsPleD8hJkslZxcZRg6USTXrl/FwyS9Z094=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qZhHuI21iH4oJd813Z85XkXHycBQp2Xq2VhC/lNZGgnpenHtSFz650GpAePajxRpQ
	 1g07p3wA0RuaFoN+Tle9Llbm36p5HZRCkd2n2QGnGJK3Il9mHs8zLkwsa81b7pbJar
	 u1xn4yNwhjS1OPS+NR5eZ6jWzZdB1GzRQSnRjkORuBNYkgrmlKlNdaTV/iA8PU0fJa
	 uSOZmCOvlFTsRIddmsOhUdJwik+6dxxPQWNwW3wHd71SSjnDfUrW1g+CDFogtAv7q+
	 zidsq/eNMaU9U9U6qo4cFA6VbqIOOuOb30Hi2/fxoCZcs9yuCFLyYYeSe9Bysn5RXF
	 fLpxFraW49y4Q==
Date: Fri, 1 Nov 2024 09:14:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/10] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
Message-ID: <5zkslmf7m5vphs2wjcdg3536eo7tuh3stjthh3ulkr7oic5i25@qtnsog5ladsb>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-9-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101053154.497550-9-alexey.klimov@linaro.org>

On Fri, Nov 01, 2024 at 05:31:52AM +0000, Alexey Klimov wrote:
> One WSA881X amplifier is connected on QRB4210 RB2 board
> hence only mono speaker is supported. This amplifier is set
> to work in analog mode only. Also add required powerdown
> pins/gpios.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index fc71f5930688..76b9ae1b0ebc 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -63,6 +63,16 @@ hdmi_con: endpoint {
>  		};
>  	};
>  
> +	i2c0_gpio: i2c0 {

Is 0 name on the schematics or datasheet? If yes, then i2c-0. If not,
then i2c-1


> +		compatible = "i2c-gpio";
> +
> +		sda-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	i2c2_gpio: i2c {

i2c-(x+1)


>  		compatible = "i2c-gpio";
>  
> @@ -272,6 +282,25 @@ zap-shader {
>  	};
>  };
>  
> +&i2c0_gpio {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	wsa881x: codec@f {
> +		compatible = "qcom,qrb4210-wsa881x-i2c-codec";
> +		reg = <0x0f>;
> +		pinctrl-0 = <&wsa_en_active>;
> +		pinctrl-1 = <&wsa_en_sleep>;
> +		pinctrl-names = "default", "sleep";
> +		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "wsa_mclk";
> +		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
> +		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "SpkrMono";
> +		#sound-dai-cells = <0>;
> +	};
> +};
> +
>  &i2c2_gpio {
>  	clock-frequency = <400000>;
>  	status = "okay";
> @@ -746,6 +775,22 @@ wcd_reset_n_sleep: wcd-reset-n-sleep-state {
>  		bias-disable;
>  		output-low;
>  	};
> +
> +	wsa_en_active: wsa-en-active-state {
> +		pins = "gpio106";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	wsa_en_sleep: wsa-en-sleep-state {
> +		pins = "gpio106";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		input-enable;

Are you sure this passes dtbs_check? I think this was not allowed since
1.5 years.

Best regards,
Krzysztof


