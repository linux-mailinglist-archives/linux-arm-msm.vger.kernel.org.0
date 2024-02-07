Return-Path: <linux-arm-msm+bounces-10121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E484D277
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 20:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D759286B85
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 19:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FA58286B;
	Wed,  7 Feb 2024 19:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3q2Uhdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5EB84A21
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707335786; cv=none; b=os1d9ZP+xEq7Bnmh2VBHlIAYdVw9f6aGwg0PB7wEmWKy0/PpZ2wjlwcvItP19mKk2YdUP7eqKOBakstRTgxgulI4vGn4NYxnBPRZOBpCQrQx0HJiPQ3s5uZf/Qfyc9/VlAgNSXlUgKaq25HIUvUu/BwalL2eVLj1n6KkxjUGyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707335786; c=relaxed/simple;
	bh=YbmVkRRcMw4doniNG38am+dfQmQ6+Z7wMmB/mG2fIE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zyy7U97HbeTgCkqm2M1UJ2yNmNdQV+n6WFvrHj3E+B2xyc0cCGTSsjx0HScA3kUHOISQvHkb4ELl8cy5/hIR21xahPnFKAOyb9pANAVQcs/buX5ZmWR9A7MnSFlPf7UqYgV76v+2qR2zTHxivANEqNxqgzjRv3PQPpokdTCZ3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3q2Uhdw; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60487b4ba0eso10721177b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707335783; x=1707940583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz7RFzUAYR3EUnuo70ELuUi/F3kU5JcqkqBZAyZnJ9g=;
        b=A3q2Uhdw7Q+w1+8FNAb1ZBhGbn+XfmGsrQ5+06vRni7S+TlADmOx2qq5Xg8MsEvWoo
         IfAhu4jAlgfYH1NEavh4OrbJzNbaX0oKsNnTasTLzNKIDBaGH26HROR6BH8b4NTjK+IE
         tnZ2dfHjogB8TUFP2Kv8e3GZ3OWuXRCXRfsuzcPIA0NlqiU3VnqY4lkld/ChRvljjhZ1
         gG5D1Z80gKdkWit758adcPCqpRbAFqcTXItfv3uAc48RI+A+I+h/AN3NfMp5CpxElkfH
         6+mFXr7yiWFquar+oTYnbtob8o1D/nKlEP7YIqEPGZ4LkVwyHPJSje0WPnIC2kBqnllv
         v9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707335783; x=1707940583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wz7RFzUAYR3EUnuo70ELuUi/F3kU5JcqkqBZAyZnJ9g=;
        b=h8XbzygrD8rT2vH+LPYy3+BNq310/h4pFlvKZY6rOf++Xi1UpAvS2SRmQAr2n4WvJI
         b6aqobSqRZ9Cjatp4aQWTGFXrS0GBErUIKX5kY2+zFWdtxhrN2ZbtLiAVL3BibwOJAcN
         9z5EGwt6Ts2V9uOutek+wO1ZJMw8kLD6/W1zT70dDW/LCM+0sjxvoBGzfFOMbpXo3G96
         7YAOwXlWAnmcVi78UJzN7RM963+cL6kYyIkCPTbpiXQ2hGRLQ8QsD4nevRG7pZpFTAQY
         FO9gkGLCUgNHcwjFFTXzqZhanvR4e0RlgE9JXOHvmuGmWXkKgztA5MnYjMlnGD1+iobE
         OClw==
X-Gm-Message-State: AOJu0YzLy7jCsPghttbyckCPURvMN1W7IzGdMPTZlQf49Xb5D/Rpst1h
	LCk3xZ6rfoF8aIlnKJ0hJe9NWnvSiEMDMJrXipRVgWdfT92gJUTrd2gyVnLVEcOFwhZWwztBBy1
	1tBWu47OCNVIsGN+ax+3Pw0RbvbpodcoB83g91w==
X-Google-Smtp-Source: AGHT+IEFJWETrkFXWbqnsGQ3Y+U0oT2Xdh2NeLWM/a4/aUl/8Lm6tQMK2gYOMBziyv5u+IGBAzvhEeg5M+/sFCO0tQU=
X-Received: by 2002:a81:e20d:0:b0:603:cf56:2b01 with SMTP id
 p13-20020a81e20d000000b00603cf562b01mr5309401ywl.29.1707335783601; Wed, 07
 Feb 2024 11:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-2-3d2750378063@linaro.org> <b10d6097-b13d-4b47-7127-9200e414b7be@quicinc.com>
