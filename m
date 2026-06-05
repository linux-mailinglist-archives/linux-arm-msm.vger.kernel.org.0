Return-Path: <linux-arm-msm+bounces-111407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JbD1OrDBImoZdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:31:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B26482CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hNHDQVsK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111407-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111407-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C0703104251
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 12:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30E74E3761;
	Fri,  5 Jun 2026 12:21:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ED738CFE8;
	Fri,  5 Jun 2026 12:21:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662062; cv=none; b=opdR4m4kRhaJu7/iH6bXamWMN4c8NpOYzK+QGTNpYo+o0f0YcBKTto2feAQ0lJWGqgaSQ12I9OW2uDUKMSOceI++NCYNpqLmSOi3YGJJZWH29A6+gURMr9E5n/QdfH5DKmVybcNNElpdkoXQ2MVUlCRtu4pSS31owlMySWK0l90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662062; c=relaxed/simple;
	bh=DdkU4J6CGSWH5oVXiBeiOcrg0UBFFqfhLg365Ae2r6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uKZ2emkaAiFQ29OCu4UffetCdNev2wh6ms1dRKUQrxVErr8wozKOfp9iKJRz64f++jyAslmU2oHnaNfVNl5bbEP1nDsfCFJZFsENER0YMWC4AFGl3F6v7Ul/YKiHkR+6b9+VXmP93rEV5ASuA4uYhLGAFUmCk2HOwvV30yViOGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNHDQVsK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28081F00893;
	Fri,  5 Jun 2026 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662061;
	bh=ARFvRlU8LRgcpA99afWuXaVaqoKC+pBjYKPboVY44N8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hNHDQVsKcPTmFNcbnHFx5RacfgbDjEci+cBLGxyoHrmLxr5uaFaPPatG4k72d8Hsh
	 8phMGhwHFuBXdQh3b2fAuPwMd4mD2Ds9s7IWDFWrxTOP/0awIk5MIVP321tIK04yFU
	 dXuZyDsPUZzgrUgjELYG7AI1PbP9LTXYALm7dsWB7hwTbFljUFPhTDq0kTDHAAI1SB
	 /BnNpBQP1EvYFHQ/i+LyU4Q/cYVnKH80RXgtKL6d5dwrA6Czda4laRLTagjVmzpcwA
	 EYWrqFvXawMe4hmRwQysF5Y5oYkJszIuD7cGlnh1Yfr6V0kljj28ywuMiZWYbWV9YG
	 3d2JWVVYKEwmw==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown
 <lenb@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] kernel/cpu: Disallow offlining boot CPU based on config
In-Reply-To: <20260605104330.GX3102624@noisy.programming.kicks-ass.net>
References: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
 <20260605104330.GX3102624@noisy.programming.kicks-ass.net>
Date: Fri, 05 Jun 2026 14:20:57 +0200
Message-ID: <87ik7x5gba.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111407-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:sneh.mankad@oss.qualcomm.com,m:daniel.lezcano@oss.qualcomm.com,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 619B26482CC

On Fri, Jun 05 2026 at 12:43, Peter Zijlstra wrote:

> On Fri, Jun 05, 2026 at 04:00:46PM +0530, Sneh Mankad wrote:
>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>> retained.
>> The hardware design on these SoCs forces a constraint to suspend and
>> resume the system on boot CPU / CPU0.
>> 
>> If CPU0 is already offline before starting suspend to ram the
>> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
>> proceed further to invoke PSCI SYSTEM_SUSPEND.
>> This leads to a system crash.
>> 
>> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
>> config and when enabled prohibit the CPU0 to be offline.
>
> Why do this in generic code? Why can't this live in arch code.
> Specifically, x86 can't typically unplug CPU0 at all either.

arch_cpu_is_hotpluggable(cpu) provides that info to the cpu device core.

No hackery in cpu.c required at all.

Thanks,

        tglx

