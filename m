Return-Path: <linux-arm-msm+bounces-117521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/5ZGGX1TWrUAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:59:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C87226A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:59:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZyDgVcci;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117521-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117521-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69DD8304E706
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3C23EB0F5;
	Wed,  8 Jul 2026 06:53:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781E3E9588;
	Wed,  8 Jul 2026 06:53:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493601; cv=none; b=PR7rDiMbxiScPwjyUDDeoSskN867eDxBTCXBEZxcRwogjH9Tt3xrZ5UzmhepP9lMNeGx60natHljKKT8y2eFfMQSZe/+UtM6KD74gi70R89q4b84Pe0zDKQNwtO5qHK2O2pYf96UdDKTJ5eDlDKRr4B55YLjdSLNhjiFbFl9vwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493601; c=relaxed/simple;
	bh=1TXg+jK8In1FaQwsjF+jePgIXle8DMAOtx8Esy8woPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjpYi/3pWQxCCFD9Pcy+4oaj53bL3Ej+tgSmcZUGtlEQAKGjyJsXQF3ipKpqDv7tvsONNW8Ynvokzlv5JL8VVmegQu/zkG1CXTOYz0d7Rg6m5aYmWpriLWWApGvhg9i8lg7m7vJReFfE1qW6+p2+h5V26eJ7/xGly8SS3bZNdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyDgVcci; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2949C1F000E9;
	Wed,  8 Jul 2026 06:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493591;
	bh=fSKoVHmkmzgUBU6Cv1GH58P6FokBu3F6zxcPPURGhhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZyDgVcciAuDMjpNLTmx8QZ+oa1Ga7XKkqbglVo1g3Dv0l5hZTnbCFNGttBOky/hal
	 oxXkElND74dV8prkv0vcE+haH0pSWIjBbABLp7NaJ1qZemMbM1jCRG2e5ARMSEERTl
	 JY9kOK43TU/W+y9oOpyR8l278dp17XDBrMhMSbWdYwCW4QtF67Legjbu4eAVghfzOI
	 jwQADZ9tasG0CDeyvZe4giheSDC54LP+W5VL3VVkk1A/Q+dYOJQ76RsTwf/+9/KJtq
	 AFMEOqtNAWn8/1hdQScoG0loAVRIDA8LBhQXTynADqQGg7tRr1Wl4zyQfOVOyDJC1D
	 RRHdj16VBpJUw==
Date: Wed, 8 Jul 2026 08:53:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
Message-ID: <20260708-calm-lyrebird-of-tranquility-88fcf6@quoll>
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
 <20260707190106.2876465-4-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707190106.2876465-4-prasad.kumpatla@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117521-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 100C87226A3

On Wed, Jul 08, 2026 at 12:31:02AM +0530, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


