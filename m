Return-Path: <linux-arm-msm+bounces-114009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JiCYLaY8OWogpAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:46:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126B6AFFB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=f1faiF5o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114009-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114009-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E51FD3055821
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7B63B42E8;
	Mon, 22 Jun 2026 13:41:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CED3B42F0;
	Mon, 22 Jun 2026 13:41:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135685; cv=none; b=FLdDeeHUNI/Itr0oz5v3Tx49Y6JpsuvBwW5XcQkXyH+gzv6wKAaf8mH8ONU/2dgCdBMY/JOYD35digwKHLICVZJXbvuYSQqzH7K7pQv6O8YfIiNw1DuwT3GExS/6Jt9N1Cu7vACOTOGEXt5Q2ogG3R//QydzhsCY/0tFkYvcfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135685; c=relaxed/simple;
	bh=YG5ABu+hJR8A+OkKYptCDTUAKYxuoGKOow7nydZevJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVQN4pSm7b0i+JEPA4pszhs+CQ6gsZnra9+bspkjSXNKqRQn7MHEBQb/riyerpPQTgt8ZlwTvZIIJYELWXBMKfa9uj9IcCkwuzSg1igBjaY9Ri+rB0VKPN0HhaOVSMEfoenlzq3igqkQXJdRmAwXLrteFCBlWGFkrouk/BF4Hsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1faiF5o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453A41F00A3A;
	Mon, 22 Jun 2026 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782135684;
	bh=uxVR3BJyXKKdRyGAhHe9hFF/UEagCkWh5uvn/XeAJRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f1faiF5oxhboJlE2wEdAIqc6asczf7X2u+G0X0oBPBvGL8v/bKyclHUyHmpdx7v7q
	 lbDad2fEP7mj2cUCXOB3tI5kIRilnPh7ejYpGICFYpJxoQEOFp6zKcepc25P+WY8BJ
	 sU+1Kq/zF7leYtEU43WY/qimYKNIFsLOAA5Ymk5VR/leJZVt1z4NR2s09/rPYS94Hw
	 fm7zlIv/Mp3iHKZ8n/OjTJpRKhz2uMcD5Z4kS2erwhL19OZYthccLYZjZVLeaJYeym
	 OPKeJcV9DPROwnHoRlxHkmXnh++G7vFgjFeAFjVkC5OQvOMFE8bZ4PuNQa79nIPIAP
	 n+2TJ9TLpQxTA==
Date: Mon, 22 Jun 2026 15:41:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region property
Message-ID: <20260622-whimsical-charming-seriema-dcec81@quoll>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
 <20260618113509.2025881-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618113509.2025881-2-ajay.nandam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114009-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,quoll:mid,linaro.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5126B6AFFB7

On Thu, Jun 18, 2026 at 05:05:08PM +0530, Ajay Kumar Nandam wrote:
> Document the new memory-region property that allows one or more
> reserved-memory carveout regions to be SCM-assigned to the VMIDs
> listed in qcom,vmid.
> 
> - Add memory-region as an optional phandle-array (1-8 entries).
>   Each entry must point to a shared-dma-pool, no-map reserved-memory
>   node. Index 0 is the control-path buffer; subsequent entries are
>   data-path buffers.
> - Enforce via dependentRequired that memory-region is only valid
>   when qcom,vmid is also present.
> - Expand qcom,vmid description to mention carveout regions and the
>   qcom_scm_is_available() probe-defer requirement.
> - Add a second example showing both properties in use with two
>   carveout regions and two destination VMIDs.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6apm-dai.yaml        | 38 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> index b767625985a7..601055182da6 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> @@ -10,7 +10,11 @@ maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  
>  description: |
> -  This binding describes the Qualcomm APM DAIs in DSP
> +  This binding describes the Qualcomm APM DAIs in DSP.
> +  When qcom,vmid is present, the driver performs SCM memory
> +  assignment for PCM DMA buffers and any reserved-memory regions
> +  listed in memory-region, granting the specified VMIDs RW access
> +  while retaining HLOS as a co-owner.
>  
>  properties:
>    compatible:
> @@ -20,9 +24,24 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  memory-region:
> +    description:
> +      List of phandles to reserved-memory regions (shared-dma-pool,
> +      no-map) that must be SCM-assigned to the VMIDs in qcom,vmid.
> +      The first entry is the control-path buffer; subsequent entries
> +      are data-path buffers. Only meaningful when qcom,vmid is present.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Drop ref, not needed.

> +    items:
> +      maxItems: 1
> +    minItems: 1
> +    maxItems: 8
> +
>    qcom,vmid:
> -    description: Optional list of destination VMIDs to share PCM DMA buffers with.
> -      HLOS retains RW access as source owner and must not be listed.

This is confusing context. There is no qcom,vmid in this file.

Anyway, I think adding SCM interface and handling of VMIDs is quite
different design of this firmware/hardware, thus this should be a
different compatible.

Best regards,
Krzysztof


