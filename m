Return-Path: <linux-arm-msm+bounces-113125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LZ0aMFW8L2pXFQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:48:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2B684B62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:48:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oiPXCYnO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113125-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113125-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0DA6301F98E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98941381B05;
	Mon, 15 Jun 2026 08:42:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97A36DA13;
	Mon, 15 Jun 2026 08:42:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512965; cv=none; b=SLbDV0HbfzbRBf+x2Ix4WAQPUKs1j3FIzkMWpdO9o/FwMSRaBlNeNf/QpDPOzOV/C3y6qaNVsT5Bs3qjvtbN7iLDRDoVLapMLRsxU7R8fqu7Hg0slnOh3SOYlOPovHWD2bWzJ+CanLYi8mEq+xajJuPqkBr+mXwJQqNQKCU0ANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512965; c=relaxed/simple;
	bh=2cZfHeL1FXnc0TTeZ8+n3ucDW+IA/Y2eMrHO7Fn7eDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N90i9aY9TAURLsbfkJlBLJUvb/P2WKjPFymo/93DWQXljzvcStbIeyOPTOobDKG5uS73m74/YEZKR0HOm0X2b64tJyTep+g7WxGqVwkGgO/JPYTzTbbj/R1RsstQ6qHTCheW4Raar/NV2MFvwZQJzE9QIqeCOWqKvMdXSH859Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiPXCYnO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4143E1F000E9;
	Mon, 15 Jun 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781512964;
	bh=mwO5FPo2SZJiaMC+NrcQMS9Mm3+xTinTgwgahXySq38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oiPXCYnO3Ht/EK/EB3OX7/UzAy017Ie9gwB0OtXodrczVM/ii1R8RYE8lFgfO7zxF
	 xqrMGya+FCFmBlkdbkC4tD5NA+rZVg7izZ+zli5GjqXTOTql7827twZAx1uNjfkUCh
	 3JAaWIXMZH97P7YPpPVgNqBOpc4/1AeaGq+xsu0lw2g4NMDcOVMXWLct588CD+SKU3
	 euRQeg9NdlAFWE7/BgmggCIgN+U1HrxHtyv/XnAR2svAu712Wx5ZvnX4BcPFGKoJMn
	 3CMVeqTDDXODBMlFb41L1RzWYTKRArrKSNNGtABV5LfiOLh7hzt44dr8gpGLfCmTiK
	 LwRgdgw1Vecyw==
Message-ID: <4e0f7aac-fd1e-40b7-a71e-47d02f10f3d2@kernel.org>
Date: Mon, 15 Jun 2026 09:42:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with
 special WSA channel mapping
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-113125-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EC2B684B62

Thanks Neil for the patch.

On 6/10/26 8:41 AM, Neil Armstrong wrote:
> The WSA Speakers are connected on the WSA2 interface, but the
> WSA and WSA2 links are handled as a single dai and DSP interface, so
> we need to specify the channel mapping of the Ayaneo Pocket S2 for the
> WSA dai in order to have functional playback and avoid DSP errors.
> 
> Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
> callback in order to set the proper channel mapping.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/sc8280xp.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 1f3afc6d015c..2f1688c9f317 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -14,6 +14,7 @@
>  #include "qdsp6/q6afe.h"
>  #include "qdsp6/q6apm.h"
>  #include "qdsp6/q6prm.h"
> +#include "qdsp6/q6dsp-common.h"
>  #include "common.h"
>  #include "sdw.h"
>  
> @@ -49,6 +50,7 @@ struct snd_soc_common {
>  	bool codec_sysclk_set;
>  	bool mi2s_mclk_enable;
>  	bool mi2s_bclk_enable;
> +	int (*snd_prepare)(struct snd_pcm_substream *substream);
>  };
>  
>  struct sc8280xp_snd_data {
> @@ -193,12 +195,58 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +/*
> + * WSA and WSA2 are handled as a single interface with the
> + * following channels mask:
It should not be handled as single interface in this case, you could use
WSA2 as it is.

> + *  __________________________________________________
> + *  | Bits  |     3    |     2    |   1     |     0   |
> + *  ---------------------------------------------------
> + *  | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
> + *  ---------------------------------------------------
> + *
> + * The Ayaneo Pocket S2 speakers are connected only to
> + * the WSA2 interface and the WSA interface is not enabled.
> + *
> + * Set the channel mapping on the WSA2 channels only.
> + */
> +static const unsigned int ayaneo_ps2_channels_mapping[] = {
> +	0,			/* WSA Ch1 */
> +	0,			/* WSA Ch2 */
> +	PCM_CHANNEL_FL,		/* WSA2 Ch1 */
> +	PCM_CHANNEL_FR		/* WSA2 Ch2 */
> +};

So we are are playing 4 channels on a 2 channel speakers?

There is also a patch by Abel, on allowing userspace/ucm to set the
channel map for WSA at https://lkml.org/lkml/2026/6/10/1002
Its worth having a look.

--srini

> +
> +static int ayaneo_ps2_snd_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	unsigned int channels = substream->runtime->channels;
> +
> +	if (cpu_dai->id != WSA_CODEC_DMA_RX_0)
> +		return 0;
> +
> +	if (channels != 2)
> +		return -EINVAL;
> +
> +	return snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
> +					   ARRAY_SIZE(ayaneo_ps2_channels_mapping),
> +					   ayaneo_ps2_channels_mapping);
> +}
> +
>  static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  
> +	if (data->snd_soc_common_priv->snd_prepare) {
> +		int ret;
> +
> +		ret = data->snd_soc_common_priv->snd_prepare(substream);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
>  }
>  
> @@ -273,6 +321,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
> +static struct snd_soc_common ayaneo_ps2_priv_data = {
> +	.driver_name = "ayaneo-ps2",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.snd_prepare = ayaneo_ps2_snd_prepare,
> +};
> +
>  static struct snd_soc_common kaanapali_priv_data = {
>  	.driver_name = "kaanapali",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -341,6 +396,7 @@ static struct snd_soc_common sm8750_priv_data = {
>  };
>  
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
> +	{.compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data},
>  	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
>  	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
>  	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
> 


