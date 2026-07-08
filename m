Return-Path: <linux-arm-msm+bounces-117531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nBlECir5TWoKBAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:15:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22972289E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:15:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N9tx2mIa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117531-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117531-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DF7F3001CEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2843EFFAC;
	Wed,  8 Jul 2026 07:15:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4C3F1ACC;
	Wed,  8 Jul 2026 07:15:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494925; cv=none; b=c+LYvdzpKSnWz08eAikLuDdCVgpBc3v+2naYHZaW0azixLbGrJ4CLc8wyX20P0KsDBYdGIQQxXlujVQD7eteWZ7ltU9hCwmBfdfhIUlc4OZyhzXX33qcnYxdDYALmh3otrCdVtAl1b31nrbSVC/T/KT9w3E9YSTAvJ9R/YWUfPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494925; c=relaxed/simple;
	bh=92LPYcJtL6s1IN9Of4SR/bXrT7oaeXLuqial9Ohbzv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu4JysRpRXrisNQ98zGGLMG80DVPE/M1Usdjy3LiopCtUjLHMbM4oWmI4DkVWbHUmKpiCKCdqZ/forxU1S5DJ7AELoWh5D+Vi5xq4ypDbasuKvYD/mXcQLvpmQpEu/pQJK96s8CsUU57l3mTNLYFt44/T+LUBI2KpeyjxGTEows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9tx2mIa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE6C1F000E9;
	Wed,  8 Jul 2026 07:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494906;
	bh=1SdiBOoVm/OzlyqeV/kwd8oyweZKdg4Gu4ZU02hH1og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N9tx2mIa8W8k2BP1rQkme7u0zKobY24Pd4XqT0Rg00Tsk/1JOtZiWDM5by6epkhub
	 FDoQ7OdN7NPVaahRunnAaTk4mG7J3rq82CbeFHlf3wotNfEZ5HMDRKJy7Da6yYk3q6
	 Y6E+uGgbLyjZ1k2cffzLNp4flSLeNLwO9KefAoIIE2RlW7eWF2GPu2hcn41ZShDTLG
	 6dkU3Ni5NsdOAxvqnfO9OD52ljzAz0FbLxxcn+wxcSTiKXs0E5H+dGNyltB5UM1r2r
	 qJJMUlzC/gMG6A1dwmjFFWjxAR4qE0CP2HUYb3ZALklh7XeqawpKXRZYWk46qJRjzO
	 nFha/cYBA+ILA==
Date: Wed, 8 Jul 2026 09:15:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1 2/3] ASoC: dt-bindings: qcom,sm8250: Add Eliza sound
 card
Message-ID: <20260708-strategic-butterfly-from-wonderland-7e2b38@quoll>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
 <20260703073434.2589657-3-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703073434.2589657-3-ravi.hothi@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117531-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D22972289E

On Fri, Jul 03, 2026 at 01:04:33PM +0530, Ravi Hothi wrote:
> Add bindings for Eliza sound card, which is compatible with
> the existing SM8450.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


