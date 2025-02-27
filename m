Return-Path: <linux-arm-msm+bounces-49639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C917FA4773E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8145B3B4C1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCAF225409;
	Thu, 27 Feb 2025 08:03:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF802225403;
	Thu, 27 Feb 2025 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740643402; cv=none; b=sDBtxf10JAAEmxwr664Mj2F/u58Wq1N6VufxaJvIvBFUwg48jbCtwzuM8F8rkXuy9LHFA4Bc9X28Yr3gEpfK6BYXHsY8io66PNA4xFaZTHCJCqEpSRZ/bMcQ2gFV72XVvRMgZBHRAF71kgjjGzjpXENCqMlV3VNXXQ1yGrUHd3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740643402; c=relaxed/simple;
	bh=3vnej7qkae+NHP38sNW1HX9Poi6RFLIV3ZtioTL4sh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5GrQ+B7BkdWEkY4CZoIu/UWL7bBCSkPpGh3w9i7oZ4bNqKLYsPjq8bLEhkMRxkwLnzAUdBphtWXi1HOFpngdmU+RhIWd745UrblTjsBptxhGCcDLi4+aWK27smWfxxtr3MvLKufsDtzbeew89Ieu4+hHNZUjTVV27PkEuCSeUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B332BCC;
	Thu, 27 Feb 2025 00:03:34 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4FD53F6A8;
	Thu, 27 Feb 2025 00:03:16 -0800 (PST)
Date: Thu, 27 Feb 2025 08:03:08 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
	sudeep.holla@arm.com, cristian.marussi@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z8Ab_wrO8JgSD_D0@pluto>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>

On Wed, Feb 26, 2025 at 12:31:27PM +0300, Dan Carpenter wrote:
> On Wed, Feb 26, 2025 at 09:55:21AM +0100, Johan Hovold wrote:
> > On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> > > On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> > 
> > > >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > > >  			     u32 domain, void __iomem **p_addr,
> > > > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > > > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > > > +			     bool skip_check)
> > > 
> > > This does not look like it will scale.
> > 
> > After taking a closer look, perhaps it needs to be done along these
> > lines.
> > 
> > But calling the parameter 'force' or similar as Dan suggested should
> > make it more readable.
> > 
> > > 
> > > >  {
> > > >  	int ret;
> > > >  	u32 flags;
> > > > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > >  
> > > >  	/* Check if the MSG_ID supports fastchannel */
> > > >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > > > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > > > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> > > 
> > > Why can't you just make sure that the bit is set in attributes as I
> > > suggested? That seems like it should allow for a minimal implementation
> > > of this.
> > 
> > My idea here was that you could come up with some way of abstracting
> > this so that you did not have to update every call site. Not sure how
> > feasible that is.
> > 
> 
> I'm having a hard time finding your email.
> 
> Why does the scmi_proto_helpers_ops struct even exist?  We could just
> call all these functions directly.  Do we have plans to actually create
> different implementations?
> 
> If we got rid of the scmi_proto_helpers_ops struct then we could just
> rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
> and create a default wrapper around it and a _forced() wrapper.

These are common helpers for all the protocols to avoid endlessly
repeating the same code pattern (like fc_init or iterators) and they are
laid out this way to be usable by any protocol even if you compile it as
a module WITHOUT the need of EXPORTing any of these symbols....same
reason why all protocol ops exposed in scmi_protocol.h are defined to be
accessed using an instance handle....trying to limit as much as possible
EXPORTing symbols beside the basic needs...specially because SCMI
specifes a protocol that is extensible by design both for standard and
vendor protocols, so it would soon became a hell to maintain such an
API..I mean just look at scmi_protocol.h...these helpers are made
accessible this way for the same reasons...same for the xops
(beside also not being overlying appreciated in the Android world to
ass an excessive number of EXPORTed syms)

Thanks,
Cristian

