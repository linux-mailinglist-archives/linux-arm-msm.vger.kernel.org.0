Return-Path: <linux-arm-msm+bounces-106506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMkiKzPm/GmGVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:21:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 208254EDEB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD9230D48AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 19:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BC847DD5C;
	Thu,  7 May 2026 19:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxtNf4tm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED2E481230;
	Thu,  7 May 2026 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181249; cv=none; b=GesR7ZKwq+9Os4BTgfrHFZYobSRfkLVyIZSIweRI5ArxbCIknOAL/8ksuB/PS2Nk0Po61DBT6X3hwx/XrQwDNAN4AsLnA5+he99riNd3YdyLWlsE5iQ9vmMWjTO4e+ov00OrznBITtII1tgyOZ51ssyety23wx3U1QSQMBJ3aws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181249; c=relaxed/simple;
	bh=i46srF+xQLZ+/JXzvyjfYSk4bP7BIO/nlJqPXGnWWAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clCq2i+DIxDc1CqyDDsAhqjV7qvpOu1ms/xhfbR4TnMYGhxDC73fOvPAQGsUwGvrCIR4bM7xfrthyaT0ubhwK7ZrqQAsMZ84qC4cwXZXTRCsvARKGXSdoTUhOve32ByQ8hKX589eM2r2pzSFkwgGhx4CaCz+Cfol9+f6Aorz8+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxtNf4tm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF5FC2BCF4;
	Thu,  7 May 2026 19:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778181248;
	bh=i46srF+xQLZ+/JXzvyjfYSk4bP7BIO/nlJqPXGnWWAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxtNf4tmdiZ2R3noRYL3VMuBMbd3W58mjZYxCtVsSHjWSxh4rrOQDjWGe/WreyG/R
	 VeP1naQNWJ0CO/Cc2BCC9YNrOQKSwSyQPgco2WFHcPQ3VW3X1BFmAg/DmX0rrqEgDr
	 7234/EFJB1Ihy1dPQ4tag3gzwR6BmToU3cBTN3gq2+G+V4ZMaGgeGfVQ81thTiOUmQ
	 7lDplW4a0kQADGkindVPtCEartTlNmUwSXpDmvI4z3USYvF73BTAYnGL6eaXcBJ2P0
	 8H5FdyCSxQ9Vb2iydBxteNXAsUeK6TmDJ8x6SM9P6lerHe9X7Hklfm3EXXzVxgciZF
	 IiVyO7mTWktNw==
Date: Thu, 7 May 2026 14:14:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: interconnect: qcom,sm6115: Drop
 incorrect children if:then: block
Message-ID: <177818124572.2320607.5201244025665342538.robh@kernel.org>
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260503161653.60785-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503161653.60785-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: 208254EDEB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106506-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action


On Sun, 03 May 2026 18:16:55 +0200, Krzysztof Kozlowski wrote:
> This binding has children, so any if:then: block restricting them,
> cannot be defined in top-level allOf:if:then:properties:, because it
> simply does not match these children.  The block, if it was useful,
> should be defined within patternProperties for the children, however
> since child nodes do not have clocks at all, there is little point in
> disallowing them in the first place.
> 
> Remove completely redundant and ineffective piece of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,sm6115.yaml         | 14 --------------
>  1 file changed, 14 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


