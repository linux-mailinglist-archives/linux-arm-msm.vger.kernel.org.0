Return-Path: <linux-arm-msm+bounces-111412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fbxKMHLEImq7dQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:43:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52374648457
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:43:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iTMV+dUb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111412-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111412-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68B7730480E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B052F380FEC;
	Fri,  5 Jun 2026 12:32:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32B1CEAC2;
	Fri,  5 Jun 2026 12:32:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662745; cv=none; b=WtHyfdY8oaB91r8aoYYMt2M4p9hY7TBVDCsYrbmpqCfU4lsivv4W+Xho2T7XTzoUofabFjEqB7p+a1B3x8/hZ7bCydD5HjIhEvgMPFN3J1HyGD6bDDACN1Wy6U2Xmt1Au9iKOcqu27R0w9wUpq83bgoWMpk2SvfvdHP3RNhJlDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662745; c=relaxed/simple;
	bh=k6oYQJNcr5f0Jhbt+inmWKxBi0O2ofPEgmENnOmypZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYzvTeILWUNvf9n6tCzZSyEcAYLmFgDcyW9DqgpgJjYUx4Wpe5DnBoWoAXlMHynPUv9uyyfVPjcVaNDP4VGhG9/XxFpz7HRb0ghosSEoUqKNI4vpT4YiAG+Sm2kk6WXTB+qJptfVNoOqQ4+DPwUPg+/JvKKQNZf5lGF6zqXNPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTMV+dUb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED761F00893;
	Fri,  5 Jun 2026 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662744;
	bh=QJZWeu/CAsNhvLdYQ0LGuGabFiBbIMVq8mhdqfQ3070=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iTMV+dUbbExPGYpaEujb3KyB0c0qB+x6soIcWNyWkpbjzBKGhPmBfjKe3QY0TvIvP
	 AdRJXsw+6LZbh8Ri6ZINPmZM+e8AW7fWakBWIbeW2Aux4A+5cKxhi1FDu4vmGN0w+K
	 Hr+RuePhQUOTtWgnUbHlBaeU2B2leRAzUUf1GkXx0zA0l72vBnjI2i579Tbl8TT+Gw
	 DQYwvGFbJPQIQx6eThLpY4/lTf2yIAUiP8m3jl7M7ErFl2QQAynMaaI0EbgN4nRO9F
	 UqXH1bSfsELY1umLX5vQ/GdWtW1sEhGoT+OW/23CLO+MC/h1JKnjDF4dAZf2d5bKXO
	 YX+m4M1sB3VKg==
Date: Fri, 5 Jun 2026 14:32:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom,osm-l3: Add EPSS
 L3 DT binding for Qualcomm Shikra SoC
Message-ID: <20260605-imaginary-essential-kestrel-0bf265@quoll>
References: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
 <20260603-shikra_epss_l3-v3-1-3c2e0b796e78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603-shikra_epss_l3-v3-1-3c2e0b796e78@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111412-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:raviteja.laggyshetty@oss.qualcomm.com,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52374648457

On Wed, Jun 03, 2026 at 11:26:12AM +0000, Raviteja Laggyshetty wrote:
> Document the EPSS L3 interconnect provider binding for Qualcomm
> Shikra SoC.
> 
> The Shikra EPSS L3 block is similar to existing Qualcomm EPSS/OSM L3
> providers, but supports only up to 12 frequency lookup table entries.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


