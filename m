Return-Path: <linux-arm-msm+bounces-84118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15808C9C762
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 18:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F24D74E103D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 17:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D4B2C0F78;
	Tue,  2 Dec 2025 17:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WETxi9yl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE12C0279;
	Tue,  2 Dec 2025 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764697740; cv=none; b=C+Te0asazESwxxaPEkSgIXFCFAqQ4M6QxT5w3eNDmL+7cGa5KsDzkpz/uciAXwDvbnPP6/y475iOtVFTGD/zo/W/gGj0fjZxJpAOdDL4vS4JpY3psWU98n3mBJePOfAL8N65NY+nW8tCyALLXm6LlpRFh2fZk0JxsfIlWDx4fQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764697740; c=relaxed/simple;
	bh=w+mga+o+tetqyVOBCkgEikxQuxEusTULiWyfjpvbTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRFJdo6mejpDVhuS+LflbPEl0hk62nVd2e8fFNXj37vpoOwVqXQHMrA/5aYny9GsVNgyvcb2YSNcPJ3i6yMgkkSYyCz+dtPQl+QEI4zoTsOjHqL8Xzc4LNPpYpMBlK3NCqV68e//wYgVsSW2FRWh+bb6YRhvuDJzDQrsoskkUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WETxi9yl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B6DC4CEF1;
	Tue,  2 Dec 2025 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764697739;
	bh=w+mga+o+tetqyVOBCkgEikxQuxEusTULiWyfjpvbTbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WETxi9ylc7wJUJTf7ozJd7xoasuVhmHN+WD2CxuKTVo1LKFY4VRDfZxyWVCJ9TBFc
	 8xJdytm+BzSskOR708bUT+ZWK1t8bQD+8+NNUDVs4oJjth+she6VT+9crwZqVGJ4oS
	 UQFtGNWHq5KECzm8X6bdNeNtHlzmCsDqe7rHTAdVmUGhiHb/To2B2MGuyKXvdyiv4S
	 Gq9rZXDXLZiI5yYlnFd3LfF4HMmgvtCamhZiMl3e63W1gCK+JB3yeDANpVNIkfeXO0
	 DTYg+iWPdkytxz7PQ5MKERYq5C2g8Mf0aWrwHiYXuCFgM2QNw6vEENsXihanPtXtdo
	 UZg64pVf0WVGA==
Date: Tue, 2 Dec 2025 11:55:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] remoteproc: qcom: Fix NULL pointer issue
Message-ID: <k7sao7ssrtkxufeegxl6kxcrydxbz3qvgdvywu7kt4c4ijojj3@z7hqohc7dhs2>
References: <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
 <o7txzvxy36nphtf5aybzb3z25zovhgtseubkyn2hbira3aorxo@vky3kzv7gvs3>
 <20251202111823.s7qgorpqalgaayn7@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202111823.s7qgorpqalgaayn7@hu-mojha-hyd.qualcomm.com>

On Tue, Dec 02, 2025 at 04:48:23PM +0530, Mukesh Ojha wrote:
> On Sat, Nov 29, 2025 at 03:01:42PM -0600, Bjorn Andersson wrote:
> > On Fri, Nov 28, 2025 at 04:02:40PM +0530, Mukesh Ojha wrote:
[..]
> > > diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> > > index 8c8688f99f0a..6480293d2f61 100644
> > > --- a/drivers/remoteproc/qcom_common.c
> > > +++ b/drivers/remoteproc/qcom_common.c
> > > @@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
> > >  {
> > >  	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> > >  
> > > +	if (!glink->edge)
> > > +		return;
> > 
> > This does make glink_subdev_stop() idempotent, but do we guarantee that
> > the rest of the involved callstack handles this as well? Is it
> > documented somewhere that any changes to the framework or remoteproc
> > drivers need to maintain this property - or does it just happen to work
> > today?
> >
> 

Sorry, missed the "second half" of your reply.

> This changes was not intended to enforce the check throughout the involved
> callstack instead just put NULL check to avoid the kernel crash. Yes, it
> works as in we don't see kernel crash after this.
> 

The way the kernel is written now, it's perfectly reasonable to expect
that error handling happens and these pointers ends up in a state where
we will perform a NULL pointer dereference. This is a bug and should be
fixed.

What I'm saying is that I don't think we have a clearly defined
requirement of how error handling in stop() should be handled.

You're patch is taking one swing at a game of whack-a-mole, but we
haven't defined if that is the game we're playing.

> I see, even after this there is no guarantee that it would not result
> in kernel crash in future may be in some SSR notifier.
> 

Exactly, there's nothing saying that a remoteproc driver's stop()
callback should be callable again after returning an error.

The outcome today is undefined.

I think we need to define the outcome, either by saying that stop() (and
all involved parts) might be called again on an error, or by marking the
remoteproc to be in an "undefined" state (what you called defunced in
v3).

> > 
> > 
> > The commit message needs to be rewritten so that a 3rd party can read it
> > and understand what problem it solves.
> > 
> > Under what circumstance does qcom_pas_stop() fail, and in what
> > circumstances would it work again a little bit later? Why do we get
> > -EINVAL here?
> 
> I don't have information on whether it will recover later or not.
> 
> > 
> > I fully agree with you that we should do our very best to recover the
> > crashed remoteproc, to the point that I wonder who will actually trigger
> > this bug? In what circumstance would a user go and manually enable
> > recovery on a remoteproc with recovery already enabled, to dislodge it.
> > 
> > I think we should fix the root cause, because that's what all the users
> > and 99% of the developers will hit. Very few will attempt a manual
> > recovery.
> 
> 
> This can be triggered from developer by seeing why my audio does not
> work, that can lead to checking the state and triggering the recover
> command and he may not have liked to see kernel crash just because
> of this command. I know, there could be firmware bug but that firmware
> did not crash the system and it happened much time later.
> 
> > 
> > If we then consider attempting a manual recovery after the recovery has
> > failed, then we need to document that all parts of the stop must be
> > idempotent - in which case this patch would be part of that
> > implementation.
> 
> 
> Now, I agree with all of the points but leaving the device crash just
> like that does not look fine either even if there is firmware bug, but it is
> not crashing in firmware but in Kernel.
> 
> Do you think, I should still follow [1] - RPROC_DEFUNCT from framework +
> setting to RPROC_DEFUNCT from qcom_pas_stop() ?
> 

I think we can get the Qualcomm platform into a state where things
really are in an unknown state (like when some of the access control
operations fails). So we might need to introduce that anyways.

But there will be a category of recoverable errors, so I think we should
handle these in a predictable way.

> [1]
> https://lore.kernel.org/all/20241016045546.2613436-1-quic_mojha@quicinc.com/
> or 
> 
> Not solve this at all ?
> 

The current error path is broken, so we should certainly fix that (in
some way).


In parallel to that, I'd like qcom_pas_stop() not to fail with "Invalid
argument" if we have a recoverable error - at least.

I would also like to know what the frequency of this error is, so we can
consider if rproc_trigger_recovery() should perform a delayed retry.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > +
> > >  	qcom_glink_smem_unregister(glink->edge);
> > >  	glink->edge = NULL;
> > >  }
> > > @@ -320,6 +323,9 @@ static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
> > >  {
> > >  	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
> > >  
> > > +	if (!smd->edge)
> > > +		return;
> > > +
> > >  	qcom_smd_unregister_edge(smd->edge);
> > >  	smd->edge = NULL;
> > >  }
> > > -- 
> > > 2.50.1
> > > 
> 
> -- 
> -Mukesh Ojha

