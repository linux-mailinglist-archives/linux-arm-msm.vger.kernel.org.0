Return-Path: <linux-arm-msm+bounces-114870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j56YIgAhQmrf0gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:38:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C186D7168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Dom5+f7q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114870-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114870-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BBFF30EC8FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C743D75D1;
	Mon, 29 Jun 2026 07:30:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4610D3CC314;
	Mon, 29 Jun 2026 07:30:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718221; cv=none; b=u246CYX3zAbSpNpTZbxBtzdg6WgT1kwNSI6tZoaHnRj9NqbD1HL7AplX87W0CxDmk0k08wXCRYhOJ4NRAmigbcOrA5CIBzbN1aaPifDfDmhCJKvo5oyKOxqhy93tLeTsp7T25NScydjKAutmgjG+ldRBb3GUyDkXZghJ0lBupdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718221; c=relaxed/simple;
	bh=g14TrWfaAOikxyH48mdhNMlGi/I/3OG20zoFFfnu4kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxSjbFPpIUOb8A6EjGbasHwqbjDsimDpRTi9rgSVwjHQ11jEHAZLoTsh2ptbgCOXT5yg4hywAG6LlAsbrATfACYV5k9DvMhzkHAe7XhSpDCXRfJw01+Pl50RYfn1AnSFXWXpozXjL6pTGZK0Ch8xkI27OmljVOuTq3CnFIKx7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dom5+f7q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13FB1F000E9;
	Mon, 29 Jun 2026 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782718215;
	bh=hmgzdPY7zdf6EY9LMwzczIbYjz2M0rg28POJh7yjcFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dom5+f7q132wrlORN7BIhWI4174ts9dpgeYBdoL3YFPPp+9evPhw+xG7drC2ylQKV
	 0Tuvlco0FpbWfeja+j4iAajvoQGgg683wkrVZ7zogyNThxIt01/1s6mVWTbcW9VGmC
	 lJpUymwXdcrrnwRfPGf5D5NZ/sLpslXT/9XVegpFzO5XAlAqpFbTZMwd3JlpjoGrmZ
	 5wplg8NTrKCXiIEV6j65CW4EmDRPfFa8aMWFHaSfYTPwysHmIVR2gO2c56QdbqkizE
	 q48X3Jq/cNkjStCSugOd9Z8Qhs+Qkx60v28mse+t8PCBkcbIy7C1ivZPbjs8CIg2gj
	 dr9V+pkFSJeuw==
Date: Mon, 29 Jun 2026 09:30:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add APSS clock driver support for IPQ5210
Message-ID: <20260629-resilient-lucky-lynx-d9db0d@quoll>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114870-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0C186D7168

On Mon, Jun 29, 2026 at 10:08:41AM +0530, Varadarajan Narayanan wrote:
> IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
> for the APSS clock to change the CPU frequency to one of the supported
> frequencies.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> Varadarajan Narayanan (2):
>       dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
>       clk: qcom: apss-ipq-pll: Add IPQ5210 support
> 
>  .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
>  drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
> ---
> base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
> change-id: 20260625-apss-clk-ed39c40ed468
> prerequisite-change-id: 20260515-tsens-802eef7a2cf6:v1
> prerequisite-patch-id: 55c7e7f58ff80ecfed956707a9a893bbf59ef74b

Really, how?

Best regards,
Krzysztof


