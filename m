Return-Path: <linux-arm-msm+bounces-26692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C619388AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7B21F21598
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 05:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6653E17BA7;
	Mon, 22 Jul 2024 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SUGtT63n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2686417BAB;
	Mon, 22 Jul 2024 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721627894; cv=none; b=g5rigIpMkzAmYus3l9DVsRnBVgAyha6cin8GAtX70l6qKpEUDmbeoMNm7JSLiBGoaNzm3JTAZjmsdmT7RF1QK684Wm7k8IfXrH61ngIIyurtBq0EBQue1lp5qm++8Iud/Oshw2l1m2MWRva7UXAaTFczTa9ydI3PJMOEb8kxEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721627894; c=relaxed/simple;
	bh=nkeDblTR4S+2jmJ1dAlZ/enSxjGVeZVXYyKlqrDj3Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kw7j8BNXnEZAnNBq2rc+2L1QtBT92lMZe2MFC8ZAO858AisZDBEuwU7a0JFacAmaScf2GcKyUwLN/YJC7nxy0tLBCnoGSdR2O7aCA4pzdFvYAWTpoycR+2Rfaj4ZYVuhnSsrjDoQ2BPrU51A8PO9xHghIXfbb5xNHtcGG8BxBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SUGtT63n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF1BC116B1;
	Mon, 22 Jul 2024 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721627893;
	bh=nkeDblTR4S+2jmJ1dAlZ/enSxjGVeZVXYyKlqrDj3Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUGtT63nikfVm12vtiDGa4OygxddgbVElPGGEnc8wr1h3FG+N6u7N28tf5sGyBXuf
	 EtMh6lTxuKqktB2kxtnsVcpGF1p7XECy+SfC5syCkgcRQ0M9VkRrguEEM3NG3yw5Xe
	 NxoyPBKo7wCzMLVfD0u/snd0l/0OlXA0fefmHAtY=
Date: Mon, 22 Jul 2024 07:58:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Message-ID: <2024072234-slug-payer-2dec@gregkh>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722055437.3467900-2-quic_ekangupt@quicinc.com>

On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. The size of this memory
> is decided based on the shell size that is passed by the user space.
> With the current implementation, a minimum of 2MB is always allocated
> for initmem even if the size passed by user is less than that. For this
> a MACRO is being used which is intended for shell size bound check.
> This minimum size of 2MB is not recommended as the PD will have very
> less memory for heap and will have to request HLOS again for memory.
> Define a new macro for initmem minimum length of 3MB.
> 
> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..a3a5b745936e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -39,6 +39,7 @@
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)

Meta-comment, for a future change, why not tabs to line things up?

>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -1410,7 +1411,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  			goto err;
>  	}
>  
> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),

You are aligning it this way, but still checking the file size for
INIT_FILELEN_MAX, so that's not really going to change anything here.

How was this tested?

thanks,

greg k-h

