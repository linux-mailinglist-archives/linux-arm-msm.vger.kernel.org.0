Return-Path: <linux-arm-msm+bounces-40971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 537819E8C8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 08:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469D21881655
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 07:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FC0214A64;
	Mon,  9 Dec 2024 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7ya8ngT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E1015573D;
	Mon,  9 Dec 2024 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733730545; cv=none; b=iZt89Wz2O/dTFiziV8zhkwS1SksSCtfNmCC5o0V7Idn1jKgeMdeipfU5648G1TYkairybNgAri5mGaseh7tv/m4x3a34AM0t7K/dwUbE5IjdWVUpEL6AB+VIoZTAoMt+TR/zdqjJKuwbawO+MkpIIrgToluPGBw9jgYvXU9yeog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733730545; c=relaxed/simple;
	bh=Ke4oSiaavD5rXW7RJFQ7IuRw5WXv3v1QivxyYpX0rdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwW8njsWKMJGQWRoIY+d8q9LUtPomvckvkCI/6EQt1L/ASsZVnCnV6FD7kU0f57izAosUWSNwbJ2w2lcYMvyxLFZmOXEaQc2nZwzeU4IlFCKkTyZKqDZfxDprfGiZCxQeAuFtx63P6ieoE3SRDbcwI89qewm1C5GmhcPpBrIAdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7ya8ngT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0830C4CED1;
	Mon,  9 Dec 2024 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733730544;
	bh=Ke4oSiaavD5rXW7RJFQ7IuRw5WXv3v1QivxyYpX0rdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7ya8ngT4sTuA0b6osceBibkaIV9znLSOOi+jrBvMeld1/frUi8zu2W8iSt7cUtwy
	 AFaP6DRxzrWn8n7IwYNKO56oIOdXGjKc1wQYJNCMyvdHtalHHtG1oqBt+G6KxMDX/U
	 OLm4Ht1XEJuUMrKtx7SrSPuZjXzuhs/NuhVUmrg8BqG3POl4BLHFaTdG/vyWYonkPY
	 Ct/2+txCu2bwx+3RouA1ZRqDhD6KC6vfgELsLO+S2SolwQQnsGAkNiw403lFnzgRsi
	 qAYJ7N9bJjPIffEcVOD0utfsD2V8uq680mBNSwrkXo2hbC5s9OD4bjjq56Nr7VJVl7
	 Gy9eZlbBiD8SA==
Date: Mon, 9 Dec 2024 08:49:00 +0100
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
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static
 channel mapping support
Message-ID: <fq5p4ubdpv3dc5jzqgakvnqzpcrhkfqar2dbcvclqlvbmbegfc@llq3kzkzegl3>
References: <20241209045551.1404782-1-quic_mohs@quicinc.com>
 <20241209045551.1404782-2-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209045551.1404782-2-quic_mohs@quicinc.com>

On Mon, Dec 09, 2024 at 10:25:48AM +0530, Mohammad Rafi Shaik wrote:
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
> index d3cf8f59cb23..9209667044ba 100644
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
> +        - 0  # WCD9370_SWRM_CH1

Drop the comments. This does not implement my feedback and you sent it
four days after I replied to you.

Best regards,
Krzysztof


