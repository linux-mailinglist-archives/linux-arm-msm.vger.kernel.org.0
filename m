Return-Path: <linux-arm-msm+bounces-89738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8AD3B4D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11EDA3015ADB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD08326957;
	Mon, 19 Jan 2026 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEyzhk9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2E031A543;
	Mon, 19 Jan 2026 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768843534; cv=none; b=eyfhyHYGitlam74nufwhQhl9afTzKNwjgaZBwXavLCS5USqNzDDhRnhPa9w2N6uvqGSJLFZg++qJrVjKdEpIEPjmwKtCPZhNBQTo2H7+vdEX4HubBoTCf5zFD+hc4+M2vYBCuE2YjuYRRyogHxnN3gteRz/cTUOzgpyk4zedK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768843534; c=relaxed/simple;
	bh=ef9KQiTORUeb2xh0Xx3sReVnHgoY66PauPM/FZXCvKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpI++xr1YxQNe9v7eS64SUf0l7j1baFLA6kG8kFKf+Yek9jvNQTE1aWXKtcM+8UcSthVOPlyLYqk+u5fBgdDs+v0XgvWDcnkbGZq4gW772m3BNCOShNkPxEcIvu+YtACnoKQYEAFumgKB9Ym03BlPvC/ZkDvRw6ey/nQu4YL4aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEyzhk9Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CA9C116C6;
	Mon, 19 Jan 2026 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768843534;
	bh=ef9KQiTORUeb2xh0Xx3sReVnHgoY66PauPM/FZXCvKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEyzhk9ZqdotAX7CWbrJ8CF/jmjwQf/SDsxcWMpaKGVGLWpbZpmXyXk26ST9ULELX
	 0rp1RQBRbcV7SWWtXwe6HIO5PhcXE9fmFgPSZAoTtUGUmJzM2HiV+fdev8TvJSe6/C
	 aIvrXwejtSNAAeolmTbC+msJEIvFFGXcc3hXo83q/VHu+gutfs9yXpwCug47930cvw
	 1cV4L6X2lwNWANrA1tIN1YxfWWz7csgxms2BtforRUKaCgPoRzhJzgIULLD0U+Npkm
	 V5v+HILIwJc7O5Qn7zmhNTVrj/R+fQ2x5VHOT8Ny5b9Xv/HUTSMBW6B5fWH/N5iaI8
	 ZTLeGRn/z7STw==
Date: Mon, 19 Jan 2026 11:25:31 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <i4zd3jesjrbljym7xuhwo5v7gwbsbuesuarnxr462eeuosevij@64hcfdzht6w3>
References: <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
 <aW5iQABCRukZXpZH@bogus>
 <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>

On Mon, Jan 19, 2026 at 07:20:09PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 04:56:32PM +0000, Sudeep Holla wrote:
> > On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > > > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > > > 
> > > > > To me, when you decided to add a second caller to soc_device_register()
> > > > > you created a regression in the userspace interface. If nothing else
> > > > > it's a leaky abstraction.
> > > > > 
> > > > 
> > > > In that case, shouldn't soc_device_register() made to give error when an
> > > > attempt to call it more that one time then ? Also should be change the
> > > > ABI documents to refer it as soc0 and not socX ?
> > > 
> > > Then the whole SoC bus is an overkill. But I have a strange question
> > > here. Consider the device having the "BT / WiFi SoC" next to the main
> > > SoC. Is that SoC a legit target to export informaiton through sysfs /
> > > soc bus?
> > > 
> > 
> > Just for clarity, I agree with you and there could be duplication of
> > information if there are multiple source for that information. E.g.,
> > the setup in this discussion where the EL3 firmware provides SOC_ID
> > information via SMCCC SOC_ID and DT providing vendor specific information
> > about the platform. Both are getting exported via sysfs but the problem
> > here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.
> 
> I understand the context and I understand that we ended up having two
> soc devices for the main SoC. And that's exactly why I'm asking about
> the WCN SoC exporting the information through the same interface. If it
> is a legit user, then it is a possible outcome that WCN binds to soc0
> while the main core gets bound to soc1 (even without SMCCC_ID in place).
> 
> Likewise if WCN if a legit user of soc_device_register(), then we can't
> make it fail after registering the first entry.
> 

But by this definition, a vast variety of discrete IP should register
with this interface - instead of providing such information in their
respective functional interface.

My interpretation is that the soc_device_register() related to the
entity which is represented as /soc in your DeviceTree.

For a broader "dumping ground for different IP to register their
version information", we'd need some way to associate each entity with
the related component - which I believe there is none, because then you
could have used the specific driver interface in the first place.

(I.e. there's no representation of the WCN SoC in our system, we have
representations for the PMU, the WiFi, and the BT core, but not the
whole).

Regards,
Bjorn

> > 
> > We are exploring ways to see how user space can survive this.
> 
> -- 
> With best wishes
> Dmitry

