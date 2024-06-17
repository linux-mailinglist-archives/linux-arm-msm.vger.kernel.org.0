Return-Path: <linux-arm-msm+bounces-22817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C790AA25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8191B2E046
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD08194AC9;
	Mon, 17 Jun 2024 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RiKp5BUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53847191474;
	Mon, 17 Jun 2024 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718615686; cv=none; b=Qty4L0w+f0ArsI+A4J2pyXcirdx1wHAUBxbqwFfqSrZEIHhFQkFP7TxH37yuo5+wWx7hOlNQm4ju5xT3bKqIEruHkHfl1JUAFIGI1H3zRI0ITGD8Nxmm4NHbL+R/WnYpIO4Plk+OrpjicxMc4Rp3OkBhRU/b55PfU+nUiV8nY68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718615686; c=relaxed/simple;
	bh=yMQPvJdaxErZHejPo0eUdt5sjumDmV2i5UooXtepVxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0jU6pzXiiA2KGt1Y3JlXtp23uW7hM2ECL4H5neE4BPRbKO1g9ic7QU2/rAnGO5uhawdHxrhnvyh9MVablL9lSeBvEK+q0Vd/V/CMTCV1FtRdbE206h77pKcbNf/ROOT+1OFvQmk3ZFskwvItJEcdBrXDFbC0ndb+ZVFQlla3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RiKp5BUj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEF8C2BD10;
	Mon, 17 Jun 2024 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718615686;
	bh=yMQPvJdaxErZHejPo0eUdt5sjumDmV2i5UooXtepVxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RiKp5BUjW92QgxszIp19E4qC7AzZbiN/2ndxZb0WQulkL3gYKMcJ+2iz1pqOtoiBN
	 YXQFdGKUPlEWsM2AVupDasBuzvV/g58oyOEF6XIWcSsor24V4HTeh5cAqCxtf7UTb3
	 Pnx+YuTs7mgFYY3DfMZgjM+Zkn1m7dRN+710ustk=
Date: Mon, 17 Jun 2024 11:14:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v1] misc: fastrpc: Increase user PD initmem size
Message-ID: <2024061755-snare-french-de38@gregkh>
References: <20240617085051.28534-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617085051.28534-1-quic_ekangupt@quicinc.com>

On Mon, Jun 17, 2024 at 02:20:50PM +0530, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. For unsigned PD
> offloading, current memory size is not sufficient which would
> result in PD initialization failures. Increase initial memory size
> to 5MB.
> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..11a230af0b10 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -38,7 +38,7 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
> -#define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define INIT_FILELEN_MAX (5 * 1024 * 1024)

That is still an arbritrary number, why not make it dynamic and properly
sized to what the hardware needs?  Otherwise you will need to change
this again in the future, AND you are wasting memory that doesn't need
this, right?

thanks,

greg k-h

