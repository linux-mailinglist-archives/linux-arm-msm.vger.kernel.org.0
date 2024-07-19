Return-Path: <linux-arm-msm+bounces-26621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E62937671
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4439F1C2061A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E42441C85;
	Fri, 19 Jul 2024 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gxjf5m/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5829A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383605; cv=none; b=jxIKG6ppIei0lVy2BgyspzmL3390Y++8lcwssGzNcH/VmZugUYzHYzbfNG1rmHRnVXxmvKTicK7aEHKFPzLWxMokImND0LZ2nPK8HAvUusrX4Tj7rs5mLbaPOCZoMnCCnovRf5XHJ3F/DyhFqhLkv/zsLR2YXCDv6RmgySq7Gno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383605; c=relaxed/simple;
	bh=bw2Wj7B9sD05gS7iMhGuDnv4DYe1GwwbF6ss6inK1RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Umwcb4+3sGc1p66ERZ0xJFM9f1+hj7JZCANmYy3m2QTRJJQzFue7lKz4Bs11S3PQa34J2XbVW5sLQArKCIvVVB0Tv6jlCkqilkLRn09TGPQpeVkp0QzEXr+IiReQxC4xmubpOtBA7gztrwh2VQEI1/gc4CCkoMV5IL5guhwN7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gxjf5m/y; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeef45d865so24148011fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383602; x=1721988402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtFkMNr97U6PMU3KWhI0m1Yz9Cr76MZFaEin19mAf/Y=;
        b=gxjf5m/ySiQ2isn/odhOCvT2TaxjZGZe6iWNOBspEtujuFsiXhu3ERvdszJvYjZOp6
         kocWB8wxD7v3/ZpmKjjHHQvSKZ/AaCA6pMMm9gmXewvoN2PqIGRKZZIQgYFv/uZHBW1E
         Om1KbCnPeUfhAMyerFtWjCB38AKCJkDW6NqYF4/um+6hOLLqDfFb+ZO2BLfVyuphvJaS
         K+hqsnlVJd8MHRJ5G/06fm8RAqdVdmH4bo7wqN51ohAVJzJSIbwjU+X1RpMCmgKvGZlH
         6hZcbpS4RDAOM4pLuyzoABSo2gju0SYseFmfqan1E4H15vs0UMqTHNSBXQ16486Leg36
         4OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383602; x=1721988402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtFkMNr97U6PMU3KWhI0m1Yz9Cr76MZFaEin19mAf/Y=;
        b=Yb3FSwEaE7EEDYvn39K3LJe62QpsrtPapZqPm/oKiNK06yOaLdp1m23nOfp2qhzqP2
         skQ0F1oAShtV42d6C97rriEwWEmxMBr4ZNoyTvCz8r3XNkROiFUFLsbOfkcfTw+wxIDF
         +4Dqi+Iv21MYhm3oQjHK7rahbx5kgTMkpcYaPEWAWhmbruAOqey9kfr5XWi8SWSPn7Fb
         55hylEqENAwgiKk+4gIqyu2999UC54ogA1h5KoUYH/IlE+LdSL/eWvJJNNPd6CWZL6hX
         0sogEyY4SiYqd34L7patFU2DOTO2zkIysQ2KzNL/Dox9SzAgtqrg3KCBIbk7eSqDZ9nF
         ZOqA==
X-Forwarded-Encrypted: i=1; AJvYcCWd1w+QN6VM8ZIbb+cFQiWPkshUwWRFHtUPsS6don+UfwuYNwqu7m2BO88p8BJCEqOw6IA3h4d9EbQxOmLeU+QRq0W/CGxmd3vie87Ugg==
X-Gm-Message-State: AOJu0Yz/2b9YwY72iLyVooTCpqKO+jJPdYUuQPDH9mQHwPdF8KQb9K/W
	vEQo37+ZuLeHVbftAcfl8Du4ZPuicn66XkYmNexjxadLA7AS571yjZRpQGMLhlU=
X-Google-Smtp-Source: AGHT+IEKIvSwhjz08K1A39gYm151NbGmciczCRnss13AY6wbm0ME/qTH+PDHsKWwKRY/LFOKkdDogg==
X-Received: by 2002:a2e:b60c:0:b0:2ee:52f4:266 with SMTP id 38308e7fff4ca-2ef05c53bd9mr41880111fa.3.1721383601643;
        Fri, 19 Jul 2024 03:06:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef0fcdd49bsm1594041fa.90.2024.07.19.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:06:41 -0700 (PDT)
Date: Fri, 19 Jul 2024 13:06:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v4] misc: fastrpc: Increase unsigned PD initmem size
Message-ID: <wd3vpjh6u7tsaxccc6ek5t3ryio453exaprsmkxyzsh4brx7qk@ywkerf5fwqnd>
References: <20240719085708.1764952-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719085708.1764952-1-quic_ekangupt@quicinc.com>

On Fri, Jul 19, 2024 at 02:27:08PM GMT, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. This size is the shell
> size that is  passed by user space and is checked against a max size.
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
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> Changes in v3:
>   - Added bound check again with a higher max size definition.
>   - Modified commit text accordingly.
> Changes in v4:
>   - Defined new initmem specific MACROs.
>   - Adding extra memory for unsigned PD.
>   - Added comment suggesting the reason for this change.
>   - Modified commit text.
> 
>  drivers/misc/fastrpc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..18668b020a87 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -39,6 +39,8 @@
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> +#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -1410,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  			goto err;
>  	}
>  
> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
> +	/* Allocate buffer in kernel for donating to remote process.
> +	 * Unsigned PD requires additional memory because of the
> +	 * additional static heap initialized within the process.
> +	 */
> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
>  		       1024 * 1024);

Ok, here you have two changes in the same patch. First one changes
the allocated memory size for the signed usecase and another one adds
separate handling for the unsigned case. Please split them into two
separate commits.

> +	if (unsigned_module)
> +		memlen += FASTRPC_STATIC_HEAP_LEN;
>  	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>  				&imem);
>  	if (err)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

