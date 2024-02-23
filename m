Return-Path: <linux-arm-msm+bounces-12406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DB3861CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 20:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30E441C23182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 19:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FAA14690B;
	Fri, 23 Feb 2024 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uWxPu15j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D21448DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708717870; cv=none; b=Ggm15IN3McRsHGmMTCNqgZozld95P0STMm4oItViQLJ1r7DssMQkXqYvMXZHkC5dJqLvxsbzk9mFIgqkZ4VMId6UImht+R0ztKeUg01052QHD989MwS2w4bx99J/G2Awe2Y69jj3pFZEW9Gi6g1yl854Teq6kfXD+5emQI/Byx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708717870; c=relaxed/simple;
	bh=YaVgMmCZccAOj2rhCfHdyWTcmqoRE1LJqZeVBmFLeSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJHIbL4ThMtQt7gG/sfCa9P9rcb7lz0d83ufiFmCnbi5iARbYuvUbU2liG3c5q2qRnkoReEuGNv/YkDy4CChzdjpNQ6BgWDO/DMQrLmk0XzA9/DDLqrsClja+WqpnES1sLCqii/u+gNNdoIOmWu+Ekpz0Mfo5yhnwro3beTyIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uWxPu15j; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 23 Feb 2024 14:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708717865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=;
	b=uWxPu15jxbBy5Qv8sUU4/FKz9vhwMVdq24ex7AxwdBDTkpdTty7N4oFt5H+WpItVhn5h2q
	QhDNbk6QMiXNrrlkBl7kMfsoV81d2NhOFvXWC0sVWqoHMtRJN5Tm42Zzvb2Qci9w4QIV6Q
	wpkGE4FwRbb7rZDimmKQkBl02FYhYXk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, 
	LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org, selinux@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-wpan@vger.kernel.org, 
	dev@openvswitch.org, linux-s390@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
References: <20240223125634.2888c973@gandalf.local.home>
 <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
 <20240223134653.524a5c9e@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223134653.524a5c9e@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT

On Fri, Feb 23, 2024 at 01:46:53PM -0500, Steven Rostedt wrote:
> On Fri, 23 Feb 2024 10:30:45 -0800
> Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> 
> > On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > > 
> > > [
> > >    This is a treewide change. I will likely re-create this patch again in
> > >    the second week of the merge window of v6.9 and submit it then. Hoping
> > >    to keep the conflicts that it will cause to a minimum.
> > > ]
> > > 
> > > With the rework of how the __string() handles dynamic strings where it
> > > saves off the source string in field in the helper structure[1], the
> > > assignment of that value to the trace event field is stored in the helper
> > > value and does not need to be passed in again.  
> > 
> > Just curious if this could be done piecemeal by first changing the
> > macros to be variadic macros which allows you to ignore the extra
> > argument. The callers could then be modified in their separate trees.
> > And then once all the callers have be merged, the macros could be
> > changed to no longer be variadic.
> 
> I weighed doing that, but I think ripping off the band-aid is a better
> approach. One thing I found is that leaving unused parameters in the macros
> can cause bugs itself. I found one case doing my clean up, where an unused
> parameter in one of the macros was bogus, and when I made it a used
> parameter, it broke the build.
> 
> I think for tree-wide changes, the preferred approach is to do one big
> patch at once. And since this only affects TRACE_EVENT() macros, it
> hopefully would not be too much of a burden (although out of tree users may
> suffer from this, but do we care?)

Agreed on doing it all at once, it'll be way less spam for people to
deal with.

Tangentially related though, what would make me really happy is if we
could create the string with in the TP__fast_assign() section. I have to
have a bunch of annoying wrappers right now because the string length
has to be known when we invoke the tracepoint.

