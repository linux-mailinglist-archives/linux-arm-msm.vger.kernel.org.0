Return-Path: <linux-arm-msm+bounces-27603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BFA943EDA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E26BD1F2137D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 01:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A791DBB8E;
	Thu,  1 Aug 2024 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLkpTVMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3501DBB85
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722472500; cv=none; b=aDJr4BumS/j0/whnx0M6nB/XEH7aW63tRmwutnVb+PKcF+3Tb+4lkcRcTZYy+sekvEUmsk7/NMPzZZHMm8FlvkWaQDvfubCDbdDbTJxQVS8enpoS4G5Pg2ZwCZHkc8UlUL8W0R3OwLCWnU0KWjFE+VIa4tZqYosC8rjCO+6bFw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722472500; c=relaxed/simple;
	bh=WQ/Mc4zHQy5Ga10rKNhs90GEgXR81mwR3QuecHPifm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhhkxXM4LuGXArJTiVfsyMDiv+TdVFKnWTnK9LMRYog2bBazCIT11BEsBf9689PayEy32zYT6lZstSmvV6R94As6cpefI6B3FqgagwKva3qIqNGRxsp1tv9tCtRaHKASBfYKpuy5Ss1+q3MixJSiVmkZ/AfImmEEfssfeUpCT6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLkpTVMF; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-65fdfd7b3deso50065817b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 17:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722472497; x=1723077297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M/CELQaNvMQTBTPJnHhuNUlt/nKrqYgz+WkyNAnHqFw=;
        b=mLkpTVMFreEWqguLs8oeY689vJF5bwAri0t9OJqeJ/JcjZds0MI7qoqmz+qMuVSPli
         TowAS4EaZeIBdRtmjemem6Mf0nCcmntboPrUewWapifLkyh5cyfZHGv6i1ciUfT5FCLP
         PtNOSEvR1yxvIJHBLR1yn17lN5xS0DAY7v6hbmQBWSUIVyIV0VvAVrNiZ8ZmbPS9hfBS
         bzRUyPP3CMPHWDz2ypc2MW8MBHzGuNIsaNW4CIHBWxr91HaKBq/xvsMGRO8RmH047Ng3
         0UGkuCXo48ma4ETLzHjXJb5afaYQqf2vgKpmn2qdUkEIXtqS9om2lkIbgwTKLjk7NTM8
         aF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722472497; x=1723077297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/CELQaNvMQTBTPJnHhuNUlt/nKrqYgz+WkyNAnHqFw=;
        b=NN+m7tWyeJMyrmX9QbSR7MhzAVFsdX8pa3HMWGSz5rC1bYpgm/NgRTV1A1/sei9Pbc
         011PiqMjwWwsYyOJvxZD9Wu37jflDLtmPjwTPUgMkt+dpX3wJxutmOZLAsztb+gkA/HR
         UmAtY6XsoYrpsd28j1NM0kPCCo12TGXFCSYE86W+Zltpok0bizH5lIgdmMR5KVuD3YHH
         aiii69lBdLiDc0KzxGt3vjuJOEsxLbljPjCHlLIlPjH76SwqjPhVBdyKOTWQ06R/u9/s
         53xN92djXae0Fco2ql54KTLVvSEW6PoWmhVBm5PeEKhXwIbh/CR9SYhFhwY19599HSS3
         WWyA==
X-Forwarded-Encrypted: i=1; AJvYcCUwGXKnSrPva4dQtnVcDOC888EGuvgbFJ77i6yaHp22BAJDDKhu6vqEC8+XZ0t4vR6touTuQWJPgXyOq47/Sku1Ir0fblXhTBx/yuAnVQ==
X-Gm-Message-State: AOJu0YyR1g6Leg+pNzKhJWG3rI5J9Ks11vDQj8FO/EzxY+CMl8cH1kGA
	SBh4V3NK4yxXAVOFN4vsMx1aQ4SEmeliXJQVb6o6wgFbetajzWLVs6DJFfPafLSUdYqs8Sn1rD6
	O14X60SG7RNGiORrQ6GZqPbVmnxCjLpT5M1whZw==
X-Google-Smtp-Source: AGHT+IGaBGM1AayDPzuZZA1cyOtTi6oJv13xWErQOdKjC4oVXJkICQP5cLrmmu5xwR7QC6Y4C3u8Iwj/z6IN0YJq5QE=
X-Received: by 2002:a0d:f3c6:0:b0:650:a1cb:b122 with SMTP id
 00721157ae682-6874bc631bcmr9370347b3.27.1722472497251; Wed, 31 Jul 2024
 17:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org> <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
In-Reply-To: <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Aug 2024 03:34:46 +0300
Message-ID: <CAA8EJpp2pg1FyrE8ftxGduHUnX=nsu=Zg_mwCrkcdqJqMJZjDw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] drm/msm/dpu: relax YUV requirements
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jul 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:45 PM, Dmitry Baryshkov wrote:
> > YUV formats require only CSC to be enabled. Even decimated formats
> > should not require scaler. Relax the requirement and don't check for the
> > scaler block while checking if YUV format can be enabled.
> >
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 1c3a2657450c..148bd79bdcef 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -743,10 +743,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >       min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
> >
> >       if (MSM_FORMAT_IS_YUV(fmt) &&
> > -         (!pipe->sspp->cap->sblk->scaler_blk.len ||
> > -          !pipe->sspp->cap->sblk->csc_blk.len)) {
> > +         !pipe->sspp->cap->sblk->csc_blk.len) {
> >               DPU_DEBUG_PLANE(pdpu,
> > -                             "plane doesn't have scaler/csc for yuv\n");
> > +                             "plane doesn't have csc for yuv\n");
> >               return -EINVAL;
> >       }
> >
>
> Change seems fine, but one question, is there a chipset in the catalog
> with a Vig SSPP which has only csc but not scaler? Even qcm2290 has
> neither scaler nor csc
>
> So was this just a code-walkthrough fix or was there any issue hit due
> to this?

Just a code walkthrough.



-- 
With best wishes
Dmitry

