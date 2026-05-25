Return-Path: <linux-arm-msm+bounces-109693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD5YJCigFGo4PAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 21:16:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60C5CDFA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 21:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CC68300FC6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 19:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4622772D;
	Mon, 25 May 2026 19:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ksalj43x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E96B33EF;
	Mon, 25 May 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779736613; cv=none; b=ZAG/Szq9NTjaRwn5qke/ke1FoVVmPAXMyjRX0iMz3o+mFOQpboUQEs/aHp7Y0C16dWkF2Thl4qOvZsoIP2VGqgU5RBB0a+ihoAJorcn0ntInj0EnvIe57W9o7Ju2l/duC+W9eBRBKT94iQvm/Wgg8nP/TKXPnWf3dmS7U3OzuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779736613; c=relaxed/simple;
	bh=AbJT4VzwzzGnWH0FkNRvKJuQxtsAhx/4Bgq3FDF2gXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J00fHShLL6uQqcRqF9htO7RthRL+iufkY/77lcFkjwJXs1g7Z6nCee8VWPpbaWa4m101hlvSSCxoO3rtkuTJUcGg+LLxJeSWp981qSoL/nwieUYzUQ6RYNIhAoqY4TA0dtU2WXe0wWPkKW6WW/Uo9EyUFY5Vm110QWCmt5hzvig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ksalj43x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E00F1F000E9;
	Mon, 25 May 2026 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779736612;
	bh=RmnQ263oLD0uK9gJy4/LWzhQv65NeeHSSci5W1ZAtAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ksalj43xrCp1ylgJK34IoUDWVXKIas6YFzTsnOEKHmktxVZYHS72NLpFPvxnAia1Y
	 RswXcF7oYIdiGevNjvDScm6u5VuuSrvwyo2JUR9ikeKKhDPeuHKLH87T3OE5OzzWbZ
	 FnyQkvc01Xdz3sJjvEDbdR568AZIZWAh0Kj6DqS8=
Date: Mon, 25 May 2026 21:15:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, amahesh@qti.qualcomm.com,
	arnd@arndb.de, abelvesa@kernel.org, jorge.ramirez-ortiz@linaro.org,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
	stable@kernel.org
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <2026052519-negotiate-conclude-d43d@gregkh>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
 <2026052211-pavilion-compost-5fcd@gregkh>
 <d9248bf3-ef48-4c04-ad7d-debc8854bae5@oss.qualcomm.com>
 <2026052541-moaning-dioxide-d5c7@gregkh>
 <wowscekybeyxjgoztvwtgls4s7pbwciiztsizyc6kolxp4g72m@bfy32b24zo2s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wowscekybeyxjgoztvwtgls4s7pbwciiztsizyc6kolxp4g72m@bfy32b24zo2s>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109693-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: ED60C5CDFA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 11:28:48AM +0300, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 07:06:37AM +0200, Greg KH wrote:
> > On Mon, May 25, 2026 at 11:30:43AM +0800, Jianping Li wrote:
> > > 
> > > On 5/22/2026 3:03 PM, Greg KH wrote:
> > > > On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
> > > > > On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
> > > > > > On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
> > > > > > > From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
> > > > > > > 
> > > > > > > fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> > > > > > > getting removed from the list after it is unmapped from DSP. This can
> > > > > > > create potential race conditions if any other thread removes the entry
> > > > > > > from list while unmap operation is ongoing. Remove the entry before
> > > > > > How can it remove the entry from the list?
> > > > > Multiple threads sharing the same file descriptor may invoke unmap concurrently.
> > > > multiple threads sharing the same file descriptor is a horrible
> > > > userspace bug.  If you do that, you get what you deserve :)
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > I agree that concurrent unmap on the same buffer from multiple threads
> > > is a userspace bug.
> > > 
> > > However, the fastrpc driver is exposed via ioctl, and any userspace
> > > (including any random apk) can map directly and then call multiple unmap.
> > 
> > So there is no userspace selinux permissions settings on the fasterpc
> > device node at all?
> > 
> > > This patch is not intended to support incorrect userspace usage,
> > > but to ensure that the driver remains robust against invalid or
> > > racy inputs.
> > 
> > Isn't control to this device an "admin only" thing?
> 
> No, it's being used by normal user apps. Also, there are systems without
> SELinux being enabled / used.

Oh wow, this driver is going to be even more of a problem than I
assumed.  Someone needs to throw an LLM at this and fix all the bugs as
soon as possible then...

good luck!

greg k-h

