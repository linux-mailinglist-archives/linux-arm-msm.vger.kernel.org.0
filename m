Return-Path: <linux-arm-msm+bounces-89550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651CD399F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 22:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 133AA30081B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 21:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765F81DE2A5;
	Sun, 18 Jan 2026 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaohNuLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5351D190664;
	Sun, 18 Jan 2026 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768771013; cv=none; b=UNjJRaDshGFU46YDGe55320iJi187SZauNGpyER5AmYU0tAL5uWDiCgCQ5RPMrpFcP+gf29L3hR17U4WqKvrAW1PRThY29nTLoCsmnRU/6l8/5vST/xzn67/ARtPDzuOhfMfwBQYuhyGZaJfvAUCR6aYb47OW08RC6JS6hu0+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768771013; c=relaxed/simple;
	bh=EtU+kqexD/KStxyNPxQa9UqtQF8DZTaoiII4pPCCBEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fq8+ECZJ1DtK+avVzGZA7eJ1QtJR+0ml2djTuItxXifZzkCqYuTXGjHqT76vFeJRtdoWJXwCdF3VxYesbWxW+e0j3iFxedzPr/vxuX3RcM7/MQFemNq5JEug+4eUFbv2ktg6LrN1f6b0inqZYBtw3vh+gG+9nNB8MfDaZyTsilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaohNuLM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307A6C116D0;
	Sun, 18 Jan 2026 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768771012;
	bh=EtU+kqexD/KStxyNPxQa9UqtQF8DZTaoiII4pPCCBEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaohNuLM4zm1yDpQACKj8DLMv8bI9cRAkZKQPFp3MS3DHuRMORhutqAdvFKh4z0qy
	 a8ENExmWluK1ny/TxKVItRSD22nFESu1CYkDGIah7hLJzhQeYyvx0AxUI8ItG6fGY+
	 jwmHy3oufyM9ndiwuP5kpKZQbSB+hbo/HnRWyjDEecLKCexLylKEfA5paDpkRCbrrd
	 B+tg8imXaxnsdx9L4oFR2Tj3tYevHuqfSTYPNWyoNNZ8M239zYt67TpzbhDQHsWJxb
	 1miMHAQCMZJDwARPpCsjZ+nU6e1XlC0l3m7t/tsbARJkr8tfTW3dTUyvxmui8o7WUC
	 5NF0dI4J74P2g==
Date: Sun, 18 Jan 2026 15:16:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, 
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWzuuwQi_nsHoj_5@bogus>

On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> > 
> > I believe that point(s) we have not touched upon are following:
> > 
> > There will be thousands of Android applications using the native interfaces
> > in the playstore in various regions like US and China and so on, which relies
> > on getting the SOC_ID to understand the product and enable / disable some features.
> > 
> > For example, benchmarks like GeekBench or Antutu may also be reading these
> > interfaces.
> > 
> > There are apps. in certain regions which are still not updated from "32-bit"
> > to 64-bit on Android yet as an example and there may be no way to reach out
> > to those developers to fix but apps. are still used by many users.  
> > 
> 
> Fair enough, but apps get updated on Android phones every day. So sorry if I
> don’t consider this as something impossible. I do understand many apps are not
> actively developed, yet that is no reason to say the wrong assumptions made by
> these apps are correct.
> 

It might be what you're saying is true, at least for the top-10
applications in the app store. But that is not how we manage or maintain
the userspace interface in the Linux kernel - we don't break userspace.

> > If we need to move all of these third-party applications to this new interface
> > then we have to "break them" before we fix them. Do we want to have such approach?
> > 
> 
> Sorry, which new interface are you referring to?
> Are we still talking about /sys/devices/socX/?
> If so, are you suggesting that X=0 and X=1 represent two different interfaces?
> If that’s the case, I honestly have no words.
> 

Please do have words, because I really would like to understand what the
expectation of userspace is in the even that there's both soc0 and soc1,
regardless of which is which.

What does it even mean to have two different socs presented here? How
would userspace know which one to refer to? Should it refer to both and
guess which one makes more sense to it?


To me, when you decided to add a second caller to soc_device_register()
you created a regression in the userspace interface. If nothing else
it's a leaky abstraction.

> > We should not have enabled this feature as "default y" in the first place and should
> > have kept it as "tristate" or kept it disabled in my opinion.
> > 
> 
> Sorry, but how do you envision this working with a single defconfig? Please
> consider the issues on platforms beyond the ones you’re focused on as well.
> 

Glad that we're on the same page regarding both defconfig and
our considerations.

Regards,
Bjorn

> -- 
> Regards,
> Sudeep
> 

