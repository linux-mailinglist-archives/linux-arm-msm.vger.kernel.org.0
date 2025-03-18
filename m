Return-Path: <linux-arm-msm+bounces-51735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C20A67525
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19113168FC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B356620CCED;
	Tue, 18 Mar 2025 13:29:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CDE204C36;
	Tue, 18 Mar 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304575; cv=none; b=qx9/LeXS38o7O+ULVpIT+yswqaRSTrTp2jrlTPbRRL3qird0zmxRktaFpeyKo+6pfEvArpxiw97eDdE6a/hH4Mz9TqN7xo7RvDnt/ktn4++rSd8esNpGzR6VrSE2XMRaRsxdkJ8G7A+CavT3FhWw0VpQgkJnYiVrmUt/X5PGz1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304575; c=relaxed/simple;
	bh=Ir6azYq/iIoLV2jYTSYnYBSQ8zREfXTrqlvu/z7kpdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuYueRFI1nD66zFTGchVKPgnj7U05gYLcSZd6SPhFWEAPoLLnOJ/vyJOjVf7XxIsRGV1aDHcXZ3LJmd9r+VCW8AMAeL+K1ztpVAOyj1GErcVqSv1Job+MRNecevT71OJGBGZ9W/PczgWeIZcUXEh0FWErkR+QN/t0cuCjFugGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 615B013D5;
	Tue, 18 Mar 2025 06:29:40 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A79783F673;
	Tue, 18 Mar 2025 06:29:28 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:29:19 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z9l1L1WICMYXSoIu@pluto>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
 <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
 <Z9kr5ABbqO27_BM-@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9kr5ABbqO27_BM-@hovoldconsulting.com>

On Tue, Mar 18, 2025 at 09:16:36AM +0100, Johan Hovold wrote:
> Hi Cristian,

Hi Johan,

> 
> On Mon, Mar 03, 2025 at 11:53:52AM +0100, Johan Hovold wrote:
> > On Thu, Feb 27, 2025 at 08:34:44AM +0000, Cristian Marussi wrote:
> > > On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:
> > 
> > > > Something like that, yes. :) I didn't try to implement it, but it seems
> > > > like it should be possible implement this is a way that keeps the quirk
> > > > handling isolated.
> > > 
> > > I hope next week to have a better look at this, in tne meantime just a
> > > few considerations....
> > > 
> > > Sooner or later we should have introduced some sort of quirk framework
> > > in SCMI to deal systematically with potentially out-of-spec FW, but as
> > > in the name, it should be some sort of framework where you have a table of
> > > quirks, related activation conditions and a few very well isolated points
> > > where the quirks are placed and take action if enabled...this does not
> > > seem the case here where instead an ad-hoc param is added to the function
> > > that needs to be quirked...this does not scale and will make the codebase
> > > a mess IMHO...
> > 
> > Sounds good. At least we have a good understanding now of how this
> > particular firmware is broken so it would be great if you could use
> > this as a test case for the implementation.
> > 
> > In summary, we need to force the use of a fast channel for
> > PERF_LEVEL_GET on these machines, or possibly fall back to the current
> > behaviour of only using the domain attribute to determine whether the
> > fast channels should be initialised.
> > 
> > The latter may allow for a less intrusive implementation even if we'd
> > still see:
> > 
> > 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> > 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> > 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
> > 
> > when not supported for all messages (e.g. with the current firmware).
> 
> > > Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
> > > up and see if I can prototype something generic to deal with quirks, possibly
> > > next week...
> 
> Have you made any progress on the quirk framework prototyping?
> 

I have not forgot, tried a few things, but nothing really to post as of
now...dont wnat to rush either .... I was hoping to push something out at
the end of this next merge window...

> Do you need any input from Sibi on the protocol versioning for that?
>

No I am fine, I am planning anyway for something generic enough to be
easy then to plug your own quirks separately...

> We'd really like to enable cpufreq on this platform and ideally in 6.15.
> I think that should be possible given that we now understand in what
> ways the firmware is broken and what is needed to handle it even if we
> still need to decide on how best to implement this.
> 

v6.15 seems hard/impossible even using the original Sibi patch 
given the usual upstreaming-timeline of the SCMI stack where everything has
to be usually reviewed and accepted by rc4/rc5.....so both Sibi initial
patch and my own babbling were alreaady sort of late.

Thanks,
Cristian

