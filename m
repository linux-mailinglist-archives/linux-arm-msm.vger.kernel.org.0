Return-Path: <linux-arm-msm+bounces-50443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98586A54303
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 07:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A377A7977
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 06:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C75B433D1;
	Thu,  6 Mar 2025 06:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vppdhw8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203905672
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741243618; cv=none; b=rXwaeH2h0sfuMadv28y5g/8O2CRCToL51b46zRJylJ7Cra90ZNfzeC3Yz17VAL1bha10pjlZ7pPI1VCf1RO2v2RCZxYVSBgLZ3gnX+a1A5ibglHWaWIHGoakgtVPEwMlQG7EtCnFnJPP821fydgPF+oxwZL/GL+AOUVlzWCAq20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741243618; c=relaxed/simple;
	bh=KpOy4pfpR4+rxn6tIFJkaSFhCJ2yW1+8lwBUy4Z33pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNExfJ4P9kaE8VhYoCME/BTDkQozfqgYrfc5Lk9OwFQ1ehRrFTWxCOuMpHSx8h2tuMZ33pwZWbmE+C8MPD5zswBgxjM3phommRFPfpMCgME4tEwaovnc8r1U5lt8Mp7Ms3iuH64jsyZDBD7uicMqHgFcWAgURf9eshfkaQc2gvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vppdhw8Z; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so346779e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 22:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741243614; x=1741848414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBJt5IiboHla6lV3Ran8Kn8NxsmqzqpO6sJDmhngbes=;
        b=vppdhw8Zq/8+0izrBHKbLmALahRX69m2tI3OciVwmdm7Gd5vnnbqdqIllpkKiRCILY
         EyjDAyE7Dsp61Jpgo9UuXFkrpRGNYddjnY+DGeWSZyHKsOAlb+rfaZvyl4N79Luf9fpb
         i+4QKV9kjQz/1vXNqQtPn6ZPqobXqyNM6k4vxrl7mvZYrEoy8jPiYGToGxUuyaAxti8Y
         sZMU+TElVdRbCVb4X6HWydRd3OB/H4XnhEMOOw9MVdv6JdU5MtotzKXeBHFpEojplVP5
         WjBGw95iC5qIvI0uF7+DWD7O0QG9oPy0slEAe7tEjAouXCNIXxtrTC0GNCtED5HHmRhB
         Jzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741243614; x=1741848414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBJt5IiboHla6lV3Ran8Kn8NxsmqzqpO6sJDmhngbes=;
        b=Q4rEBvskIcNRC7nPQqZxGz+91v2bAVNq2xtA8hKC3Fx9eApafoRQ087AVOonaVvTGS
         zj1Of92R0NxQsncx9es805F6HtLlsYM7zsLV/97dVOP1IRvTt3tGqZ02o4TD/Y/aRJ5U
         +nDYEb6CkAyhV5WDyhTBaXL3TQMVLP6wbB+LcahsOZLgBw/iUd+d15hIocn6pSmTmZxo
         sNMiw+sRMX0eYrizwgKvo5V76AZJePIQyC3eM/zQ5NzuHqmA62qxRcElRy+zcZzNC3LU
         ch1Zmu3hKJxi0c1P8HYXCOy9V2vdFtV0jE0meHlXQpEQieYaCC7q1rDkdpmVsdBwipXt
         TzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUPdzKQcgtrvsqG8j/kW6hOGJRSeQisLD274evmdKA1O78PZzvHwFtTJapQ8i4rf1XUI0nQXhJwv763q4Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/NWb/leoE0msQ4d/xsqWl7/Rtpyni2acI9YgNWwBAO9iWWTq
	rkc3G/v0N+4A1UCyDIftNUyxjndgMwxSYCaaVPJRuf4pe3GYVyRsGO4QhT0J4qI=
X-Gm-Gg: ASbGnctUcGA/sv6onQEeE4wYOZfYyAixPiVorl8RwI4nQxSwdwYvUFaGmlYcJtJWSi7
	qIqjadSyk7d+F5PtYejwf3SSsihulHqh2XU2y9aDt2N5Sepq2HG29iesgmVBM/PzyX5PgOE2Dlx
	DjeLK2nm20/wAot2BddgDY6mxUJdxt5S4F/hS9KgptMSqEabWHFfy7rWhajBcB+2LH+UO0ajQZp
	nTvLmFfw1clGDq+yPyC7JjQjlT52gdGphQaoNZY/BDslkj8Q84hYpeogYK15k3n6EjDRbTzsm8W
	YduRDknoL7eUW5LsHe2G/iRKNDVFzhut0/AImw231k6X4PYhJLL0qxbsoLM81u9w3wYprvO+591
	YsEEtTwbJQH3khC36ShfYRUH3
X-Google-Smtp-Source: AGHT+IHw2m0vBIquj8s91nI2Oqzx4I4bD6M7fJN4tOBXcl0RZL/nJ12bNu4CSxcWu+sPaxEIuNgp6Q==
X-Received: by 2002:a05:6512:b09:b0:545:c89:2bc9 with SMTP id 2adb3069b0e04-5497d38dbe7mr2421818e87.43.1741243613998;
        Wed, 05 Mar 2025 22:46:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd6e2sm80629e87.130.2025.03.05.22.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:46:52 -0800 (PST)
Date: Thu, 6 Mar 2025 08:46:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Message-ID: <732vgwega4ok3tkbefyxixyfdonfenik5q5zhdxqot62aygavt@s2m3m7gzjgb7>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
 <f3bfb118-f947-4b09-a368-42c5f0d1373b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3bfb118-f947-4b09-a368-42c5f0d1373b@quicinc.com>

On Wed, Mar 05, 2025 at 09:15:10PM -0800, Abhinav Kumar wrote:
> 
> 
> On 3/5/2025 7:16 PM, Jessica Zhang wrote:
> > Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> > dedicated CWB PINGPONGs
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> 
> Not exactly sure which fixes tag to use here, but
> since this should have ideally been addressed together while adding the WB
> mux programming to handle CWB, I am going with
> 
> Fixes: a31a610fd44b ("drm/msm/dpu: add CWB support to dpu_hw_wb")

I don't think it needs Fixes tag. The patch is good to go on its own.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > index ae1534c49ae0..3f88c3641d4a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
> >   	mux_cfg = DPU_REG_READ(c, CDM_MUX);
> >   	mux_cfg &= ~0xf;
> > -	if (pp)
> > +	if (pp >= PINGPONG_CWB_0)
> > +		mux_cfg |= 0xd;
> > +	else if (pp)
> >   		mux_cfg |= (pp - PINGPONG_0) & 0x7;
> >   	else
> >   		mux_cfg |= 0xf;
> > 
> > ---
> > base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> > change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry

