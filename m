Return-Path: <linux-arm-msm+bounces-25238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567E0926FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 08:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0300B280FE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 06:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4491A0739;
	Thu,  4 Jul 2024 06:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h0Hl6A63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D2B200A3;
	Thu,  4 Jul 2024 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720075204; cv=none; b=WSYAwxmob0sK9eOGMA0ht/U+rl3K4EjHZKy6r+wpK3xGPN1qehJc+9zECL0YEGyA6QI1yKnIHtghOp0iKvCwgfEHWUht6Du0PIxGHAT9JhKLugB6o+zjvoVdE8oay1NRpOYov7kB0Ncw+/uqa3RBdkIbgEsHEr/cI/2aiqk0Bh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720075204; c=relaxed/simple;
	bh=lKbMaNJkLUVocG1e6FxVa282qh0hksbV3LzEAbQM4hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNHUxCOmEvItX7poSAhEe6+dB8qiPfX02Yku16Ybvnd8AsGageJ49x8Uaobc0ib5m9zarByNbp1ZuGpPrcBStUp29Pvf0f3b2oTz+h+vJrctG1y/E+NW5EwZvERhFEQej2O6q2RkArk/4jb0q2ZGd27shKMvbA7tWe/Xm1WIB2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h0Hl6A63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5402BC3277B;
	Thu,  4 Jul 2024 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720075203;
	bh=lKbMaNJkLUVocG1e6FxVa282qh0hksbV3LzEAbQM4hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0Hl6A63TDTsrQG3QlAxNO5fqljBBOKeD9DwBBZKxz+JcqTNicDzE6Toc8fJFIMmJ
	 Yxfa7CxDUAnvbodwQAVh8W98UDtzF9kvNwTvfEaN5YsSGoVIYHkrPfzDH7R+TYj8Lr
	 55Kmj+uzWfzRiy+tqTijjTqCqN4IDix+xuS0pwTk=
Date: Thu, 4 Jul 2024 08:40:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for multiple PD from one
 process
Message-ID: <2024070427-squash-antiviral-8c81@gregkh>
References: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
 <2024070353-giggly-stardom-7b6d@gregkh>
 <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>

On Thu, Jul 04, 2024 at 11:47:22AM +0530, Ekansh Gupta wrote:
> 
> 
> On 7/3/2024 4:09 PM, Greg KH wrote:
> > On Wed, Jul 03, 2024 at 12:22:00PM +0530, Ekansh Gupta wrote:
> >> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
> >>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
> >>  	spinlock_t lock;
> >>  	struct idr ctx_idr;
> >> +	struct ida dsp_pgid_ida;
> > You have an idr and an ida?  Why two different types for the same
> > driver?
> Using ida for this because for this I just need to allocate and manage unique IDs
> without any associated data. So this looks more space efficient that idr.
> Should I keep it uniform for a driver?

Be consistant, it will make your life easier over the next 10+ years
that you have to maintain it.

> >>  	struct list_head users;
> >>  	struct kref refcount;
> >>  	/* Flag if dsp attributes are cached */
> >> @@ -299,6 +304,7 @@ struct fastrpc_user {
> >>  	struct fastrpc_buf *init_mem;
> >>  
> >>  	int tgid;
> >> +	int dsp_pgid;
> > Are you sure this fits in an int?
> I think this should be fine for IDs in rage of 1000-1064.

Where is that range specified anywhere?  I don't see it documented here
for us to know that :(

And if that's all you care about, then use a u16.

thanks,

greg k-h

