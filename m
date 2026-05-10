Return-Path: <linux-arm-msm+bounces-106827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG9QEVnbAGq/NgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 21:24:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6397505F67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 21:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E79DB3004C4D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 19:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFF930F938;
	Sun, 10 May 2026 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKSfM7WN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE6233704;
	Sun, 10 May 2026 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778441022; cv=none; b=NxkmC1RrHX7qFu6Q20y46E1dwXq0Bogkp/ta1nQTl+FqQfycbwIuFr84Y9pcZatDyFCQuXb80yEQvqY1xaUSzVY0yLj6UJdOPNW9pdl7TSIRrZTYtX4oO0trH5vh1lwd7N0e0MqIiCPKm1Ri2SFCYq7rUNsRJCdXtsXsTjDSQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778441022; c=relaxed/simple;
	bh=VtKlCWi/WZCp9eF70ML2HPisQEkB7bfjW/9MYJQ6q9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAIxuMu7WVIxSO+JjufqW7P2thn9UUkn1aLssQwrwukwacRJaBotXakz4lKJHu6eyP7SeFN9IQg4poUmjg9W1RlMeb+ikmmsIMzuErJ+8MKV4SWA92j9hqZQdbNKYNqRwhEx6930iw0bSx/lk2FjikD2mtVff+mMxOhbxe9QLZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKSfM7WN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B507C2BCB8;
	Sun, 10 May 2026 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778441021;
	bh=VtKlCWi/WZCp9eF70ML2HPisQEkB7bfjW/9MYJQ6q9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKSfM7WNNhAXCJYptyUa1uL9pzlwb+HjyhNFI0Yvfe+p+oNuZedvLCdtySeR5AFie
	 tiZMFWCVgbIt0nFyNZU98gEfgpBtbtiBKXkYF6XUTV+S9kNYzO+8zWGQpcFh0/raNv
	 DZ1DDxMwpKooQS9220xFKHn8fks85dZ+8e6fQWwesNM+tJE9KF2azWM6711Hadt25b
	 +xuIZlL9UGTYBBLsrbOWunfSozeIkFYM8M2d6SqKLyuD3JwP/nlx78aQQRzsJYmFk7
	 mRcS10Q/sc1Gk+80nle1p8GKvk/5EelyMXsewXHVu2NWX0wbUQ/DQemcicpH7vGYoY
	 iAcISIv5dCTNA==
Date: Sun, 10 May 2026 20:23:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jack Matthews <jack@jackmatthe.ws>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Regression in split ARM MMIO timer driver
Message-ID: <20260510-augmented-kakapo-of-wholeness-748b38@sudeepholla>
References: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
 <20260509-ruddy-dragonfly-of-poetry-45e9f1@sudeepholla>
 <87wlxca2jb.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlxca2jb.wl-maz@kernel.org>
X-Rspamd-Queue-Id: A6397505F67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106827-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 06:58:00PM +0100, Marc Zyngier wrote:
> On Sat, 09 May 2026 13:19:56 +0100,
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > On Fri, May 08, 2026 at 03:48:14PM -0400, Jack Matthews wrote:
> > > Hello,
> > >
> > > I am working on mainlining an old chip, Qualcomm's MDM9625 modem.
> > > I had previously booted 6.17-rc3 before putting this project to the side,
> > > but when I restarted work on 7.0 I was unable to boot. 
> > > I have bisected this to commit 0f67b56d84b4c49adfd61f19f81f84ec613ab51a
> > > (https://lore.kernel.org/all/20250814154622.10193-4-maz@kernel.org/) and
> > > reverting this commit makes the device boot successfully. Unfortunately I do
> > > not have access to low level debugging such as UART so I have not been able
> > > to pinpoint exactly what is missing.
> > > My changes for this chip are all available here in case it is an issue of my
> > > own doing: https://github.com/jackmthws/linux/commits/mdm9625-latest/.
> > 
> > Looking briefly into the DTS file, I couldn't find the sysreg based
> > arch timer node in the DT. It could be just an overlook unless there
> > is some issue with it that it's not added. After the above mentioned
> > commit, the MMIO timer gets initialised bit late in the boot and
> > could be the reason for boot failure. Unless you have intentionally
> > not added it, I would suggest to add it and try.
> 
> Ah, that's a good point. Not having per-CPU timers is not going to
> fly, I'm afraid. The MMIO timer will kick in very late, and we
> probably need to schedule threads way before that.
> 
> This looks to be a single Cortex-A5 however, not an A5MP, meaning it
> does not have the TWD, and relies on a global timer, which is a
> terrible thing to have. Not to mention that MMIO accesses on the
> counter is going to be even worse.
> 

Ah, my bad I misread it as Cortex-A15 and not Cortex-A5, so assumed
missing sysreg based per-cpu arch timers.

-- 
Regards,
Sudeep

