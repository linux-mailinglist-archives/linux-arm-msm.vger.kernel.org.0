Return-Path: <linux-arm-msm+bounces-115595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r8ADCbXBRGqH0QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:28:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 109876EAA2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:28:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l4Nb0psk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CF983002D0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBE03B636A;
	Wed,  1 Jul 2026 07:28:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269713B19D4;
	Wed,  1 Jul 2026 07:28:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890926; cv=none; b=cDClJVmWVyRkfUIBXMcf2ILoMHt55DGAo0+yQaFHoABU3fzqSMTsN7wfZ1nHn83wEaRI/uDDFyJ8DS5/RvlIzwB1lhXZtmM9lc4few+63YX/ibsMcpJ5xD7UpDBmXgSEbr8ojkKanRnHBJQToKJnVtEAms9eQad6cFdL+iZ6Wpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890926; c=relaxed/simple;
	bh=0BzXNpslteJF7n07zyNOZSjQMdWKS6UF7cfrWNw9A8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+ARwFFkl4kLZjjjGeuig/aI9CMdiqtA1PnwwrY9QaM3M0J9V02bEHD4tZRk3ai44nIXoTEc/xm+r8ktQfYqw91LiPY9eiyw3aMqVPIg1rEGXnH82+4xSvj5mg237bF4XFuPVdhUODwzpl9lkPWwkQjqSN9CGpUHqsSVbdmRBbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4Nb0psk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6941F000E9;
	Wed,  1 Jul 2026 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890925;
	bh=IYCgu7OSC8Dx4AUeKgdsj096nEM4dOcEI9jfOmqbbpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l4Nb0pskMZfOonRgM9axK0Z5KkrY7e97XHMgQr9jZJ106VvFK3vobt6HRclk+arCu
	 PF+rFpyseWHD1JkY4TMcTYWAfSdf5A75zn2A06b1gRhoS6b2M9oUKrAKC+YmDQsQEq
	 zkOTTxdq4wGZMN7TRRy0cNAb4g+tRutSX84abOFUGyFMls5Cpx6qh8PxIPFS9iNrAR
	 xJ991vlSe5yP3YQMZRA3ZeesnxNwEygYm/hpHvnq35w69xt4cULlcpfB3bYdMIXZod
	 QCWJgmenlg7J/W8bsTlByHhavq4qJNoDwc/pD7coBnOIRK9hnGtPlURiNtEcXjFoBt
	 7RigQt66auBBg==
Date: Wed, 1 Jul 2026 09:28:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document HAMOA-IOT-COME board
Message-ID: <20260701-rigorous-analytic-mackerel-449703@quoll>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-2-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630071022.3256-2-yuanjie.yang@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yuanjie.yang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115595-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 109876EAA2E

On Tue, Jun 30, 2026 at 03:10:11PM +0800, Yuanjie Yang wrote:
> Document the device tree binding for the HAMOA-IOT-COME board, which uses
> the Qualcomm X1E80100 SoC.
> 
> The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
> SoM integrates the core system, including a SiP that contains the SoC and

This is contradictory to the code. Your binding said you are using IOT
SoM, not IoT COME SoM.

> related components.
> 
> Hierarchy:
> 
>     Carrier Board
>         -> SoM
>             -> SiP
>                 -> SoC

Drop. Compatibles define that.

> 
> The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.

I don't even know what does it mean. How two different hardware can be
equivalent? Are they the same? Are you creating duplicated compatibles
for same hardware?

Best regards,
Krzysztof


