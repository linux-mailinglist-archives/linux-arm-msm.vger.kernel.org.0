Return-Path: <linux-arm-msm+bounces-49784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B681A48FE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63CD3AD0E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8503015A864;
	Fri, 28 Feb 2025 04:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQxYpcq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05A85626
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715443; cv=none; b=KYWthiuor0Kr1p9sYEzju5jVbB62F2Xw8c18rDWOeBa8lLyqfZNG7fiQwEKXt6h8NY7OfnU0WIiRK2fnL5bqAei3Z9m+4Surj/+LXliYscUrnYeCXPSYfOu93ME0cmfi3K1oXmN24M6OMBZ0mioE+3yMTYg8rIlK4hMqsUH0rOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715443; c=relaxed/simple;
	bh=yjpHU47lcxuI7NezIsym2hhyx+WdaZiRRUZi87/74KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC91dfQr8jQbGzz7kzHZqeeqhKt5hg+O5A5+uTHnsNJrJime+CQx2Uk1alDZGhs2RD0HZfQgRxYmD1XHhDLNMSXZO4Yc6S/ZKPpQegMVgcTWbTgqCPXct/4MTRW17jFpquO9l/x7h2oSd3SDf6PCb58OzVcPsr9nhP+YsYdaF00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQxYpcq6; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30930b0b420so14332671fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740715439; x=1741320239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qd/SSjZSdsFXpP8Mw5Z4CDkuUKoi98PoVJbFfa8a+ac=;
        b=CQxYpcq6ft4BwgkFyYLcBYH4d7AkpbdbEHltFgzXFm1mij0oUF8XKRs2xjlm7JpQgo
         5Zr4mvu2Wa2iNfR3C5SrY8mfFNH2h1UoTlZGYTuRuotDMmKZAXoMhhRa5ljtYUlPhAM+
         n+yusGsbUEbLXd+31tE2EAQe8EEbGS8c8MDUt7jNLNE6ncnQlm7Akp0Gaba9p+cO1f4D
         USHQgso6zURMyEYpEwNPYq2sXsmXHL8X9dZmz27VzTSlCVLf6uxSLfzt1gjXhgKYSL2c
         yWoVdbAkAxdVbU4apO4ZyIXXGTUtwlwWYx7AkrhbbfsqzaxpBmgX11GX+hS0Cvm/wk+t
         Orjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715439; x=1741320239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qd/SSjZSdsFXpP8Mw5Z4CDkuUKoi98PoVJbFfa8a+ac=;
        b=a1n7CePl3hmZ1RR2BxCpm3RpvlLIDJJOGwYchxkQDV3LoZDPXh4mkrUvIaBk8Nw6Nb
         WoD9y3UDLX+1sr5pph4AhagYleeybHncUd69m1MBta0jPVWa/fU96eRWE8qn2o5qQBUH
         NcqwHK4tP9/xGuuQQkK1BLNnd085kzivgVclaOAM7a4FC9/GtWQzwfSVwjNtex8TYAnL
         fN31ogMZFFWaMkWbZp1UF2aS/vfEbz9hGZFaOylBMrBNBLCqyRoxQtt2fNz+pHOGWmiB
         4LNyjlgMtuVWqumHDXKRDgqrDkHgrfi2G/8nMIlZ9H6WlpxLZiSa2IK3Rq6u1d7aERGp
         EjHA==
X-Forwarded-Encrypted: i=1; AJvYcCXkwHCa2qQNlN7H9Zn0zZ0LD7tKosuu5WDB7N7d8WXdAMx7vMI7hwnzTavWmdKZkbV4/zoZyzTjXQbjoA58@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXldaOiue9c4D5tnqywtatvhwIzt8WLua58JHa1/4C+ycCNUp
	Y7UOt0zlLwRckdKWiQBdimy7m/wYqestiHP+L6dIN4w4apCJRFVO3jYMSL1HleABlsE6okNumM9
	so9g=
X-Gm-Gg: ASbGncssgjNGwzBKrVFJadcCd9u7lyejOJIzEqsB3i2BLMevQAsNpRIbnlxBDihrth4
	xSpXqW9PM/PVZcnr1meIaHBNWvFWyCClsAl8YjRktZu3i/MuRDO7wtuzP1CqmjqGNQ4byztprdz
	Vq8hr69KHVWOm9m8xglILi95BUw6dzP2t2r2qLesdxahpo64/pjZbDqX9GVM4F9RfvJlqkOpfaA
	7AWPpFZP/hBcwQJmjWwwVo0QLhLG8tVbEQMsW5XK24qTeNKRx0pnV+X7joOiO+36Bz0T90Et5cG
	HOgv5CLYX88i3hkI+iU65/OXcVKjhFU8RgupwVwam8ZBi0avgf+Wdm7vM2k4fLagDpA09G8EmSU
	jbUsCPA==
X-Google-Smtp-Source: AGHT+IHNQymHd5ykzqnXmyMsW1a5EMx9alc09Hn9+MB6NToh83PZlB6/RNRvKwbTSqirwQlRGlJx9g==
X-Received: by 2002:a2e:b70f:0:b0:308:eb58:6571 with SMTP id 38308e7fff4ca-30b9341382cmr4665921fa.26.1740715439491;
        Thu, 27 Feb 2025 20:03:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b962da0ccsm1003861fa.27.2025.02.27.20.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:03:58 -0800 (PST)
Date: Fri, 28 Feb 2025 06:03:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL
 blocks on DPU >= 5.0
Message-ID: <6utf3iirzf7vtotsjxswtiuodt75mtrmhlofvsju5qfdmx7sdk@6mflw7g67ljy>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-7-71ca67a564f8@linaro.org>
 <45evxcbkcenkoiufh6vqpq5ngfz3mz62evvjxehmqgp5sd4lo3@a5swxugzf4fm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45evxcbkcenkoiufh6vqpq5ngfz3mz62evvjxehmqgp5sd4lo3@a5swxugzf4fm>

On Fri, Feb 21, 2025 at 12:37:40AM +0100, Marijn Suijten wrote:
> On 2025-02-20 12:26:24, Dmitry Baryshkov wrote:
> > Since DPU 5.0 CTL blocks do not require DPU_CTL_SPLIT_DISPLAY, as single
> > CTL is used for both interfaces. As both RM and encoder now handle
> > active CTLs, drop that feature bit.
> 
> I was wondering if this bit only existed to ensure the right "pair" of CTLs
> exist: not on DPU 4.0, but on DPU 3.0 we see that CTL_0 and CTL_2 have this bit
> but not CTL_1.  Meaning that split display can only work when that specific pair
> of CTL_0 and CTL_2 is used in conjunction?

Unfortunately I don't have a deep knowledge of those platforms and I
don't have a way to test it. My SDM660 board (IFC6560) doesn't have DSI1
routed anywhere.

> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 

-- 
With best wishes
Dmitry

