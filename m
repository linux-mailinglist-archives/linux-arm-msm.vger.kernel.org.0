Return-Path: <linux-arm-msm+bounces-103145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLAvMRNP3mndqAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:28:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 416DE3FB336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6596930584B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7319E3E717D;
	Tue, 14 Apr 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6x2ijRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02B264617;
	Tue, 14 Apr 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176502; cv=none; b=skWcscau/Q+D4TbveqXKs7X5RCW3dnwLOq0EBq1jHh3IBqVKPBSx6G40BsT6rtUQ1u8l4O44+UPvl1vb1k1Ir7FiDRzTGAs/JG3jEO2HtPaV6dwKXuXDvvioRa4LnoxfK3T9MbFQoxw7nXAc7/iSIr2oYi4Pz4aV4vORciq+7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176502; c=relaxed/simple;
	bh=542y0Reg1wfkN39Mlm8Bc6OnGlzXXf9YYnupzX+2uE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dz+khY+IW6EGcrBvgxk5YG+fHw+rXP2/wmPvTOfygqBKIWMBo36IGC4QI6znZlY2AD+vwSLjZXyE5m+2zz8ixxti9FQ440UCelUew4ZP1xBs5nx43ACj3bCWJLXMdhth1FgWlKxESef+xTY1KaqICVSlyZlL8R31kWUnJ86J2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6x2ijRE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E017DC19425;
	Tue, 14 Apr 2026 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176501;
	bh=542y0Reg1wfkN39Mlm8Bc6OnGlzXXf9YYnupzX+2uE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6x2ijREgwH+UStvzWlGDEDBRe8zB8b6za1EM+WgFeFv7NV9cad02cipg52mkzmYn
	 Lz6fPhjs9Ll0z202yAJV3k98Kt6ZBlVNQ0YBk74hs/r4P6iys1z+o1qiOMamVt8oET
	 D0OquLq8xRQr9ZmNUKSWBHbD91owjeTSO7qoJcdkH/30MkHvVwBLjWohdP4IH7FTZa
	 oG+SjwvWNmfv4b3t262b+J1bP+2bD/7AsjuOgiOoTdJf9K0MW4dLN+C4bK9dvPQSpi
	 BXi/zGNPp9OhlnmSo4aqzldBjvsz9a/H899YuRwJ4ia/5MdKYRmYT/jV9WI2uAYMt5
	 l6zFsN9qb4xCw==
Message-ID: <f9806784-8145-407e-b77b-403327aaccf1@kernel.org>
Date: Tue, 14 Apr 2026 14:21:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] ASoC: qcom: q6dsp: Update bit format support for
 secondary i2s
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103145-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 416DE3FB336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/13/26 9:19 AM, Kumar Anurag wrote:
> Add 32bit for playback and capture over secondary mi2s.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

Pretty much simillar changes a are already submitted by "	[PATCH v1 0/2]
ASoC: qcom: q6dsp-lpass-ports: Add support for extended sampling rates
and PCM formats"  https://lkml.org/lkml/2025/11/18/673


--srini


>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> index 4eed54b071a5..0664f18d7a44 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -380,7 +380,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  			.stream_name = "Secondary MI2S Playback",
>  			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
>  				 SNDRV_PCM_RATE_16000,
> -			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +				   SNDRV_PCM_FMTBIT_S24_LE |
> +				   SNDRV_PCM_FMTBIT_S32_LE,
>  			.channels_min = 1,
>  			.channels_max = 8,
>  			.rate_min =     8000,
> @@ -394,7 +396,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
>  				 SNDRV_PCM_RATE_16000,
>  			.formats = SNDRV_PCM_FMTBIT_S16_LE |
> -				   SNDRV_PCM_FMTBIT_S24_LE,
> +				   SNDRV_PCM_FMTBIT_S24_LE |
> +				   SNDRV_PCM_FMTBIT_S32_LE,
>  			.channels_min = 1,
>  			.channels_max = 8,
>  			.rate_min =     8000,


