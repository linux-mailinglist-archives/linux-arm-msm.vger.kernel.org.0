Return-Path: <linux-arm-msm+bounces-94847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJrqFxlnpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:31:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BF1D68DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4726F30523A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4A33A0EB1;
	Mon,  2 Mar 2026 10:23:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A34392828;
	Mon,  2 Mar 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446995; cv=none; b=hyycsdnjqOU/pnbuH8R8xLulYiLcuN/9vyR0WEUf0wEWsuX+c0t7xn3bUwMqEUVpdiE/eUKbFinsmx+3IDOEQMWBX0tQ/86xKbk2tlrq/CO9ksUZfASTB2nCFP+ggtEogdGkV88cxItHWoHPz+PX+M052tXsXnpBc3KFg0KDjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446995; c=relaxed/simple;
	bh=JXsDSUzXfXJFyTXVsQfkE08VwngEw2R2QA/JKnjB0Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4wqQx3cfGRtE5xtyjWFUYclz63rzgUAsEmM99O4RIZOFhyx8mOOTvBAkTl6ReVn9q4W2YyLPXhqaaaPfaVr94hPnSEdVlU8vm3ed8w9XO78JqV+1+LIVKaeGbqCW5PpZh2bybcQeV2nVRCWbH+jguMFtF2lKXDzxZZRY4YgfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC36B14BF;
	Mon,  2 Mar 2026 02:23:06 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E85D3F7BD;
	Mon,  2 Mar 2026 02:23:11 -0800 (PST)
Date: Mon, 2 Mar 2026 10:23:06 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: ada.coupriediaz@arm.com, catalin.marinas@arm.com, dev.jain@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
	yang@os.amperecomputing.com
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL
 single-step
Message-ID: <aaVk1YrbraMAwcEl@J2N7QTR9R3>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302101905.3591689-1-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302101905.3591689-1-khaja.khaji@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94847-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.787];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 670BF1D68DF
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:49:05PM +0530, Khaja Hussain Shaik Khaji wrote:
> On Tue, Feb 17, 2026 at 04:55:44PM +0000, Mark Rutland wrote:
> > Since DAIF is masked, we won't take an IRQ to preempt during XOL.
> > Can you please share an example failure that you have seen?
> > I believe other architectures are likely affected by the same problem.
> 
> Thank you for the review. You were correct on all counts.
> 
> I confirmed the issue is not related to scheduling or preemption, and the
> v1/v2 approach was based on an incorrect assumption. I’m dropping that
> line of reasoning.
> 
> I’ve since identified the actual root cause and have a new fix ready,
> which I’ll send shortly as v3.

Ok.

As above, *please* include an observed failure in the commit message. It
will be the first thing we ask for otherwise.

Mark.