In-Reply-To: <b10d6097-b13d-4b47-7127-9200e414b7be@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 21:56:12 +0200
Message-ID: <CAA8EJppV_PYMyJBEogONrDVmZ91XmMkr=J0tsioO20GaAW8GoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 20:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> > Existing MDP5 devices have slightly different bindings. The main
> > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > register regions are a part of the parent, MDSS device. Add support for
> > handling this binding differences.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> >   3 files changed, 93 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 723cc1d82143..aa9e0ad33ebb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1197,6 +1197,78 @@ static int dpu_kms_init(struct drm_device *ddev)
> >       return 0;
> >   }
> >
> > +static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
> > +{
> > +     struct platform_device *pdev = dpu_kms->pdev;
> > +     struct platform_device *mdss_dev;
> > +     int ret;
> > +
> > +     if (dpu_kms->pdev->dev.bus != &platform_bus_type)
> > +             return -EINVAL;
> > +
>
> !dev_is_platform() perhaps?

looks good

>
> But I would like to understand this check a bit more. Can you pls
> explain for which case this check was added?

It is necessary to be sure that we can perform to_platform_device() on
the next line.

>
> > +     mdss_dev = to_platform_device(dpu_kms->pdev->dev.parent);
> > +
> > +     dpu_kms->mmio = msm_ioremap(pdev, "mdp_phys");
> > +     if (IS_ERR(dpu_kms->mmio)) {
> > +             ret = PTR_ERR(dpu_kms->mmio);
> > +             DPU_ERROR("mdp register memory map failed: %d\n", ret);
> > +             dpu_kms->mmio = NULL;
> > +             return ret;
> > +     }
> > +     DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
> > +
> > +     dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
> > +                                               dpu_kms->pdev,
> > +                                               "vbif_phys");
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
> > +             ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
> > +             DPU_ERROR("vbif register memory map failed: %d\n", ret);
> > +             dpu_kms->vbif[VBIF_RT] = NULL;
> > +             return ret;
> > +     }
> > +
> > +     dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
> > +                                                dpu_kms->pdev,
> > +                                                "vbif_nrt_phys");
>
> Do you think a "quiet" version would be better?

Yep, why not.

>
>
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
> > +             dpu_kms->vbif[VBIF_NRT] = NULL;
> > +             DPU_DEBUG("VBIF NRT is not defined");
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
> > +{
> > +     struct platform_device *pdev = dpu_kms->pdev;
> > +     int ret;
> > +
> > +     dpu_kms->mmio = msm_ioremap(pdev, "mdp");
> > +     if (IS_ERR(dpu_kms->mmio)) {
> > +             ret = PTR_ERR(dpu_kms->mmio);
> > +             DPU_ERROR("mdp register memory map failed: %d\n", ret);
> > +             dpu_kms->mmio = NULL;
> > +             return ret;
> > +     }
> > +     DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
> > +
> > +     dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
> > +             ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
> > +             DPU_ERROR("vbif register memory map failed: %d\n", ret);
> > +             dpu_kms->vbif[VBIF_RT] = NULL;
> > +             return ret;
> > +     }
> > +
> > +     dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
> > +             dpu_kms->vbif[VBIF_NRT] = NULL;
> > +             DPU_DEBUG("VBIF NRT is not defined");
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static int dpu_dev_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> > @@ -1230,28 +1302,12 @@ static int dpu_dev_probe(struct platform_device *pdev)
> >
> >       dpu_kms->base.irq = irq;
> >
> > -     dpu_kms->mmio = msm_ioremap(pdev, "mdp");
> > -     if (IS_ERR(dpu_kms->mmio)) {
> > -             ret = PTR_ERR(dpu_kms->mmio);
> > -             DPU_ERROR("mdp register memory map failed: %d\n", ret);
> > -             dpu_kms->mmio = NULL;
> > -             return ret;
> > -     }
> > -     DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
> > -
> > -     dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
> > -     if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
> > -             ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
> > -             DPU_ERROR("vbif register memory map failed: %d\n", ret);
> > -             dpu_kms->vbif[VBIF_RT] = NULL;
> > +     if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,mdp5"))
> > +             ret = dpu_kms_mmap_mdp5(dpu_kms);
> > +     else
> > +             ret = dpu_kms_mmap_dpu(dpu_kms);
> > +     if (ret)
> >               return ret;
> > -     }
> > -
> > -     dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
> > -     if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
> > -             dpu_kms->vbif[VBIF_NRT] = NULL;
> > -             DPU_DEBUG("VBIF NRT is not defined");
> > -     }
> >
> >       ret = dpu_kms_parse_data_bus_icc_path(dpu_kms);
> >       if (ret)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 16a7cbc0b7dd..01e783130054 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -476,6 +476,9 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
> >   void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
> >               phys_addr_t *size);
> >   void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
> > +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> > +                            struct platform_device *dev,
> > +                            const char *name);
> >
> >   struct icc_path *msm_icc_get(struct device *dev, const char *name);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > index 59d2788c4510..afedd61c3e28 100644
> > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> > @@ -50,6 +50,19 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> >       return clk;
> >   }
> >
> > +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> > +                            struct platform_device *pdev,
> > +                            const char *name)
> > +{
> > +     struct resource *res;
> > +
> > +     res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> > +     if (!res)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     return devm_ioremap_resource(&pdev->dev, res);
> > +}
> > +
> >   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> >                                 bool quiet, phys_addr_t *psize)
> >   {
> >



-- 
With best wishes
Dmitry

