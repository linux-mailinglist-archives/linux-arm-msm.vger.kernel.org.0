Return-Path: <linux-arm-msm+bounces-105594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDh5Ebs792kddwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:12:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6C4B58E1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09979300145D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 12:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956723AEF3B;
	Sun,  3 May 2026 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NscqoRvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA02FE074;
	Sun,  3 May 2026 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810360; cv=none; b=GZi6dhmPMBrKQwHV2Z6sSIDNNTgMJMF3ACKdInB+/5DMILuITUusztRgl2dKUzqL8Fa+cEfy3LaLUFzkENaCQkvFFBDeZm0GOvSt8V/15n3FMGKTQecg8pa9MLp3r0wncHBZwlh0QEWbgk/YN6mZ14oTQsSUg5Or48Hd33gwbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810360; c=relaxed/simple;
	bh=IgBpBg64K/E9k7iCYiUb8IIxrd2NcZrfehC67kuX3Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZiXUNuL83lX2jKXlDsbr2EIJTiPC6KKQyfpKkvy7mXbtuY4ekirgJeJQVqTCpLa2yIoyN3ZwUjaHkBbEvmbeJQKXLlUaFtsUPbmb4RqlpqoBQpbsuceoz94+hGYfw2DGJDEx/49hlG9sfnLpKqV9trCQW3ta/GpF+ykqoGzw28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NscqoRvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03D5C2BCB4;
	Sun,  3 May 2026 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777810360;
	bh=IgBpBg64K/E9k7iCYiUb8IIxrd2NcZrfehC67kuX3Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NscqoRvVI5Sz/H/u0wX22mlDBvbm++U8eVTu2iSomixNc2RogTENeUmA2bb5DQuql
	 Qd427v2p9hkHZp9DsVdrKrn9fvnj3POKVpIzFvCXSu/BedVhXVNCjnFW4wUUDeikGG
	 ITvBezg40A2AZGeu8PhY837mQJwVCK+KTpeeBCny7mifn34rhiHfHFi66/obzKX2zr
	 DfrVk0WdGOkvkkEs3Ma1Tnz8JWsF8WJB8tvYGJFI7I/JA7hX2MvkvXYdptAC5KkHFn
	 rSEJCNNOCclGhAjJpg0u3qvrGqOx/yjsNngNCQiXjdx+mlMyCF9dHxfAbNRPofyYCp
	 VIajLT2XXoqFw==
Date: Sun, 3 May 2026 14:12:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Nickolay Goppen <setotau@mainlining.org>, Adam Skladowski <a39.skl@gmail.com>, 
	Vladimir Lypak <vladimir.lypak@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add internal
 mi2s support
Message-ID: <20260503-bouncy-cheerful-jackdaw-cdcab0@quoll>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-7-mailingradian@gmail.com>
X-Rspamd-Queue-Id: C2A6C4B58E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105594-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 11:31:19AM -0400, Richard Acayan wrote:
> Add the internal MI2S stream capabilities as specified by the audio
> kernel modules and configure the ports as MI2S ports.
> 
> Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  sound/soc/qcom/common.h                  |   2 +-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 200 +++++++++++++++++++++++
>  2 files changed, 201 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index ee6662885593..be693b53a4fa 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
> @@ -7,7 +7,7 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <sound/soc.h>
>  
> -#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
> +#define LPASS_MAX_PORT			(INT6_MI2S_TX + 1)
>  
>  int qcom_snd_parse_of(struct snd_soc_card *card);
>  int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> index e5cd82f77b55..7006071f45a0 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -668,6 +668,205 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_5),
>  	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_6),
>  	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_7),
> +	{
> +		.playback = {
> +			.stream_name = "INT0 MI2S Playback",

Same comments which you completely ignored.

Best regards,
Krzysztof


