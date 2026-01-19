Return-Path: <linux-arm-msm+bounces-89696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87290D3AE58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55C76315DDBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A08A39281B;
	Mon, 19 Jan 2026 14:53:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258BE38B7DC;
	Mon, 19 Jan 2026 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834429; cv=none; b=WMfeADGi9ILY7DmFQm0k6bbuVI3l4073PGhfTCDgWQIwokKJ2jYarWxl4pLOclCjDfTpXuwuUpkHBFwA7qOirmD8DgmwOSRsDPuLQcAZrAvSp3gyJCJcAfrls95nqfOof3Y9nYTok1zyArW4HzysVCQP/DBTGI+Oem76N8j5du4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834429; c=relaxed/simple;
	bh=NjpC0hMYVniiFh/79pFUPvMe4Yc46xqZkKT47zpmVFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXMNCF+DDiOFaMykLRmcoNIYDMMYgtiR6zdLDtGCzi3PnVCYKyzA1BPX/ihNWb4eFN4rzznlrVSRmeQUaRW9DhcLS2T1P4S+UG6rRWJxaLTPX1Y/IX2sbXPgS/7yBOPcliZnn5fmk4UNICQB3DYwrW6Ak9lxN5go4ZSm4UTTk0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C89AFFEC;
	Mon, 19 Jan 2026 06:53:40 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D453F694;
	Mon, 19 Jan 2026 06:53:45 -0800 (PST)
Date: Mon, 19 Jan 2026 14:53:42 +0000
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
Message-ID: <aW5Fdjag_w7i0zWN@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>

On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> > > 
> > > I believe that point(s) we have not touched upon are following:
> > > 
> > > There will be thousands of Android applications using the native interfaces
> > > in the playstore in various regions like US and China and so on, which relies
> > > on getting the SOC_ID to understand the product and enable / disable some features.
> > > 
> > > For example, benchmarks like GeekBench or Antutu may also be reading these
> > > interfaces.
> > > 
> > > There are apps. in certain regions which are still not updated from "32-bit"
> > > to 64-bit on Android yet as an example and there may be no way to reach out
> > > to those developers to fix but apps. are still used by many users.  
> > > 
> > 
> > Fair enough, but apps get updated on Android phones every day. So sorry if I
> > don’t consider this as something impossible. I do understand many apps are not
> > actively developed, yet that is no reason to say the wrong assumptions made by
> > these apps are correct.
> > 
> 
> It might be what you're saying is true, at least for the top-10
> applications in the app store. But that is not how we manage or maintain
> the userspace interface in the Linux kernel - we don't break userspace.
> 

Agreed, but I still think socX != soc0 and that is wrong assumption by the
application. Anyways, if more people think it is user-space break, I accept
it.

> > > If we need to move all of these third-party applications to this new interface
> > > then we have to "break them" before we fix them. Do we want to have such approach?
> > > 
> > 
> > Sorry, which new interface are you referring to?
> > Are we still talking about /sys/devices/socX/?
> > If so, are you suggesting that X=0 and X=1 represent two different interfaces?
> > If that’s the case, I honestly have no words.
> > 
> 
> Please do have words, because I really would like to understand what the
> expectation of userspace is in the even that there's both soc0 and soc1,
> regardless of which is which.
> 

OK if we are going there, can we blame the firmware for exposing this
information which is standard ? Sorry to repeat by firmware is exporting
that info in OS agnostic way and other OSes use that as the information as
it is standard way. Why can't we make Linux use or work with that information
as that removes all these vendor specific fragmentation created over years.
This point is orthogonal to user-space break.

> What does it even mean to have two different socs presented here? How
> would userspace know which one to refer to? Should it refer to both and
> guess which one makes more sense to it?
> 

Yes, the standard interface doesn't have much info though, so it could be
union of it if the applications prefer that way.

> 
> To me, when you decided to add a second caller to soc_device_register()
> you created a regression in the userspace interface. If nothing else
> it's a leaky abstraction.
> 

In that case, shouldn't soc_device_register() made to give error when an
attempt to call it more that one time then ? Also should be change the
ABI documents to refer it as soc0 and not socX ?

> > > We should not have enabled this feature as "default y" in the first place and should
> > > have kept it as "tristate" or kept it disabled in my opinion.
> > > 
> > 
> > Sorry, but how do you envision this working with a single defconfig? Please
> > consider the issues on platforms beyond the ones you’re focused on as well.
> > 
> 
> Glad that we're on the same page regarding both defconfig and
> our considerations.
> 

Thanks.

-- 
Regards,
Sudeep

