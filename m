Return-Path: <linux-arm-msm+bounces-113248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8SMCHMY1MGoSQAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:26:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9D688D79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:26:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=oJQIeMyv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113248-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113248-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8E33038BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5795E413D8B;
	Mon, 15 Jun 2026 17:21:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73A40863B;
	Mon, 15 Jun 2026 17:21:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544096; cv=none; b=B7Su/9HEO6OaM06eWC2aTrRIZI+FO22MpkJGoi4nE+zOxUUAMJdD8ImorXzcHOLHIBKmxVCHda+Ya4uyNKjBjHtc0GZkT8GY0XcKCcUaSYQ46w0gL4Il5YBxIt/a3W2kMW4E7rHPywhhygslIPBZ5XSQ+WFIEfPrFbdey9iCp3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544096; c=relaxed/simple;
	bh=iIbTOSIp0iMFO2Z7SFmL5SdUAEiTnbuy9LqmwWri3ZM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=VhwM/X5SIH70X6lhn/KlP3jEN/zVafCgHLmjMBluSx5HmAKNu6JOWrlhQmuoh5u4WKJkerG7KXAnNCL+TxPYPaa7mLaCgLrHJ15394WciNxmxsYDc3ggRiYjpDY7JbzNlmLWPyjVjpbqrXNB+5bE2MG+x9nyWB/liP0RaQaLV7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=oJQIeMyv; arc=none smtp.client-ip=136.144.136.11
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4gfH386S9mzTPNDC;
	Mon, 15 Jun 2026 19:21:24 +0200 (CEST)
Received: from transip.email (unknown [10.103.8.120])
	by submission15.mail.transip.nl (Postfix) with ESMTPA id 4gfH382y09z3R3nyg;
	Mon, 15 Jun 2026 19:21:24 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 19:21:24 +0200
From: me@herrie.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org, Bjorn
 Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
Reply-To: github.com@herrie.org
Mail-Reply-To: github.com@herrie.org
In-Reply-To: <b51b4d7e-fdea-4793-9007-c9e3ee922f70@oss.qualcomm.com>
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-2-github.com@herrie.org>
 <b51b4d7e-fdea-4793-9007-c9e3ee922f70@oss.qualcomm.com>
User-Agent: Webmail
Message-ID: <267d1996c4f6b25518d30eeca129fda4@herrie.org>
X-Sender: me@herrie.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1781544084; h=from:reply-to:subject:to:
 cc:references:in-reply-to:date:mime-version:content-type;
 bh=UMEnw+hfbfjO44xCyRSRyc5yFScaN4Ozq5k4yQSUsoo=;
 b=oJQIeMyvpmUHjCufH8c+X7FrsUgbaseTHoUYgVHisRUCBQWQKavkjNwRL4JoF+Q1t+hShE
 6Fxr47uZn2DMr0jxzoh1jwDKfJTEtQwigRILHLPAOt6UMK5iA8iSL7qWmmPh3FRomEk1xI
 zQtDVBwOljFvPN37FxtVepMZ+PlRKzAacMIdIMtM4ZyI6ezAAv6MW1PCsS3Oz9lced/InJ
 UHx8GFQGm6yXaIbzEEseSkkUvN9GqfE1jj4RdosCmKiqhCbQ5AXTT99aeO0ZImCnhma01M
 GnziTVVdPl/74xOl2AJP6KK5CkGBU5sj2PRI77ngfO/EcasVoG896QrkTj58JA==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	DMARC_NA(0.00)[herrie.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[github.com@herrie.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:dkim,herrie.org:replyto,herrie.org:mid,herrie.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4B9D688D79

On 2026-06-15 18:36, Konrad Dybcio wrote:
> On 6/2/26 6:27 AM, Herman van Hazendonk wrote:
>> On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
>> a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
>> existing dt-binding header already reserves CE2_H_CLK (ID 77) for
>> this clock but the driver never registered an entry for it, so probe
>> of any consumer that resolves the binding fails: the CE2 MMIO window
>> reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
>> signals that never arrive.
> 
> [...]
> 
>> +/*
>> + * Crypto Engine 2 (CE2) clock.
>> + *
>> + * On MSM8x60 the CE2 block at 0x18500000 is gated by a single 
>> hardware
>> + * enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The vendor MSM8660
>> + * clock-8x60.c routes both the "core" and "iface" consumer-name 
>> lookups
>> + * to this one register, and the upstream QCE crypto driver requests
>> + * both clock names via devm_clk_get_optional_enabled(). Without the
>> + * clock present at probe the QCE MMIO window reads back 0x0 and DMA
>> + * hangs indefinitely waiting for handshake signals that never 
>> arrive.
>> + *
>> + * Register a single clk_branch: the consumer DT can reference the 
>> same
>> + * clock phandle twice under different clock-names ("core" and 
>> "iface"),
>> + * which yields the same struct clk for both clk_get() calls. Per-
>> + * consumer refcounting then works correctly and the single 
>> underlying
>> + * enable bit is asserted while either consumer holds the clock
>> + * prepared, instead of having two independent clk_branch structs
>> + * racing the same hardware bit.
>> + */
> 
> I don't find this comment particularly valuable, given it ends up
> describing the fact that the common clock framework has refcounted
> enables (pretty widely known) and details how the DT is going to use
> this (which we can read in the DT itself)
> 
> I think the commit message is really exhaustive and it's a better
> place for this info anyway
> 
> Konrad
Hi Konrad,

Happy to clean it up. MSM8x60 is poorly documented in public and 
whatever is
available in downstream kernels is often incomplete, so I tried to 
document
most in the various commits. Happy to put it in another place if that's 
more
appropriate. A lot of the info was found by register poking and trial 
and
error because the lack of documentation.

Thanks,
Herman

