Return-Path: <linux-arm-msm+bounces-48721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28DA3DF19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87B73A9564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A34C1F63EA;
	Thu, 20 Feb 2025 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejpRHR0p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E51EEA27
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066333; cv=none; b=fXAvvysOWYc2m+gKufRoufbcK8yti98Ev7REYfXp8rjMo7CoYhhj0uxD2FzF8t+rj3aoUeIRV2TLtBNCWsUcfI4LYfGg1kpll1chYW0GBtsfjCoqYhx+HRm5MC4sh8/K2TyWq6OIwtTwSpdSLb0tAXs+ZQaHJKLmkuXgGrG6Cvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066333; c=relaxed/simple;
	bh=I5AKNyz1woS7lsaTJ5RrOa6I3nEatNmzHER7C9F0AFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESm2RlFF4Wq4PV4pDNXPDnXyzCKsqmVEwqcxlDOmzW6LzNsJ3+Z7R/gGq6s+ceIM3vxik1jCGV84n965g1y0kkf9msjK4wROY+F5JcojihBBWpv0YNfeYw6FdU32clT2ZaX+e+FbRSaqZs59tEFhpls0LDnlxu7Os276kuxb7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ejpRHR0p; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f6ca9a3425so9231827b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066331; x=1740671131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caj6pSHnNXWHcTKHiPPWfy3wKXfZWUVBt2Cq5t/KZXw=;
        b=ejpRHR0pXnPWoXKPeqFnjIclDgbVDmjx48KDaUr62YMc1J7JazJItorZJnaPDgF0eW
         9k/43LXfMcyf3+GQDPJ1W36oSiOctqGidcoiAq8dY6NM9MB0o0jegkij9s7loMiBWDtj
         EzeTk9FlKX4GP6QFh+BEIE0CNIA7TqIXkmAoRa4aiiPiKpON2qDZobyVEGMgHn5oMv5g
         NlNcYIr35sqk71siXfFG67zjJHRtwWb0tTMlTHWJHvaF8VymMzWDVJuvqVf3ILpa7hIb
         n7mrCPUP8FTWAWgPT+ONHV08bJWN74Xt+qPV1fAfIDTnLfQyogi/FtJzyuxIKVNleJZE
         14Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066331; x=1740671131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caj6pSHnNXWHcTKHiPPWfy3wKXfZWUVBt2Cq5t/KZXw=;
        b=g6bkWLUcv6jss83LeX3VZcK1++uN6DPJdVSBcYOd/fCdRgkieW2cjW/6qFDJpcNzVo
         kFftMQ4ndXnNMAD5wuGxNJT60Eor5QJeYAxPmKvVl6QLXixNmQejL6bdXxPHJGYHMWci
         i9okHX7JjIlMIOkfJMouk+VEG3JUxMbXPlDzAYM3EmLw8T8c56UTW1coBzBtiuyM2hI0
         FRGq9cwbbWlhPJA6ggjho6hUMsziXXWJmKHUXUAiZ3zlXDsbXT8xnDr89bG77CqRWy9b
         6tA3huWbCD+tydBMtUe3di1kkQ7RYF2pNPPF0vqjATu7/mHukGYi/XkHReu8JuXB1QdJ
         Hg/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXPCySEhUib9GgBMpJv13CgBDODlKNWEIQa/5EFSxe5gZLdhVnqGJc7ypjOI+S3j86WrWf0zU22zgc3AVg@vger.kernel.org
X-Gm-Message-State: AOJu0YxQm6P+l1wUfRFn5QcxbXQbXbMQ2eH19UFy2o1+RDNB+80L2num
	9+LmUG1ABw0iupnCtbrj0YDzVEOWYmwhitQMh5zz7oycXXo0kadffx8EV54WDGL0VW4C/TEl8Md
	uqtxuPQypNJ09xxT0M8bmyEOqrMyqI775wrVCZA==
X-Gm-Gg: ASbGncviV2MeJ0t8vQDA65+Osfw6She1RhamW9yW5gcs/eYGwHs3MWcIPQKFGfLJpUx
	hCkdIcYVKEwx6nGhATi8MF80CnYqiDkRoohg5tf9xcufeUy7TmKhMRMEknWLgcqoqp1VVWUj2pB
	WL
X-Google-Smtp-Source: AGHT+IFG8SQEvQPyPA1X148UgsKK5bEmhiv/YocBv364w+iyBZWcNKIHT7rnzjN/l/ohIkB1RhFxo8T7boVqG1XXrxE=
X-Received: by 2002:a05:690c:4482:b0:6fb:9822:bbd7 with SMTP id
 00721157ae682-6fb9822be7dmr102049387b3.15.1740066330764; Thu, 20 Feb 2025
 07:45:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org> <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
In-Reply-To: <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 23:45:18 +0800
X-Gm-Features: AWEUYZmYsYjKrn2CbJfu7EO98jbyUBGJnmOHIdlgcyPvmpQCuWq9GXUcgPDpBig
Message-ID: <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B 18:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Feb 20, 2025 at 06:07:52PM +0800, Jun Nie wrote:
> > This change originates from the Qualcomm Android Linux driver. It is
> > essential to support a dual-DSI configuration with two panels in
> > some circumstances per testing. As the name suggests, this modification
> > may enhance the bandwidth robustness of a bus.
>
> Please start by describing the problem and the result of the changes.
> Otherwise it reads as it "may enhance or may worsen" the robustness.

OK, will re-test it with older branch. I remember it cause LCD to go
to black without
this patch, but not fully confident with my memory. With latest code,
there is no
difference to have this patch or not.
>
> >
> > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8=
e3ff395486c0b4898 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *h=
ost,
> >       return ret;
> >  }
> >
> > +#define DSI_VBIF_CTRL                        (0x01CC - 4)
> > +#define DSI_VBIF_CTRL_PRIORITY               0x07
> > +
> >  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_=
base,
> >                                 u32 len)
> >  {
> >       struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
> > +     const struct msm_dsi_cfg_handler *cfg_hnd =3D msm_host->cfg_hnd;
> > +     u32 reg;
> >
> >       dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
> >       dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> > +     if (cfg_hnd->minor >=3D MSM_DSI_6G_VER_MINOR_V2_8_0) {
> > +             reg =3D dsi_read(msm_host, DSI_VBIF_CTRL);
> > +             reg |=3D (DSI_VBIF_CTRL_PRIORITY & 0x7);
> > +             dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> > +     }
> >       dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
> >
> >       /* Make sure trigger happens */
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

