Return-Path: <linux-arm-msm+bounces-21088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD58D49F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5304E1F2270B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B6417D346;
	Thu, 30 May 2024 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjYNGBEO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65A1078B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717066787; cv=none; b=C38r26UTrWGr2p15gGfP/QsxUKArFH2TSPqjaUIyDsRkpfL+c1IsMvDj13AM0NAOFFyhXX7JOIzHl6hCavSwcAEK937hAtJBJGI+ujVCV07hRwy2RhtiP1r+rYPhy8vRlF3cy+bMsk7CjkW8ScxGuJcndOI6Rhw01J/nlywX2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717066787; c=relaxed/simple;
	bh=9/fKoLvOKpICUqz6KMCfaHn81C8Ngz7UpdjXeMLPujc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MO7+lUFp8hM0tj2JDhtXGONUVrc1Y/Cmy4MnfBGSXBL9Jnhox0QXNFQM/fCopuUdu40ostYt3UV5NI/JR9vXUW57LUeZKU/rP630vjvdpDT2v/JYSEC/kkSmI/bc5Vr5af2+9Yndn4cw1DXuIwNkXpqkjR+QVlvU5/KLfRf8mNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjYNGBEO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b80e5688aso475718e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717066782; x=1717671582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e+0dLNBhw1eUTF0RZL6Cl4NPRPs6ZchhOvYxJnIa8tI=;
        b=DjYNGBEOQJQt2/Te3YrbekfQ/I7p8Mj0Hzc0JX0Tcye6oMsrPCA6ulTsOAj/Svz8PP
         nEelTAafSMXfKRsi/MzQuys6waBtQt6ZB9KEHvWxY1t0j6XT+zQ3VDQe8G3h8AKVRnFV
         RiOy0xkcODXY8NuaIFzpjUFeujYZu1znDuQ1FbU6ebrvtAFkrZuuvCuIgYPUe0n6J3rq
         l7nIVObSdAYsK1R/bhMGt6jEE0hw9XFEDf3usF7bNqG56CCrs6/fzJnYCoN9a+rpdrPk
         fN0J7pz+l29+0hYh+ps1xAAaxUzzx0SDg7vEw3JywnGNyx4BUUw4BujhuOVmnBBoy+OW
         cO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717066782; x=1717671582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+0dLNBhw1eUTF0RZL6Cl4NPRPs6ZchhOvYxJnIa8tI=;
        b=k798LsjX0/YURB7co8C96xRZcGkyJEzE1br/PQXJiaf6pc8FFeo2xC8bIF9aBOf2qj
         VGZ8pch/VtAQcIrJPLjREwk+33/jvuKd7cyow7raoIWpmcWZIx7cnkBRQlYb4Qb5QaUi
         BUkTjgVUTRKQU5Xldo/M92p4SPvsjE4TfjcrQSXl6SUFdMHVDZu9h0s/5lfjWAhF1J6X
         dMLcgUCAGJ1Rt+nDLQyxmGboswDOlNj5dcsXw1t03uchKKkrSPq9VYeXb66VVIk8jMzJ
         YIrEjePYbQ2FcQDQmu+KW6+6GEs/6yeWyLbJ05POqiNRAXSWgitLJSAdJ4YWf4lsBnAf
         y23A==
X-Forwarded-Encrypted: i=1; AJvYcCXnRstNEz9IO0MC2XLysL15HbpbFen2ZMlxK8iMt5W5n6aO3uHmXu53Wi7EiBZc/M4OT5xuC/h3qbWlzAeQhP17Pfx/LLIaCPfWIUTxIw==
X-Gm-Message-State: AOJu0YwOPH25KANoq1ogoKImtM5PKCC4bLqBCClAnE+O1tCBN8BlCUPG
	auyQSQmJULB5dBYO/YfF7zunh7YB2ab2s46kab7D6JxnSobFB7WJwNIO7Bdj8sg=
X-Google-Smtp-Source: AGHT+IH6F2kT3o13I5gkpnyJT9zN+imrzUIkYfF3JSfHv3Rx/jdXIRcLNXU/qh+jY65qQ+ImaqXU0Q==
X-Received: by 2002:ac2:529c:0:b0:51f:4d57:6812 with SMTP id 2adb3069b0e04-52b7d428982mr1423348e87.19.1717066782384;
        Thu, 30 May 2024 03:59:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b39cf8dffsm390073e87.23.2024.05.30.03.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 03:59:42 -0700 (PDT)
Date: Thu, 30 May 2024 13:59:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v3 2/9] misc: fastrpc: Fix DSP capabilities request
Message-ID: <zcqc4dgc6pippwiysybmkbvogfd6gbinnrw65kiulie3wlup5y@wq4dexvamo7t>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530102032.27179-3-quic_ekangupt@quicinc.com>

On Thu, May 30, 2024 at 03:50:20PM +0530, Ekansh Gupta wrote:
> Incorrect remote arguments are getting passed when requesting for
> capabilities from DSP.

Describe why and how they are incorrect.

> Also there is no requirement to update the
> PD type as it might cause problems for any PD other than user PD.

Also... means that these are two separate issues. There should be two
separate commits.

> In addition to this, the collected capability information is not
> getting copied properly to user. Add changes to address these
> problems and get correct DSP capabilities.
> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4028cb96bcf2..61389795f498 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1700,9 +1700,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  	args[0].length = sizeof(dsp_attr_buf_len);
>  	args[0].fd = -1;
>  	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
> -	args[1].length = dsp_attr_buf_len;
> +	args[1].length = dsp_attr_buf_len * sizeof(uint32_t);

As you are skipping first entry, should there be (dsp_attr_buf_len - 1)
* sizeof(uint32_t).

>  	args[1].fd = -1;
> -	fl->pd = USER_PD;
>  
>  	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
>  				       FASTRPC_SCALARS(0, 1, 1), args);
> @@ -1730,7 +1729,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	if (!dsp_attributes)
>  		return -ENOMEM;
>  
> -	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
> +	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);

So it looks like the argument was correct. It was passing length, not
the number of attributes. The only thing to fix is that args[1].length
should be dsp_attr_buf_len - sizeof(*dsp_attr_buf).

>  	if (err == DSP_UNSUPPORTED_API) {
>  		dev_info(&cctx->rpdev->dev,
>  			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
> @@ -1783,7 +1782,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  	if (err)
>  		return err;
>  
> -	if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
> +	if (copy_to_user(argp, &cap, sizeof(cap)))
>  		return -EFAULT;
>  
>  	return 0;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

