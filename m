Return-Path: <linux-arm-msm+bounces-44268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E741DA05054
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F43D161F82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E1E15DBC1;
	Wed,  8 Jan 2025 02:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xW8qDUEe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E115CD74
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 02:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302164; cv=none; b=gzz8ZXo0iiystQyuVwtLqdme843s9PA7IGayQ0wCvgP7ZiEHZn/fBt4ixm0FbrPH+YiKgFDixQHVhdLVmSZWJ+HlFA8qZ0rUMByOcaLdYtmUmYutyuF1i1FJUSJkeaICHNANOY9SjH0ndcOJX/zCG00WgVYIG4/uYOY5K5W9qrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302164; c=relaxed/simple;
	bh=qmBh6A2//qSaLUtRsbtmQMJNi/BTORLfdrTH0XtdBlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGl3UtIqmXOqianO1IfVAxEMyXaOsojpWX41NdVqiU6xUbaOxw3BENPWAUzNAeQ7JC34hATaXEIy+ZiaBFwVnjkaTldmU5NhQqYEz6uDRXIIqERCXltO+UKKm6OYJKNmMmazfFlada74dMY/FCL23LrdEaTxacVqKkxvb7tFbTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xW8qDUEe; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3035046d4bfso147000331fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 18:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736302161; x=1736906961; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MTP6siuOIN5C6BhUQhyl7nhBGaiqQegbzgaOO496xE8=;
        b=xW8qDUEeKYI/ExzZaoa9NKGLnw3fwJyV5bXO7mtl6F4+7/zRHhAv1eBCHY7Zrk21A7
         /w0B6ssbhfB1OFpxIc2YVg4D0GDNfg8zGS15ElqAbQk9hiy4R+UbBgNtI/qWG3RiOfAh
         L6v/HZuYvYVeBIbLM/RlyHyx3BoZsnb1sm0YBKZ4+vl3y02d6jehuXw9PzbKLB5mFW13
         630d3Eb1jRyB19LWv8OHK+kaXI4EUkOUo40T4Te3w8aERTzQCvgvmkhmlGEpdbZjg/00
         Ba4BuaysyT7rIGjgpoTcazCoIgsVeHIVEMCRWRVM6SivUfZrWwkDTG+Wb1ysGunFqolz
         qzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736302161; x=1736906961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTP6siuOIN5C6BhUQhyl7nhBGaiqQegbzgaOO496xE8=;
        b=GSv1doFTiE8bmPqeMYeECU3EyzOzS6fE0u8VOjrxUwgH3vYR8H37cbXf8bJgK6hDNx
         /T8hcjlJJ9aFXh46EQpuVSJyeAYTxyMIReXIxrXE/8bPapG5P0LMfXZlCOQy58Daxx6S
         tij8EJjSJKTLCSj+nvcgvHy0FOB4wwIyzI8okS+qU7+pY6vD2ESEjy9MTqwfZcRMWGqZ
         W6TahTc3oLzpIGaLX664LsM8xoOyG/Piq5uxF16nx8g1ca72O9XqyKXhDU1mtuvl101D
         1TwryVih1ifLIwxX/oeQ/QeKBuEkNxcqzpcMYXrh59uJxD6AXsnRg1fxyoVdjguwUBHV
         3J0A==
X-Forwarded-Encrypted: i=1; AJvYcCUQVvZQ3kYxfCfBoxNwt8W7uM56CYSecBWphzNWkdeeLL/t+ycg5f+muFFceP+Yh/+hrgDP1JyE0+I3vL7u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8IDItWJM8tczRvc1y6/c83nmP4ihtU2PX9oqHTPwQwuDJkPw
	YVUhy4ocU/ORC9ysopMAaIf2/9dQzi39qImdb41xv/TYX7LvuBKHKU+MM5g/iV0=
X-Gm-Gg: ASbGncsI49z8oNVsGEVaESpylPJUk0SaY5dwRUhn9qHIMWOYOa4a2lQ+bm0bY07isBM
	woCB51198f2KFkfa1SJldnuNgqDK/uT1ji6W8ipO98IWrSG870dX+8lWb4cREcA8/hh9pYMJlf/
	AKm6qreu/cjK4nnRq4rEdocHPj2pEMONDTdlceIrNNRe5yfORVyPweidgu1XDMFD27qLk+eJRF9
	whN5KFmLlfdvHx5dSOimpC4VAj0chuGCzSnU94fwSfuGaeZtjwVfkc+vWE5DuEo/YJwbUsc1D4y
	STpLSmfr9IoWYU6bQiQP7ZXpX8UGQRGlqdVO
