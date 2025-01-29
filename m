Return-Path: <linux-arm-msm+bounces-46490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B435EA21AF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D8E3A42D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 10:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B06A1B425C;
	Wed, 29 Jan 2025 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kc3PkfhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464A11B4235
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738146605; cv=none; b=KxmVt7YuA4CmaL+giRb+FUFABsJMzhS1+uyyGjPs3MZiOFNbxuBdGf8cKeGVxcwmvwm79o+Id+5lc6N2h5+4gzSaKT0MXH1gQQEAcbpp8V+X2nyl7b0mdKpTxXxBmFweXtvWXmNq9UDl1EIJqqztS8qZ8AsuCFH2HERCg34uTJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738146605; c=relaxed/simple;
	bh=6zmWtTpdDEKQZjNK7/Ow+asSICw05VeLn4npyO/GYZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNMTUVI7n2LHYAXNwfwqm0+RisFW+RdC2QqH/9Hh8YhmKzQ7yLtJ8jDBc7LaAsIbLqZxNgJSIBbb8kvrbTCiM9zWpm8l7v63n8FDBDXJ3AKtEItt71RuukSmvlpDUbchWhldOwF0T336Z0avymcC87hOV/jKwXM8VgihBYf3ssI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kc3PkfhI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543e47e93a3so898666e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738146601; x=1738751401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf2z9AXXqo23L5sx+QSCftXUEAvXag8Pe4y8FtysR9w=;
        b=kc3PkfhIFpSwmbY4qU4xfFRP9eOgNv2X0jBCw3x2m/NFWNL+OXC5AdcjX5v6fqnlDP
         QbPwhhJM7rty4jv1sJ0C6trDxvF9zPlDMEaP/UGQlRQytNFDfL8S5SybeCF+v6lrUp4d
         Y2I48LVwta3Nt3R0Nw3ZzkVaeRFCoowjZ8ynmhgtI0TC/uYHV7pjC2UqbkV9++DCvkDd
         P4r7vOHD/t7IpzRKMHBGV2f3qLfkw6+f3/YIcMQJTeg6YiTiyK9xeDFPxJ0dgmRxC1Kl
         imEAfJv+j2NQ+Wq8x5qtfAnK0YH2Qsjx4F5vdINnAj05n7P9hDs4Sd4Sawggc4melffr
         a0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738146601; x=1738751401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf2z9AXXqo23L5sx+QSCftXUEAvXag8Pe4y8FtysR9w=;
        b=T3DpameAmGyZWkVQIy+6HFlP3dH7GvfuTWgSJpsxWPYSmgifX00rFdXCWdtNwJRg3Y
         mYhL2hR6bveHMlPwt4ijmgTxPe8MCuHUQSE5MOMUu4iNrEwthMsMv0NQT54IPTbdv3qh
         BxFCxpdgKGk88nSDexhAl0OQdYxfIfUHiePrwTfcZ5yqYNahQ1+uZ+0RmRPdUbMa1g/u
         Wpv4IsgxVvgSSGNV0sObr1yS2inpAuzqMsPZTcjfghCP4Rg3su/TsXX8Qpu+XzcM3E96
         FQoU18V0vRiBSB7RpcMnqqDh0VXSYAypjxw9SkMzwirrzl6UxNGQe7flc3CvlHqmmJSX
         iC9w==
X-Forwarded-Encrypted: i=1; AJvYcCWNUH95/G7A7EFMOTCJ7tnutI3Xr+0Pci7Q/z0sGJEpmY8k2UvvzZg2JfbytUFl9t29OWETJLpBv3H26jm3@vger.kernel.org
X-Gm-Message-State: AOJu0YxuKeSDwq53LA5//rKFSoGBzkKUBuEUwOnYeQIYJZeYDOsQ3cb4
	ieWcUoV/yf34FekdYkkIGDk/T16U+2wV85VwDl8CPQY8QKrjPWdziBFzqslFFBY=
X-Gm-Gg: ASbGncuC55snbKDO6/8DTl/SaFoZ+w+xa0MdvljPbp0LOkhxfHyZfoX69PxO8gvuDBR
	zXTLSx49PaiYWtA1JYcVwhz4tN9q6tHWkHD/u1aI/GFw5qVqe8Vwvv75AkDYDTvTAcUgm70BPBV
	MyYS350xpZcwC5ROyEYU6AFeTEJ3lKbgjbVavu25SSXHtV5jzK4HRRXkfIBHoYejy42wYSuVpLR
	d1qku24Ax1UKutyyEbgyHwimj4whnBf7gC4BY1m2NwIA6kVtHzZVgbFu4b2Zq+78a9vfJBj5tuk
	9+oFjHjt5S3YLlC+b5BA2EfHe2zA2uNIy0ZH5QG0wOuz7AM03FySDZaRC8l/MzuKmeH85WTC58o
	Wep5jhg==
X-Google-Smtp-Source: AGHT+IHkpLJ8On8IDe/0sYVi8VhGBlFK7bZ6QLzqiTm3DF3uzi4M+9EKkB/RqKJcbmGZoV2De5zgyg==
X-Received: by 2002:a05:6512:4026:b0:543:e3e2:879e with SMTP id 2adb3069b0e04-543e4c3fdfemr727073e87.51.1738146601094;
        Wed, 29 Jan 2025 02:30:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c838166esm1932581e87.235.2025.01.29.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:30:00 -0800 (PST)
Date: Wed, 29 Jan 2025 12:29:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 2/5] misc: fastrpc: Introduce context params structure
Message-ID: <bvuexnpy4yohdbmanj77yugxn2qkwmkcsguvdfbvoyekv5yq6x@fmvwlq5uxxrr>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-3-quic_ekangupt@quicinc.com>
 <dbyrbb4q2q2hrdarprfpbg4qnctjfp4uiwp6cqq6epg42ekeba@fyipe2jrhayz>
 <fec1e345-1ebb-467c-93d1-264ad0279096@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fec1e345-1ebb-467c-93d1-264ad0279096@quicinc.com>

On Wed, Jan 29, 2025 at 10:27:45AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/27/2025 9:13 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 10:12:36AM +0530, Ekansh Gupta wrote:
> >> Add structure to invoke context parameterms. This structure is meant
> > Nit: for invoke context parameters.
> 
> Ack.
> 
> >
> >> to carry invoke context specific data. This structure is passed to
> >> internal invocation call to save the data in context. Examples of
> >> data intended to part of this structure are: CRC user memory address,
> >> poll timeout for invoke call, call priority etc.
> >>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 138 ++++++++++++++++++++++++++++++++++-------
> >>  1 file changed, 117 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 1a936d462519..c29d5536195e 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -254,6 +254,11 @@ struct fastrpc_invoke_ctx {
> >>  	struct fastrpc_channel_ctx *cctx;
> >>  };
> >>  
> >> +struct fastrpc_ctx_args {
> >> +	struct fastrpc_invoke_args *args;
> >> +	void __user *crc;
> >> +};
> > Why do we need a separate struct? Can we use fastrpc_invoke_ctx instead?
> 
> As fastrpc_invoke_ctx structure is allocated and returned from fastrpc_context_alloc
> and getting fastrpc_context_free. I was thinking of keeping the user passed
> information in a different structure.

I think we've discussed that previously: don't store user-passed
information. Parse it as necessary and then drop the user data.
This way both old and new invocation types will use the same data struct
internally.

-- 
With best wishes
Dmitry

