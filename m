Return-Path: <linux-arm-msm+bounces-16580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0789A3F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40CA2866D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4C6171E60;
	Fri,  5 Apr 2024 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCAlWqEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881A6171E54
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 18:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712340951; cv=none; b=K9ua0RvuHQ9OT1+d4pyTOlMVN24q3I03sbkjHItUiGzGiLzLZFO57c3YoCYBrH/7qBRv64Wd8W0aznYYXHArqkYB3K/nXBdiLFXyN5kiTB2fKXBKXPZc5jXg8/V1BBzsFUYEIIg6VSQLbjdZrHrjWZ9gwBpZtX8mlH5lqWC+ECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712340951; c=relaxed/simple;
	bh=S5b+AdiQvOIMzuTd9jzPScl58yKfNpTUdQmYxUuUACw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXUEk+2I8lgy0iT9PzKLF1UNNd1FbC6syRHHRxhznmtNS3CkEGZMV1b4BMD3LVKgHDcs3udZDoszp1wusmlYEspu2m4UvXnqbTKRzBlkpfwQaa5W/9MhIeByBNHJntF0z+rYOkv8Dz+oVXQKLI07i3LUNwDf1WDQ5UPBmAgST0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCAlWqEw; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso2581156276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 11:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712340948; x=1712945748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jhJUaxFqXdP8RjNRyyUr2YeJgug8HchIqd4jcE8AeV4=;
        b=tCAlWqEwmgTB8LT2lj57IY6r58qxEBcvZuoTGBucdSyYdObmEdYZIU9d6ZM9WyTmvz
         Q1y3nvy0wFmkPSKAN560/6HCnzfQkY5+4XpU00Diqd7Fdpaquvr2Q4esGeLeVqVjVtD/
         Mh18urf+aMMQP+D9aD6BM0A+38nCIa6FWsF/GjBJO4BsGz94eP6PNdnePi77rtD22VPx
         X/p2L8RcyTuwKPHyr3ahM2oEsvLE2QqglIbbhC5qej/AGLDcloFZEGKdvhpH2gMV9eb+
         VtAOKTVmzcrQWnDW8oD6VAa8uF0dqUaw6eS3N5Cb/YerIwBHK+papT9lf7YPgsQ1ygWF
         ts4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712340948; x=1712945748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhJUaxFqXdP8RjNRyyUr2YeJgug8HchIqd4jcE8AeV4=;
        b=iNDyJNgWPvpwogNKqFZmbxZ2BBcUhhrXvPKkjJolY/2HjSE5EwREdq6a+1I+1G20wv
         tH/B3XIAlgpJH3P2gDS3c/npp969tL4C5N1k62Oy7TLKo816y9FOnMEfP96LZ0TQ8TLj
         AmRO1oE9akplWygIqLCFO0UBrqlAMPhDEBRi5fA/ut1D6aFRxLqNboDTLHc+ngL5XFxU
         TfhTBw8kuPIDluHPGKtcww90S0Oo1piQj6ZcjgQJWKzeHpygDPcDGy2FMQkK66NLS2l0
         8hnZW6D29yk2jfytMUlWRfS25ou2uLSYnJoxAHBsPY6LRgzyLn8eu/EZMXZeeLnqjSS1
         ptDw==
X-Forwarded-Encrypted: i=1; AJvYcCWOvhAv4jwe8a0o9Zibz4YJBCM5JgL3QAfr9jDD0u0w0wxuO4Vn643lZR/ZCXUW3icZ9jZ+ul2l9NEbGvkrzkTYGs132iFjlCsPX45kqg==
X-Gm-Message-State: AOJu0YwYGg8+jz7Pdaso8hg38gtZ7IdSIPlk6MeE4g4dI0wqr639YJrQ
	fZmtRzXVT1YyHBt65ZD8n/rRDXeLjFfrOz19kjHXFSzl4SMXOMBYB2R/94Gt9LtlsouQMsGg9hS
	m7qlsqzpyndN48ojFNzg0wJ2FiZNvl/9NcZ0iwg==
