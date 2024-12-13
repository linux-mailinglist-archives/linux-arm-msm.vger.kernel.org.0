Return-Path: <linux-arm-msm+bounces-41919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE39F06FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB650281B01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8252E1AC8AE;
	Fri, 13 Dec 2024 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYGQdt7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A11AB6FF;
	Fri, 13 Dec 2024 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734080040; cv=none; b=jZk7Lpv+ifhSUMeGuDAJlB0pIeTrztmR5s8m6NpW5WoUYISOfSidLHrkC84Fvht8LGBARp6evmCYxjIOyYOxbzi6+9v6nHOEneq8YQCH8w+Zu1ypncs/x1/IOvM+Qfyj4zdnBG7FbgFp5dFGo6htHg/BwHfx1w9WsboTCGBHftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734080040; c=relaxed/simple;
	bh=xx1YCCc7x74d5prYar4rNsVjFMi0KmmH2/WshxrFgFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLGO+7TzOksW8KsNxZ0p9O9+QVvovqSK7dBLJ1ts62u9LWTnv0PhhZ06DpsXqTjqr4Wc6b0Ea4FQznOtSNFofLzxicWNZchqeh5DnG98V5iUIeV8Myc1AgMjRA5262WapfvSV9/Qm3fhUdBiPd4nDIEX0vrUqjca9zwHl08/nlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYGQdt7g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25961C4CED0;
	Fri, 13 Dec 2024 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734080038;
	bh=xx1YCCc7x74d5prYar4rNsVjFMi0KmmH2/WshxrFgFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYGQdt7gMOzrSpI2pNvkeXUp63YP6uhlskMyBMkZVNFKgWgsVIyWBme/cUxadA0P2
	 QwQJMAxd353bmBC1yYj2NNPg3aY1RTUH5JekxE2QK6vlVDVO6s6d4mHnXQOUZgw5zH
	 kWoeHYjZCxVVeRlSyM0vPJ7zdRiuRFKKZNzJ3UdakMoJk8TZKJQEPYefhLwJdErvxC
	 S3Ghxtu7ICi/SOuCiNHjO/JPe/uFAYnLewlvKXgqadhEsynLJp+ifi0glwr3Z7jpuQ
	 zjHnT4xACKJrovXHjHG1m/6wTW7tcqySsI7Vvu+TUbvLTLKyYzEKBFzbdKnUPo48lJ
	 uEozC60hv/zTw==
Date: Fri, 13 Dec 2024 09:53:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Sanyog Kale <sanyog.r.kale@intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH v5 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static
 channel mapping support
Message-ID: <iuuxejlzes23ju4oy2m27oen2bhrenyuouq37ktvmiheoy7ow6@w6oqzh4bj4v6>
References: <20241212162334.36739-1-quic_mohs@quicinc.com>
 <20241212162334.36739-2-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212162334.36739-2-quic_mohs@quicinc.com>

On Thu, Dec 12, 2024 at 09:53:31PM +0530, Mohammad Rafi Shaik wrote:
> Add static channel mapping between master and slave rx/tx ports for
> Qualcomm wcd937x soundwire codec.
> 
> Currently, the channel map index value for each soundwire port is
> hardcoded in the wcd937x-sdw driver, and the same channel map index
> value is configured in the soundwire master.
> 
> The Qualcomm board like the QCM6490-IDP require static channel map
> settings for the soundwire master and slave ports.
> 
> If another boards which are using enable wcd937x, the channel mapping
> index values between master and slave may be different depending on the
> board hw design and requirements. If the above properties are not used
> in a SoC specific device tree, the channel mapping index values are set
> to default.
> 
> With the introduction of the following channel mapping properties, it is
> now possible to configure the master channel mapping directly from the
> device tree.
> 
> The qcom,tx-channel-mapping property specifies the static channel mapping
> between the slave and master tx ports in the order of slave port channels
> which is adc1, adc2, adc3, adc4, dmic0, dmic1, mbhc, dmic2, dmic3, dmci4,
> dmic5, dmic6, dmic7.
> 
> The qcom,rx-channel-mapping property specifies the static channel mapping
> between the slave and master rx ports in the order of slave port channels
> which is hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> index d3cf8f59cb23..c8543f969ebb 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> @@ -58,6 +58,40 @@ properties:
>      items:
>        enum: [1, 2, 3, 4, 5]
>  
> +  qcom,tx-channel-mapping:
> +    description: |
> +      Specifies static channel mapping between slave and master tx port
> +      channels.
> +      In the order of slave port channels which is adc1, adc2, adc3,
> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 12
> +    maxItems: 12
> +    additionalItems: false
> +    items:
> +      enum:
> +        - 1  # WCD9370_SWRM_CH1
> +        - 2  # WCD9370_SWRM_CH2
> +        - 3  # WCD9370_SWRM_CH3
> +        - 4  # WCD9370_SWRM_CH4

I asked to drop the comments, because now they are obvious. 1 is channel
1, obviously. Your description should say what are the values here:
channels on the WCD9370 or Soundwire master device side.

Anyway, if it is understable to Mark, then I am happy as well:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


