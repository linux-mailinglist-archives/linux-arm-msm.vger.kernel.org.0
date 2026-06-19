Return-Path: <linux-arm-msm+bounces-113821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K4vSA5j5NGpHlgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:11:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E446A4874
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:11:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=VfZbndLn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113821-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113821-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1462C3013B89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014D73590A9;
	Fri, 19 Jun 2026 08:11:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E2B30E82C;
	Fri, 19 Jun 2026 08:10:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856659; cv=none; b=ujOMyWZI5xPE3fcZn/YlhEURole5KEzbmv8pImA/oe5zbpjlBcOqHxIMMDt8BP5NTyFayOhSQ5+/YwIcpQVQfw5vXUgZZSLSGU+BNxAfJE72uJ8KvdJmdtjNTpsoHBhAbluAyFTNFqqp+qjY21flhBPev3dF4vZtkcXbdtYIXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856659; c=relaxed/simple;
	bh=BpBGkCSu7+PzRSqdV+sqhQ62LthPAHGqeO4TeM6FeFU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lmyOzXdwsy6UZqnyC5psKIUoTVDs2GndONyx1sL8DyXEg70gVEau1z0H2eYcoM3dN88Zw88c/UBDVw/2qhAj3Px+uHIHjUvMUy+axjZIyUh39cXzJiTuxwfTxV5WvyXfv5i/F/pFANS77mzI3/ckl2ENMjCj14Y2kNDPAUX5zuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=VfZbndLn; arc=none smtp.client-ip=136.144.136.12
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4ghVdw5ZntznFBj;
	Fri, 19 Jun 2026 10:10:44 +0200 (CEST)
Received: from transip.email (unknown [10.100.8.81])
	by submission5.mail.transip.nl (Postfix) with ESMTPA id 4ghVdw1ryxz2pRDjr;
	Fri, 19 Jun 2026 10:10:44 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 19 Jun 2026 10:10:44 +0200
From: me@herrie.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Herman van Hazendonk <github.com@herrie.org>, Georgi Djakov
 <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] interconnect: qcom: add MSM8x60 NoC driver
Reply-To: github.com@herrie.org
Mail-Reply-To: github.com@herrie.org
In-Reply-To: <ff72dd25-926b-4a51-99ad-4535f6025dcc@oss.qualcomm.com>
References: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
 <20260606-submit-interconnect-msm8660-v3-2-f9da0158cdf8@herrie.org>
 <ff72dd25-926b-4a51-99ad-4535f6025dcc@oss.qualcomm.com>
User-Agent: Webmail
Message-ID: <3b8fe2ee8abb8a58939d5ded029bd08c@herrie.org>
X-Sender: me@herrie.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1781856644; h=from:reply-to:subject:to:
 cc:references:in-reply-to:date:mime-version:content-type;
 bh=oaGtO+PMEUVOUfZirfkTBA88JHbSfN8UYKkF58Svw5g=;
 b=VfZbndLnRf6Q7kt8O9+SPfJYmof/AW7GdY3AbGavOjPyjdj6+3QAJJ+x9k8H5AhvU65EL4
 VL5HSQqJP40bRkAVqOZlEPh0NRBR8Tu/VHisHTkD+0/+UflEKHXbrRdTX1AwKsJhg2Lz6S
 RP50cSpZylRZ6K6V7XNE386LGnsJ2htfBDbki//uOOmrnhGGuOITPZs5EHFPRy8WPbaqZV
 3QZ4tvCF4THHrvjQp825U+EOyumMb1t3tusMxdP9aQbfjSsTExTurVyIlO4E5BKdD9UUv3
 2pwX4u/Tb5bZpS7G9ctSdj5KT02X3T9+lfSZ1d0n82TZWcLTSDtK3MYlvERG6g==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113821-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:github.com@herrie.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[github.com@herrie.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0E446A4874

On 2026-06-17 12:36, Konrad Dybcio wrote:
> On 6/6/26 2:34 PM, Herman van Hazendonk wrote:
>> Add a Qualcomm interconnect driver for the MSM8x60 family modelling 
>> the
>> four NoC fabrics (APPSS, System, MMSS, Daytona) that connect masters
>> and slaves on these Scorpion-class SoCs.  The driver implements the
>> interconnect-provider API to manage bandwidth between specific masters
>> and slaves via the RPM arbitration tables.
> 
> [...]
> 
> 
>> +/*
>> + * Minimum fabric clock rate to prevent bus starvation.
>> + *
>> + * When no consumers request bandwidth, the rate calculation yields 
>> 0,
>> + * causing fabric clocks to drop to minimum. This creates bimodal
>> + * performance: fast when other subsystems (like display) happen to
>> + * request bandwidth, slow otherwise.
>> + *
>> + * 384 MHz keeps fabric fast during concurrent MDP display scanout
>> + * and USB gadget traffic. legacy vendor kernel docs: "AXI bus 
>> frequency needs to be
>> + * kept at maximum value while USB data transfers are happening."
>> + * 266 MHz was insufficient - USB crashed during display activity.
>> + */
>> +#define MSM8660_FABRIC_MIN_RATE		384000000UL	/* 384 MHz */
> 
> Can you ensure that through a vote in the USB driver?
> 
> Konrad
Hi Konrad,

I'm reworking the interconnect driver based on earlier feedback, but 
running
into some regressions I need to tackle first. The driver I had was 
stable,
the reworked one has some issues that I'm trying to tackle before 
submitting
another version. The minimum rate will probably disappear as a result of 
that
anyway.

Thanks,
Herman

