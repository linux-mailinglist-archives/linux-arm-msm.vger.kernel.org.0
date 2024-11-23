Return-Path: <linux-arm-msm+bounces-38928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A89089D6A35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EB78281C29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862324D8D0;
	Sat, 23 Nov 2024 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dy7Be1X9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF842E3EE;
	Sat, 23 Nov 2024 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379707; cv=none; b=VKQn1Z2hCazp6+tMFjWFFdUV5rbrcwW9iJyeMfMJcd+PWtvVXdmz9n6uJWp2CN09SHycLf4SG7RErr72b+5rkjaNvwQc3L8ilw6nOnfgeIbXrZWie+9Lw8OX0756JFFc8Gjk1Q6OMZuSJQkEr99jobxEQO4kqxTNZYU915jPGTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379707; c=relaxed/simple;
	bh=LSC+296eaCcRWoAQlKto1Dt7qRuEDTSbc/MEcKKwOm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1B1S+t1Ti37WsQsPM3QGnhLa3pxFFo1BwRTWpm5HGo4TgZ/b8A+qYrxH6yfbZf5HQKxVZzkScyeTBYUFRx2fjBUoXxPZ6HXCA5FSRu5jFn5oENuEsAGeew4o8vUkIE0LgqtLWU2J/FtXpvZDZHSV6i5wK2WDHhFqDiHbvv/Usw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dy7Be1X9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2337AC4CECD;
	Sat, 23 Nov 2024 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379705;
	bh=LSC+296eaCcRWoAQlKto1Dt7qRuEDTSbc/MEcKKwOm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dy7Be1X9vO6UhYEQiyxyN8wmUAjyBZsC62gv/GMPvQt2+/RYpZaTTgko10yk1wKuL
	 v5nlug+eq02tgXA6HrZFl1Ii1elQ5MmZMCMp8Zu8Yq/6zaiTB8Jeiw6j5mc0RMiP6P
	 8VOBA0ANFlZD0WzuuEIW4pip3GZ5zmBMVr1hV2jp/embmjQNrBFRXbzwM8kK93T0Jh
	 6h8p42NoZgTvh650fHW6dC0kxZiZON+7Zdlk8KA67+A3tWY3pBdgrGL7s3tyTWl6aR
	 Zsht0jGWtTYUbM2xW0h0E5G0umQD8JzM7CT6MpHlQWchUBDVCo/gVuvw57OMi7t/j/
	 nIoXQN3dgiK3w==
Date: Sat, 23 Nov 2024 17:35:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
Message-ID: <qr2kblpejiif3y3hnyvsidso5plemeh2mkyf2xjzcprhiwohlo@itd5uiok63w4>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>

On Sat, Nov 23, 2024 at 01:58:56PM +0100, Maud Spierings wrote:
> Add bluetooth for the asus vivobook s15
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index d0bee4b6fc0be6fe40d335f4d50dde495853b315..caf7509692db84c69ad375b5dd07054ac0adcb52 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -18,6 +18,11 @@ / {
>  	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-0 = <&hall_int_n_default>;
> @@ -545,6 +550,14 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
>  
> +	bt_en_default: bt-en-sleep {
> +		pins = "gpio116";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +		qcom,drive-strength = <16>;

Hm? There is no such property for TLMM. Which node is it?

> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio70";
>  		function = "gpio";
> @@ -624,6 +637,17 @@ tpad_default: tpad-default-state {
>  	};
>  };
>  
> +&uart14 {
> +	status = "okay";

Missing blank line

> +	bluetooth: bt_wcn7850 {

Underscores are not allowed in node names.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof


