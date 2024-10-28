Return-Path: <linux-arm-msm+bounces-36162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8A9B3008
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 13:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5BA428250F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253E11D86DC;
	Mon, 28 Oct 2024 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4mi8Kgb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9BF1D61AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118135; cv=none; b=RdPqVy/XJhtt7YgC71gQdBtZ4Hs4vIiQ4EHUjXq2xHkoO7pX+1zFmsX2uXvGOtU0ZY+XZqtCcf9K7oZ+3/tLmRW+qLqAKZA8zBNqUUjm2ZH+ZI9mBEt8G7VFj7bacq36Dbkm6y3iotImlg253RFd5iz8xaskW3TyNcsBEW6rGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118135; c=relaxed/simple;
	bh=mO2Zl63zBGPiPrmps5znjVtYV7sw225Lnb/7NwBIoYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7jL4j5BWz+cI5bcYaZzVaqfKDy2W7ip7pfW9vjMQtincRXUTaycRfJgAJdL3xY8GzmD8rfPjDe3fsiMcrKQvI7AbfPBctM0inirae012hN9uA5PkQh+SUJNN3qYwjqJHgCIvB6GFBL2BTco952+daAdRQvUYBIDUG/PudYwHc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4mi8Kgb; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f6e1f756so4446898e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730118131; x=1730722931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLYYwenIWq8hGGfx5PBZfrB8Ff3+iHzFbKnT2o/gqxI=;
        b=g4mi8Kgb0l9C6X+pTeyD4YTY+U1GAe6FbD/QzSCiibWvZQLvUvv+EviIlDmDNofwIf
         /z2UPknk2n6OtgkuGIHsN4HhezrRYftUFr2CF7EGDQTy1OZe6+XQONRdw8bEWXqENltV
         7bvCrRELx1U2eYvV5M2/9/gEXCUG26ZMcX6boEYN0dMf0qP1Gf9EghklVyTV7F2kIiyX
         lssr6gxP9pL6tWo+A0SIHSx3DeSmk7/kssQUHTmpafDyktE2AGjPYlaEDfypn+ow7re4
         Xg2l+GmBLK3xc4AzdnVrEdbBS8Hxxe8JqZxj2leJsYf0Q/9tlIUaXED72352Hzy4UjJg
         0abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730118131; x=1730722931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLYYwenIWq8hGGfx5PBZfrB8Ff3+iHzFbKnT2o/gqxI=;
        b=RILnKq9t5BDdxZV2orT4ht7nt4x61Su5OWPkHB/3Kd+7re497iHsgpj/UsuNGJZwHY
         /DlyqTLjxc4OK44okWiUj+5GZpuWwWm+eo9yyy7oJ+7Ut9fprPP5j7v9ll94UWnxXEzv
         kuAsXUkdW3IfE7ROHLkQT7SaiqrFqu6/55j3Ve3l+NUI1WBBwO/rO2QG3Leqe7Efxmwg
         kU6FFFO5FBBFol0F8hxsEGHkgmVLa9YQSBtDvcjYX7cTObx5iCTFCdCCbw3Zs+uldzMq
         DX7OBsj+JwRHy1RzYn+ev8xGkddBz7ptN63OgiBEB/MYbzW5UyNIkvlPqBwKvNRsRGS9
         OiZA==
X-Forwarded-Encrypted: i=1; AJvYcCWTNaJjxZtYFs1AGVKRPC6bL4kgoA+51gHxk/x2pK9+RpQly/3NRZph2Dqnuiu07BXRB7KNrR2mhlt1V0eC@vger.kernel.org
X-Gm-Message-State: AOJu0YxRIjpZ5g2V3qfb8b5Rxb6RC960M6NFYGpJE09OLR+hTyi+RnpT
	+y/P69KZgiYaP2tpzUC4TFpQ2KQoem4Np1DlTI9+w+Ga928ak4KppEPtJJ16q6U=
X-Google-Smtp-Source: AGHT+IGeddx56M5Aox0jHqSipfTF3UVxUtQ4hd+mUkvJVvTErR6Nr5e5nz0d6gtqJRW46RK4ORMKMw==
X-Received: by 2002:a05:6512:b82:b0:539:fd75:2b88 with SMTP id 2adb3069b0e04-53b34c46711mr2900121e87.60.1730118130837;
        Mon, 28 Oct 2024 05:22:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1de0b2sm1068056e87.246.2024.10.28.05.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:22:10 -0700 (PDT)
Date: Mon, 28 Oct 2024 14:22:08 +0200
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
Message-ID: <k2eh4ysckrvh3hubkfh7u3x7mow4cnoo3tvxfygriyxha6zx3n@i4hdghgjvasx>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
 <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
 <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
 <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
 <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
 <27bea27a-9aa3-42f5-9b0a-df5744276966@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27bea27a-9aa3-42f5-9b0a-df5744276966@oss.qualcomm.com>

On Mon, Oct 28, 2024 at 12:31:50PM +0100, Konrad Dybcio wrote:
> On 28.10.2024 11:52 AM, Dmitry Baryshkov wrote:
> > On Mon, Oct 28, 2024 at 11:36:15AM +0100, Konrad Dybcio wrote:
> >> On 28.10.2024 11:27 AM, Dmitry Baryshkov wrote:
> >>> On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>>
> >>>> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> >>>>> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> >>>>>> Clang-19 and above sometimes end up with multiple copies of the large
> >>>>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >>>>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >>>>>> fill the structure, but these create another copy of the structure on
> >>>>>> the stack which gets copied to the first.
> >>>>>>
> >>>>>> If the functions get inlined, that busts the warning limit:
> >>>>>>
> >>>>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> >>>>>>
> >>>>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >>>>>> the stack. Also, use this opportunity to skip re-initializing this table
> >>>>>> to optimize gpu wake up latency.
> >>>>>>
> >>>>>> Cc: Arnd Bergmann <arnd@kernel.org>
> >>>>>>
> >>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
> >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
> >>>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>>>>>      struct completion pd_gate;
> >>>>>>
> >>>>>>      struct qmp *qmp;
> >>>>>> +    struct a6xx_hfi_msg_bw_table *bw_table;
> >>>>>>  };
> >>>>>>
> >>>>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>>>> index cdb3f6e74d3e..55e51c81be1f 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>>>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >>>>>>
> >>>>>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>>>>>  {
> >>>>>> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
> >>>>>> +    struct a6xx_hfi_msg_bw_table *msg;
> >>>>>>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>>>>>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>>>>>
> >>>>>> +    if (gmu->bw_table)
> >>>>>> +            goto send;
> >>>>>> +
> >>>>>> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> >>>>>
> >>>>> Is it necessary after being sent? Isn't it better to just kzalloc() it
> >>>>> and then kfree() it at the end of the function?
> >>>>
> >>>> Keeping it around will help to cut down unnecessary work during
> >>>> subsequent gpu wake ups.
> >>>
> >>> Then, I'd say, it is better to make it a part of the a6xx_gpu struct.
> >>
> >> I think a6xx_gmu makes more logical sense here.
> >>
> >> FWIW, the driver allocates both _gmu and _gpu for all GPUs regardless
> > 
> > Hmm, are we expected to handle / perform BW requests in case of GMU-less
> > devices?
> 
> opp-table does that for us
> 
> In case of no gmu ("gmu wrapper"), Linux is the only entity that controls
> things

Ack

-- 
With best wishes
Dmitry

