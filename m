Return-Path: <linux-arm-msm+bounces-112353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2SPwKYwlKWr7RQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:51:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAB6676D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:51:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fJWYSfGI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112353-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112353-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D86830158BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAEA3AFD08;
	Wed, 10 Jun 2026 08:51:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E439A3A7F59;
	Wed, 10 Jun 2026 08:51:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081462; cv=none; b=IYmAufVqF9UU17U7YX6MKk1gKY7osyDOPdCfmLggD4hdOHHVuGzUhCqCriGXWAiBc+IgvDVZsN9kOVigkQOYCU6bRUH8yCq9CbgvzypV3UFu5XCRIbv1Y17WQoleJIbaC3gzxvqzVkpH1tVRJi8GcBUKRRgmtq+nrU9Tq+cSHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081462; c=relaxed/simple;
	bh=n13i9DN+x6itolrXfeCRqK1ypg2cYsP1x0umNA1LFYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6l+sd9xybgXbAnVMrtt7QCqJ+8k6cpnv3+SVg/hbYL6An7DxhPvb8yT24ihRoYdXEod7DHNJJ08yExGqvqf/GDB+lsiHR2TfwXySiP1nLv2+RiDZP6VjE93yXgCxB20JBBhYWLdYA+2Na6q1vJVazHJLB7+aobFGt9Gp8Ox+tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJWYSfGI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89411F00893;
	Wed, 10 Jun 2026 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081461;
	bh=nwFfqw6RTmiqHr0J4pBOGyY2zipkP9FlsxvhdxTXaGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJWYSfGI1h2OdJnrFwuzsE0a0y9u0fzo9Wnvvlld4CPgKEo8Oxi4fdDxp2iQIuxSn
	 QvZWmQBerkfiK2Hoc5+vS5vktoY7WdfZxS0qJ7G+p73MTOxTnXzxtL8sYdbjvmNxkl
	 7nuqEAKaHr56UW/5wYARxc/zCH4F7S6KIXxJrd8cqsZruizAl5fa1g9lQ30ytSqSaY
	 acH4rFINzwrfg/ylDJl4pP+wRzmx9f0f3hiyEB951jgs7jrVczUWNs3F7K2bEo5NSK
	 MV3Okvx+CRyrThr8xGhaZ4Yts9qNNGkTe7RZcEhX21dGZ5gQmEneQpr7eVi56MRCkQ
	 iG6hpuJ4sOfAw==
Date: Wed, 10 Jun 2026 10:50:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v1 1/3] dt-bindings: sound: qcom,q6apm-dai: add optional
 qcom,vmid
Message-ID: <20260610-silver-pelican-of-agility-86fcbc@quoll>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
 <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112353-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,quoll:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53FAB6676D2

On Tue, Jun 09, 2026 at 12:10:36PM +0530, Ajay Kumar Nandam wrote:
> Add an optional qcom,vmid property for q6apm-dais nodes to describe
> additional VMIDs that should be granted access to PCM DMA buffers.

No clue what is VMIDs and nothing here explains that.

> 
> The property is optional and bounded, and driver-side validation will
> reject invalid values such as including HLOS in the list or VMIDs that

Driver is not relevant here.

> exceed 31, matching current SCM source-permission mask handling.
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

Does not look like property of a DAI, but some sort of SW policy how you
organize your VM guests...

> +    description: Optional list of destination VMIDs to share PCM DMA buffers with.
> +      HLOS retains RW access as source owner and must not be listed.

Best regards,
Krzysztof


