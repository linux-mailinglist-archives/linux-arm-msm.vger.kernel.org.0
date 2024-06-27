Return-Path: <linux-arm-msm+bounces-24428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 739AA91A4F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A526D1C20FE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F1E145B34;
	Thu, 27 Jun 2024 11:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G6ab5byY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B607713C9CA;
	Thu, 27 Jun 2024 11:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487219; cv=none; b=cTdUH5xYdN9SMofCCoZvsz4GnUsMdAhHWOfEee0VluC2cp8dA8ZuKkEE/tdAcjFLE1iGk6Clozaqtkvfe3optwDOhvbleipgrsVa6dHnVdA2X16dPwaehP8mBUQs9WrcU4sppYpgqypyT6XOSuO1rBrXbImrh5ReywyUu5I6zcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487219; c=relaxed/simple;
	bh=MB9u8iTtmWyO97YEmZErJn/2xZ0Zhkz+CeU3YYUQ9PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6UsX9k3ypsycAVNeqCLI1YzrJvF+cJAc161tokS0MsN1hSZqsebnDgtxUnxcPkhruyGTFBjqUMsnOLY6TFtIgndRdt7mXrStIg5xc2WUp6fpBNbiZ7Nw+C/gTqjshxX/ygUPMhVU0k1nkCjteXhUe0VXrs7fMf4h+A6BJt/9mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G6ab5byY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFB8C2BBFC;
	Thu, 27 Jun 2024 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719487219;
	bh=MB9u8iTtmWyO97YEmZErJn/2xZ0Zhkz+CeU3YYUQ9PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6ab5byYgSWYwPj4yBFPWZlYZmgZwnYH/1CGw+tCXnEtY7u3R+NE7pJxn7poSZgT1
	 +0jqJ8zFTop3wihIfwEbgU4VZxJR0+qOLWJkUi1PoJyM4zWQgwQ1d7chQlfkEt4o0w
	 zUDTj8KKbZN4X6TrUifYfhrwVuOiFvKJ1OvlKk4U=
Date: Thu, 27 Jun 2024 13:20:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <2024062716-lumpish-both-24df@gregkh>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>

On Thu, Jun 27, 2024 at 11:35:18AM +0530, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. This size is passed
> by user space and is checked against a max size. For unsigned PD
> offloading, more than 2MB size could be passed by user which would
> result in PD initialization failure. Remove the user PD initmem size
> check and allow buffer allocation for user passed size. Any additional
> memory sent to DSP during PD init is used as the PD heap.
> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> 
>  drivers/misc/fastrpc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..9d064deeac89 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1389,11 +1389,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> -	if (init.filelen > INIT_FILELEN_MAX) {
> -		err = -EINVAL;
> -		goto err;
> -	}
> -
>  	inbuf.pgid = fl->tgid;
>  	inbuf.namelen = strlen(current->comm) + 1;
>  	inbuf.filelen = init.filelen;

This feels really wrong as now there is no way to bounds-check the
buffer size at all, so userspace can do "bad things" like go over the
defined buffer size limit which you are expecting, right?

So how is this actually correct?  If you want larger sizes, then
increase the INIT_FILELEN_MAX value.

thanks,

greg k-h

