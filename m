Return-Path: <linux-arm-msm+bounces-26693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A699388B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2721C20BFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 06:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFDE168BE;
	Mon, 22 Jul 2024 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gtxqfrHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A733C0;
	Mon, 22 Jul 2024 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721628032; cv=none; b=kQTbStK6iYURFNSCG8KSZZm5DMsU18Mep86vy1jhNFiL8r4/U+OoLrE2MPmsovMDmiptBvdo3pCcp+lb35893f7gg7GeyR5S81pO2VM80PR00dzEs3hYXVhcqcqpgkvuBcoI0eQCpOh+cvplI4tH4g4aVt0oK0iJNJ/8zHF28EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721628032; c=relaxed/simple;
	bh=UOdO5rzxPHlgIWDk6aHeG0JNSvBIhvn5oszuTvmYYyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7hRfboc0xADMV+KefjL0BKybyIfr1Y9FIX5qYV1uItfii5OfqL7uK+mDQrqHao7vcR5Xq9ACXAw9NtETuNLm9gei/617gYyCI2R5bKTdPDcrwpdI8liF4RtSHROswHs7U8Q9rNRknmU6pAOAaiub+zi0hRQ9gcbsoNiCtSc2Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gtxqfrHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EC7C4AF0D;
	Mon, 22 Jul 2024 06:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721628031;
	bh=UOdO5rzxPHlgIWDk6aHeG0JNSvBIhvn5oszuTvmYYyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtxqfrHmH8UtS8hE1BrE5pv3LhImqMhQrEOousVju4/BNE8cOtnA2IC6UgIe6anB4
	 DJqRKKJy9BX70RMhJkDgReM+F5pKHC4iV/qPYnkFYfsMM80Qy0XTWWv4MNsQIEzsjb
	 5u1jeehjWMat8pSY5zEwi5uAGb8QUKdnqW056/IQ=
Date: Mon, 22 Jul 2024 08:00:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v5 2/2] misc: fastrpc: Increase unsigned PD initmem size
Message-ID: <2024072235-daydream-clunky-0272@gregkh>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722055437.3467900-3-quic_ekangupt@quicinc.com>

On Mon, Jul 22, 2024 at 11:24:37AM +0530, Ekansh Gupta wrote:
> For unsigned PD offloading requirement, additional memory is required
> because of additional static heap initialization. Without this
> additional memory, PD initialization would fail. Increase the initmem
> size by 2MB for unsigned PD initmem buffer allocation. Any additional
> memory sent to DSP during PD init is used as the PD heap.
> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a3a5b745936e..18668b020a87 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -40,6 +40,7 @@
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> +#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -1411,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  			goto err;
>  	}
>  
> +	/* Allocate buffer in kernel for donating to remote process.
> +	 * Unsigned PD requires additional memory because of the

What is "PD"?

> +	 * additional static heap initialized within the process.
> +	 */

Why are you using networking comment style for a non-networking file?

>  	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
>  		       1024 * 1024);
> +	if (unsigned_module)
> +		memlen += FASTRPC_STATIC_HEAP_LEN;

I don't understand, why is "static heap length" being added for
something that is "unsigned"?  Why isn't this just "SIGNING FREE SPACE"
or something like that?

thanks,

greg "naming is hard" k-h

