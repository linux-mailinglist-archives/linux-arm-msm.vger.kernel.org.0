Return-Path: <linux-arm-msm+bounces-24430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4C91A500
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9645028100E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC90C1494A1;
	Thu, 27 Jun 2024 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VFaBiZPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59C313C9CA;
	Thu, 27 Jun 2024 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487289; cv=none; b=uiCrxt6w8WKegyK3KinJ2aBRsO37fhiEMAnUM54d/T3EtRsrjPXNQQryZfTF7SKVr35QnrBrrW8pycYuu9jB/sGvMl3/9pPGWtFKMk0MmR6snHKPpkbsoGBczlDKFQli8bSd2ZIP5JLWn+FsqgxViRo+WVajLeL3L9BwYB27aKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487289; c=relaxed/simple;
	bh=CyKq1sUeh6UABolS6qiUs+Q6NjuB0eP+Qe2G6oJZRcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVZ3uxoU5kEb2zVU7OszUh1sWIDOfsHxLQGEhGORmRCdyIrrw1IDg8DtKNyispOBK79u3yQO0geLtLKdnneE6Z22aqOEEAfKdNxDZBO84yljIZMjXHlcTnPXoNMv3hp6JGf7oyZpOcyF+N5apKIY6eFHAgFuZ2COU3LCHbCYSdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VFaBiZPX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C13C2BBFC;
	Thu, 27 Jun 2024 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719487289;
	bh=CyKq1sUeh6UABolS6qiUs+Q6NjuB0eP+Qe2G6oJZRcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFaBiZPX+Cua2EczUngJQyDGZrGSYQ4BAZsHt98wkUqCoPvedXj0rIjWcKCWMFE24
	 ZiBQpegoYV8FrFDvREsKdHzPP6xt1rOhyIE0wXZAygl/bGmul5RUVcd+ChblR43XTr
	 ML9ZScS4+MQrtnPjulOsLThnHoHyxKMZJxAimUFE=
Date: Thu, 27 Jun 2024 13:21:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <2024062736-sanctuary-badge-6a1e@gregkh>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <2024062716-lumpish-both-24df@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024062716-lumpish-both-24df@gregkh>

On Thu, Jun 27, 2024 at 01:20:15PM +0200, Greg KH wrote:
> On Thu, Jun 27, 2024 at 11:35:18AM +0530, Ekansh Gupta wrote:
> > For user PD initialization, initmem is allocated and sent to DSP for
> > initial memory requirements like shell loading. This size is passed
> > by user space and is checked against a max size. For unsigned PD
> > offloading, more than 2MB size could be passed by user which would
> > result in PD initialization failure. Remove the user PD initmem size
> > check and allow buffer allocation for user passed size. Any additional
> > memory sent to DSP during PD init is used as the PD heap.
> > 
> > Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > ---
> > Changes in v2:
> >   - Modified commit text.
> >   - Removed size check instead of updating max file size.
> > 
> >  drivers/misc/fastrpc.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 5204fda51da3..9d064deeac89 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -1389,11 +1389,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >  		goto err;
> >  	}
> >  
> > -	if (init.filelen > INIT_FILELEN_MAX) {
> > -		err = -EINVAL;
> > -		goto err;
> > -	}
> > -
> >  	inbuf.pgid = fl->tgid;
> >  	inbuf.namelen = strlen(current->comm) + 1;
> >  	inbuf.filelen = init.filelen;
> 
> This feels really wrong as now there is no way to bounds-check the
> buffer size at all, so userspace can do "bad things" like go over the
> defined buffer size limit which you are expecting, right?
> 
> So how is this actually correct?  If you want larger sizes, then
> increase the INIT_FILELEN_MAX value.

And this feels really wrong compared to v1 of this patch, which did
attempt to increase the size, yet it wasn't really well defined.  Now
you went way too far to allow ANY size to be passed in here, which is
obviously what you don't want to do.

thanks,

greg k-h

