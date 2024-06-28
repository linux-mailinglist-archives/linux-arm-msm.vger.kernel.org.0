Return-Path: <linux-arm-msm+bounces-24644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083791C0BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 16:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26BB71F214A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 14:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72061BF326;
	Fri, 28 Jun 2024 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jtF5JXf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63191E517;
	Fri, 28 Jun 2024 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584495; cv=none; b=YaxLUn72EPTrs4gF5e56ts+fOWlGVtLSri5/gsSh1QawIUwm3ceVBUBENMd9/7qTTIUc8nq4jSEwOLTvKxlXsLO/A9M3JEW3lFxhhQICfHZeQgOEOU1S9Y7d6LBeIFujkUCdwhRYmMh8KzCgXTXn1SNNCFLyNwW8SaCmlF3N7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584495; c=relaxed/simple;
	bh=Q2TVU0ghZYFPna87bELQcodlt7oMAF8q8qvMmGtmQTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHFPYT6sabVwNSoa365nThDamHrNSTR+Rg7YVhtzG0CYlHAofgnmiwl4XhHP8jb4mEwJ/OX604DP9TvM/apWJev+gwHYVp9ZHdKpQUysZ27IHK6Kv8UQfrSP3o1+1paVQvd/4CUib4J7pDe0CBZ181RyMlhWbBK+vQq2qsfio4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jtF5JXf9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00C3C116B1;
	Fri, 28 Jun 2024 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719584495;
	bh=Q2TVU0ghZYFPna87bELQcodlt7oMAF8q8qvMmGtmQTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtF5JXf9FlcICSN6dyPv0qF5arcbNQ5/TuvTR5NDxC1INy7boCCwhQvn+6LAxGsq1
	 O/k1ZXs4f9SbcvgJWjFRia62dcLOYVW5MAh4iiKPvqog6J0rG6D7equylpAj/FZKZ0
	 TDK54lBypPUn3biEnt4rbEcWa7bFxMBlRWniP+JU=
Date: Fri, 28 Jun 2024 16:21:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <2024062849-brunt-humvee-d338@gregkh>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>

On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
> >
> > On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> >>> For user PD initialization, initmem is allocated and sent to DSP for
> >>> initial memory requirements like shell loading. This size is passed
> >>> by user space and is checked against a max size. For unsigned PD
> >>> offloading, more than 2MB size could be passed by user which would
> >>> result in PD initialization failure. Remove the user PD initmem size
> >>> check and allow buffer allocation for user passed size. Any additional
> >>> memory sent to DSP during PD init is used as the PD heap.
> >> Would it allow malicious userspace to allocate big enough buffers and
> >> reduce the amount of memory available to the system? To other DSP
> >> programs?
> > The allocation here is happening from SMMU context bank which is uniquely assigned
> > to processes going to DSP. As per my understanding process can allocate maximum
> > 4GB of memory from the context bank and the memory availability will be taken care
> > by kernel memory management. Please correct me if my understanding is incorrect.
> Just wanted to add 1 question here:
> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
> allocated huge memory?

No, because any userspace program that takes up too much memory will be
killed by the kernel.

You can not have userspace tell the kernel to allocate 100Gb of memory,
as then the kernel is the one that just took it all up, and then
userspace applications will start to be killed off.

You MUST bounds check your userspace-supplied memory requests.  Remember
the 4 words of kernel development:

	All input is evil.

thanks,

greg k-h

