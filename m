Return-Path: <linux-arm-msm+bounces-81861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B0C5D257
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 13E6934D5FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF87178F2F;
	Fri, 14 Nov 2025 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMOHF3vX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F1450F2;
	Fri, 14 Nov 2025 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763123601; cv=none; b=lpciDQtI/vDF6+RwGguTBCktGmZRYnE6sM79v2L0BGFxOzs9oftqhPct2ZJMRVthOmkDuV3XlAQrwG8Szp3mVH0o6wPAjVjsNjDDxFcfWssqdUAzJJRGQU6bony5N8ATDVtPwodo/9Bbj0YX5op1yJ1IcNpEpgTbNjT+zzyhoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763123601; c=relaxed/simple;
	bh=0tblge/NAgicvgD5ljkfUV5nvWG2Q7uwFxvCKh5uta4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbUWsu9GK6StW8GvtMLbzN8VfPYO45uA34aNubRU/YqbgUNvSdf2Z5E/lTYRF7e0srUT6YwB+wa6qezFPTOVepL0mk+yOld9LMNFQmGBHaHF8ocOM7ZqPgjbIBK4x5UOv+TrgCd0YPgNAWrfBy+IQ8OPtWMQINthIriGJtrN9Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMOHF3vX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F038CC4AF09;
	Fri, 14 Nov 2025 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763123601;
	bh=0tblge/NAgicvgD5ljkfUV5nvWG2Q7uwFxvCKh5uta4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EMOHF3vXpfkI9WZDhUH6ahs46W4CUn+3KBjrYjVXJV7ODvrC9ZMdoxVvwAHxsRtCg
	 HDrVJSE3UTq8VTRX0qmAXfIbkoSpOgRQo3oNoj/7jfZlAmAvWcm0jiDneiqcaa7hJo
	 QO6nZ4qRHcTBpoybsx7ZDAjffG8NpOzTJxJhoJL9xBzxeqS/hBDPMn9H1HzQE2TWbT
	 ii5KNcylQ72wVQFVcfBGoj6IjrOEkg2YPe89RK5wumTChC/twa4ONmv5ifLcq0hZHy
	 1Wkqc9+j2p0QrZgdZ48nmh0JBeED63sNLbsltPl4R+YKgAq37WyvlhKkpVUxzZQ4Y1
	 ppKB8POF80trA==
Message-ID: <789ca70c-c9ac-4290-8a24-1f83febe498f@kernel.org>
Date: Fri, 14 Nov 2025 12:33:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to
 I2S format
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 "Dr. Git" <drgitx@gmail.com>, Casey Connolly <casey.connolly@linaro.org>
References: <20251114-sdm845-quaternary-v2-1-9d803bf5f7c9@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251114-sdm845-quaternary-v2-1-9d803bf5f7c9@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/14/25 12:14 AM, David Heidelberg via B4 Relay wrote:
> From: "Dr. Git" <drgitx@gmail.com>
> 
> We configure the codec DAI format for primary and secondary but not the
> quaternery MI2S path. Add the missing configuration to enable speaker
> codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.
> 
> Signed-off-by: Dr. Git <drgitx@gmail.com>

Please fix your git user.name, looks like "Dr. Git" is not your real name.


Other than that patch itself looks sane to me.

--srini



> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v2:
>  - Rebased on top of next-20251113
> ---
>  sound/soc/qcom/sdm845.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index e18a8e44f2db5..0ce9dff4dc525 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -365,10 +365,12 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUATERNARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>  		snd_soc_dai_set_sysclk(cpu_dai,
>  			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
>  			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  
>  	case QUATERNARY_TDM_RX_0:
> 
> ---
> base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
> change-id: 20251114-sdm845-quaternary-e9d6d0b513c9
> 
> Best regards,


