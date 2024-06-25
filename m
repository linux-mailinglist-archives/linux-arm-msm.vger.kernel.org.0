Return-Path: <linux-arm-msm+bounces-24171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD4917352
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEA42283043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 21:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88923148848;
	Tue, 25 Jun 2024 21:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrXxI7lr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72D3B7A8;
	Tue, 25 Jun 2024 21:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719350550; cv=none; b=HDK3/qmikZ1Gvx8GCe4A1DkEelxqW6Na7ooZY2hrCSqOtayC/zRSjo9Qd8VQrExtg5NTHPjVZElJ5taacGuYqAyeaPg6tAg3TCav+pCaj1bUtieNora0A5EGRA229PjJNE8xeFSyrogUx+p+Jh+FzzkNTUWyvf50YPScBqnOxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719350550; c=relaxed/simple;
	bh=GEoRhVjFStK6Qsb04Z2xZAxzZVnKtTiKCYijwuFpR/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CS8U89cKS1C18yESMh+pyWFVWly1y8AYHdWSsQ4FHLSH4f9pesO0pd3lvgk+oSVS6b6oz2HTI8uNqo+40rv5y7YNmoVn9u5T715GtYbABGksa1EcypSlelzLeMXPRAr51qEP1Ep7q1AmGRvRdxEk56SRdEqN8pX7zLVD7nhXBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrXxI7lr; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-79c0f8d6ec5so50966385a.0;
        Tue, 25 Jun 2024 14:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719350548; x=1719955348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw5CUHUm3Gpt6SSSe/xI/X8gPanBuozSYqQObhb6KGY=;
        b=FrXxI7lrhnBKK+oJsNM8NWj//+jQtX49ylUlOGTtmxhoBLujBPSNjBAWnZqitka3hZ
         UiGSGZxGWEiRIzX7RQP5Qav0cyvA9tYsVu6zwJ7dLc0IGaVl3EdTKGY3sg8rJjsslWPR
         K0O1+AkEVlK/wLdvzTtpfNE9LGF6VmVUNNSJjhAzUJRlqZadTHnsuh/PJbzHOGcOK477
         MMUyLuYW5XPhhoBKcIO7RDeXT33t8nkEdShQ7GweW+9/yPo6vy2XzHROk0+AmR8nAhPn
         TjrDDnHXNF07gkc3po3c3/Qx6kUjvZbYl/2lZ2otXCM1Ny9Su/A1p5/Cng0LzVqTx3YJ
         CayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719350548; x=1719955348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tw5CUHUm3Gpt6SSSe/xI/X8gPanBuozSYqQObhb6KGY=;
        b=eNgGKTpDI9ujN7vm1ZNfBD+mN4o+rwmjO9beknIwWoCujOo4/DIxdYAxq0bxBFj4Bl
         KY/rgM6oEcnPnc3ez/kM/Ah/cYgYIdPM9Tlysx4SyktSNS6b10dG4D6FcyxCtmATS1mh
         bC9fxJSrBmJyApSXtM3r5vHaQqVuEotA8bSLaufH10AMwLGu0/6H25vmTt0eCIpLcWk1
         bmwFh9GuNtqj72CIu9wfEcXCMpjjodoLvhQi63oxB+kW8uoHJqF9mFBs0S1fUNV36KZk
         xLRTuUMwygy0yNK+ctkbybvF9mbnmzDCLN0Pqnn7Dx4KtjzNHrcFGnvICWYAa9rBHi2F
         S4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE4e9sJJBPQHYIDa+4lrLFdzXlu1SDabyGXQ674Wss0t8rR3T0u8ClBw2SjVveiGWqkk7E8PQAIPjmPP8MIWagD3jI4c+tRap7RQHoxnl91pyoMGH0Y3+/DODrrg/7gzRhVSGEYD/U28GVVA==
X-Gm-Message-State: AOJu0YzSqpyuXpf2vfl1Xe663LoUDSlR+kLL+MOgZ7soW/6TGkHK5QyR
	Ery5Q2/Ygt0gKIF7LMFlKQ28izDxFB+LFy2RWDbFLrvm6OT/mnVhy/hRglPx2LX67d7uhUIIkYw
	UXocaboSeWUicEXTHB38cWzx4ZTk=
X-Google-Smtp-Source: AGHT+IFXbQes4gdlhi490sxQ7X7y/cppE8GmTYOi2RZ9YmtK0eJYSO7nHKlB0DeYq0ofNiX6Js/r4nkF0aYqaVEkXP0=
X-Received: by 2002:ac8:7e8f:0:b0:445:3f1:4715 with SMTP id
 d75a77b69052e-44503f14c47mr8059651cf.36.1719350547916; Tue, 25 Jun 2024
 14:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org> <CAA8EJpqnFEkWx4hq_UDgQ9n5qNj=WjN-Td0+ELGh8hrDpBFjGQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqnFEkWx4hq_UDgQ9n5qNj=WjN-Td0+ELGh8hrDpBFjGQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 14:22:15 -0700
Message-ID: <CAF6AEGt0cjmNyp9wqMMLE9FCKP3E=eibW9q_HGpqnCZzO=sKcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "drm/msm/a6xx: Poll for GBIF unhalt status
 in hw_init"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 1:18=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 25 Jun 2024 at 21:54, Konrad Dybcio <konrad.dybcio@linaro.org> wr=
ote:
> >
> > Commit c9707bcbd0f3 ("drm/msm/adreno: De-spaghettify the use of memory
>
> ID is not present in next

it ofc wouldn't be, because it was the previous patch in this series ;-)

I've fixed that up (and below) while applying the patch

BR,
-R

> > barriers") made some fixups relating to write arrival, ensuring that
> > the GPU's memory interface has *really really really* been told to come
> > out of reset. That in turn rendered the hacky commit being reverted no
> > longer necessary.
> >
> > Get rid of it.
> >
> > This reverts commit b77532803d11f2b03efab2ebfd8c0061cd7f8b30.
>
> b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
>
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 4083d0cad782..03e23eef5126 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -867,10 +867,6 @@ static int hw_init(struct msm_gpu *gpu)
> >                 gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
> >         }
> >
> > -       /* Some GPUs are stubborn and take their sweet time to unhalt G=
BIF! */
> > -       if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
> > -               spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
> > -
> >         gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
> >
> >         if (adreno_is_a619_holi(adreno_gpu))
> >
> > --
> > 2.45.2
> >
>
>
> --
> With best wishes
> Dmitry

