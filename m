Return-Path: <linux-arm-msm+bounces-49467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E1A45AF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2A3166E2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1D82459FB;
	Wed, 26 Feb 2025 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Avlx0PYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24404238165;
	Wed, 26 Feb 2025 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563915; cv=none; b=ngaqFQ47sIwY4liZHZvXxGeLW1hoZJ/1Uf0HGLgxXDsF8ewKXV06l2SGaHv+w2pS/pwlB4pOWczPl7Kp6t1vf+cuW/RielnWVHPHEMUKDMG/2pFelMXJah4DjEaKhXvchqu8n4mt79plYJwaT01h41r92nzSjXJlklNuxbGyLU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563915; c=relaxed/simple;
	bh=EvazlJDvIpSU8xWaHY1rfrsB8hsCd5XKw0hdPe8UWiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=am8K5zD5J/5KPBXk/dG7YzBZvRmoOGyVkJz6g1fPrXmcwkVxgwq/lPkbjATBgzlgI+kx0MCEsR1Sss+Y4FoxDjkznVUnGr9AZRwF0AfHz5YG7QLnON52IjX+kbvA+sfhS8pwfc9Oy2bIFv4yQg2yca5KZhXyF8uNLR15jIXGomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Avlx0PYe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9321DC4CEE9;
	Wed, 26 Feb 2025 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740563914;
	bh=EvazlJDvIpSU8xWaHY1rfrsB8hsCd5XKw0hdPe8UWiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avlx0PYeAPsIbsX7doARLDiRl4MUL0bVhphVW7ezkhMZnD1TLd2dYM61UpYblKun/
	 uinfftczSMAtwDsD9MDph6dKFfELQjF9NfBjEu6TqTENnjYTW8ceYq/kPLGe9XZJ50
	 n5AVTYKQVwn9CdiCs8MbsvEr8/VbOsxdr9pgI39RMn4O6yebHjnq6OZQXP9EJnHjRG
	 rHBqc+DbFfyeYhzF0nm353hO9GOrPDTPuAvW7/xvY/7o9z/TzB4tZfNsqgPmYntVda
	 S7dYN3J9T/gDblDWf+RyX0r+ONVtOjJJlO7b4FZsHG30ES8SZrzb6KQ8sW2QpDuoaR
	 6UvlYd9EVgpFA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnEBg-000000000Qe-2U3f;
	Wed, 26 Feb 2025 10:58:45 +0100
Date: Wed, 26 Feb 2025 10:58:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, dmitry.baryshkov@linaro.org,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z77l1NflYXTnRyg0@hovoldconsulting.com>
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
> 
> I'm having a hard time finding your email.

	https://lore.kernel.org/lkml/Z4Dt8E7C6upVtEGV@hovoldconsulting.com/
 
> Why does the scmi_proto_helpers_ops struct even exist?  We could just
> call all these functions directly.  Do we have plans to actually create
> different implementations?
> 
> If we got rid of the scmi_proto_helpers_ops struct then we could just
> rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
> and create a default wrapper around it and a _forced() wrapper.
> 
> Some other potentially stupid ideas in the spirit of brainstorming are
> that we could add a quirks parameter which takes a flag instead of a
> bool.  Or we could add a quirks flag to the scmi_protocol_handle struct.

Something like that, yes. :) I didn't try to implement it, but it seems
like it should be possible implement this is a way that keeps the quirk
handling isolated.

Johan 

