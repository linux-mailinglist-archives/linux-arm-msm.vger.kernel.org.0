Return-Path: <linux-arm-msm+bounces-105580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOfAMiiJ9mkUWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 01:30:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1258D4B3A7B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 01:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E35C300CE63
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 23:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DC7313E0D;
	Sat,  2 May 2026 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRsBz1Fm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7743128B0;
	Sat,  2 May 2026 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777764606; cv=none; b=eCLVDINsmUOTngFnjvLIYEXPDgs5KCLaDT4fVTXdwW2wGY4+Nu3M2AUtZ7NLYqS28db1unXaFR3bIbT90OkKBc0H/wWBVpHaMZ7yGjVmtczlvu8xYr+u71XzqkbFzWL3CITisT1+OUd1ctDWkBbv05GiBvbC79tA6kQT+JJbMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777764606; c=relaxed/simple;
	bh=c8tSNJ5FwoK/bo93cmcfDUrwcAE4yfvaA0eLewWAF+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmUwAysVOAybehc2jP5tFR5Tv8o02LUhNP3xq7bnsvsba7G4RoMtEICjXEC8iXmA2RyrgIh8IVG2cYUlMiKb5wDHOZWxz2hoAWRwKvm0ROHypcthT+MJm5SUwAtjDAKDkzgB+Oe/dqgZXah0iPm/2bRSUJmyWqYblL0PygdGXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRsBz1Fm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36734C19425;
	Sat,  2 May 2026 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777764606;
	bh=c8tSNJ5FwoK/bo93cmcfDUrwcAE4yfvaA0eLewWAF+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRsBz1FmTh2Q5Q9XJsOjM0ygtpRp9u2sJUjsTJfmAlT6BAX+BtRLC3qPbG7otsIUz
	 oUUrtRV9UrXSsTYiCA1o6D8yKDHrgXknTDVAF1m2sT+ylQ5QUHbkmqZUubRHnWu19j
	 FDwOmuZM2by3QWCYyxjwZHvC/vg+6KmK9WO2mI+GYKMMMs+CqOenrqjH9/ryJs20Ge
	 vLx5kFi3mB5WMD36ZZoepeJECjmRe0+MlgsAZXSyZoE7cYmzIDMRxBpxDcvcMdG3Wc
	 4v+97CSntQKrvVNjLYqThpe8PF2sQys/tUGl5RGskDEmi3sezgIYwuauqq1puT67sS
	 /0gKm8mQ7idGQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1D14D1AC5863; Sun, 03 May 2026 00:30:04 +0100 (BST)
Date: Sun, 3 May 2026 08:30:04 +0900
From: Mark Brown <broonie@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 11/15] ASoC: qcom: sm8250: add support for
 INT0_MI2S_RX and INT3_MI2S_TX
Message-ID: <afaI_FuIq7Pb0kYh@sirena.co.uk>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-12-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5TVXTFgvmuU5e6Ml"
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-12-mailingradian@gmail.com>
X-Cookie: 667:
X-Rspamd-Queue-Id: 1258D4B3A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105580-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--5TVXTFgvmuU5e6Ml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2026 at 11:31:24AM -0400, Richard Acayan wrote:

> The INT0_MI2S_RX and INT3_MI2S_TX ports on SDM660 can be connected to
> the digital and analog WCD codecs. They can be supported with the same
> logic for other ports, but just need to be explicitly stated. Add
> support for these ports.

> +	case INT0_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case INT3_MI2S_TX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);

Should these both be using SNDRV_PCM_STREAM_PLAYBACK?

--5TVXTFgvmuU5e6Ml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn2iPsACgkQJNaLcl1U
h9A9wAf/ZF5dVK3iNZz2v38moW57Dc4bSRh94ogb4y6SZk1Swr1DMnHrZPXj3uTD
4nktAqqUvy/uMN3PGDbrNZRYIQIqgQ0i+YqNQZ9Pb53nKXWDe9iKCo9dEK8Hd1Ay
ANSTdkxFheOSEYhYqmlYmNiieMgdba65OYCRtDrhiVYwn5gRHF+HIC8R71f+ATdk
3/wqdpQzSStf0LA6tycbZv6mMtGTiapUry7uOQtiveSptW4ZAQvxy3IqXGrD313x
jiYzhDEmpN9W8WzIyhtE44ODZJWTvx4XDbMMUNZeLCMkC99OiUVeFMMRqn21HrAO
gSgKrRKqd5VnvuLTd34syj+4cC5Vow==
=p9nj
-----END PGP SIGNATURE-----

--5TVXTFgvmuU5e6Ml--

