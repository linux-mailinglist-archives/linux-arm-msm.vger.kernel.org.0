Return-Path: <linux-arm-msm+bounces-118111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YoEVO1gSUGqJswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 23:27:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16F735CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 23:27:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BvuWBuDz;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118111-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118111-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB0BA3008D34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 21:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EBF3BB106;
	Thu,  9 Jul 2026 21:27:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E911D5160;
	Thu,  9 Jul 2026 21:27:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783632469; cv=none; b=r1ROwJAEa/oBljJzeQhOXsKWImc0FKr00C/U+S5u/EzZ+h9Zv3bdmNtifVmL604bOYygHeK0hLmEVQRCHoBr6a7Z1u/rncnDsJtWkj4TOAMymwsmuKu0rfDCyyQXTlwEqLd65QsFpYoq0rU/rfcsBAo21qSBXfJ0SbFjhuMGmR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783632469; c=relaxed/simple;
	bh=Sa4wXNpENSDYzM5GF1XaqAmirpRXBVUWfMUvlNmq7kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5o680aOL57d40YmZjKWYPAOdkrpUvIrdyO/LGaH46Yg1WcTLPofiyVzyNFOgeZbfTxv3aMBHlDBmGFcxF+0jlLAYVxhdT4EuREPztZaUZBvBGYXm9hMFR+GJ2ySXIrwRem1d/kw06BW90JwcUu/lY9LpAcKGIbfecUr4UqQhQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvuWBuDz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CC11F000E9;
	Thu,  9 Jul 2026 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783632467;
	bh=K7gv7DO3sRanhSag9LvnX9LZtxm45e9XO0imyrqaXXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BvuWBuDz7IFj4YppCCGpHWM4n2RrTqqSFf9MnF4JteCmXladxy8roihQmpUhe3zW2
	 3kU8DWcbn/KDobOugs7FtOq/4oq5zPpy/f7UQZXXrC1+XYC+1jHng8QLyqLj7Y7DHq
	 taA14sTXy0s365x58bM8TLUdKUQqelteSYdhO54s9DYANJMZtw8j6OdxxyW0BH4/V5
	 EEYaEI4nMb9BU2GqTL9+jRdM+sTja/Olu+4ViQpxNzf8zRwx3B+P2/d0XuUqO1IRNa
	 wenYWNjnmR6XS4ww6wCOKazCY5Uc5dndlQdotWYqSkbVfg2HFhK7+GfpO3cC6r164u
	 I8FGpqDu+VonQ==
Date: Thu, 9 Jul 2026 16:27:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <alAN2t2C5twxuIjd@baldur>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
 <aiqF5mh1PvWpH3L5@linaro.org>
 <20260611105506.llvya5tda4xsd2lo@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611105506.llvya5tda4xsd2lo@hu-mojha-hyd.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118111-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E16F735CF6

On Thu, Jun 11, 2026 at 04:25:06PM +0530, Mukesh Ojha wrote:
> On Thu, Jun 11, 2026 at 11:54:46AM +0200, Stephan Gerhold wrote:
> > On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> > > On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > > > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > > > If a subdevice fails to stop, it indicates broken communication with the
> > > > > DSP. Continuing to stop further subdevices against an unresponsive
> > > > > remote processor could close rpmsg devices that could remove the memory
> > > > > mapping from HLOS and in case if remote processor touches those memory
> > > > > can result in SMMU fault.
> > > > > 
> > > > > Change rproc_stop_subdevices() to return int and abort on the first
> > > > > failing subdev. Propagate the error through rproc_stop() and
> > > > > __rproc_detach() so callers are aware the teardown did not complete
> > > > > cleanly.
> > > > > 
> > > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > 
> > > > But what would callers do about this? If you abort the teardown sequence
> > > > half-way through you now have an inconsistent half-stopped state that
> > > > neither a new call to stop() nor a new call to start() could recover
> > > > from. That doesn't sound much better than the SMMU fault. Or am I
> > > > missing something here?
> > > 
> > > SMMU fault result in device crash while other is non-functional remote
> > > processor. From Linux side, we do not know the state of remote processor
> > > when the timeout happens..cleaning the subdevices can result in the
> > > debug data being lost for hung remote processor.
> > > 
> > 
> > Ok, but how do we go from here? Do we expect that the system would have
> > some userspace monitoring daemon that would collect the debug data and
> > then reboot the device to make the remoteproc work again?
> 
> I would expect the manually collected crash dump in this state to find
> out the exact reason for remoteproc being stuck instead of ignoring it
> and claiming a graceful shutdown.
> 

We need to consider the scenario where there are other users running
this code than you, and as Stephan suggest, they probably expect the
system to recover (by some means). Few people would be expected to pull
out their JTAG hardware and start hacking away...

> Whatever we do here, the remote may be dysfunctional without a reboot,
> but cleaning the rpmsg device will clean all the required debug data, or
> at least if possible, tell the rpmsg driver with the rproc state that
> shutdown was tried but was not graceful.
> 

That's certainly something we need to take into account, but does the
use of "may be" leave room for the possibility that we have a
recoverable error?

Also remember that the user might be in the middle of an important video
conference when the CDSP hits this error, so we don't necessarily want
to reboot the system just because we enter such state - there's user
policy involved here.

Regards,
Bjorn

> > 
> > With these changes, I don't see how you would start the remoteproc again
> > without fully rebooting the board. Calling start()/stop() on the
> > subdevices again would lead to crashes because some of them are in
> > started state and some of them are in stopped state and we don't even
> > know which one is in which state.
> > 
> > Thanks,
> > Stephan
> 
> -- 
> -Mukesh Ojha

