Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C990025FA8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 14:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgIGMde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 08:33:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:45932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728792AbgIGMdb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 08:33:31 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFD56206E6;
        Mon,  7 Sep 2020 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599482010;
        bh=kDHQv3XCIPb67Uc5kjThYASF43s8jQiU+rU4a6we73I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vutxjeTK+c84QOcfrmiQZoAi3MNhUbkZMzAVZmEnKl5xXrZQEmSlf1zS7Xgi3ZePG
         Kq2LM/1sU1DPH/RLJRbJoSq+gDNSSX/2E59CxSiQy0JhaWF2Ume6S88ru0CV/ry47x
         bcA5p9/yYPLlnsQpMe147ImA3SQHie1kywQFTOTs=
Date:   Mon, 7 Sep 2020 14:33:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
Message-ID: <20200907123344.GA2371705@kroah.com>
References: <20200901003300.11985-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901003300.11985-1-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 31, 2020 at 08:32:59PM -0400, Jonathan Marek wrote:
> Initializing sensors requires attaching to pd 2. Add an ioctl for that.
> 
> This corresponds to FASTRPC_INIT_ATTACH_SENSORS in the downstream driver.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/misc/fastrpc.c      | 9 ++++++---
>  include/uapi/misc/fastrpc.h | 5 +++--
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7939c55daceb..ea5e9ca0d705 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1276,7 +1276,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  	return 0;
>  }
>  
> -static int fastrpc_init_attach(struct fastrpc_user *fl)
> +static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  {
>  	struct fastrpc_invoke_args args[1];
>  	int tgid = fl->tgid;
> @@ -1287,7 +1287,7 @@ static int fastrpc_init_attach(struct fastrpc_user *fl)
>  	args[0].fd = -1;
>  	args[0].reserved = 0;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> -	fl->pd = 0;
> +	fl->pd = pd;
>  
>  	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>  				       sc, &args[0]);
> @@ -1477,7 +1477,10 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  		err = fastrpc_invoke(fl, argp);
>  		break;
>  	case FASTRPC_IOCTL_INIT_ATTACH:
> -		err = fastrpc_init_attach(fl);
> +		err = fastrpc_init_attach(fl, 0);
> +		break;
> +	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
> +		err = fastrpc_init_attach(fl, 2);

Shouldn't you have #defines for those magic numbers somewhere?  What
does 0 and 2 mean?

thanks,

greg k-h
