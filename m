Return-Path: <linux-arm-msm+bounces-116718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2CnMIml/S2qSSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:11:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8A70EF33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WRLy7BXm;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116718-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116718-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33BB131EA121
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FE94CA267;
	Mon,  6 Jul 2026 09:16:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C923B8934;
	Mon,  6 Jul 2026 09:16:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329402; cv=none; b=ZPbGu6IAxVhoDEn33jJ7jPCQe2PPlcN/gLICSAPEbr2r85u073Ajt/YVPImAOUnXptdDhUmGYGJW7Tbp7/14cRTdwustuAnzpd78pTJ4jT9OeqpRCWySwfxPhXvg949TzHl14o881t4QTAyY4ccmL2AHqY53hSGYRYbovXbnVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329402; c=relaxed/simple;
	bh=tAvOtMXm/P4hMQo4CyDsw0njcmQbY4L/sLCEhymQXEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qu5CJkdE8LgBRKsAb3J1nNcr0deaoED2YGX/KQAc9QBffgBOikgCjSzOFeBVQr24G0Wx9CEtaSH77VaZMXY8S7Z7S575vRyXDA28oNiTSu30esFAAKpN9Yxk0gfeng+JdejjDVXh5R/YdYhcn7WwLfycy0Gb/TXXmC4GHoZPWDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRLy7BXm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6433E1F000E9;
	Mon,  6 Jul 2026 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329392;
	bh=GqDsh2QaLKyHlaA9B2wG1IbFv9bbWVtFohll3WxV0wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WRLy7BXmrQwuhcKKUQeEVftjBJSq86DS94OZuPCDtxVVR4EzjIwIyxHW19+RNTnl/
	 agnpZdEOj4r2UwCF4o5qz9ShTdxFLQEX08eSDco8+NxfukYNxIVJBOgpmCgrFG3tSI
	 HtHIc3dFLxKbhmlCYLBlMggzaB5gUNP5NeCeJhDqy6vv7l5ICeFT9kHpwdRUK8OhPS
	 7U/1s8+0E9kv2R9QUFEjqDz30TX+Q+zpmiu2NKA4NMis4c8iU1krFfrUDcUdZsdPpT
	 eE5fhi/IFdyQe0zB0qDbod27nr5AAy5VLFqTkCgDwFmpXOPZkHoDdOpXh8bwtQbwVF
	 wBWkGIoAbbEMw==
Date: Mon, 6 Jul 2026 10:16:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
 <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:sudeep.holla@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:catalin.marinas@arm.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:will@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116718-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sudeepholla:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27A8A70EF33

On Sat, Jul 04, 2026 at 08:43:39AM +0200, Daniel Lezcano wrote:
> 
> Hi Sudeep,
> 
> Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
> > (It is always good to cc all PSCI maintainer for any ARM64 CPU
> > hotpug/suspend related changes)
> > 
> > On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> > > The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> > > the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> > > retained. The hardware design on these SoCs forces a constraint to suspend
> > > and resume the system on boot CPU / CPU0.
> > > 
> > And you fail to explain why they have that constraint.
> > 

I still need the above to understand the issue/constraint better.

> > Is it because some secure context is not allowed to migrate ?
> > 
> > We already have a mechanism for that in place and this hack is not at all
> > required.
> Do you mean a mechanism for the secure context or for preventing CPU0 ?
> 

I meant constraint based on secure context.

-- 
Regards,
Sudeep

