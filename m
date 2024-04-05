Return-Path: <linux-arm-msm+bounces-16569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934389A2CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979CEB25BF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC073171668;
	Fri,  5 Apr 2024 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1wf0mxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0421757E
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712335455; cv=none; b=RT3aY7w3nBb3jcihP3yri+3JguF16L4NmblxnnZyL4UwepCvDL8fKZ8KScpJdvq0lNnmHRiew5g5etDard2wMan+NGIVvkYKXTiEDVMGV1ohOmuUhl5kIHK2ZpAo/sjZgPZDUomMYc3MDXaXWf9cIjxWNS6k4P5wuvrwds7AW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712335455; c=relaxed/simple;
	bh=aT2R1dZXSI6UwLhiaGq5Z/p/OQUs3v8GH1d9CvTZe80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqwKp76sfHtGhWsuNtU9/OIpCS65CVyXHNqF0G3WZ2sZMlYe8DwX0sh3O7++CqZOES0nizkOJW5CGQhdQ5uutZUq6z6BEVomWkApoqIE3i6tqpYYmh6JwI67Ig9bTsKT4A/lLtM1BhRIhf+o+3ac3PzbyOH3teQdeuw8I1sDkbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1wf0mxK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d0c004b1so2312858e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712335452; x=1712940252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A8tZjaq3vsa5Ef5+rAl3Nt0a+YxPI811nD5LkgtpzOc=;
        b=B1wf0mxKLxbA/yCbCdDpYe5pfTQX0S74tquDNL8H04DYmGuHYfgJCtIUIAGLtIuAvz
         p/AlkQhToYP5qwsAtX+GcgODzI/xXrvaFZEAfb35hn5YmilhiYWXBB1xPBNMr4wfGADy
         u/Zq6vHkg8ps21VvVY5jHy8H8xR7+C3SbMfrYV7W+KNPSESVW+Cb+99emFjCyCvHxZmU
         NBEFxh6+X76pwA86Go/hj0rbQgLswZkle0ABnVV9uQEePWFAFYFRSpADJB/rFdjd5LuQ
         vxeTA6u9/WLzvhw1OWM9KuOPTXQD72s44xMOHUR8OtukBewcJ5sCY14tyZHB3G0fc2Ll
         cpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712335452; x=1712940252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8tZjaq3vsa5Ef5+rAl3Nt0a+YxPI811nD5LkgtpzOc=;
        b=RVG29v3hvN6DLCaLV+dEjj/tXWSj9794JxkDdB3dngccd6x8wbi/FPhmD2vqo2H3gn
         QG/Iwx9CSsTcRNsQw5gyEV8z5IUSdXGJZOp63wCbOOYJ+EtToajdS8pvnmTmr+L3idqy
         xWhqgoX9POFM5L00mU0LTS+izKmUxloBfqsrNZ1XOM9AF/d80VlXyyMQbaxizqb96S6o
         01S3+aBLWHdCpNwflPu6114WodRhAi7l46z4BrBRhmvQ84gcxxl/v4HEXrFYZLBCY8iu
         +/g17MyruU7s/SIjT0EdbRLKxdq+jNpprSXH18Wt4tpwSALMX3oGaDgOeHt4Ry92MiOI
         oATA==
X-Forwarded-Encrypted: i=1; AJvYcCWIkKQjvZEk/QtIgn7m+mxPst0+qBF2x24QHlwKna6W+HV3SWu2pS2yCZc4mNqdVOEqJ5tW7hZfFxhzgUgSz9XZrUraYVGMPCG0UcW3yw==
X-Gm-Message-State: AOJu0YxfiMXak39IPIjA8Bdrfwiqag+OPs8cXqTw25M/1eAKKtVj0QmZ
	CMzoN4M3uGvlhkDDq6WzMjIe7V1FAuHbLf8nc1KWFLpStL+9ALXGYUgo6+pVUDY=
X-Google-Smtp-Source: AGHT+IF8OL4JCr1Af7MxIbU7nV2WDQTCwzIesM0Hw7oetMCXwX7NKBeUDfbrw0/tz/kEhN40UAsDEQ==
X-Received: by 2002:ac2:4895:0:b0:515:c7c9:b150 with SMTP id x21-20020ac24895000000b00515c7c9b150mr1690611lfc.0.1712335451773;
        Fri, 05 Apr 2024 09:44:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id e10-20020a19690a000000b00516d0933256sm239452lfc.131.2024.04.05.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:44:11 -0700 (PDT)
Date: Fri, 5 Apr 2024 19:44:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
Message-ID: <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq>
References: <20240405092907.2334007-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405092907.2334007-1-jani.nikula@intel.com>

On Fri, Apr 05, 2024 at 12:29:07PM +0300, Jani Nikula wrote:
> Logging u32 pixel formats using %4.4s format string with a pointer to
> the u32 is somewhat questionable, as well as dependent on byte
> order. There's a kernel extension format specifier %p4cc to format 4cc
> codes. Use it across the board in msm for pixel format logging.
> 
> This should also fix the reported build warning:
> 
>   include/drm/drm_print.h:536:35: warning: '%4.4s' directive argument is
>   null [-Wformat-overflow=]
> 
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Closes: https://lore.kernel.org/r/2ac758ce-a196-4e89-a397-488ba31014c4@arm.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Tip: 'git show --color-words -w' might be the easiest way to review.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  8 +++----
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 24 +++++++++----------
>  drivers/gpu/drm/msm/msm_fb.c                  | 10 ++++----
>  5 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