X-Google-Smtp-Source: AGHT+IHldfpbKaYUcoqF5K4urJDwBSTDAr2GvI+99OIfZDo1Lx3FXl89iGsmD4l64asvGVI06Hywfg==
X-Received: by 2002:a05:6512:eaa:b0:542:2871:535c with SMTP id 2adb3069b0e04-542845bf82fmr196448e87.22.1736302160893;
        Tue, 07 Jan 2025 18:09:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422360067esm5452932e87.99.2025.01.07.18.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:09:19 -0800 (PST)
Date: Wed, 8 Jan 2025 04:09:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <gyskd3jye43w4flhngmnelf7zaajrcqxual4ylsy5ql4xwlacd@ndzdqx77gqsj>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
 <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
 <dbe94c6b-e981-4f40-9261-2e44b5fb73cc@quicinc.com>
 <842c9230-d95a-43b8-83ed-0bfb286ee334@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <842c9230-d95a-43b8-83ed-0bfb286ee334@quicinc.com>

On Tue, Jan 07, 2025 at 05:34:20PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/18/2024 1:33 PM, Jessica Zhang wrote:
> > 
> > 
> > On 12/18/2024 3:20 AM, Dmitry Baryshkov wrote:
> > > On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
> > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > 
> > > > There is no recovery mechanism in place yet to recover from mmu
> > > > faults for DPU. We can only prevent the faults by making sure there
> > > > is no misconfiguration.
> > > > 
> > > > Rate-limit the snapshot capture for mmu faults to once per
> > > > msm_atomic_commit_tail() as that should be sufficient to capture
> > > > the snapshot for debugging otherwise there will be a lot of DPU
> > > > snapshots getting captured for the same fault which is redundant
> > > > and also might affect capturing even one snapshot accurately.
> > > > 
> > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/msm/msm_atomic.c | 2 ++
> > > >   drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
> > > >   drivers/gpu/drm/msm/msm_kms.h    | 3 +++
> > > >   3 files changed, 9 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/msm_atomic.c
> > > > b/drivers/gpu/drm/msm/msm_atomic.c
> > > > index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a
> > > > 100644
> > > > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > > > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > > > @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct
> > > > drm_atomic_state *state)
> > > >       if (kms->funcs->prepare_commit)
> > > >           kms->funcs->prepare_commit(kms, state);
> > > > +    kms->fault_snapshot_capture = 0;
> > > > +
> > > 
> > > - Please move it before the prepare_commit().
> > > - You are accessing the same variable from different threads / cores.
> > >    There should be some kind of a sync barrier.
> > 
> > Hi Dmitry,
> > 
> > Ack, will add a lock for the snapshot capture counter.
> > 
> > Thanks,
> > 
> > Jessica Zhang
> > 
> 
> We cannot have a mutex lock because msm_kms_fault_handler cannot hold a
> mutex. So we need an atomic variable in this case.

Or a spinlock.

> 
> > > 
> > > >       /*
> > > >        * Push atomic updates down to hardware:
> > > >        */
> > > > diff --git a/drivers/gpu/drm/msm/msm_kms.c
> > > > b/drivers/gpu/drm/msm/msm_kms.c
> > > > index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8
> > > > 100644
> > > > --- a/drivers/gpu/drm/msm/msm_kms.c
> > > > +++ b/drivers/gpu/drm/msm/msm_kms.c
> > > > @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg,
> > > > unsigned long iova, int flags, void
> > > >   {
> > > >       struct msm_kms *kms = arg;
> > > > -    msm_disp_snapshot_state(kms->dev);
> > > > +    if (!kms->fault_snapshot_capture) {
> > > > +        msm_disp_snapshot_state(kms->dev);
> > > > +        kms->fault_snapshot_capture++;
> > > > +    }
> > > >       return -ENOSYS;
> > > >   }
> > > > diff --git a/drivers/gpu/drm/msm/msm_kms.h
> > > > b/drivers/gpu/drm/msm/msm_kms.h
> > > > index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878
> > > > 100644
> > > > --- a/drivers/gpu/drm/msm/msm_kms.h
> > > > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > > > @@ -128,6 +128,9 @@ struct msm_kms {
> > > >       int irq;
> > > >       bool irq_requested;
> > > > +    /* rate limit the snapshot capture to once per attach */
> > > > +    int fault_snapshot_capture;
> > > > +
> > > >       /* mapper-id used to request GEM buffer mapped for scanout: */
> > > >       struct msm_gem_address_space *aspace;
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 

-- 
With best wishes
Dmitry

