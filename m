Return-Path: <linux-arm-msm+bounces-116532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ePuKANUnSmpv+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:45:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB20709A27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:45:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CNlt4mgQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116532-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116532-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05AF830054EE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 09:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7239390C85;
	Sun,  5 Jul 2026 09:45:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BB536492C;
	Sun,  5 Jul 2026 09:45:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244751; cv=none; b=uuXVws0qVpv4KJ/BSjBFG9p2y8/92Hf26v6M1gq5/9RHoyes3Nriv3MXXKdGZ3NDW3KBbritIiUHY+536M77sgmVDjanoH877JhGU5oziVcXzLxfp5gcyMRGf40DJy9cfWNQCe9jJ55USveyvBFS1fZQKeY2Rk/corYv64fUDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244751; c=relaxed/simple;
	bh=QML/3R4/n3S8roF531jnkGEdSHHrANy8qh8f7wOS1F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv3asEsglg1KyHjKDEi4UgilC3zBefxXyTtixUDoIymwYxDCGPCIUg8b+yuLdUFS13dVfVJG4fvK9cDlmme230TeFl72nLR6cTAlhMBDzSSj60kjmXtmSUz32rwLMjJaUXpYi2lg3QGdRDKDIgHJulFMfHP7H2cCdTMeNYJMdbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNlt4mgQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202EF1F000E9;
	Sun,  5 Jul 2026 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244745;
	bh=ufksji/qXGlRH4CRhlYkpA6u8CXK+m4oU5KBLEDXkf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CNlt4mgQkIZjrcV6enyUbkwkBdHCHF2AKt0TDCJPBjbyu5Xyc+TqA9+wJOWlDxyB5
	 i7S8fZrECYuHWeWZERKyxNhAbMQ8IoOMzqHTsXuxmEz47zGtvrwmcsaF0/WOPZ9RbW
	 4LFeGfKmbMchfXkipcUEOKzLUZ0bygv06hDNP92jFcqx1VwJX3ytN98HPjLphe142E
	 YS+uhps4CYzE1K39/v5XNmI1wHa0s40ooXr5pi7JeSFVojRzThBhXNUh9SwuYu5Xmd
	 p6L/ApavcjV5NvYp9yDOFyP9AFfBcFqf4T8FL6ZPXmuiNWxsHGqgqIu17uik3kh7Qy
	 VW3VokxU7LBUw==
Date: Sun, 5 Jul 2026 11:45:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: Add Purwa IOT EVK
Message-ID: <20260705-sensible-agile-kagu-df3b78@quoll>
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
 <20260703-ec_support_for_purwa_evk-v2-1-c59aac5c6aac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-ec_support_for_purwa_evk-v2-1-c59aac5c6aac@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116532-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CB20709A27

On Fri, Jul 03, 2026 at 03:23:41PM +0530, Anvesh Jain P wrote:
> Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
> found on Purwa IOT EVK boards.
> 
> Like the CRD, the Purwa IOT EVK carries an on-board embedded controller,
> provided by ITE and running on a separate MCU, which handles fan control,
> temperature sensors and EC state-change/suspend notifications. The existing
> Hamoa IOT EVK documents the same EC via qcom,hamoa-iot-evk-ec.
> 
> Like the other reference designs, it uses qcom,hamoa-crd-ec as its fallback
> compatible.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


