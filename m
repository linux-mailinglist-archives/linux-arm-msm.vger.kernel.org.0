Return-Path: <linux-arm-msm+bounces-22048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5F29001B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 425771C212E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611A0187339;
	Fri,  7 Jun 2024 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n40smNOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE161FCE
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758736; cv=none; b=XfWVF20yJrFsZOj4FA9RLDj3OLR7YUwcwkGVG6d8Czs7tDXxVeN0PhqnKsnRJZel2VnbZ5HwlQ8aRRVvEzwnaIvPYTqc8Q3CyfDVFyzbTyGPbUb8JyXA0C2dJQrlljqw0TjZSKvQzqztqmnM6Y8yP3o3Z5ZvV42UgrWzvSIHaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758736; c=relaxed/simple;
	bh=imAdMxEgpItJC7m2y2a8Qp3v8Ayf8lh6CfzMdKXal/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI+rAXsnhnVU0rYjW+ZjLvk7p+Gsh0MD5IBKnAfUuZJH6ighcZ3jPg2M4OhbmGURu5Dqim3zepUqWW2Jp/k04kYD/8CPalCTLBKisOzVotch1CUGVz5/FAZDFkb007pIfOu2Yr4LOdyel7+BmWHh3NjnuAY1s05LkEP3ffP5W44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n40smNOG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b7c82e39eso2230546e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717758732; x=1718363532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LA62BcUboJ8oQKyNiD3kfMcc/f4SxzTvuzwHvOhJ4mE=;
        b=n40smNOGYQUXXk+N4vYIUp1oUlz4IynZa5tFBcJlhvSypZrpiPx4XWnfs3U+etD0jC
         MtawK/O7SdyQLPqSytAi51mOGJzcqqHHWsk8tHJ/CPpcqvczBUj9ibXiQRBmzuPoYi//
         6gySyPT1sBuKa+6bMOdTMCzTmBaoBdZFiC8UwRKUKzCeRBf7IRXWZ6le0OVJrkGlMcma
         235z6gV+cak1/Q5TyyW5ugNsFxiPFiej2mp33sC/WSP2FxQZ1l0JrmnyFuPWFkboKCpC
         xfvtaJohL8+MF3nAtJBfUgcr2DG6O8hkacHLsk2vtAdBHknPqipPl9mq6L1e491rnClV
         rdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717758732; x=1718363532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA62BcUboJ8oQKyNiD3kfMcc/f4SxzTvuzwHvOhJ4mE=;
        b=dvasT/45/xk5GaUULWdWY9BraynkrI+X2HYAkOy9gSFY/eaPLwCE4wfhhkxydtk+H6
         OMUitJvO1Mt31ohPbNPUPlW3GgoRcDpBo6AMv9EuDACTcq8RK5flsZxuwenImUs4X3/d
         zfI1cC4uvyDby1As5hL6Ce2cGAO+u1+fdhRsMIZNDdiWPo4zCye/x6MC7/o7HPtKYxwG
         JLxPw/IOjmnN9bE1PsdUCAJ9khPG+xkyTNplnrH078F6PVaM5cWt326wjDhCC49qsvCZ
         lEnKte4RDGHBKE4CBZk82QFEy0kBcNY5kpp4FUgLc7Hi8Aqa3KUs/ohCfYEf1oi6s3qi
         oxTA==
X-Forwarded-Encrypted: i=1; AJvYcCUZeeZnX0Rz9Y+5ZPUS8aAiuuMLiSVqc5eXgT9wMJ+xTTA0jVuptlIWcta81dNuzOOi/gLkgv8tzeWOsODoToWT1hlZ6xJIpo1Z45CKvw==
X-Gm-Message-State: AOJu0YzMuN5z5U0Nf/YUCE2y55fJzjA4IAv2XMAof5UEoYtC2GtUBkWx
	4OGRdXWN7GcD098eF7tOFWdN54QCFQWmlt6trJdTqBaXgs/8GqS4up18y4rp190=
X-Google-Smtp-Source: AGHT+IE3Cp6vuMXDWAIPcIHNqCYov1VfYGyfxDQht/MN7zZ++gROSc2k0OFvbvjxaSVXyjIFzFWXrQ==
X-Received: by 2002:a05:6512:a95:b0:52b:8255:71d4 with SMTP id 2adb3069b0e04-52bb9f669admr2379081e87.3.1717758731835;
        Fri, 07 Jun 2024 04:12:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1f1fsm501872e87.46.2024.06.07.04.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:12:11 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:12:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v4 04/11] misc: fastrpc: Avoid updating PD type for
 capability request
Message-ID: <wn5tyo2tk4ybt5xel5leicdi5uvblmnabdh4vhfnupern5jaja@fu2d4bf5mcgp>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-5-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-5-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:24PM +0530, Ekansh Gupta wrote:
> When user is requesting for DSP capability, the process pd type is
> getting updated to USER_PD which is incorrect as DSP will assume the
> process which is making the request is a user PD and this will never
> get updated back to the original value. The actual PD type should not
> be updated for capability request and it should be serviced by the
> respective PD on DSP side. Adding changes to avoid process PD type
> modification.

Nit: Imperative style, please.

Something like: 'Don't change process's PD type for this request'

> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f64781c3012f..abdd35b7c3ad 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1703,7 +1703,6 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
>  	args[1].length = dsp_attr_buf_len * sizeof(u32);
>  	args[1].fd = -1;
> -	fl->pd = USER_PD;
>  
>  	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
>  				       FASTRPC_SCALARS(0, 1, 1), args);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

