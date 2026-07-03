Return-Path: <linux-arm-msm+bounces-116358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XhHKObHaR2pZgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:52:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E95704059
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:52:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S1W87LOQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116358-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116358-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19DAD3025A46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369CC284693;
	Fri,  3 Jul 2026 15:51:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB823535E;
	Fri,  3 Jul 2026 15:51:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093911; cv=none; b=I3AogQQYODNaWqSvn64PEkxgBqykGQp0ABFSqY49xB8r1pyBFWVoKsdM++nT+uCfl7yYcqtOzQZKBj9Aeu7053pjAraOQPndbRiPEnojNAb7jVZPh1nyvwlpqy5EtBxSc/8qxC2YYcxDyQE97r+I7LVBRqqQgYs6+r3vhJxx0cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093911; c=relaxed/simple;
	bh=lVW7oFsmm3mnZfJWpUXg/oAmayER/txPAT+ERX5ry/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nh2uh1hG/4+ezopIoRK9otbrC6jVBQHCwcIY3M93EfXCmy3pddGscxIxUtFexm1Od0xajmKHXuWY/TuknVheJOiq1y4isApyqV6XHJpsLuQtrvSDVFmnxECU+aZgcJ+HVk2iMlU/w38mCQJmLk2mJTrXh0cb5hV2ZUcRtiL5rtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1W87LOQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361A11F000E9;
	Fri,  3 Jul 2026 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093909;
	bh=3tFkhV9y3YSpG7ZFQq6X18e4oKX1Jy1S3KYwLSR0WpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1W87LOQhTm4vC9qjjU6evSDA7cIZuPkpXGHrVl4l/Y2SBeuvoH3TBVUAYI6gg35B
	 VMDwmFQDailxQp2+c++0GbmJHxuzaTy2XN9S6wp83hs4sHDycopFzFEGVwUjMObiUT
	 Je63NveeqJD6Bam9yHz6UZ0bTDCVl+eHpKGJeEkLKBIr4CyfnngUwG0MCmPLcc6/4h
	 yYOYIyfExN+aPu8V3GrcFy8GRZPzFJMaCxni28KSWA1qdJf88B3BNZpkckITHIPCoh
	 KkZzB4kXLBDry3iqhIgrM+IQPgQdLa6f1pP+eq1R4oAkPxZVWlMrXwRqEHg1yYZr22
	 9/n+cUnD34acg==
Date: Fri, 3 Jul 2026 16:51:43 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:catalin.marinas@arm.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:will@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116358-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sudeepholla:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97E95704059

(It is always good to cc all PSCI maintainer for any ARM64 CPU
hotpug/suspend related changes)

On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> retained. The hardware design on these SoCs forces a constraint to suspend
> and resume the system on boot CPU / CPU0.
>
And you fail to explain why they have that constraint.

Is it because some secure context is not allowed to migrate ?

We already have a mechanism for that in place and this hack is not at all
required.

-- 
Regards,
Sudeep

