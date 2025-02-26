Return-Path: <linux-arm-msm+bounces-49450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF51A4590E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E248D188AB96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A85224231;
	Wed, 26 Feb 2025 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVDJWhkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351E258CC2;
	Wed, 26 Feb 2025 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560109; cv=none; b=R/sogeEZxrxVFGsSO7EMpyi8eCuHXUXAnd/ikjwk3x6L8wOrB6vDwShxcy6fNmIAk2rJnOPIGUzpIzAlMJgfYxxWBy3XfF6g4UMuWqDUEyosR6EqYFS6yvr4wf+y9q+WcnLLKU3hiRXi2jNlzEkg+rOe6HvcDdBQPNcX7T6vMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560109; c=relaxed/simple;
	bh=k9Imo4Ndb+Av6okiCY/htILEn6oyEwrXzbQnbAjSjo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITcamPqDTfIX8u1fe3xDxYvL8L/plxI6fhxQDm1875MerY5nFfZSx5SbFynMB5DyhrRotkaDp4YkGRM9jYzaApveoNI5IFl7xOrD+WeUDGCbP9o5mVnyomnWD0BiQCLJhxvAAfjN7qJJIayQw4coDsqKSQnXYXphkV4HhVMUZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVDJWhkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01663C4CED6;
	Wed, 26 Feb 2025 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740560109;
	bh=k9Imo4Ndb+Av6okiCY/htILEn6oyEwrXzbQnbAjSjo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVDJWhkLl84U3eyL0yjbQXFgShXMKq3Ay6Mog2dflRLeJZVCBeTBR+E9F43TEA5iP
	 wSN1Foc7A2kFeeM5JFDWbAbEPhtch38XJQKpb0POGXr0rHq+yWxFd74TN6LBUy9yac
	 eXBzIfoIPpGBFqgorhgz8jVDVot8nifzXyFOU2KbOXy3c0o2Ix/HvjvGWE9WsQviKz
	 iajrmmlAW0TY0/le6hESGZBTfxSJ/I2q3V9oPzsMntmRkLAJ1+LwK33W6s0GF+6yK6
	 C3NtvikLi2Z+zRNhFjoSxAev4RpXFtyghSuZQdEYxnZdvh+se/tRh4JfZkWZJqKJbe
	 rbJIlfRH0Tw8w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnDCL-000000007d2-0AyI;
	Wed, 26 Feb 2025 09:55:21 +0100
Date: Wed, 26 Feb 2025 09:55:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77M5iXHQsdMptWm@hovoldconsulting.com>

On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:

> >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> >  			     u8 describe_id, u32 message_id, u32 valid_size,
> >  			     u32 domain, void __iomem **p_addr,
> > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > +			     bool skip_check)
> 
> This does not look like it will scale.

After taking a closer look, perhaps it needs to be done along these
lines.

But calling the parameter 'force' or similar as Dan suggested should
make it more readable.

> 
> >  {
> >  	int ret;
> >  	u32 flags;
> > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> >  
> >  	/* Check if the MSG_ID supports fastchannel */
> >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> 
> Why can't you just make sure that the bit is set in attributes as I
> suggested? That seems like it should allow for a minimal implementation
> of this.

My idea here was that you could come up with some way of abstracting
this so that you did not have to update every call site. Not sure how
feasible that is.

> >  		return;
> >  
> >  	if (!p_addr) {

Johan

