Return-Path: <linux-arm-msm+bounces-16313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DAA8972EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 16:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 932991C211E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 14:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9FB2F28;
	Wed,  3 Apr 2024 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5x37iJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E5E58AA1
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712155460; cv=none; b=uw8qA/umNPWLO2qJzqpyG1jiuloDFF7n5h7jYoPN3F4k74DMHPzrzAKYG6IB1v0v+tt1yuy8S4f9T5qTQox8eE0IIeSkpyBAieaw62X+nTPS2DlPj3v/gMVnYDoi98aIrHcZ9fWrIpT3jQys5N/SimW2gmmNZv93yhv/iJpumlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712155460; c=relaxed/simple;
	bh=lsRpr/8jWj3lfSaJBM3ocC2GdBVv947x6Oo/jhR7VbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig3zObNbA6MJkVoEDHnZLx60A2He84CnIiIKGNdy8XY2WXV4+bmUts3k0FvT3Z6R6kGANylW2DwqgzN8QHZ9vWMN0V5aFXL6yet+4iZ9kmjVQVcyOsLVe1ZPNaoovQ5ZuCE1M8MLjpoK8hJeDHoJUQwMUtyZuruuruy2REOsn2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5x37iJ1; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d715638540so72808931fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712155457; x=1712760257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSvZ57t2p82ZJ1lio7M1iLNtxzJMWQfJlM+tiUoDpMs=;
        b=B5x37iJ1QquONlWtQ53VrAHxkHegSkepxHAT1zGfGPWwM6XJ5WlNhxaxargL0FtYhE
         ZiVX66PAbP0pGkCIlRB3I2Wlau2JakbjoJeVZb/P78tNjaqrZk34v+q5kxbgALl0E/Dt
         GjgsGDdxRmbn6zZTfUkkioqzqLUejGjz/ctxYcRaPsg3FpC3SIxniuU+f1CrONkzQVH7
         J4qFjXyOu/WXPo0GCD7+3o+inYmx19HmfD2+rCDQ8er2WiMHnnV5jtAae4KnwobO0/FT
         Fe0uKDScIimvebcWLYZRunRM2bbxMErdntHKHcdY02JdeKPhOFKT4oJ0+V/yCkDMFNAb
         ln5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712155457; x=1712760257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSvZ57t2p82ZJ1lio7M1iLNtxzJMWQfJlM+tiUoDpMs=;
        b=GEQgO/mtDvAbRb/VmIPE0AhJMvaw8l4lj7/j1u+60XJFF1YPoLaYogG9c0B5ISdJGg
         W260i6OCbqO02lcR5Ih1r/OUzAsP+3r7S2RjjQ7qp5KlKG0gI2M5B9ZoH+GLnIOrNqaN
         nLppBXl/olMSxCODPUQCILC88td84WWjHS/hvPy9ep+9i59ThwKqF4wE+iA8Xaki23UR
         EfTQZA/A3kKnJph5RqHZVp2WqN88UXUq8d2XLuqV6ox2QvzgTr1JciFTeDybC1T59BZI
         ND7+k8AHs4PMI32E/xLVf1EYgyyUDg8nd4mk1bR/868+tDrFodnGHqpllwQBP4Bpmd7M
         z57A==
X-Forwarded-Encrypted: i=1; AJvYcCXbB8Qy+J4XUY2YUAsuPhqjlfYoowaP/kgYH7nFGIaWKZRy3JneviZ9vFJra7FxCP8KiR95MKEcKMW7ZmfO9EdrWI3wMhL4gZds92h/WA==
X-Gm-Message-State: AOJu0Ywih3JWD/8XuLdBnYNvsJgjrSQbjo69sz625ojRvWRyqpxOyBvs
	kMEyz+5D+DFMZwuvILYnz476/xml5cP9YjGNOU1cLBZq5QgzRdejT0cj7YiOYM6kDLYYuZQTO9U
	A5zLQYt29ft23rSzCLn3dD6mqv3hZo0LFrqOS7Q==
X-Google-Smtp-Source: AGHT+IF1xEeqYKajQd4WFoCF5CO9BwkZ/fZwROFlZBQ88tomzbj9vB/5AKqgIiLAJMNB7Y2JTjHkkgDcp+Ci9CqG+is=
X-Received: by 2002:a2e:8793:0:b0:2d8:3d62:da6c with SMTP id
 n19-20020a2e8793000000b002d83d62da6cmr1498179lji.52.1712155457181; Wed, 03
 Apr 2024 07:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org> <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 3 Apr 2024 22:44:06 +0800
Message-ID: <CABymUCNNhFTQZ6NSOL8SmLzCSOktvR_Sj0s2TSmqa0_56CSvDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add necessary DPU timing and control changes for DSC to work with DSI
> > video mode.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/dri=
vers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index d9e7dbf0499c..c7b009a60b63 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
> >                 timing->h_front_porch =3D timing->h_front_porch >> 1;
> >                 timing->hsync_pulse_width =3D timing->hsync_pulse_width=
 >> 1;
> >         }
> > +
> > +       /*
> > +        * for DSI, if compression is enabled, then divide the horizona=
l active
> > +        * timing parameters by compression ratio.
> > +        */
> > +       if (phys_enc->hw_intf->cap->type !=3D INTF_DP && timing->compre=
ssion_en) {
> > +               timing->width =3D timing->width / 3; /* XXX: don't assu=
me 3:1 compression ratio */
> > +               timing->xres =3D timing->width;
> > +       }
> >  }
> >
> >  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params=
 *timing)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 965692ef7892..079efb48db05 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct=
 dpu_hw_intf *ctx,
> >                 intf_cfg2 |=3D INTF_CFG2_DATABUS_WIDEN;
> >
> >         data_width =3D p->width;
> > +       if (p->wide_bus_en && !dp_intf)
> > +               data_width =3D p->width >> 1;
>
> How is wide_bus relevant to the DSC case?
> Is there a need for the Fixes tag?

48bit bus width should be used when DSC is enabled. Without the
widebus configuration,
a lot dsi error happens as below in DSC case.
[  206.275992] dsi_err_worker: status=3D4

For the Fixes tag, the previous patch mentioned to enable the widebus
mode for any DSC case. So it is fair to add the tag.
>
> > +
> > +       if (p->compression_en)
> > +               intf_cfg2 |=3D INTF_CFG2_DCE_DATA_COMPRESS;
> > +
> > +       if (p->compression_en && dp_intf)
> > +               DPU_ERROR("missing adjustments for DSC+DP\n");
> >
> >         hsync_data_start_x =3D hsync_start_x;
> >         hsync_data_end_x =3D  hsync_start_x + data_width - 1;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry

