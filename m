Return-Path: <linux-arm-msm+bounces-36801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F099B9AD4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 23:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2C828242B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 22:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C600B1E47B3;
	Fri,  1 Nov 2024 22:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SpBP1jo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BD31BDC3
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 22:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730500012; cv=none; b=mrjvQUPNsGRd5m0A0lDAwgvOVfpir35T/cEcOXgrxNX70bVxWxHntqYLoHlztZ7H+Hcub3+Wuiv/NiMWTR6yVMVY4AEuNZp3lkH8bSTUeXK+Tuc675EVQzdoimSdiMOz+U8RzhczZUj/Muqvl8jp9d6XvElxAf/n+OiQCaby1Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730500012; c=relaxed/simple;
	bh=T8PyvAA4h8EW6lsYtCHMxijEtV/sBCs/yJPa21lQE0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfCEMQYv6yL5GQAtMdpzMBbPiM1Vc9pM1TdFuw0M6o9PIZEtZDl8RIa05X/H3rCyLLGSE+LAmwS4usV5TAl/kdU0o9tSe/FcwqNOmaWG8rPSDizWt57wAPowZpm9oHfooW97tlLGwBFiQDWa7QHKpb+aGTlhqdOR0l9B1uDZvfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SpBP1jo2; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so2091790276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730500009; x=1731104809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZudTzd0+bQI8YAgJ9zoL8NILhzadYVubfY3jlJ2hS3Y=;
        b=SpBP1jo2K1LehUkc4+mvSjSikpuR5RUq3yPwLz5UpiFibUuva6c8yqCsmzSOa0jVmN
         5DCJBgIT54b6Y+A2v2Xq1Rgo0vXje5qCFAm0W3Na0tvZo7qP9jBV4PD9E6Ofhaw5+FHt
         9bFXgrTU+GMv428kWnHCYwsF52oG5wtbtAwRIr9pNrFuPgv9pVUW6zaFfdLf11OD9XBa
         mO7c3Djbu7wpG8k+JBGAWQ1GPgOod7lFSvbx8ntEgWR4j5BzCUXvbe8nBd4tf23w1qY7
         F+gmm36FEaojiYCZp5P/IhLYrUShVHNn0selonUX3s1p3k03nVwLqsHjCffO/qqYusyk
         /U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730500009; x=1731104809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZudTzd0+bQI8YAgJ9zoL8NILhzadYVubfY3jlJ2hS3Y=;
        b=C3WuZ/ZILOavKWwhBJnVV3nfzCVEHqNiF7UPb8/qFjw0Uj4lf2tsc8kN4TNV9aXNPp
         +l548M2lB3csgYDfBhasv2WtYsHiHs9aLkfz+8PoFz4Cbv8GH58myRgfSegT+jm13SmD
         XlqGV4ngfydXkh+29BNAGHfl1AusuvaYSLBMjc/+IOb4BbDzmj3rrg4F+hHsTi1iPH3+
         NiF84/n/X+yCUPg3tyIBVz7f/x8lqMqSkAmRwPrg20OH6ohZkju1auN7BEA8x7af5VzB
         mkwQ4f51V9ALZ+mqoT5+s9g5/LNXvKCiM3wCL7z8tmrDCTT4MsX4Eu01qEx/R8DDr/Dy
         gLwA==
X-Forwarded-Encrypted: i=1; AJvYcCWrdbhYfMEaOXrf82djQSX5EQ+qWBOeE7lgZ8tzMQe+nd+s4HlLlRoO3cgdjnUuhv4bOZvKUtfkywG+HDa/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1OAyevA5yS5recHdRIUXfrJ0+aXbeTJoOjsqoYo99YtkX/ViQ
	yzI1qCx+AetndPkUcHSyHtIwVFJq0J6oWmmY1EJmL12njFvAaFHb2UUbtmBGvg6gJ4kXKL39aXw
	9c/8uc8EWaJvQrIIJ4m4F2qmB3FdZgfRNWieusw==
X-Google-Smtp-Source: AGHT+IGtriCDF4xwF2pEv4oKmK1IxTM5b7GjmdDA6xwQNU8GyukANzaIo/LVK5L70uLC6wImMimFPrxbBm/wgfMeDA8=
X-Received: by 2002:a05:6902:2182:b0:e2e:46e5:c2ca with SMTP id
 3f1490d57ef6-e3087a599c7mr22672334276.14.1730500009290; Fri, 01 Nov 2024
 15:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org> <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
In-Reply-To: <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 2 Nov 2024 00:26:38 +0200
Message-ID: <CAA8EJpps+spdowEbDoO2zNfyn+DnWwPgnZiFMw13ZE=iAnJEnA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Nov 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/18/2024 2:10 PM, Dmitry Baryshkov wrote:
> > The MSM HDMI driver supports interlaced modes. Set the corresponding
> > flag to allow interlaced modes on the corresponding connectors.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 4a5b5112227f..643c152e6380 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> >       bridge->funcs = &msm_hdmi_bridge_funcs;
> >       bridge->ddc = hdmi->i2c;
> >       bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > +     bridge->interlace_allowed = true;
> >       bridge->ops = DRM_BRIDGE_OP_HPD |
> >               DRM_BRIDGE_OP_DETECT |
> >               DRM_BRIDGE_OP_EDID;
> >
>
> I had quite a bit of discussion on this internally because this spans
> quite a few generations of chipsets.
>
> On very old hardware, even before msm8996, there was dedicated hardware
> de-interlacer. But even on msm8996 or other HDMI supported chipsets
> where the handling of if (mode->flags & DRM_MODE_FLAG_INTERLACE) is
> present, these were because its carry forward of older interface code.
>
> The way we handle interlaced formats today, is software needs to handle
> the part of dividing height / 2 and width * 2 and adjust the source crop
> if necessary. This part has moved to userspace for recent chips.
>
> Othwerise, we will need to add this part in the dpu driver to adjust
> this. I am not seeing this part there yet. So may I know how you
> validated this change? Something similar to :
>
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/LE.UM.1.3.r3.25/drivers/gpu/drm/msm/sde/sde_plane.c#L1340
>
> If we add this part first to dpu code, then we can mark interlace_allowed.

I think you are mixing the interlaced formats and interlaced output.
The code that you have pointed to is related to hardware deinterlacing
- in other words taking the interlaced framebuffer and outputting it
to the progressive display.

The interlace_allowed flag controls a different feature - filtering of
the internalced modes (aka 576i, 1080i, etc). In this case we are
using progressive frames, but the HDMI outputs a picture as two
separate fields. I have validated this by outputting image (modetest)
to the external HDMI display on IFC6410 and on DB820c boards.

-- 
With best wishes
Dmitry

