Return-Path: <linux-arm-msm+bounces-76662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15334BC9535
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCEA73B24DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6100F2E62C6;
	Thu,  9 Oct 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJsyU6qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAED34BA39;
	Thu,  9 Oct 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016983; cv=none; b=i8UyD0JmZWLXQZHXEFVj1XaRAcZpo5V3Jw2COrFHA04Tpnr2ssbYeXdFzOsEBRl1NEsf+m3A9YVHIxStt1v6BlGtf+Dj0VzZOssDoLS9KrtdwfO2+4n9yK9YCZ9ttbqSc2RepSqa2TuYwIY5cbBbVy8HLFN8aEB8di0mbl7i6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016983; c=relaxed/simple;
	bh=RJzlIzaNrRMi8Em3HrGnc0Nhu1pxrEKe/TDA2cceJ9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FH+E9QwVuOMBv/bZZQq72o8PhIH19SHJGThuX9tSkwj+5l4yuy+IiTEyxeOwX7junTBWjXokCPxFquJ4PeIAshj/BYL0KboD+4zfUaWAdU3Jq/dEKO4WpFQv/REMYgF4L0NW30RU6oZVIt08FHIihjzDoeiqDfN4VxpAXF6n4mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJsyU6qi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37BEC4CEE7;
	Thu,  9 Oct 2025 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760016982;
	bh=RJzlIzaNrRMi8Em3HrGnc0Nhu1pxrEKe/TDA2cceJ9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gJsyU6qiPFnfMZnR7Q+/lowVsnthyFh3aa1Lo+BqsMj0Wq/p4cggNvU408o+rXhqh
	 kN655+1ssU25jGTwvHZZQ2lJGxEur279fz8+H0Fr0oOK5xwn91d0HIBTCUpcW36owU
	 K+omY3nkWnSgTkzPVCMsMqXh+Y5L3wPGoRXO4ctNWxTbEfTS1AWwUczvsOtOHDVZVW
	 123Dh6d27BY+rPnEwYTl04yaV67YtREbA4lfdNu35Yw+wY3ngFdg/TS9zTq3nUBtYT
	 ZWlKi5pdk9ZEGqInuCwqOahIU3hUl2/ACBqb2Ej6Y3s3wFJIB7QbFiesuydYMtMHji
	 n8nj77Gc3bEmg==
Message-ID: <44606de8-3446-472f-aa6b-25ff8b76e0ec@kernel.org>
Date: Thu, 9 Oct 2025 14:36:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-2-6b7d38d4ad5e@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-2-6b7d38d4ad5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/8/25 7:56 PM, Neil Armstrong wrote:
> In order to describe the block and master clock of each I2S bus, add
> the first 5 I2S busses clock entries.
> 
> The names (primary, secondary, tertiarty, quaternary, quinary, senary)
> uses the LPASS clock naming which were used for a long time on Qualcomm
> LPASS firmware interfaces.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -64,6 +64,27 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/string
>      description: User visible long sound card name
>  
> +  clocks:
> +    minItems: 2
> +    maxItems: 12
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
> +      - const: primary-mi2s
> +      - const: primary-mclk
> +      - const: secondary-mi2s
> +      - const: secondary-mclk
> +      - const: tertiary-mi2s
> +      - const: tertiary-mclk
> +      - const: quaternary-mi2s
> +      - const: quaternary-mclk
> +      - const: quinary-mi2s
> +      - const: quinary-mclk
> +      - const: senary-mi2s
> +      - const: senary-mclk
> +

I don't this is correct way to handling bitclk and mclks for I2S, these
are normally handled as part of snd_soc_dai_set_sysclk() transparently
without need of any device tree description.

Also doing this way is an issue as this is going to break existing Elite
based platforms, and the device description should not change across
these both audio firmwares.

thanks,
Srini

>  patternProperties:
>    ".*-dai-link$":
>      description:
> 


