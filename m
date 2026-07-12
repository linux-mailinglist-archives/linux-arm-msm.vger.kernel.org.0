Return-Path: <linux-arm-msm+bounces-118563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ECKTCmuIU2qlbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:28:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0623E744A3E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:28:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O00M2lDi;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118563-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118563-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2984B3002F57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D833AB5B7;
	Sun, 12 Jul 2026 12:28:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB03A7D7A;
	Sun, 12 Jul 2026 12:28:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783859301; cv=none; b=F9ZIZinGWyLJiJd6hxJO7yhktgJVbqA7Ny2f5d1yxnJq6WocWHXk7DX3ZdMB3CGBRwaUs1iPUJMdiK2tsteXdFL3fi2Zr93Dxo7oAf9YsTNPMEWOV7bkQ75I5VWw9sfetVvbFGyOxuQxm2cg6tda4YFBzrcgW7YH4JbffTZsLFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783859301; c=relaxed/simple;
	bh=zBuoHJgyKjwMTn3GawD77iFOVO6xlqE976aNZ+y/hoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZXbMKBQfb1ny2OiMDMzn3HmzOrsWGGN5QoQ+LT5aW664x2wCUinnMmZGHqbKO9oZeVICBL58zLQvFL7NGddfwC0+iNt017E52+z3mpnbgMLvw2fvI/7SIliXfdR+YFV77kFvibP1PJEJtaGLgJuwCLrXcJuR54hvdq95GGK5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O00M2lDi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C281F000E9;
	Sun, 12 Jul 2026 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783859300;
	bh=Su0f0fOvCgbDlKnlSpfTJomGI+pCMm3O57CCfD3OJFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O00M2lDih+AwYIjL+yrW85IYDF9mo8bCqaRp1M4tfrFBMT6ZmAXMHbw/rHT+uzEZI
	 ZX9bx6S0TW8aitDiCvMrPqKr3u7TPIRDlMjDFPpMbPwJmdwYokPDHWl/WkNHBeP/Na
	 NLkvvGt42Nyd1EdVs591cKlOcPP2YrytxYj/W+fRj7SlGWUeqt4g3vPNrID5waUAZT
	 g4g9vS53rb5XF8iAwhTFgyd7v6d2ifQALd/5YtcmEmEc1sDLeo9TGkfUoiCbVAEvMb
	 nYHSGWGXIO3Q2r6iFuPYCBMPHC+a2JRfpMWm10r0dYjCEcggp7+oXOrC+K2WjCk2Yi
	 +VVvS7AeQA5eQ==
Date: Sun, 12 Jul 2026 14:28:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Message-ID: <20260712-fantastic-emu-of-fruition-ba5bfa@quoll>
References: <20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118563-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0623E744A3E

On Sat, Jul 11, 2026 at 11:33:01PM +0530, Krishna Kurapati wrote:
> Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
> has two usb controllers and the secondary controller is high-speed only
> capable.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


