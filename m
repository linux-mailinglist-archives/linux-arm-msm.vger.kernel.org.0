Return-Path: <linux-arm-msm+bounces-39265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690D9DA38F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E07166397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696D3176FB0;
	Wed, 27 Nov 2024 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0nD7hyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30FF9DD;
	Wed, 27 Nov 2024 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694896; cv=none; b=HzeNVEVkMG8H5ALe+c80Jhpy0AY7rffCPtVTRNtUu2LxuDVCyrpHjPrXpapebRvOTR87p+/GWo6glC2TfpoAkcSsDvTvHJWCkulXI0I29kzNdqYpBuKDx+T6EmMal2OwgTKTW812MXEoL7MM3oBoAvDC9PIa8yWy1aIZZISafyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694896; c=relaxed/simple;
	bh=NF28kIDMQwUhDdPuzlAAIZpmVkGZfzIskrkhwP6SS1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCjVJPG52pk83hYxm/M0+ugZO5jWsffrzLg51+R8rLkdSwRXCbD65pGXgHcdgaQ/vHRpsi4f3sKY8BR/ZTlMO5pSVUhG633z9c8OPp/UHAfZMxLbzkMMMJlpbjmUWIumnrgyVaZ2btikST9P8pXY1arI+le8okFbIPzQCzGrWlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0nD7hyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550A2C4CECC;
	Wed, 27 Nov 2024 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732694896;
	bh=NF28kIDMQwUhDdPuzlAAIZpmVkGZfzIskrkhwP6SS1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0nD7hyowBqigFW5yKF06MgdnaRYC2G4KNmt1r5NhZM7AQPsnnQHuTQmezHnHhZj4
	 ysDPX7tj2opnyph35Oe3s5wPj8IZnUFppYc4xsRNjiskTJv8ZWymuRwZmwcPtoXQu2
	 zjNs+9D9qEuYee8fY5aWYBpFlqSFYxOYOV7dvYE3XZTGjqMx9WMvoVFOKqNhD9gVwP
	 Y1AabvC7rxbHe4d7WNecTHDhz+s7vZ0NT8ZFzO3ErP3lY7GmCY9s26BN63QttdT/cD
	 ZtTYfe9vERGhkUmtxCzKsYQb0yMDebCSi+y2R+JESz+8vJsdnSlXPjd8ntdF6xo+Cf
	 tl+Qrq7dspj2w==
Date: Wed, 27 Nov 2024 09:08:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Sanyog Kale <sanyog.r.kale@intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: wcd937x-sdw: Add static
 channel mapping support
Message-ID: <jnetmj5ibmmoiputq52vsvfqjz2auwjeqwt36g7sg4kjrrxyso@nrugsa6px4h7>
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
 <20241126164300.3305903-3-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126164300.3305903-3-quic_mohs@quicinc.com>

On Tue, Nov 26, 2024 at 10:12:57PM +0530, Mohammad Rafi Shaik wrote:
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> index d3cf8f59cb23..7893b1c1f80b 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> @@ -58,6 +58,44 @@ properties:
>      items:
>        enum: [1, 2, 3, 4, 5]
>  
> +  qcom,tx-channel-mapping:
> +    description: |
> +      Specifies static channel mapping between slave and master tx port
> +      channels.
> +      In the order of slave port channels which is adc1, adc2, adc3,
> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
> +      The channel map index values are fixed values.
> +      SWRM_CH1 ==> 1
> +      SWRM_CH2 ==> 2
> +      SWRM_CH3 ==> 4
> +      SWRM_CH4 ==> 8

I am surprised to see here again 1/2/4/8. My comments were not
addressed. I think we agreed during our off-list talk that you will use
1, 2, 3 and 4.

> +
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 12
> +    maxItems: 12
> +    additionalItems: false
> +    items:
> +      enum: [1, 2, 4, 8]

Best regards,
Krzysztof


