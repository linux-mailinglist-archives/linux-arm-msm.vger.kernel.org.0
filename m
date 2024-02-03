Return-Path: <linux-arm-msm+bounces-9698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0220A8483D2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 05:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7752C1F24E0B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 04:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D715D10A05;
	Sat,  3 Feb 2024 04:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DM58zrJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF710782
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 04:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706936223; cv=none; b=Bp1SAaEqGK7HBnt3kimGRU8O2NnnktZALlsitE8TI+6VfNMBg6gMwq8KQBwK/mFEF1AlE/kRYw4L0t4Rp2YvIYl++X+v9mcJS0CI+H5MeW1fq1LKkdmsDSuXtx62KUY4k7nVqFhHi2GUuVJfnNrBBI29hVLJhfKb/wYrbFTIYw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706936223; c=relaxed/simple;
	bh=wKy8pJGaRQ54CuzSdhu8+xkT6SOYTsPwXkeIF/nYQD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3cwoF8AxeNH9b1/xdQiUQxln/LJDEzAwYCpjvA/qny1WbIfgk1QNduSoN1f/uBErxeLdKeRoAkURA5hSz5VGamrCo91rXEXrHcWfNEy8UpiqJTc7dx2xeFflKkHqehsjn5cf5mXW0uBXjbul50ffe6WReA3YWXc/r10/5qaU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DM58zrJ/; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59a910a1265so1498164eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 20:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706936220; x=1707541020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Js2QfXs3Kv3aTrQZDgjZoyjW7ifVdIqfUU+Z5Gf8Jr0=;
        b=DM58zrJ/ae/LmnsnDY+/pEK6fRzCBJ270Mx6vZmm/76YOp9zL9sloDSYn3C4oMcHcP
         1lKqB2Wbvo5/q2Bhzin3JnzIMKZsU8dDp8zvnJDfhyENLzg9bthZJYuV3nCrXrmM67UM
         bLLi+nnBPZlwAfvi8tBRsw/c1Osxx8kP2ancyl+SsDUe92+SXoAj3LcVgCBEtlOMAH43
         7QJtNboXhMLWm1ZHwyWpLipFkmC/ph8JI2qkQ+XXmXtGfEMpRsdZQMEGexWkrbAstheV
         C0uHLGfFTK13+YxMH8UWvz8r0VfIyVSw43Uqgu/IkIxNADHux/blK3wSkJba9qH9KL0I
         MQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706936220; x=1707541020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Js2QfXs3Kv3aTrQZDgjZoyjW7ifVdIqfUU+Z5Gf8Jr0=;
        b=QOK5bzlHV9cmy8DZ3UKE8r3WxJIS43sA5ZhDaxBuV0+4Z/jCYreh2MaTarDwk8FH7Z
         c2TgRUcBKJ7gLymc+Q0BxJW/+/pPjX5Um5WHRnEW/ZhHkiPAccvSMYQQ/e1mKoSg5pTw
         KY+gHACQS8CCFtpmm+jHLe+sKrksGG2BWts3zLZVqZ6eVa3JTNWUwRCM78JasnOlwVKU
         t9vSgfsM4zF3IQ7u1supfF0aZbvlOvsKc1hzHkwkHiXflrTOq25hZ6yGiJhPx3MdhovI
         s9XcE+sVKg77cDQCCF0ld19qYFAo4yixzXacJ49Z/qsaIunBVlCumLYULclzgdDkDEEd
         qeGA==
X-Gm-Message-State: AOJu0YxEljtkaBOvjFHugiOyd4irR4nJcvVnscUONg7XFnuZLT4TdWVr
	ubDAuE4VeiiKnaqG3q6iNDlPd/+xGXAFAi+kfQg/eKiDkzeOYW/hyKQG6oZ5DA==
X-Google-Smtp-Source: AGHT+IGOgmxZ3CB6VB34fKCm/ENjp6io0zJyn4+7PxlwjeLGiYmNeh5ehDZqnV1Yxl+sjPgzEbquAg==
X-Received: by 2002:a05:6358:3a0e:b0:176:916e:5d97 with SMTP id g14-20020a0563583a0e00b00176916e5d97mr9279249rwe.32.1706936219967;
        Fri, 02 Feb 2024 20:56:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVF4BmuxQQtX2Z3E/9s1868PC597dydjDbX0qy52eMb3OihcGrpzTKaXf1yyTwQ/q76pQGBRr7jxWpToOrYMr2VjBUQ6ldXWVD2baTsTMwQCjZjCU6CaU0I4KHpQvJcEBTwbR2OSV34Mv1uu1iWHDLWP6PaYWuA4KcBnGRTrdeTCQyTcLCGVGaGp6CjMXZLm0HlJGqxkVPrVTtEQbrQ01muOk/u3++uVfJpMT2wWz8EDAjgNGXx7j79L9B2Y3H0CTsZaN2WcLbFb4TnXBABbatQk4+v5w0cUS0RIoRzHJMban3bI004Sy2Y8Kp1w0domqj4cBTzMMA6+KQtngWNEMDyH7tV6p1+eCw0EQSM
Received: from thinkpad ([117.202.187.138])
        by smtp.gmail.com with ESMTPSA id j31-20020a63595f000000b005cfbe445a85sm2631019pgm.70.2024.02.02.20.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 20:56:59 -0800 (PST)
Date: Sat, 3 Feb 2024 10:26:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@linaro.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: ep: Use kcalloc() instead of kzalloc()
Message-ID: <20240203045653.GB3038@thinkpad>
References: <20240128112722.4334-1-erick.archer@gmx.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240128112722.4334-1-erick.archer@gmx.com>

On Sun, Jan 28, 2024 at 12:27:22PM +0100, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> Here the multiplication is obviously safe because the "event_rings"
> member never can have a value greater than 255 (8 bits). This member
> is set twice using always FIELD_GET:
> 
> mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
> mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
> 
> And the MHICFG_NER_MASK macro defines the 8 bits mask that guarantees
> a maximum value of 255.
> 
> However, using kcalloc() is more appropriate [1] and improves
> readability. This patch has no effect on runtime behavior.
> 
> Link: https://github.com/KSPP/linux/issues/162 [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Applied to mhi-next!

- Mani

> ---
> Changes in v2:
> - Add more info in the commit message to better explain the change.
>   (Dan Carpenter)
> - Add the "Reviewed-by:" tag.
> 
> Previous versions:
> v1 - https://lore.kernel.org/linux-hardening/20240120152518.13006-1-erick.archer@gmx.com/
> ---
>  drivers/bus/mhi/ep/main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 65fc1d738bec..8d7a4102bdb7 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1149,8 +1149,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
>  	mhi_ep_mmio_mask_interrupts(mhi_cntrl);
>  	mhi_ep_mmio_init(mhi_cntrl);
> 
> -	mhi_cntrl->mhi_event = kzalloc(mhi_cntrl->event_rings * (sizeof(*mhi_cntrl->mhi_event)),
> -					GFP_KERNEL);
> +	mhi_cntrl->mhi_event = kcalloc(mhi_cntrl->event_rings,
> +				       sizeof(*mhi_cntrl->mhi_event),
> +				       GFP_KERNEL);
>  	if (!mhi_cntrl->mhi_event)
>  		return -ENOMEM;
> 
> --
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

