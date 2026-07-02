Return-Path: <linux-arm-msm+bounces-115844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A/McMTQQRmr+IgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:16:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFB6F411E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:16:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YMeRtYBn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115844-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115844-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31A9E301A3AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DF738F925;
	Thu,  2 Jul 2026 07:12:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E938F92A;
	Thu,  2 Jul 2026 07:12:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976332; cv=none; b=AV8EJ62yrzjE/gGvgSuxj1t/RvihC/OXTXiUCr7r0AMKWddHsWT4+l5rnxHfR9Hj8XLA1RjkpwIzP1QC7Jgy30S2ko6AUto7qlz0CdPWE43ROF1Z3gq5eRt5OLmY+5y3JpkZFFxN8G5wGl2sPDgEpqlWPE4+JmR+mriz6KVWoc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976332; c=relaxed/simple;
	bh=7xvk1tOx/mGc+/2avUHFclUJEvlifOrpq7q22vMUXSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKIvcV9wwgfw03WUuDYlMY6AbKm9xmi86ydjNBUxK7ynDoGqG1NTyMO90WQBUJoyg9z2E8U1rtok9XERXu0mOEmQefvW0ohm5R0PNFPlrl4NANQP8q2v8Q9F6ljFN7CbAWouRlGGo7Sg7IvCDS16Rpogf7+5O19O2xCufs9++Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMeRtYBn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D8A1F000E9;
	Thu,  2 Jul 2026 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976331;
	bh=bzLKKMe7jbApEplxjumz0k1RO7TakfAge4mkRtGwUZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YMeRtYBnVfjpYfSLhaNKUs1/gnunMJB8tODQPhSmYUG+2eOgODs9zfLIGTymK8Cyz
	 LYsmSAonAdZABPe3rVlx9qvsHjdAhLh3bAX7465oDXpuJ0sp0eUmEgw0ppo+KstBil
	 uPx+g2u0s5krkVStfBTZrq8dKrjH7MV130tVJeaaw3fpoRjImT+rZpbEmiSlzJcJJY
	 iUQa9s7r/3DSj5AUE7t3KTzMv6J1/SysimbVdGvnYWRwtFXDAPu1lsRKhR30UAJiFP
	 BJlGcbp/cDB9yJ8IxbGkPctFcYQfTI5+4/y6bZGafVG4b/ZR0/nn35UoDCL8t764GW
	 Zf0LAOKbP8Ffw==
Date: Thu, 2 Jul 2026 09:12:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] ASoC: qcom: Add generic of_xlate_dai_name
 helper and use it in lpass-cpu and qaif-cpu
Message-ID: <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115844-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39AFB6F411E

On Wed, Jul 01, 2026 at 04:27:52PM +0530, Harendra Gautam wrote:
> Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai
> phandle argument to a DAI name by searching the component's DAI driver
> array by ID. Each driver currently implements this identically.

Heh? Identically? So why even doing this?

 +
> +static int qaif_cpu_of_xlate_dai_name(struct snd_soc_component *component,
> +				      const struct of_phandle_args *args,
> +				      const char **dai_name)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +
> +	return asoc_qcom_of_xlate_dai_name(v->dai_driver,
> +					   v->num_dai, args, dai_name);
> +}
> +
> +static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
> +	.name = "qaif-cpu",
> +	.of_xlate_dai_name = qaif_cpu_of_xlate_dai_name,

I miss something - qaif_cpu_of_xlate_dai_name() wrapper and
lpass_cpu_of_xlate_dai_name() are identical. Why can't you use
asoc_qcom_of_xlate_dai_name() here directly (or
lpass_cpu_of_xlate_dai_name() without all this renaming)?



Best regards,
Krzysztof


