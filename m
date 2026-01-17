Return-Path: <linux-arm-msm+bounces-89529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D80D3912C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 887BF30057EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08912E0412;
	Sat, 17 Jan 2026 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="camHaPpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E319CD03;
	Sat, 17 Jan 2026 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686209; cv=none; b=SRkNdQPaGfuQUG9nJAoLd8ZPy1m7fLQEzlq9au+rEeHyDnncygjZOvQNfGh2s6fZM3MDRjI8NykRIw9sUUqEBpqMfXPqi+K34R9qxrNCsY7bbF+M+oTX7ZkJLCMf+XEH4JYIG12havQ0AfIEqLDlxkel4F0OE3JuvsZYDxZmTnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686209; c=relaxed/simple;
	bh=Yh7FjF2iO+Wbm4/uEu8pLMiCOy4rGG8q2nrbqLPs4NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nc8UrWKs77CKpmmWnyMO8mXiaGGgUDpiKrMZ3ZclCJ1dAg8LFR9XVJa0CNTcw/10nnRcT/2VvNB2V7ruCsjx/prs/grg+e0RG8C759ARoj9DYL5E8E+vj/spXRqugtR9/U9E/PkV2beKqnHmn8MZM8zaLzBzbFPICUL7nNnL9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=camHaPpe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA2FC4CEF7;
	Sat, 17 Jan 2026 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768686209;
	bh=Yh7FjF2iO+Wbm4/uEu8pLMiCOy4rGG8q2nrbqLPs4NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=camHaPpe6TT3J5Iv9l1S2dRa+9X6A9nJAnFBzP98VlqBpDPqhSLermdyQcwgH4odx
	 J3yw16Cpc5LHMjhl1x3eAtsVCnxguhtroR9I1iZt09g2Kxl5WCKch/Snl8pOAC9sMF
	 3mhu1PM9LMlnktiKPQanyTkuZDrTlmIgVebneKcdZW02PmyqCZpNvgizBxJzf+WYJP
	 zaSneizfY0V9YbBfhljykAUX0XSWOYmjtcgAO6tGw0Rztbz7MDsRaP/ZbS3WZrCidr
	 RBbdVwyxQp+2ECyREVrqo19W1ckOZM1L6GvjxY8QnVr5yEqoQTVjwahV/TKTl18zjl
	 CxggS1MTE5OxQ==
Date: Sat, 17 Jan 2026 15:43:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <thal4kzpicjancpoop6ct4gjn67k7ypgfi33tzmfstuuj4dzch@smxhbkpqnocg>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>

On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> On 1/16/2026 12:53 PM, Satya Durga Srinivasu Prabhala wrote:
> > Hello Sudeep,
> > 
> > Thanks for the discussion & feedback.
> > 
> > Wanted to check on below possibilities to disable the SMCCC SOC ID at the vendor end, can you help comment?
> > 1. Introduce cmdline option
> >    We are trying to pursue that in Android Kernel - https://android-review.googlesource.com/c/kernel/common/+/3912874
> > 2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry
> > 
> > If any of these other options are agreeable, will send separate patch.
> 
> You broke the replies by top-posting here. 
> 
> > 
> > On 1/16/2026 2:39 AM, Sudeep Holla wrote:
> >> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
[..]
> >>>> The userspace
> >>>> tool seem to have made a wrong assumption and can't expect the kernel to
> >>>> magically fix the issue here.
> >>>>
> >>>> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
> >>>> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
> >>> Sorry, at risk of repeating the same thing again, the user space was using
> >>> soc0 interface on Linux Android products for a long time base on vendor
> >>> implementation. While I agree that, user space had some assumptions based
> >>> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
> >>> should at-least have a way to disable it (via cmdline) based on vendor
> >>> requirements.
> >>>
> >> It was the case with lscpu too. We didn't disable HMP just because lscpu
> >> didn't understand or just read cpu0 data. It is exactly the case with
> >> the userspace tool you are mentioning here. Kernel is not providing wrong
> >> data.
> >>
> >>  From the ABI document in the kernel, it has been marked as socX since its
> >> initial addition in 2012. So clearly userspace got it wrong and no one
> >> realised it until now. There is no argument that data provided from the kernel
> >> is wrong in these discussions. So I have nothing else to add unfortunately.
> >>
> 
> I believe that point(s) we have not touched upon are following:
> 
> There will be thousands of Android applications using the native interfaces
> in the playstore in various regions like US and China and so on, which relies
> on getting the SOC_ID to understand the product and enable / disable some features.
> 
> For example, benchmarks like GeekBench or Antutu may also be reading these
> interfaces.
> 
> There are apps. in certain regions which are still not updated from "32-bit"
> to 64-bit on Android yet as an example and there may be no way to reach out
> to those developers to fix but apps. are still used by many users.  
> 
> If we need to move all of these third-party applications to this new interface
> then we have to "break them" before we fix them. Do we want to have such approach?
> 
> We should not have enabled this feature as "default y" in the first place and should
> have kept it as "tristate" or kept it disabled in my opinion.
> 

Kconfig defaults are not a good way to solve such conflicts, there's
nothing saying that ACK wouldn't =y this in their config because it make
sense for a subset of devices.

I share your concerns about the impact to user space applications where
the authors interpreted the API in the same way as I did - there will be
1 soc instance per soc...

Regards,
Bjorn

> ---Trilok Soni
> 
> 

