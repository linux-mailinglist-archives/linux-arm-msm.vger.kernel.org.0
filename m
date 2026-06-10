Return-Path: <linux-arm-msm+bounces-112382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E0m/NpksKWrfRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:21:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F6667C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:21:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AqhxLFDj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112382-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112382-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B2F632A1113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EAF3B42ED;
	Wed, 10 Jun 2026 09:04:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7083A5989;
	Wed, 10 Jun 2026 09:04:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082282; cv=none; b=D5PDZg7OYnShU6ppsGNGcbUf+kGESupl9JSUytNIXU+3dF4P7QWdUXS9ixtp8RaUh6eEZpfAwHBaSMhb5x+RpFYBchkd5itT960MPhAz5ggxNQ9kBDMhmU3CvmlkHWspgn9ZQJ3sCn5WvQWyo+vWe8fUzbwW20AW4lxJ5bTstGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082282; c=relaxed/simple;
	bh=cZpLybn4x4f1p8M7Je1eNrs+9z6NVu2xigKvChxzG3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thzX9N6AHSZSbBoTIfz5mv19hb0zTwX8/CI1mrAIsVoOeOA0/ZzHk/KvKfnxYeK0k5q8BuUXvltib9BPUtlX+hcNk07+GakQCIwdwI9D9q81go2/vtlEb9huTgfN/lpj2IqZCFdrIy/ks8XrH9MiPd1+KkpvDSrDW5Ww7dfFuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqhxLFDj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38ADB1F00898;
	Wed, 10 Jun 2026 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082281;
	bh=rX6O3bKY03wuV/N+jcdbUzTrtTw5gMO+dKrOQtLnSfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AqhxLFDjqlJ5DjcMHkebMyL5qBFeuhZMmitIDJwJ49uFS13iWvQeC/7TCt/D+QcIP
	 Fr9uIXXN5V/t71/siF7hwDAKxP0FRtKoDzNmr5GEZU4jZtxieIiUvxSrYvYF1zF3xI
	 fcN3skscwg+N3V6Fs1zp+Ylkcx9iaWehgzeAlnFX1uPMNJIqP9ilR2sbMRHLPYkC4b
	 lPcfv6G6mbiLbe8uH/OYZUpjV0aHgau55WyRi5FydGKpeKkvG/CNZY58Jk12OM+deX
	 8rCdFe6gPfQKXfkBj1vJ290SqN5OZQHml6uG/7TQUNscGJH5AmMLnGKsP7xsFOXfr+
	 d763QXfIygTlA==
Date: Wed, 10 Jun 2026 11:04:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com, 
	jishnu.prakash@oss.qualcomm.com, Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] bindings: power: supply: qcom,pmic-glink: Document
 thermal-mitigation
Message-ID: <20260610-gracious-badger-of-debate-6ad0ec@quoll>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
 <20260609-cooling_device_reg-v1-1-e15bddcb0086@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-cooling_device_reg-v1-1-e15bddcb0086@qti.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dhruvin.rajpura@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:drajpura@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112382-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 471F6667C42

On Tue, Jun 09, 2026 at 02:46:42PM +0530, DhruvinRajpura wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> The qcom,thermal-mitigation property allows platforms to define
> discrete fast charge current limits used by the thermal framework
> to throttle battery charging in response to thermal events.
> 
> Document the qcom,thermal-mitigation property to describe the array
> of fast charge current limits in microamps that map to thermal
> cooling states.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index ff01d2f3ee5b..fcb69ebaa7cb 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -58,6 +58,16 @@ properties:
>        The array should contain a gpio entry for each PMIC Glink connector, in reg order.
>        It is defined that GPIO active level means "CC2" or Reversed/Flipped orientation.
>  
> +  qcom,thermal-mitigation:

Use proper suffixes, see writing bindings.

Also, name looks too much as policy. Describe the hardware.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Array of fast charge current limit values for different system thermal
> +      mitigation levels. This should be a flat array that denotes the maximum
> +      charging current (in uA) for each thermal level. Elements should be listed
> +      in monotonically decreasing (non-increasing) order.

What is a thermal level? How do you define it? How does it map to
thermal bindings?


Best regards,
Krzysztof


