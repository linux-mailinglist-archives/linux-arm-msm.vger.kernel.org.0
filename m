Return-Path: <linux-arm-msm+bounces-89868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC4ND4PIb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:25:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AE4968E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD4EA62DC87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1BD32C33D;
	Tue, 20 Jan 2026 17:47:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3462A3D3300;
	Tue, 20 Jan 2026 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931239; cv=none; b=fl50EHTt82WmiV79mQhm3Oe/K/f43Cri+al2f6PPdyQiGtCtDi9MOoXP+PklZdlNYOLGehske/7CGGWwblT+TAI8pj0X9lhdSx6CSA2A8EHwNbyjT4vTsICHk5Xd2l95xxrUdB540J3SXlnzsqu55pj6uPYIeO+WiahCMM+pLEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931239; c=relaxed/simple;
	bh=prfSr+SOyeMy+2AAU1lvXC5avOW1gknyG0WZ/nnDxYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV7mvDRXlJKlxiIEzfOhnxzDmrTtWDc2j7z3XbdUY170OSTr8PUVR4rm/tjmpbbxchdtfF6kWIiaukQcFOQLcZmb0uDzf+5a2HKqyzQjvszhQrsfaByLP3vUAkyMue8XJiSQoKlyYFBHWHlFwTvXvlOqoxBTLmxvi9dMVoulaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E20F91476;
	Tue, 20 Jan 2026 09:47:09 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.35.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1D803F632;
	Tue, 20 Jan 2026 09:47:14 -0800 (PST)
Date: Tue, 20 Jan 2026 17:47:11 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aW-_n_gWV_cxlS-L@bogus>
References: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <qv2do4mmxrlspkr2b2vzsozedxzdocoyapymll63laowljue3d@ycq3mlxrrllt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qv2do4mmxrlspkr2b2vzsozedxzdocoyapymll63laowljue3d@ycq3mlxrrllt>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : No valid SPF, No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-89868-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C40AE4968E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 11:21:07AM -0600, Bjorn Andersson wrote:
> On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:

[...]

> > 
> > OK if we are going there, can we blame the firmware for exposing this
> > information which is standard ? Sorry to repeat by firmware is exporting
> > that info in OS agnostic way and other OSes use that as the information as
> > it is standard way. Why can't we make Linux use or work with that information
> > as that removes all these vendor specific fragmentation created over years.
> 
> I certainly don't blame the firmware for providing a generic interface
> for exposing such information, it sounds like a good idea to me. My
> concern is that we're not "abstracting" this away from the applications,
> within the kernel.
> 

I see your point, but the purpose of the SOC_ID interface is to avoid encoding
vendor-specific interpretation in the kernel and to push that problem to
userspace. If we now need the kernel to provide an abstraction based on
vendor-specific information from the device tree and SOC_ID information from
the firmware, then I don’t think that’s feasible - SOC_ID was designed
specifically so that the kernel wouldn’t interpret it.

> I think the UAPI should provide one answer to the question "what target
> am I on right now" - not two (or N) different answers.
> 

I’m not sure that’s an exact match for the question. The socX nodes simply
indicate which SoCs are present and expose the associated identification
information for the system that’s running. It’s not clear whether this is
limited to the application processor only, whether it can also include I/O
components, or whether the identifier is required to be unique.

> > This point is orthogonal to user-space break.
> > 
> 
> With multiple socX instances exposed the UAPI no longer matches my
> interpretation of its purpose (feel free to tell me that I have
> misunderstood the purpose).
> 

I can’t say that you’ve misunderstood it; it may be that I’m misunderstanding
it. My interpretation is that it provides information about all the SoCs on
the system. That could include multiple instances of the same SoC, different
variants, or even I/O chips such as Bluetooth or Wi-Fi. That’s my take on the
socX nodes, but I may be wrong.

> > > What does it even mean to have two different socs presented here? How
> > > would userspace know which one to refer to? Should it refer to both and
> > > guess which one makes more sense to it?
> > > 
> > 
> > Yes, the standard interface doesn't have much info though, so it could be
> > union of it if the applications prefer that way.
> > 
> > > 
> > > To me, when you decided to add a second caller to soc_device_register()
> > > you created a regression in the userspace interface. If nothing else
> > > it's a leaky abstraction.
> > > 
> > 
> > In that case, shouldn't soc_device_register() made to give error when an
> > attempt to call it more that one time then ?
> 
> Based on my understanding of the purpose, that seems reasonable to me.
> 

It's exactly opposite based on my understanding though 😉.

> > Also should be change the
> > ABI documents to refer it as soc0 and not socX ?
> > 
> 
> I'm still grappling with the thought of what does it actually mean to
> find N socX nodes. Perhaps I'm wrong and the answer is that these are
> just different blobs of soc information and userspace should consume
> them all? (Just doesn't feel very user friendly to me).
> 

Why ? If the intention was to provide as much information as possible
about the running system.

-- 
Regards,
Sudeep

