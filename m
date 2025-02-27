Return-Path: <linux-arm-msm+bounces-49640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF47A477E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC7C47A3066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E848521578F;
	Thu, 27 Feb 2025 08:34:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD46213A3F2;
	Thu, 27 Feb 2025 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645297; cv=none; b=RuCk0ofke7CRG5LX0hoJzgtLC0x/ZpXprK3o+di20ULEkkMF/zBOVjXMlOPP6IK4/V+NJso9GW2R3/5HEwxkzlbrLWruNq9ZkD3sVDz8DL8t3ED+GCTm/arK59FgHNTHOHpRvRt/C/wRWIHmji25NQhsqPiKKmnxLvcnehA8a4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645297; c=relaxed/simple;
	bh=5ZLeqmdkLwQ5NBO+s0wVpWR+KwHTu+P2L07dgmrQd08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjIJVwEegfMYzh9yvU0kcjtrpOv0YQgVyMfWpge0cDpX0JBlXlkCR50f9T1axpkx7s8e1netx6Nv81Kez8kBQIVgdmgQNcLp/RYGVbY7QGLHSWvVme9pnn/dHW4GjCPNeVaCe8NhJ7GatEoWmGltjR6KPDCcP/Djmk3X7yvv664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A80172C1C;
	Thu, 27 Feb 2025 00:35:10 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 719873F6A8;
	Thu, 27 Feb 2025 00:34:53 -0800 (PST)
Date: Thu, 27 Feb 2025 08:34:44 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, dmitry.baryshkov@linaro.org,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z8AjhHsVT9ZQTtZX@pluto>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77l1NflYXTnRyg0@hovoldconsulting.com>

On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:
> On Wed, Feb 26, 2025 at 12:31:27PM +0300, Dan Carpenter wrote:
> > On Wed, Feb 26, 2025 at 09:55:21AM +0100, Johan Hovold wrote:
> > > On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> > > > On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> > > 
> > > > >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > > >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > > > >  			     u32 domain, void __iomem **p_addr,
> > > > > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > > > > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > > > > +			     bool skip_check)
> > > > 
> > > > This does not look like it will scale.
> > > 

Hi,

> > > After taking a closer look, perhaps it needs to be done along these
> > > lines.
> > > 
> > > But calling the parameter 'force' or similar as Dan suggested should
> > > make it more readable.
> > > 
> > > > >  {
> > > > >  	int ret;
> > > > >  	u32 flags;
> > > > > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > > >  
> > > > >  	/* Check if the MSG_ID supports fastchannel */
> > > > >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > > > > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > > > > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> > > > 
> > > > Why can't you just make sure that the bit is set in attributes as I
> > > > suggested? That seems like it should allow for a minimal implementation
> > > > of this.
> > > 
> > > My idea here was that you could come up with some way of abstracting
> > > this so that you did not have to update every call site. Not sure how
> > > feasible that is.
> > 
> > I'm having a hard time finding your email.
> 
> 	https://lore.kernel.org/lkml/Z4Dt8E7C6upVtEGV@hovoldconsulting.com/
>  
> > Why does the scmi_proto_helpers_ops struct even exist?  We could just
> > call all these functions directly.  Do we have plans to actually create
> > different implementations?
> > 
> > If we got rid of the scmi_proto_helpers_ops struct then we could just
> > rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
> > and create a default wrapper around it and a _forced() wrapper.
> > 
> > Some other potentially stupid ideas in the spirit of brainstorming are
> > that we could add a quirks parameter which takes a flag instead of a
> > bool.  Or we could add a quirks flag to the scmi_protocol_handle struct.
> 
> Something like that, yes. :) I didn't try to implement it, but it seems
> like it should be possible implement this is a way that keeps the quirk
> handling isolated.
>

I hope next week to have a better look at this, in tne meantime just a
few considerations....

Sooner or later we should have introduced some sort of quirk framework
in SCMI to deal systematically with potentially out-of-spec FW, but as
in the name, it should be some sort of framework where you have a table of
quirks, related activation conditions and a few very well isolated points
where the quirks are placed and take action if enabled...this does not
seem the case here where instead an ad-hoc param is added to the function
that needs to be quirked...this does not scale and will make the codebase
a mess IMHO...

Last but not least, these quirks 'activations' in the SCMI world should
be driven mainly by the VENDOR/SUB-VENDOR/IMPLEMENTATION_VERS triple and
only as a last resort by a platform compatible match...because the
IMPLEMENTATION_VERSION, exposed by the FW and gathered via SCMI Base
protocol, is completely under the vendor control so it can, and should, be
used to identify broken FW-versions...indeed all the distinct SCMI protocols
are anyway versioned elsewhere according to the spec, so there is no need to
repeat SCMI protocol version here..I mean it is an IMPLEMENTATION version

As an example on a JUNO the SCP reference FW reports:

arm-scmi arm-scmi.1.auto: SCMI Protocol v2.0 'arm:arm' Firmware version 0x20f0000

where the FW version represent something like the FW release tag, I think...not
really sure about the menaing our FW gys give to it, BUT definitely it is not
a bare copy of the SCMI protocol version...

So...
...does the platfom-to-be-quirked at hand properly use the IMPLEMENTATION_VERSION
flag in a sensible way ?
IOW does that change between a bad and good (or less bad :D) version ?
Because shooting with the platform 'compatible-gun' should be the last resort
if all of the above does NOT happen in this beloved fw...

Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
up and see if I can prototype something generic to deal with quirks, possibly
next week...

Thanks,
Cristian

