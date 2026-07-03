Return-Path: <linux-arm-msm+bounces-116174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id it5PNxpVR2qhWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 08:22:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3FB6FF0C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 08:22:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l1SvAygo;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1CC6302813C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 06:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35C0372EF4;
	Fri,  3 Jul 2026 06:21:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A533CE80;
	Fri,  3 Jul 2026 06:21:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059706; cv=none; b=BdA+Crtm46dy08fttwEn+apcs5oX7oC1Y2xSOXx0LwbPlsWH+Mi7IjjCAtuAbFABNpJqtHmMVGuZXl2tyhmPhlMFBZwOboz2+ufGv6f7eAzV4CPzd3aYCtulNIZkyEGAbQ48qzOHvnWrR393h4lRBGdDBPeC6ntkXEzWbVBy1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059706; c=relaxed/simple;
	bh=lzzJVjjvVZjpLMVVdCED199e6uwLBfBDY/p+X3b2Hhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMn3rmqZXdH7ITw7jo4RohNH740SPVtTILleXNZqsMTfflQ21zXW4+llVGSqyBTVN9Hb+8PeJQTe+KOuxwFBlODZSfAvpGcIzCzO67DyqJu18fUupUc495bGaNOuzmKWWhF9lZJs+DTSnDO/IiPBXqEzqthXI8A/N9lq7f3U5ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1SvAygo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D737F1F000E9;
	Fri,  3 Jul 2026 06:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783059705;
	bh=7MnTyVBXFYp8Vg2HkN9K0Uqvv/ITH5vIesO323A19Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l1SvAygoZlQi4uJF1C/PgeT3ztkI0zOK3VsCg5W40I4/4qwR8F2fqN5SqTIfDwfaM
	 kliunmN4aKQGkXYwlJFF9PGIxCY1cLPdTkd9Tqtd2fXFODKM5nhnKA8cYqfceGxe35
	 tyIQLNfsjCvAnFhdTU5LUi2RwptdVqvYO1UeVXvvbSDpI2ngOBl15yyTmmk66BRco4
	 OL5BshL8b19pQbQlGsOd7o1WMYJIj4RW6kTpA/uk6+ceq40IF2fe9hjfScII8/1pBU
	 GZHMskefZ+hsP2rUtX0MB0Ee3buaDKXDta4YtUASIAU8iCyHc/ZKrOuCpBR5XLOpWR
	 flR+9gWnTTS1A==
Date: Fri, 3 Jul 2026 08:21:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: power: limits: Describe Qualcomm
 SPEL hardware
Message-ID: <20260703-pastel-sensible-scorpion-6cea30@quoll>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-2-434d50f0c5b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-2-434d50f0c5b0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116174-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C3FB6FF0C1

On Thu, Jul 02, 2026 at 10:52:55PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> +  SPEL enforces power consumption limits to prevent thermal overload, maintain
> +  system stability, and comply with platform power budgets. It provides
> +    - Hardware-enforced power capping with configurable power limits
> +    - Time window controls for power averaging
> +    - Energy counter monitoring for each power domain
> +    - Automatic throttling when power limits are exceeded
> +
> +  The hardware supports multiple power domains including system (SYS), SoC,
> +  CPU clusters, GPU, memory, and peripheral subsystems. Each domain can have
> +  independent power limits and monitoring.
> +
> +allOf:
> +  - $ref: power-limit-controller.yaml#

Which properties are shared with above schema?

> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-spel
> +
> +  reg:
> +    maxItems: 3

Best regards,
Krzysztof


