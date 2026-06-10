Return-Path: <linux-arm-msm+bounces-112315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NEEMFHsJKWqdPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:51:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1C7666649
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:51:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EZG+TaM2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112315-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112315-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 905A03028774
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157B1374A09;
	Wed, 10 Jun 2026 06:46:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6451898FB;
	Wed, 10 Jun 2026 06:46:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073991; cv=none; b=L1O6i71hggVAfxjVnPjfXMZMX7wb8eq3RdDhd5ksEHMETFqo6pehzH02hkfPYEPW7O47JKpFQoYx2kRF/z6RpW7ZSQHXT6SEijkMjvuWppfTTz2bBQF1BUiCkLlFKHmdIXG7MSLDmac8b97388ULEqW2OYE0MFWLQfHM4p/pFzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073991; c=relaxed/simple;
	bh=u7YOelhDPOkEe+ygseQFg3HIJ9G3EzeUC1EcSXKcsZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hav0Uf/zTQ1trNNWD9i/phj179Kj1Zxn9X5bNjY1sVwQS/Thyl7YH41ibdWdloLQd+CZxBYoI4i7y8Eddg2icQVF7EqvLtYCzOdtKZPdQd6yFjQ9AYDtxp1ltBOLqtvL4y7HTTkje+n8efXgY8A8F2jSdz2ppZwuRgeHcrEaHUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZG+TaM2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C889B1F00893;
	Wed, 10 Jun 2026 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781073989;
	bh=FkPXCepqRUy7nsilnfQjzTEdRMA/rcS9qrVjc1EIpEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZG+TaM2xOpdStnA9Jj0JTI/bmcAeK3mjLG8WjJExrqA2egzTyv0tNIjZT61T19q8
	 MG2LSopad03konOE+mIhicx3PuVrYs9NGDOoBTLxAVQbgwv4Jwo23dFFqNxfnX2eJm
	 q8PCh4E3IYadW1IBXgfyahbmAy0Xawt+sb0wJ3ciQKIcqBnZfs1nC3sQIZ2k+x16MM
	 pK8Q85vFWeob3fIQCYvnB+N+R+RAMM7226gvfwC0dHHNi0yiO8AQJzzZMjghfL27Dk
	 Lmo2jD/uB0b6dJBS5D0EJHsUCBejUVkgDIzFISPnE2C41sbWnFckLx9ssaoIIvCKlw
	 bHunyZPs8QICA==
Date: Wed, 10 Jun 2026 08:46:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>, 
	Adam Skladowski <a39.skl@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 02/15] ASoC: dt-bindings: qcom: q6dsp: add support for
 lpi mi2s ports 5-6
Message-ID: <20260610-humorous-shrewd-lizard-e54276@quoll>
References: <20260609162255.31074-1-mailingradian@gmail.com>
 <20260609162255.31074-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609162255.31074-3-mailingradian@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:setotau@mainlining.org,m:a39.skl@gmail.com,m:vladimir.lypak@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:johan@kernel.org,m:kees@kernel.org,m:ckeepax@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:a39skl@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112315-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,mainlining.org,oss.qualcomm.com,opensource.cirrus.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,quoll:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D1C7666649

On Tue, Jun 09, 2026 at 12:22:42PM -0400, Richard Acayan wrote:
> There are 7 internal MI2S ports per direction found on devices with the
> internal sound card for Snapdragon 660. This is similar to the LPI MI2S
> ports, and the LPI MI2S bindings can be reused for internal MI2S. Extend
> the bindings for LPI MI2S ports to accommodate the internal MI2S ports.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 4 ++--
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h            | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


