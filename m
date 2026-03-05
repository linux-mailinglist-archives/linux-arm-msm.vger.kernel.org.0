Return-Path: <linux-arm-msm+bounces-95528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNPAEnc3qWlk3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:57:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B530420D082
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB8293033266
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A05833B961;
	Thu,  5 Mar 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eq93sB3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D6D33B949;
	Thu,  5 Mar 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697460; cv=none; b=WsK8lVbmef0vwyFeoUX3fbysR4lEF/vWQpG+ThIgsWkworMFQ+1VP8CrDfpxoPnD+axn0pfwaHuKPhj1YyNM27ZTvQXGHN8J/k683S9DPi16q7lbNf3aXSA4urNBSZqU/TPVJB0Q3t7XGOjhhhhV6zXh43ttSZI+4Xt26v7RI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697460; c=relaxed/simple;
	bh=LTFCOG5QXLiQSKnu7SNj+IKfRYZTwEVJn8wWTsU0rXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehYUZ7oshWn+dWNnfpYgAWd9wXuCLeCV/3ugfHAgOP/UQwCXG3pr2MBGRJYMXM9TxEWNNQtgW54cNu1iMQTDJvDGX3hkts5VX8h9Ky0NBu556gDNTK4CirhBzGk1AO6aFiD1sLPb4B6WHZdNA5wVyG/1kIvdc4kdDOfxVpsdL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eq93sB3x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955BAC116C6;
	Thu,  5 Mar 2026 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697460;
	bh=LTFCOG5QXLiQSKnu7SNj+IKfRYZTwEVJn8wWTsU0rXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eq93sB3xaArZGPVhM1mPmY8W4sl3biK2h5i5jDNlSguadqXTPx9IgZ5tWipSAJmB9
	 N/zDvFpjmoBGM8P5a7r2tb6vOLWvdFu4YNEDxWL4TPwac6HgXAZTD2yJ2y20bJ2Rfr
	 K+QHBlHUHNw/JHAOGMZyyxAub/6P4GIOxWFMUCR68z26IDQHpYoKUBJgsBS5EPTV6u
	 O8BbRQx92ZWsTi34C0gsf0RC/VKaf6/3b21asXEI3uMreRXctXAEiE1fHZ846dWtkp
	 MOaIL/6GL2LmATWc4kgBmxgQQmwwBOtOffy411lETfZA2/MIqF5NYjq9y+upo8PPIm
	 Gu26d5F8fZYZg==
Date: Thu, 5 Mar 2026 08:57:37 +0100
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
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: qcom: q6dsp: add internal
 mi2s support
Message-ID: <20260305-fluorescent-gainful-unicorn-4f8d7e@quoll>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304195815.52347-3-mailingradian@gmail.com>
X-Rspamd-Queue-Id: B530420D082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95528-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:58:06PM -0500, Richard Acayan wrote:
>          then:
>            required:
>              - qcom,sd-lines
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 6d1ce7f5da51..6753f7bf004b 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -140,6 +140,20 @@
>  #define DISPLAY_PORT_RX_6	134
>  #define DISPLAY_PORT_RX_7	135
>  #define USB_RX			136
> +#define INT0_MI2S_RX		137
> +#define INT0_MI2S_TX		138
> +#define INT1_MI2S_RX		139
> +#define INT1_MI2S_TX		140
> +#define INT2_MI2S_RX		141
> +#define INT2_MI2S_TX		142
> +#define INT3_MI2S_RX		143
> +#define INT3_MI2S_TX		144
> +#define INT4_MI2S_RX		145
> +#define INT4_MI2S_TX		146
> +#define INT5_MI2S_RX		147
> +#define INT5_MI2S_TX		148
> +#define INT6_MI2S_RX		149
> +#define INT6_MI2S_TX		150

This conflicts with Srini's patches and looks pretty the same. Please
look at his patches and avoid re-doing them.


>  
>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>  #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> -- 
> 2.53.0
> 