X-Google-Smtp-Source: AGHT+IG8NStLBJ/v3TNzYtzpORNsJBegPKWoMw/JsWIwCn17FZbnI1E8BDTcn0eeeyQ5TnsPEj0tSy6OlV0Jtf0188I=
X-Received: by 2002:a5b:b8b:0:b0:dcb:aa26:50fe with SMTP id
 l11-20020a5b0b8b000000b00dcbaa2650femr2010398ybq.15.1712340948409; Fri, 05
 Apr 2024 11:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-2-962ebdba82ed@linaro.org> <7cecab40-2711-4735-1eb2-45f3942982b1@quicinc.com>
In-Reply-To: <7cecab40-2711-4735-1eb2-45f3942982b1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:15:37 +0300
Message-ID: <CAA8EJpodmW8+JDxLx8+1sYURsXGZfmV1q6wzyxF1cxAx2Jo5dg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: move next bridge acquisition to dsi_bind
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 20:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> > Currently the MSM DSI driver looks for the next bridge during
> > msm_dsi_modeset_init(). If the bridge is not registered at that point,
> > this might result in -EPROBE_DEFER, which can be problematic that late
> > during the device probe process. Move next bridge acquisition to the
> > dsi_bind state so that probe deferral is returned as early as possible.
> >
>
> But msm_dsi_modeset)init() is also called during msm_drm_bind() only.
>
> What issue are you suggesting will be fixed by moving this from
> msm_drm_bind() to dsi_bind()?

The goal is to return as early as possible as not not cause
probe-deferral loops. See commit fbc35b45f9f6 ("Add documentation on
meaning of -EPROBE_DEFER"). It discusses returning from probe() but
the same logic applies to bind().

> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.c         | 16 ++++++++++++++++
> >   drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c |  8 +-------
> >   3 files changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> > index 37c4c07005fe..38f10f7a10d3 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> > @@ -120,6 +120,22 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
> >       struct msm_drm_private *priv = dev_get_drvdata(master);
> >       struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
> >
> > +     /*
> > +      * Next bridge doesn't exist for the secondary DSI host in a bonded
> > +      * pair.
> > +      */
> > +     if (!msm_dsi_is_bonded_dsi(msm_dsi) ||
> > +         msm_dsi_is_master_dsi(msm_dsi)) {
> > +             struct drm_bridge *ext_bridge;
> > +
> > +             ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> > +                                                 msm_dsi->pdev->dev.of_node, 1, 0);
> > +             if (IS_ERR(ext_bridge))
> > +                     return PTR_ERR(ext_bridge);
> > +
> > +             msm_dsi->next_bridge = ext_bridge;
> > +     }
> > +
> >       priv->dsi[msm_dsi->id] = msm_dsi;
> >
> >       return 0;
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> > index 2ad9a842c678..0adef65be1de 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> > @@ -38,6 +38,8 @@ struct msm_dsi {
> >       struct mipi_dsi_host *host;
> >       struct msm_dsi_phy *phy;
> >
> > +     struct drm_bridge *next_bridge;
> > +
> >       struct device *phy_dev;
> >       bool phy_enabled;
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index a7c7f85b73e4..b7c52b14c790 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -464,18 +464,12 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
> >       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> >       struct drm_device *dev = msm_dsi->dev;
> >       struct drm_encoder *encoder;
> > -     struct drm_bridge *ext_bridge;
> >       struct drm_connector *connector;
> >       int ret;
> >
> > -     ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> > -                                         msm_dsi->pdev->dev.of_node, 1, 0);
> > -     if (IS_ERR(ext_bridge))
> > -             return PTR_ERR(ext_bridge);
> > -
> >       encoder = int_bridge->encoder;
> >
> > -     ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
> > +     ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
> >                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >       if (ret)
> >               return ret;
> >



-- 
With best wishes
Dmitry

