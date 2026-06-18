Return-Path: <linux-arm-msm+bounces-113810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id djcuK8ZtNGrUXwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:14:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E0B6A2EA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:14:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I8L3CRmu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113810-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113810-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22C52300E26F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 22:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94502343882;
	Thu, 18 Jun 2026 22:14:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B215A85A;
	Thu, 18 Jun 2026 22:14:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820866; cv=none; b=evAJYF8wJfQ0p9FEnFwmur7Ii4HuuWwLUIlQSj4tPfYvM6LPArNNs/53G6BoDeaGY0ClqyUCBzwiARLV7/NsELOESBfHjQcdqtNdpis2yfI5CqYzvwc/JZG1nhNzDf+gqfsZSMv2ngF9KQyNPSW7O//LpPvM9oSN2+yHZ7erTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820866; c=relaxed/simple;
	bh=FSeD4FLEzQXxH6NdAi3KJUJf4e/24qr9YHL4I3rCRk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbqTJ5XLJiZO6kRL++hU0/4IVstsBvB7+cRAfNt81GF4oemHAeY16qdnIJ/LLBu2HmBzNWhJq6lSaI4Xd+w9JcwF/y8vYaWbjhjBK4YzoEbQgg1SQrU39lcFHW3BOx0bnEOqOfGJm51T+cDaP5X/gYXUh2NcJp29ZCryZezlZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8L3CRmu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEEA1F000E9;
	Thu, 18 Jun 2026 22:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781820865;
	bh=RJN9fmk/nbRMzWrPea76BTBFaLMq88wd92t9s7CSLxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I8L3CRmuUmqLdVzTXIXP7IKyew2bqbUwmgHy0PlnETUmenge9CtJ+I4DoHPO0R0bN
	 fKnaca7iQ2QppZpwwhLSURqUqKVFvVhBH1O/RXUBzm6EDjXoxXe5SSuvx+a9ETcAss
	 zPN6+93JJBkhsuC6c+CYeFdvPOHaQjTP2iKqJqqJqMr+hgtXwCnLffCYQ4GRFfynw1
	 4kW70g0diDha89Cp5HGaUTt5GVZlMqaz3uolhPyxggV9ooV5vOr6WHDkgMZaImCTeP
	 9jXyq59aO7mCawK62/LLlzHxAZDMEc76jm/n3vCylrrnAqAazkKrcj/jjF4cTOE1pP
	 SZC2Ir0/tZmcg==
Message-ID: <39e90d95-0bae-4eb8-96d4-6e39aae432b2@kernel.org>
Date: Thu, 18 Jun 2026 23:14:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: sound: qcom,q6apm-dai: add optional
 qcom,vmid
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mohammad.rafi.shaik@oss.qualcomm.com
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
 <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113810-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25E0B6A2EA8



On 6/9/26 7:40 AM, Ajay Kumar Nandam wrote:
> Add an optional qcom,vmid property for q6apm-dais nodes to describe
> additional VMIDs that should be granted access to PCM DMA buffers.
> 
> The property is optional and bounded, and driver-side validation will
> reject invalid values such as including HLOS in the list or VMIDs that
> exceed 31, matching current SCM source-permission mask handling.

This is totally sounding like non-human text and not really adding any
value other than word count to the commit log.

It would be simple and clean to describe  why this property is needed
and which platforms would be benifit from this.

> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6apm-dai.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> index 9e5b30d9c6e6..b767625985a7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> @@ -20,6 +20,16 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  qcom,vmid:
> +    description: Optional list of destination VMIDs to share PCM DMA buffers with.
> +      HLOS retains RW access as source owner and must not be listed.
Description is not clear and accurate, this property is mandatory on
some platforms where we have mDSP providing audio services.

Pl remove HLOS and expand VMID.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      minimum: 1
> +      maximum: 31
Why is the max value 31, do you have predefined list of VMIDs ?
> +    minItems: 1
> +    maxItems: 8
> +
>  required:
>    - compatible
>    - iommus


