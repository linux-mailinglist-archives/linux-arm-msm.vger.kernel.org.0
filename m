Return-Path: <linux-arm-msm+bounces-36147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F769B2DB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746191F222EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7A31DF727;
	Mon, 28 Oct 2024 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y0qOw4mV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FE1DF26C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112728; cv=none; b=Cq1UJloQcrny2k4aImJKBuuMrcL/HVwkOtf8gzihlUdcal+7U08Hi+bsAFpJRTG2rLYnwYD7TNoijd2NNCMCHNuEZBkOPyCwlFxAm+qHz0lnLwfVzf2/8cuG3L6FarP0Y3fCqI/tfnhvBsIkCSn4GPJOP+gfjBIatZK0CVgAjjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112728; c=relaxed/simple;
	bh=CS4BmsjI1HWkQUrlqadLWnMo+QLiDGjMl5le7XlpIeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQCqYZXKsVFtUwd7VTihB+1E1iP6pjdtx/CJ09ATv82h+jaI1jfdDcFk6HoJcnLG1LWiVPO8ZfEHCBHJSqOysVhUqPQtmBodVrdfv8+NogT7fF4QlegJ13ln/JkJIHiNL/YwVYSQ1WI7jivIhOjagYQrSYe5z9hw+RU/kOurBcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y0qOw4mV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539fb49c64aso6761823e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730112724; x=1730717524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75RMsbUWQqHekparXFuWHBkmwh5mRCxsXcIEwNzMOBY=;
        b=Y0qOw4mVPtEmhT348OXQky1bC0CfLNXqVPGXKsSgwK+63r4HblMnHuftCW8rVgZ2kD
         CbGWS9J0iIvGybhU9o38ReRpxEAgLs3SxYGZvPUBeb7ka9jb0Mj+SQayDWIO0k+MxkTk
         YnwpDmtPESVSBP57f9yCDffWxAXbhW25he9kPPMniyEGxLq3Zkfl8SyWADvcKnAZxi0Z
         AYPqet727QtGdUk8dT2mFaYcXIpvCPI/xOHzKBNCqfFJNijl2X5BtfxelGcD4Hjwdh3N
         cPmX9UUnxi4/a6aJ4FDGNc2VOeuQ9UibLYc+DaiKpNtI10ldMFE//rZLBGjTthS/dLyX
         QhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112724; x=1730717524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75RMsbUWQqHekparXFuWHBkmwh5mRCxsXcIEwNzMOBY=;
        b=NNXh5o14V9T2OBxRdOuy5cjJvYQkJoBetcFEPkWb+EXcA1f+4Nq7dqPT9G50Aw4yl1
         S/7BmRwEwA5Br7IFNYFwhm2OuJru7RkROy5CZXp4PYfAkAh+eBSo6SFXxisEKLmZYTzj
         1Smd20Oml6VjdPkJTajF6a7nGmZe896OLLrdXIbIvg+Gq4AGJ+yninwbsfFePQZeEDMJ
         DaCewAiE4eCUepwc1HTHUrR3HDqRZZXmaq90F2LEuYKNbKGlwHPU5MTnan5710A2PV2E
         MSzWGPXv3Mk+kB4roGus2mZgZuIzegMDtWg+e8jbND9l76XVZT/z1sn2dKbIEKrIb11i
         tXaw==
X-Forwarded-Encrypted: i=1; AJvYcCUAJQQNj88B4y9cAa9UibsOjKTu0+gvKqJICwZOn3g8YGMkU/9HGkluNmJWeJNX2Ov3wMcg3JFEYwup0hNx@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKxDpLivS2Y377ZxV0CokBVO0+pjfaNd74r02dyQwhvQO5bIp
	X0sib77Fg3xq4RRWELOlrjqUzmzB8Acf56dB3ZN5NYEgR4fWGWT4EBjk7EGZwXY=
X-Google-Smtp-Source: AGHT+IF5XS7brW24GwzPn8C79xMYDDlFcF/p3I5r6p+BJD+JCe/k5iD0/fpLRAMX38xJREuHzHCMcA==
X-Received: by 2002:a05:6512:4009:b0:539:94f5:bf with SMTP id 2adb3069b0e04-53b34c3f9b6mr5770526e87.59.1730112723695;
        Mon, 28 Oct 2024 03:52:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e126dd1sm1049798e87.77.2024.10.28.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:52:03 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:52:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
 <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
 <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
 <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>

On Mon, Oct 28, 2024 at 11:36:15AM +0100, Konrad Dybcio wrote:
> On 28.10.2024 11:27 AM, Dmitry Baryshkov wrote:
> > On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>
> >> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> >>>> Clang-19 and above sometimes end up with multiple copies of the large
> >>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >>>> fill the structure, but these create another copy of the structure on
> >>>> the stack which gets copied to the first.
> >>>>
> >>>> If the functions get inlined, that busts the warning limit:
> >>>>
> >>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> >>>>
> >>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >>>> the stack. Also, use this opportunity to skip re-initializing this table
> >>>> to optimize gpu wake up latency.
> >>>>
> >>>> Cc: Arnd Bergmann <arnd@kernel.org>
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
> >>>>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>>>      struct completion pd_gate;
> >>>>
> >>>>      struct qmp *qmp;
> >>>> +    struct a6xx_hfi_msg_bw_table *bw_table;
> >>>>  };
> >>>>
> >>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>> index cdb3f6e74d3e..55e51c81be1f 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >>>>
> >>>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>>>  {
> >>>> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
> >>>> +    struct a6xx_hfi_msg_bw_table *msg;
> >>>>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>>>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>>>
> >>>> +    if (gmu->bw_table)
> >>>> +            goto send;
> >>>> +
> >>>> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> >>>
> >>> Is it necessary after being sent? Isn't it better to just kzalloc() it
> >>> and then kfree() it at the end of the function?
> >>
> >> Keeping it around will help to cut down unnecessary work during
> >> subsequent gpu wake ups.
> > 
> > Then, I'd say, it is better to make it a part of the a6xx_gpu struct.
> 
> I think a6xx_gmu makes more logical sense here.
> 
> FWIW, the driver allocates both _gmu and _gpu for all GPUs regardless

Hmm, are we expected to handle / perform BW requests in case of GMU-less
devices?

-- 
With best wishes
Dmitry

