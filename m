Return-Path: <linux-arm-msm+bounces-89749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B12D3B839
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 21:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EB80302036A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 20:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA082EBB99;
	Mon, 19 Jan 2026 20:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeU6eD9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52D258EFF;
	Mon, 19 Jan 2026 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854341; cv=none; b=VVsmimpbWyaKqvg5y6HKrciNHWVbCzu0RTyX4MTD/NKgYpAw5xPu0QrbCx5xZwiOa/p5jkSlCRX/Kxh1EhcdiQ6cjP1Nsx8wDut+xhExbrD3d2WJxl7lJkEp0V+5VyNsi5waCd70K4lv3nNUz+obwdfJaL+v8AN3x6HTCelqwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854341; c=relaxed/simple;
	bh=8d3W0K4c8D26haPLNtGJkI7Gi+VMOP9nhNsuB6f8Ybs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu6s7W9IITDJwDhN3hZY7DN66CIgCZj6Z0/1uVSP1hBxGJzDFE9am3t6VHakWF/peikl1uFFpmB473TEDXr00Gj++zUhRRsVwByOF01URpbseejAyN4w6OM/vCSYEjiYZFD8oSXkXgwyMUA+Qx+O2lj4bHQNSvZl8jHYiFQML6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeU6eD9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17376C116C6;
	Mon, 19 Jan 2026 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768854340;
	bh=8d3W0K4c8D26haPLNtGJkI7Gi+VMOP9nhNsuB6f8Ybs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeU6eD9Io4nLlYEbk5smaUpvQaQd2qHv0p10DtuEmfGpwBznIAqfnh59UR0X/hvKU
	 iJXW8HPPF7RT/DqECRw2MYujG5qAufNIUczrpd4oR+pLj39kxFQ0pKDciGSRR3ycYl
	 ft5bRGDPO6wCCsNXoK9+8Dn7+1Bces/pKT12OpYeuNjCUPy6qAQhehoJpeFun5uSre
	 6TYlpzQuuS0e/e5cyeikQozZUNTcxm6MPDDHHVFr6xCjI9T+SwpG+0z9oJsNH7eYuQ
	 PytEpmDHMn3/gASmL0gOy7acPBJevU3cieHq9dD2TZt2njOPtuslboKAHEJe+IFE4C
	 pv8ISjWpvuYJA==
Date: Mon, 19 Jan 2026 14:25:38 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <ta63kpklakanlc6dnmsqgr7u2o3ghdnt7uyyu3obbjask2voyv@eu6rhwhqzeyv>
References: <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
 <aW5iQABCRukZXpZH@bogus>
 <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
 <i4zd3jesjrbljym7xuhwo5v7gwbsbuesuarnxr462eeuosevij@64hcfdzht6w3>
 <2fmnaxj2ma2bb5iuuu4yzmenp3tsxjko6rziwuaaqr6rqvegbw@s4x6eiwhlkcm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fmnaxj2ma2bb5iuuu4yzmenp3tsxjko6rziwuaaqr6rqvegbw@s4x6eiwhlkcm>

On Mon, Jan 19, 2026 at 09:46:08PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 11:25:31AM -0600, Bjorn Andersson wrote:
> > On Mon, Jan 19, 2026 at 07:20:09PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Jan 19, 2026 at 04:56:32PM +0000, Sudeep Holla wrote:
> > > > On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> > > > > On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > > > > > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > > > > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > > > > > 
> > > > > > > To me, when you decided to add a second caller to soc_device_register()
> > > > > > > you created a regression in the userspace interface. If nothing else
> > > > > > > it's a leaky abstraction.
> > > > > > > 
> > > > > > 
> > > > > > In that case, shouldn't soc_device_register() made to give error when an
> > > > > > attempt to call it more that one time then ? Also should be change the
> > > > > > ABI documents to refer it as soc0 and not socX ?
> > > > > 
> > > > > Then the whole SoC bus is an overkill. But I have a strange question
> > > > > here. Consider the device having the "BT / WiFi SoC" next to the main
> > > > > SoC. Is that SoC a legit target to export informaiton through sysfs /
> > > > > soc bus?
> > > > > 
> > > > 
> > > > Just for clarity, I agree with you and there could be duplication of
> > > > information if there are multiple source for that information. E.g.,
> > > > the setup in this discussion where the EL3 firmware provides SOC_ID
> > > > information via SMCCC SOC_ID and DT providing vendor specific information
> > > > about the platform. Both are getting exported via sysfs but the problem
> > > > here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.
> > > 
> > > I understand the context and I understand that we ended up having two
> > > soc devices for the main SoC. And that's exactly why I'm asking about
> > > the WCN SoC exporting the information through the same interface. If it
> > > is a legit user, then it is a possible outcome that WCN binds to soc0
> > > while the main core gets bound to soc1 (even without SMCCC_ID in place).
> > > 
> > > Likewise if WCN if a legit user of soc_device_register(), then we can't
> > > make it fail after registering the first entry.
> > > 
> > 
> > But by this definition, a vast variety of discrete IP should register
> > with this interface - instead of providing such information in their
> > respective functional interface.
> 
> I *suppose* that was the intention. Otherwise there is little point in
> having socX defined in the ABI.
> 
> > 
> > My interpretation is that the soc_device_register() related to the
> > entity which is represented as /soc in your DeviceTree.
> > 
> > For a broader "dumping ground for different IP to register their
> > version information", we'd need some way to associate each entity with
> > the related component - which I believe there is none, because then you
> > could have used the specific driver interface in the first place.
> 
> We can be using of_node / fwnode pointers for that (where available).
> However, I guess, there would be no fwnode for SMCCC SOC_ID.
> 

I prefer a model where the kernel abstracts the hardware and firmware
away from userspace, and presents useful and purposeful information to
the applications.


When I cat /proc/cpuinfo I get an abstract representation of the CPU
cores that are visible to the current system, I don't have to
cross-reference the output against some hardware/firmware description
table to make sense of the data.

It could have told me about the CPU core(s?) in the WCN chip dangling
off that PCIe link...but it would also have made the output absolutely
useless.

> > (I.e. there's no representation of the WCN SoC in our system, we have
> > representations for the PMU, the WiFi, and the BT core, but not the
> > whole).
> 
> The mapping is really a separate topic. I can imagine "just an
> enumeration" kind of ABI.
> 

Let's imagine a more concrete example. I'm implementing some service and
I want to use the value from the "serial_number" soc attribute to
identify the device. I read soc[012]/serial_number and get 3 different
answers (in "random" order!).

Would that interface be useful to you without any form of means to
determine which set of attributes is representing which "SoC"?

Regards,
Bjorn

