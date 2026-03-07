Return-Path: <linux-arm-msm+bounces-95981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CYFTAaxErGk7oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 16:30:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD922C68A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 16:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20DB83012EB2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 15:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868AB2D876A;
	Sat,  7 Mar 2026 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8RqgTLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE41FF7B3;
	Sat,  7 Mar 2026 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772897449; cv=none; b=U5nuOhx038uQs5kzbsPt9QaMqFGqWL009tM3/W33VjYBzgPLJCzkw97WKWDTrNUX2srHuYjShpJDqxRIpZLfRBMhl+ipB2ssFbI03WUQx69SIitn21FopKfLaOcALf0ScbDjHUgrAxCvNgeKh00SSMNUXCiHU1GyW4qRpmIk1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772897449; c=relaxed/simple;
	bh=h1g4bg/uEerSEazQNyEF6BOqyHZ+cr01C5874htHjHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDFLGseFp10kABdiAfUuQW/g+4xDz0AeQrrGqx3ifv8vAvQ/7SnJ330AXG4kzPwPedmhyB1yMTvrs6IGkWTMzGau+VVG2OY/w27WaaKVnJyRS+WWGHNv/IH4I9I4d5zk6117q9aHlERB4muap10WQzX0mu2YSAMe8NKtrEl+BXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8RqgTLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BFAC19422;
	Sat,  7 Mar 2026 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772897449;
	bh=h1g4bg/uEerSEazQNyEF6BOqyHZ+cr01C5874htHjHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8RqgTLO+3Mf6LxI00rbOpXATAnLME406BByiOzKEx17qssm/tvmZpiGOtaSSeqWp
	 +LfuXIlUD6XRPRsz5v9CE1f6z1PFU1R6s75x0HS6lxAyYHcnMcx6BlZRGZvuZ9rYk9
	 DX4ZuS0TBK7Do1UpxBa7ebvUlR9jgYVnPvtQuqnyVxpZiwkW8WKrsTBYJjPyraobkB
	 CtMV3P5QEhg1Dssul0TGApgERxbyck7Y0Se0SKqZIiuFzuLKxZ+7lPsHnLokLpSwSu
	 216jfTLab6+Hop6AWjSZyRjoDtMwFT7Bj8j8aOH0mqTLCwwB7Dl8kpGLyd9bXgrlsi
	 cWaVHvCnNICMg==
Date: Sat, 7 Mar 2026 16:30:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Message-ID: <20260307-inventive-stingray-of-pride-5c2216@quoll>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
X-Rspamd-Queue-Id: 6FDD922C68A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95981-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:48:37PM +0100, Luca Weiss wrote:
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics power domain Controller on Milos

Power Domain


> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description: |
> +  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
> +  Power domains (GDSC). This module provides the power domains control
> +  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
> +
> +  See also:
> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h

Milos

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,milos-gxclkctl
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1

reg should be the second property, like you have it in "required" part.
I guess you copied it from kaanapali-gxclkctl.yaml, so lesson - qcom
bindings have acceptable quality, but not good enough to take as correct
starting point.

Best regards,
Krzysztof


