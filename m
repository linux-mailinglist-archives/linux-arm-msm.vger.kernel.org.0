Return-Path: <linux-arm-msm+bounces-89737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B4D3B44F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 479B53096788
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76216327C18;
	Mon, 19 Jan 2026 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWV2KY9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532913164A9;
	Mon, 19 Jan 2026 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768843270; cv=none; b=NsGsdR3kzAjfoBscrFc0GTGbnD3g+7vlrYRRCSdO9ZbO79F0sTJ0NYN0oOEAlntYTY2n/T2ab0uZSQg+tgt8VC6DHmKMfjxS3V7tmBYm7Suoq2nlguL0pF74Ojd0/mf7zZRi4tk8x1C7PSpbFLCrXrJBEglM/AHlmNwzygLuOWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768843270; c=relaxed/simple;
	bh=XocMp6mK1Zyg24+uQifHH/76ysAbbhjL8x90MKeGFrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBHi8TsgzwOBMeAK/AjQpK1qkiEIwFLniEOkaqXv2VfPzrjd6L2+381L6VdZYiQdl0fopxL0EsRCjbsWdaOG2R43xprH/CFWOxndTX0TFtVymLRftykEch4M0VMcfuKDYbJ0WzKGeD1+dP7RerlvGcsuxHz5Ly+oVnT+jNyxXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWV2KY9b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC561C19422;
	Mon, 19 Jan 2026 17:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768843269;
	bh=XocMp6mK1Zyg24+uQifHH/76ysAbbhjL8x90MKeGFrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWV2KY9bObPKEaXLTdo7tHbX5+1Hv2z9jsrYyQV16l0nwEpMeQW4RdhNjjdATFvqC
	 Tcb81GDs+8jQ25ufEwwJhcpk1usi5Lq0cuYsO0bVTetlKB43/bHKgW6KlkCslWMgQ2
	 uPQLWztwnpPP6Jf5nJMw/uAVE4FZ4kHFPst1Ta71423ovAiKcJE9U5aVPleOgxpD5Y
	 xFYeEvNl/HadDKKWnz/M2GmKvVOKw4FD5txdzGgmF+82l3vw/3frSpwuPjbc+Chioj
	 QLQ5A0V7tfTQqwpv4Bppzu4NRS4g+SufVKF4CenbrjA+3M1FYAUjC8xRaOURWr8n8i
	 cA49Iw4xHRAUA==
Date: Mon, 19 Jan 2026 11:21:07 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, 
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <qv2do4mmxrlspkr2b2vzsozedxzdocoyapymll63laowljue3d@ycq3mlxrrllt>
References: <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW5Fdjag_w7i0zWN@bogus>

On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> > > > 
> > > > I believe that point(s) we have not touched upon are following:
> > > > 
> > > > There will be thousands of Android applications using the native interfaces
> > > > in the playstore in various regions like US and China and so on, which relies
> > > > on getting the SOC_ID to understand the product and enable / disable some features.
> > > > 
> > > > For example, benchmarks like GeekBench or Antutu may also be reading these
> > > > interfaces.
> > > > 
> > > > There are apps. in certain regions which are still not updated from "32-bit"
> > > > to 64-bit on Android yet as an example and there may be no way to reach out
> > > > to those developers to fix but apps. are still used by many users.  
> > > > 
> > > 
> > > Fair enough, but apps get updated on Android phones every day. So sorry if I
> > > don’t consider this as something impossible. I do understand many apps are not
> > > actively developed, yet that is no reason to say the wrong assumptions made by
> > > these apps are correct.
> > > 
> > 
> > It might be what you're saying is true, at least for the top-10
> > applications in the app store. But that is not how we manage or maintain
> > the userspace interface in the Linux kernel - we don't break userspace.
> > 
> 
> Agreed, but I still think socX != soc0 and that is wrong assumption by the
> application. Anyways, if more people think it is user-space break, I accept
> it.
> 
> > > > If we need to move all of these third-party applications to this new interface
> > > > then we have to "break them" before we fix them. Do we want to have such approach?
> > > > 
> > > 
> > > Sorry, which new interface are you referring to?
> > > Are we still talking about /sys/devices/socX/?
> > > If so, are you suggesting that X=0 and X=1 represent two different interfaces?
> > > If that’s the case, I honestly have no words.
> > > 
> > 
> > Please do have words, because I really would like to understand what the
> > expectation of userspace is in the even that there's both soc0 and soc1,
> > regardless of which is which.
> > 
> 
> OK if we are going there, can we blame the firmware for exposing this
> information which is standard ? Sorry to repeat by firmware is exporting
> that info in OS agnostic way and other OSes use that as the information as
> it is standard way. Why can't we make Linux use or work with that information
> as that removes all these vendor specific fragmentation created over years.

I certainly don't blame the firmware for providing a generic interface
for exposing such information, it sounds like a good idea to me. My
concern is that we're not "abstracting" this away from the applications,
within the kernel.

I think the UAPI should provide one answer to the question "what target
am I on right now" - not two (or N) different answers.

> This point is orthogonal to user-space break.
> 

With multiple socX instances exposed the UAPI no longer matches my
interpretation of its purpose (feel free to tell me that I have
misunderstood the purpose).

> > What does it even mean to have two different socs presented here? How
> > would userspace know which one to refer to? Should it refer to both and
> > guess which one makes more sense to it?
> > 
> 
> Yes, the standard interface doesn't have much info though, so it could be
> union of it if the applications prefer that way.
> 
> > 
> > To me, when you decided to add a second caller to soc_device_register()
> > you created a regression in the userspace interface. If nothing else
> > it's a leaky abstraction.
> > 
> 
> In that case, shouldn't soc_device_register() made to give error when an
> attempt to call it more that one time then ?

Based on my understanding of the purpose, that seems reasonable to me.

> Also should be change the
> ABI documents to refer it as soc0 and not socX ?
> 

I'm still grappling with the thought of what does it actually mean to
find N socX nodes. Perhaps I'm wrong and the answer is that these are
just different blobs of soc information and userspace should consume
them all? (Just doesn't feel very user friendly to me).

Regards,
Bjorn

> > > > We should not have enabled this feature as "default y" in the first place and should
> > > > have kept it as "tristate" or kept it disabled in my opinion.
> > > > 
> > > 
> > > Sorry, but how do you envision this working with a single defconfig? Please
> > > consider the issues on platforms beyond the ones you’re focused on as well.
> > > 
> > 
> > Glad that we're on the same page regarding both defconfig and
> > our considerations.
> > 
> 
> Thanks.
> 
> -- 
> Regards,
> Sudeep

