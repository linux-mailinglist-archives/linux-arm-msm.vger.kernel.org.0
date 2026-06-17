Return-Path: <linux-arm-msm+bounces-113521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8bhNEqlkMmqZzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:11:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1C697C72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:11:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Zbe5rA8B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113521-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113521-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F199930209DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933CF3955E8;
	Wed, 17 Jun 2026 09:06:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F563806B0;
	Wed, 17 Jun 2026 09:06:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687178; cv=none; b=X9b050KhSgJITvTtFrW4NfyZCbM3a7Rby7vxEAQlS0rI3ijLOqKSJy2mGXpGr1wCKG85mQBjxc9Q22t3dIMvgmoeQNjP4df7pSsHb5g+lckk8gVNH1CAawpbn9XyMbxfsHOGh12OQPAO7dcbmy6mJLPsXQ5Ck3XA0rEuwAF8488=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687178; c=relaxed/simple;
	bh=87rqxZ6DoysrUWHbFWQa2CpX6kNz2Ly9u/XKYCLwhjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvOJ/3AtpOqhpaFmEsjqHUhU3cudBWnLU8XwkghTehfpFc9NnvDiQjljCqliAEHp/trgHdmo7GXoFVWJFAYO1vTA3dclI0diDUlECxtxSmAgUhE3Gr/khVjtG+/rDuCnen4WhzyRwYtQIkBarhrqpLh4iDu++Fl+kHGTPOUQOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zbe5rA8B; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CD61F000E9;
	Wed, 17 Jun 2026 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781687177;
	bh=pw+CPMxX7kIpTRzGOW9utdbjRiEhzIi4EfaZkGwIwfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zbe5rA8Bp1ZRulmaMmYPa5pKdOrFqNrOs5Se+yDhmavxDWaJqTuHpePKyWkUD9AW4
	 KmL6PsO65Wi1be5roCIcW/aU/oRDosM0QnH6Ai8nenfTn7vevGg+PgpvvFqLpbOZgj
	 jd7bDKt4g5S8ikvOaONBSbT7QQdf/s5Ki+Jfqj/EBDsvoq/19Bxa1dV05WOmAH4or9
	 mz8HSUnmQ+qKgFcvvNEsLbQMO005Ojj049W1W3fzSTnEYlJU8cFZHpEmAl/VmRQyg4
	 2D7abf91XRNhU/HeQAof4QHkWl7/uMQgPhNFRriuHGghBLl0UQUhkbecfqJr9cNYtZ
	 NjERu/NhylcgQ==
Date: Wed, 17 Jun 2026 10:06:13 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
Message-ID: <20260617-glittering-aloof-dormouse-3acd96@sudeepholla>
References: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
 <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
 <eb50b45d-ad04-4da7-8cfa-6e1abb1ffba4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb50b45d-ad04-4da7-8cfa-6e1abb1ffba4@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:unnathi.chalicheemala@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:kernel@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:satya.prabhala@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113521-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sudeepholla:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FF1C697C72

On Tue, Jun 16, 2026 at 02:14:59PM -0700, Unnathi Chalicheemala wrote:
> On 6/12/2026 3:55 AM, Sudeep Holla wrote:
> > 
> >> Per the FF-A spec, the all-zeros UUID is the defined wildcard that
> >> instructs the SPMC to return information for all partitions. Map NULL
> >> and empty string to uuid_null rather than crashing in uuid_parse(),
> >> preserving the intended "return all partitions" semantics for callers
> >> that pass NULL.
> >>
> > 
> > Agreed on the spec part but not w.r.t the interface. Where is the driver
> > using this call and why is it sending null or wants to extract all the
> > partition information ?
> > 
> 
> A developer wanting all partitions might reasonably pass the all-zeros string
> "00000000-0000-0000-0000-000000000000"?

I understand that and the core driver does exactly this when initialising
to enumerate all the partitions on the system. But you didn't answer my
question as where is the FF-A client driver pass NULL ? You just expressed
the possibility here.


[...]

> > I object to make it uuid_null. Below check is enough to check NULL
> > dereference.
> > 
> > -       if (uuid_parse(uuid_str, &uuid)) {
> > +       if (!uuid_str || uuid_parse(uuid_str, &uuid)) {
> > 
> > 
> > I don't think we need to service NULL as valid argument via this interface
> > as the callee driver needs to pass its partition UUID here.
> > 
> I agree with you, NULL doesn't seem like a valid use case.
> 
> Will send another version with your suggestion, thank you for the review.
> 

Thanks!

-- 
Regards,
Sudeep

