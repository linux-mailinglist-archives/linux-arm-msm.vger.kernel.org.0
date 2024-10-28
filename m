Return-Path: <linux-arm-msm+bounces-36145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39309B2D50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 483A31F20F71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8921D2F73;
	Mon, 28 Oct 2024 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MdZJAPhT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653D186E27
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112632; cv=none; b=bod9Z2cD9zUALZWLLZdKd7ChRwwfIy6yLur9B8CllKlGPnd6OVrkX3GwkhKvDo+gbBW6rLHJvh5w+b7/VJG9TdwzAbPGd1piAAxE2Q9XypPWWs7vlbJYE06Hw0mkEOhqw8iONYjByQe5kAkw/P5ZryVzzOri3tzay2HT1lKbXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112632; c=relaxed/simple;
	bh=bU1Qtn48i5nUAA3O2eESXBE5C0blf2pcU1u+JOIFCEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4S+dbrWtSxj/M9TAG+6rDiFjkapLb7thtmIV2Vxxep7sxtZravT/Y1VROQwzXVneec/M6ZLudGsOFwmubwZ9CbU0v1NW4lvVqztsOGoj/IH0SbeT2zCo74CT7BmIpkier4vbvFDPa8s8jmeWaaMjbnTT3BX1NO5cVV94BAHxDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MdZJAPhT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f6e1f756so4339986e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730112628; x=1730717428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xT9gfcNhArTE1c2C7RUJiJlGQ17PepUqnBsoFt7gaK0=;
        b=MdZJAPhTIIODnSSzQwrL7Udzvl5F86lKqzhzF2ubIaBd0y3NW+aCb1p8c1syaBGCRc
         6ynJSRuhLIipgp+3kC00dgHe4KU+Jt4Qq4hlQAuD94g0Zq0KVL8McQfw/+Mwd1gQzU52
         r9cR2xmG7oN8Ne8VLnH/cYJeeJLh9zTBotUaMRB5zKhAspUWiLa2E/8nzCvWl6LHj5yb
         S8kjkDFAk0nkIALmXVuXldrKoKHfJJf1zCPpV/w8SqdkjYvM7JpZg9TFS0n/FYPgDQ2A
         a8F4U+IxHxch6cQggXAHECmT4DQtJpbJRwsgt8dc3T5x80x8J8rGhiHU3uCgeNmsiInr
         PtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112628; x=1730717428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT9gfcNhArTE1c2C7RUJiJlGQ17PepUqnBsoFt7gaK0=;
        b=maT+ideW3E++fCHW+Jpk9+4YS/uzF2F1v1RanaxPLDG2mJjfwH/JpvZnm93eKJeiS5
         h4SNZqI0yISUpTCP4sbVTpHt6uUZQo/kPoVNJvgOhcJ7/ivS3P6kbk3iAd34y/mXw/YP
         2fJWm7MUCmMBRpuBz7fxHMIIQKOgJ4CE5G8JEmUfBlbzKPqrP3X5q5hEjR1VLhRl2Y5n
         1hHGYMH3ZS1uoMsoMfdnSvNj9NDjgtuky9rxt7ym3lskxCdrKtxSTnWEhoAXyJzyHUgq
         lQT3fl/npWwTKCgqV8X9CjEq7VPon5gC9waaiypU8Joyk7lKNITPNLrqfSTGf4uC9VDB
         oKYw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6sMdNK+XnwkRCQPwcvqpw24M7AvWlUGmO6JQIyWmyKZvprbzXuSHpwVNiizDBeGyHnOnyRp+xiE5Q5du@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9X26SCYSL4VwY80/nHwGBrqVVIsTqbRs2aPo4udAjKpU9WXjP
	M4Iya0hSRfgkypM81WGRTMWnHEkDIQ3hvgMRn/bMX+ayJ2yk3Jk5PQD4FV4Fbmc=
X-Google-Smtp-Source: AGHT+IH8FSgEZPGmIDpEZ2RxUjOJo65ME5pGZDusIyUmphRyeZHRXp0OHKNRYZxJAZ8p5+Tv9Q1f6Q==
X-Received: by 2002:a05:6512:33d3:b0:539:e7b9:df03 with SMTP id 2adb3069b0e04-53b348c3954mr3544985e87.1.1730112627826;
        Mon, 28 Oct 2024 03:50:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1244d7sm1052368e87.68.2024.10.28.03.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:50:27 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:50:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <pipbl5fxssydcw3ehqsq3oea56nc37un7ok3oersvrqrlssyo6@5ksxbtcixfbo>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
 <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
 <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>

On Mon, Oct 28, 2024 at 11:39:16AM +0100, Konrad Dybcio wrote:
> On 28.10.2024 10:52 AM, Akhil P Oommen wrote:
> > On 10/28/2024 12:13 AM, Arnd Bergmann wrote:
> >> On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
> >>> Clang-19 and above sometimes end up with multiple copies of the large
> >>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >>> fill the structure, but these create another copy of the structure on
> >>> the stack which gets copied to the first.
> >>>
> >>> If the functions get inlined, that busts the warning limit:
> >>>
> >>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
> >>> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
> >>> [-Werror,-Wframe-larger-than]
> >>>
> >>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >>> the stack. Also, use this opportunity to skip re-initializing this table
> >>> to optimize gpu wake up latency.
> >>>
> >>> Cc: Arnd Bergmann <arnd@kernel.org>
> >>
> >> Please change this to "Reported-by:"
> > 
> > Sure.
> > 
> >>
> >> The patch looks correct to me, just one idea for improvement.
> >>
> >>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>>  	struct completion pd_gate;
> >>>
> >>>  	struct qmp *qmp;
> >>> +	struct a6xx_hfi_msg_bw_table *bw_table;
> >>>  };
> >>
> >> I think the bw_table is better just embedded
> >> in here rather than referenced as a pointer:
> >>
> > There are some low tier chipsets with relatively lower RAM size that
> > doesn't require this table. So, dynamically allocating this here helps
> > to save 640 bytes (minus the overhead of tracking).
> 
> I'd second this, said chipsets often ship with 1-2 GiB of RAM (which
> is still a lot in comparison, but you know.. every little bit counts)

Okay from my side. Yeah, poor Gnome runnning on top of 1 GiB device is
very sad.

-- 
With best wishes
Dmitry

