Return-Path: <linux-arm-msm+bounces-35559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC79AC0B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA77283FF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BFA1553B7;
	Wed, 23 Oct 2024 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnDdFELj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC715533F;
	Wed, 23 Oct 2024 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669961; cv=none; b=MYW640wNQFPEB3bS8qDN3m/wC2W0/ULZs1MilIle9rx8qszSiEEDmLam256FvTCASbzapdQFN3k871CjK4Yt9wp4fLOu/0R5p9o0OJLXoSXhTJCXphY9A4N5/9BJ2j5MXVVAwqMmJEd6jZV8J51mmjrGoQFuZdw1XLLohmKUVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669961; c=relaxed/simple;
	bh=oPyusmD/QDz2SE57yTcbShgT07gzSQ7MB1ODrO5VT4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxQsToaIvKlcCDRs5g7CnkS0uM0hpiUl/9LyGLCt440TSInLWTXUcW7zxhZPMZHIavpgK4gkqAwXke457XuEPXSgaJYysy6cKQYZrIqQxRA/e+TU/rr+8oa36kYw6UW4iNbBuW7Mwo4Tynywtx8PpfWmiHd0Ln7U453O0cnLTto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnDdFELj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11374C4CEC6;
	Wed, 23 Oct 2024 07:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729669960;
	bh=oPyusmD/QDz2SE57yTcbShgT07gzSQ7MB1ODrO5VT4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnDdFELjvmb61zfdpNbp3drujU039YFwkNlsBk7nLq4w9elAYJHmwflFvNhcpi+sS
	 IyLQrAmSb4psaUAJFds2Tys/eoaWd/pUWuf/uAYWHyNH/Jxv+ywoB3sgimvX2xy8eu
	 lGi57EAo3lEVXsN/R5wjJX6hPgzJM59KxDCEhdgAT51mgNghuqfcvVC27eukzYdbNx
	 RRZnwgD0sgYiFoFcY5zt0NTzRxf7oYSqK7K2101AQi7/GFNAPr1O9F5G1omzl7GFYU
	 62aslh+vVJNtzuhYdL+u+Q7SZI/6XuqqwaLN/fwOd4tZUGn3+IFWtU2LhWgg/bNtK7
	 jn1ajlXxDn1Tg==
Date: Wed, 23 Oct 2024 09:52:36 +0200
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
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static
 channel mapping support
Message-ID: <qzjbiby7w6a7m4e324hdatgklmejlcxfwv7tszzfmdqahgrbu2@bcwsdlrpncxq>
References: <20241023061326.3871877-1-quic_mohs@quicinc.com>
 <20241023061326.3871877-2-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023061326.3871877-2-quic_mohs@quicinc.com>

On Wed, Oct 23, 2024 at 11:43:23AM +0530, Mohammad Rafi Shaik wrote:
> Add static channel mapping between master and slave rx/tx ports for
> Qualcomm wcd937x soundwire codec.
> 
> Currently, the channel mask for each soundwire port is hardcoded in the
> wcd937x-sdw driver, and the same channel mask value is configured in the
> soundwire master.
> 
> The Qualcomm boards like the QCM6490-IDP require different channel mask settings
> for the soundwire master and slave ports.

Different than what? Other wcd937x? Which are these?

> 
> With the introduction of the following channel mapping properties, it is now possible
> to configure the master channel mask directly from the device tree.
> 
> The qcom,tx-channel-mapping property specifies the static channel mapping between the slave
> and master tx ports in the order of slave port channels which is adc1, adc2, adc3, adc4,
> dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.

I still don't get what is the channel here.

> 
> The qcom,rx-channel-mapping property specifies static channel mapping between the slave
> and master rx ports in the order of slave port channels which is hph_l, hph_r, clsh,
> comp_l, comp_r, lo, dsd_r, dsd_l.

And this description copies binding :/.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> index d3cf8f59cb23..a6bc9b391db0 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> @@ -58,6 +58,38 @@ properties:
>      items:
>        enum: [1, 2, 3, 4, 5]
>  
> +  qcom,tx-channel-mapping:
> +    description: |
> +      Specifies static channel mapping between slave and master tx port
> +      channels.
> +      In the order of slave port channels which is adc1, adc2, adc3, adc4,
> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
> +      ch_mask1 ==> bit mask value 1
> +      ch_mask2 ==> bit mask value 2
> +      ch_mask3 ==> bit mask value 4
> +      ch_mask4 ==> bit mask value 8
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 8
> +    maxItems: 13

Why size is variable? This device has fixed amount of slave ports, I
think.

> +    items:
> +      enum: [1, 2, 4, 8]

What is the point of using bits if you cannot actually create a bit mask
out of it? Why this cannot be 7?

> +
> +  qcom,rx-channel-mapping:
> +    description: |
> +      Specifies static channels mapping between slave and master rx port
> +      channels.
> +      In the order of slave port channels, which is
> +      hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
> +      ch_mask1 ==> bit mask value 1
> +      ch_mask2 ==> bit mask value 2
> +      ch_mask3 ==> bit mask value 4
> +      ch_mask4 ==> bit mask value 8

and the value is what exactly? Index is channel, but what does "ch_mask4 ==> bit
mask value 8" mean? I don't understand this at all.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 8
> +    maxItems: 8
> +    items:
> +      enum: [1, 2, 4, 8]
> +
>  required:
>    - compatible
>    - reg
> @@ -74,6 +106,8 @@ examples:
>              compatible = "sdw20217010a00";
>              reg = <0 4>;
>              qcom,rx-port-mapping = <1 2 3 4 5>;
> +            qcom,rx-channel-mapping =  /bits/ 8 <0x01 0x02 0x01 0x01 0x02
> +                                                 0x01 0x01 0x02>;
>          };
>      };
>  
> @@ -85,6 +119,8 @@ examples:
>              compatible = "sdw20217010a00";
>              reg = <0 3>;
>              qcom,tx-port-mapping = <2 2 3 4>;
> +            qcom,tx-channel-mapping = /bits/ 8 <0x01 0x02 0x01 0x01 0x02 0x04
> +                                                0x04 0x08 0x01 0x02 0x04 0x8>;

Keep it consistent, e.g. everywhere without leading 0... actually not
sure why this is hex, either.

>          };
>      };
>  
> -- 
> 2.25.1
> 

