Return-Path: <linux-arm-msm+bounces-104130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HV2I2zU6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:00:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02625446FFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3032300D602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756D83EBF01;
	Wed, 22 Apr 2026 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myI3bHfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516133EBF00;
	Wed, 22 Apr 2026 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776866410; cv=none; b=V5lCfGsenroTe1qxqUiYCVtUxe7QpQTIpu5xzDIgQFoUOdXV+tkXS80hWHG4XqJ9/oroMmdu/+Wi3h9zY2HrKnemdA9qERqqPJNR8JwhI0PtNEZvvQdUlrMm+u1J0gjwodZCVxWDaXVKoLVtG5vQrkR0a6vQfKKl08/vEvbzFwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776866410; c=relaxed/simple;
	bh=2grIjbJFTI4YTLJzlvWVX3WAqgdl/RXVxEGZA5Wo0VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWnuibBC/zRJZjncezst52KiIi0xf8i3aDw+1NRFYkK+3KIkaRvik1EZtY/czpphJwBW/FgAQp1gvTEfVQ5XaK+BnIkwUuiPrpVteLrWb7ZrQzoNEKDINcSz4LhDuOMUAFh/2aQv3rtWn3Edm0ZYDBPMdtX+0Q9AmjpPP7Oep9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myI3bHfz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB4DC19425;
	Wed, 22 Apr 2026 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776866409;
	bh=2grIjbJFTI4YTLJzlvWVX3WAqgdl/RXVxEGZA5Wo0VE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=myI3bHfzY8bPSzrxEPBrG89TnALMQo5JcXSDUqYIsJnUWT6lETAAkCkAfva/X+bkU
	 SCi0PTYakEGt9/e2lqiLna2CsI2jtHhmvPgU3lXTRz4EBvFuHBEx5noMGu7koHhs5h
	 ePGXwXU6/vLmQE/gYzq7i3Q64Im9TDJDZwHWiW5alyZ8zf6vFquECy7lhCLfLPkw85
	 qUdvHXksCaoccSQt9VSp9S4P590IPG1ba0jvUPUPxr5/01rGP/3DQLe2aGrRxYBT7C
	 XdU+4SPM6lGcGwoCBtGdn9ifgD8Zezc8KUqHmEN4eNMqSvbQUjOh3iX7hKbbHP5L8J
	 xKMnWf7DLh2uQ==
Message-ID: <10c61642-da1c-4811-841e-ca5061d93032@kernel.org>
Date: Wed, 22 Apr 2026 14:00:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: x1e80100: limit speaker volumes
To: Tobias Heider <tobias.heider@canonical.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20260422-x1e80100-audio-limit-v2-1-333258b97697@canonical.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260422-x1e80100-audio-limit-v2-1-333258b97697@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[canonical.com,kernel.org,gmail.com,perex.cz,suse.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02625446FFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/26 1:30 PM, Tobias Heider wrote:
> Limit the digital gain and PA volumes to a combined -3 dB in the machine
> driver to reduce the risk of speaker damage until we have active speaker
> protection in place (or higher safe levels have been established).
> 
> Based on commit c481016bb4f8 ("ASoC: qcom: sc8280xp: limit speaker
> volumes") which addressed the same issue on the sc8280x SoC with some
> minor changes as explained below.
> 
> The Digital Volume behaves almost identical to sc8280x since both use
> the same lpass-wsa-macro, but x1e80100 has two sets of controls prefixed
> with WSA and WSA2.
> For PA x1e80100 machines use wsa884x amplifiers which expose a linear
> scale from -9 dB to 9 dB with a 1.5 dB step size giving us
> 0 dB = -9 dB + 6 * 1.5 dB.
> 
> On x1e80100 there are two different speaker topologies we need to handle:
>   2-Speakers: SpkrLeft, Spkr Right
>   4-Speakers: WooferLeft, WooferRight, TweeterLeft, TweeterRight
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>

Thanks Tobias for doing this, this has been long pending.

Bits required for Speaker Protection are also getting tested, hopefully
we can soon send it out.


Tested it on T14s and Dell Latitude 7455

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>




--srini
> ---
> On x1e80100 laptops like the Lenovo T14s Gen 6 most of the audio
> enablement work has landed upstream at this point meaning it works
> out of the box on any Linux system.
> One unresolved problem is that there isn't a solution for active
> speaker protection yet and the current default seems to be unsafe.
> 
> With the current defaults it is trivial to crank up the volume to
> a point where the T14s will hit what I believe is a hardware
> protection that shuts down the speakers entirely until the next
> reboot. I am worried that this means there is also a risk cause
> permanent hardware damage with the default settings.
> 
> This patch adopts the same limits we currently use for sc8280x to
> x1e80100. With this applied I can't trigger the same shutoff I
> described above.
> ---
> Changes in v2:
> - Adjusted Digital Volume names as suggested by Mark Brown
> - Link to v1: https://lore.kernel.org/r/20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com
> ---
>  sound/soc/qcom/x1e80100.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index a3f4785c4bbe62e7e027deb6d810e0a0275d81c2..c81df41ace8839cf912a55514518f1d8cd3e58c1 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -27,10 +27,29 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
>  	struct snd_soc_jack *dp_jack = NULL;
>  	int dp_pcm_id = 0;
>  
>  	switch (cpu_dai->id) {
> +	case WSA_CODEC_DMA_RX_0:
> +	case WSA_CODEC_DMA_RX_1:
> +		/*
> +		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
> +		 * to reduce the risk of speaker damage until we have active
> +		 * speaker protection in place.
> +		 */
> +		snd_soc_limit_volume(card, "WSA WSA_RX0 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "WSA WSA_RX1 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "WSA2 WSA_RX0 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "WSA2 WSA_RX1 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 6);
> +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 6);
> +		snd_soc_limit_volume(card, "WooferLeft PA Volume", 6);
> +		snd_soc_limit_volume(card, "TweeterLeft PA Volume", 6);
> +		snd_soc_limit_volume(card, "WooferRight PA Volume", 6);
> +		snd_soc_limit_volume(card, "TweeterRight PA Volume", 6);
> +		break;
>  	case DISPLAY_PORT_RX_0:
>  		dp_pcm_id = 0;
>  		dp_jack = &data->dp_jack[dp_pcm_id];
> 
> ---
> base-commit: b4e07588e743c989499ca24d49e752c074924a9a
> change-id: 20260421-x1e80100-audio-limit-f6e75e0ad422
> 
> Best regards,


