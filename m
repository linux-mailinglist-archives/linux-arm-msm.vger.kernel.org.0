Return-Path: <linux-arm-msm+bounces-95523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGxdCy82qWlk3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:52:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CBE20CF42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 695D43001070
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E2032E13B;
	Thu,  5 Mar 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5HWHWmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A5E32D7FB;
	Thu,  5 Mar 2026 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697118; cv=none; b=drHYuGJ2vcZ2A5x9RxcGNbPfV07+CGRECEYuox3TeEDdPCri6+02w2i13GWDHw14z9KK0E2Ugq7ETGdKW7U7cwqah0Qbk0F+cXZ9y68elIOlhvjKMQqD6DpvcEF2J6XzB6me7XjPzTSg4lSPomSmsFn3STvujRuxiagE310dyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697118; c=relaxed/simple;
	bh=0CK2Jdavr+yUdl57OhO3y9nKTUk9/Qrm2nJwyhFSLNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqAdLGjuA1J7S6KbwOz4BiGJgMThLqt76UZOtuP/J8L0PrSByh72HmQi/KE569KzK2OC+B+1p90InzgeudKg+0XdWXRz+iv3NWI1th159eLxnMoXL+mVBlTmDv/jKQG7X3ZNqInRJGDuXLpwWVS3lP/4L0w9ocSFCwxVbHDbXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5HWHWmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5A6C116C6;
	Thu,  5 Mar 2026 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697117;
	bh=0CK2Jdavr+yUdl57OhO3y9nKTUk9/Qrm2nJwyhFSLNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5HWHWmITfNBTDrdHNfdkY2Zd5XM1EAsMQ+hwHlpAq4lu6DfT8nzrGwxB6JsRAdg5
	 WJ1ToEAlsCKH3te0xbCpP1f1qiVq/9KrwOy4MiJ6QYY1sCIEeWNrXSf0bFmNcKjWw4
	 koc9u9Xw8iVvlPvguzfmh4k7G81gzmjL70Sg3oTgawsPi1TrZb6eyqn9Vk1ScOAduK
	 SNiZbFqiEvIwGO5D5Q3+1fp7smIQMDUxM0enmnuX0Y4PutC/PM7X7e4/NldTlp1nd3
	 sr4h/w+pwyCHAlrMcNe4K2UI02nBNFQOoMTgqqGSszTJWbG6eyMw+gtpiBtgwN2232
	 90Ql4CBYImGng==
Date: Thu, 5 Mar 2026 08:51:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 10/11] ASoC: qcom: add sdm660 sound card support
Message-ID: <20260305-industrious-sheep-from-eldorado-4413a5@quoll>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-11-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304195815.52347-11-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 35CBE20CF42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95523-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:58:14PM -0500, Richard Acayan wrote:
> The Snapdragon 670 and Snapdragon 660 share the sound card, which can
> have digital/analog WCD, WCD9335, WCD934X, or board-specific sound
> codecs. Add support for the sound card.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  sound/soc/qcom/Kconfig  |  12 +++
>  sound/soc/qcom/Makefile |   2 +
>  sound/soc/qcom/sdm660.c | 192 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 206 insertions(+)
>  create mode 100644 sound/soc/qcom/sdm660.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index e6e24f3b9922..2ef4c436e534 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -167,6 +167,18 @@ config SND_SOC_MSM8996
>  	  APQ8096 SoC-based systems.
>  	  Say Y if you want to use audio device on this SoCs
>  
> +config SND_SOC_SDM660
> +	tristate "SoC Machine driver for SDM660 and SDM670 boards"
> +	depends on QCOM_APR
> +	depends on OF
> +	depends on PM
> +	select SND_SOC_QDSP6
> +	select SND_SOC_QCOM_COMMON
> +	help
> +	  This adds support for audio on Qualcomm Technologies Inc.
> +	  SDM660 and SDM670 SoC-based systems.
> +	  Say Y if you want to use audio devices on these SoCs.
> +
>  config SND_SOC_SDM845
>  	tristate "SoC Machine driver for SDM845 boards"
>  	depends on QCOM_APR && I2C && SOUNDWIRE
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 985ce2ae286b..8b6bdc19e780 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -24,6 +24,7 @@ snd-soc-apq8016-sbc-y := apq8016_sbc.o
>  snd-soc-apq8096-y := apq8096.o
>  snd-soc-sc7180-y := sc7180.o
>  snd-soc-sc7280-y := sc7280.o
> +snd-soc-sdm660-y := sdm660.o
>  snd-soc-sdm845-y := sdm845.o
>  snd-soc-sm8250-y := sm8250.o
>  snd-soc-sc8280xp-y := sc8280xp.o
> @@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
>  obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
>  obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
> +obj-$(CONFIG_SND_SOC_SDM660) += snd-soc-sdm660.o
>  obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
>  obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
>  obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> diff --git a/sound/soc/qcom/sdm660.c b/sound/soc/qcom/sdm660.c
> new file mode 100644
> index 000000000000..8dae01b733dd
> --- /dev/null
> +++ b/sound/soc/qcom/sdm660.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2020, The Linux Foundation. All rights reserved.

Don't upstream 10 year old code, but take newest drivers and change them
to match your needs. Look here:

...

> +static int snd_sdm660_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct sdm660_snd_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	card = devm_kzalloc(dev, sizeof(struct snd_soc_card), GFP_KERNEL);
> +	if (!card)
> +		return -ENOMEM;
> +
> +	data = devm_kzalloc(dev, sizeof(struct sdm660_snd_data), GFP_KERNEL);

This is not the syntax we have. For like 10 years.

It is always sizeof(*).

Best regards,
Krzysztof


