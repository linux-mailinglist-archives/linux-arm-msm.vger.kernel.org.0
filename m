Return-Path: <linux-arm-msm+bounces-119221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oyQYGixwV2ocOAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:34:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09375D977
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H+iHmiGT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 681F5301A71E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EF7448CF2;
	Wed, 15 Jul 2026 11:33:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E81429CF7;
	Wed, 15 Jul 2026 11:33:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115229; cv=none; b=OeUPAGd1l6vkwYlmzXbkiplj0IqMgxuqG3cb8G2xY6pLLropJ4U71KXZlqIKZKevMEj58sSe5lETU23wdoAneXLhYNKzQYrq30rHvDWl32VWqV70nkfCHlve3fNi9RLjIDgmKIk5H6UktfJgxV6sGsM//kj0XS9mI89oyB0v09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115229; c=relaxed/simple;
	bh=wNLl4EHt7/5TJ9Dlwu3SQI9iEXnNtSAyPCu9DVn4+V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpfKJwHT6xrrgyC7UWC4+UbR6fE8q8WXPWyAnReiUUg6uRNQIIT/aKHqCR1NFK/Gq1S2qgdlNUq0kXCsVUsLccJLurBJzER9yhLIPujhQzhAndlPgsSsXTBHX2NH+7uA7dyeu6B1LZUBP0YG9qFbJKHuGBEJmWFAzr2E5gzXTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+iHmiGT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5C01F00A3A;
	Wed, 15 Jul 2026 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115224;
	bh=9JLVvqvoCSlLsZHpJXT/d1xXXcQ5YiMbXN8YNpGZ/UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+iHmiGT8XGHqSd16XF4uqUaycjdWK0m5JTD3wWPP8tfXekN+QBHnP6V+2mhMdS5a
	 iHN1HmAg4/FKtaGsZvj4GHatutAM52YvKQzHYM8+dOCmaAHEBNtkLYdam6HPppVhVj
	 AF5avHzh5rWN9sHOOr9CcXDuc1lSOhRYO2vactvqVu0jMB9Scg37E/08Rd4k2OXcUo
	 onHDWDKdm75KsE+QkGiAxy2S8ohPWnHGFfN1sskbnJVxdnBiEGaQ4pERkVnss6RLjI
	 6yYhty2bNz0j5x8P7peWNDrIG3SC3DJVNZ+nth0blndhwWneFq/qCZavl4gYVo3lXR
	 X/VG6kbJgrHHg==
Date: Wed, 15 Jul 2026 13:33:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Message-ID: <20260715-steadfast-silver-hog-a81e03@quoll>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
 <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119221-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,quoll:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF09375D977

On Mon, Jul 13, 2026 at 02:34:09PM +0530, Taniya Das wrote:
> Add device tree bindings for the global clock controller (GCC) on
> the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
> bindings, since the Maili GCC is identical to the Hawi GCC apart
> from a few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
>  include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
>  2 files changed, 29 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


