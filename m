Return-Path: <linux-arm-msm+bounces-111382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qiQyLqSsImrpbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:01:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889064794F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:01:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=eVFXeXCx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111382-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111382-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CCB3025D3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEFF4183CC;
	Fri,  5 Jun 2026 10:43:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE63FAE0D;
	Fri,  5 Jun 2026 10:43:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656218; cv=none; b=hTjRGfHt49OK85IuqZgHj1ebtcSZRWt1nb7MVZrfXYjBi4Q1b3Sjl9VCWDkF9rEgo/vV0xmNA5kMLinsiea/32LrppEEwskWkCGbFqFeJt4jlmxh6gGj7IiDKlwcD8oPACAzg7W4JTw8DA+FKXTlj3MGoy+yDRXyfsNSu8jDPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656218; c=relaxed/simple;
	bh=OTS5g35FWuBOcvT7/jsfviRXgLY8FI8pl6EFyMYP1Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVT/gil9JvI1aOttb02L3WLIoXVfBWBWVklyyS+s7lbBVC9a7SruJrMb9faPtSilPwAwkQDCBzLexxJS/qwyEflVqlFuH6L2jSAZPyRL5WCVIl8TtbXhmAiyhWM7AcmDwKB4kqhRdGv6XqWWpuEPkY53ldJQPn4Hxyd5rin+SmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eVFXeXCx; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QNhFaIMM0QqeQZWZaAPyaKmERxsimT4coORq325LaBI=; b=eVFXeXCxKBaWB2uCG8Cj2TEpQ9
	XEpAgSuM47UDi5d4WJ4UxkHMOt0d1pMv0RwJxeGS2YfJt3WUyDCh4wT0/Lni/VCEdrNz2b2g5RMW0
	4+qou+usyRfKZrFpD4qUIUKMOUsMT9uY8vo+/ySZ3ZDCFi9EtrtULjPmvD8nOlbSf0QYepWAFiBiZ
	nlGWEvT3pDC8ILUZObyZItOJ0N6QCmiicwj8iNx5E1kTjGshykbgE0VqytxYTxnO5WGpibPpycE2m
	71jqrMmeht+y7tvvyOYcWRjkFnS0w+8Mhb37FwF392DdJ6/Hh9+P4gI5X2wEmNEdFwZ8aWebLuffK
	pU2fOFoQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVS1U-00000007m3S-27QN;
	Fri, 05 Jun 2026 10:43:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1FE30300339; Fri, 05 Jun 2026 12:43:31 +0200 (CEST)
Date: Fri, 5 Jun 2026 12:43:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] kernel/cpu: Disallow offlining boot CPU based on config
Message-ID: <20260605104330.GX3102624@noisy.programming.kicks-ass.net>
References: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111382-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0889064794F

On Fri, Jun 05, 2026 at 04:00:46PM +0530, Sneh Mankad wrote:
> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> retained.
> The hardware design on these SoCs forces a constraint to suspend and
> resume the system on boot CPU / CPU0.
> 
> If CPU0 is already offline before starting suspend to ram the
> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
> proceed further to invoke PSCI SYSTEM_SUSPEND.
> This leads to a system crash.
> 
> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
> config and when enabled prohibit the CPU0 to be offline.

Why do this in generic code? Why can't this live in arch code.
Specifically, x86 can't typically unplug CPU0 at all either.

