Return-Path: <linux-arm-msm+bounces-14845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C6A886DA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE59284934
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8C06026A;
	Fri, 22 Mar 2024 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVbYWOiQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9675482C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114697; cv=none; b=Q5z0Sq7pdAfdWqMLPwycRZBBjUq8oTVPzDCEeyELWhbFftMDGkY/LxTyLMUKoWm680u0AARmAQhSHx9V+nuRjEFosbJyrEu/Q+O1vAlPbT/N3xyD2ZCGhLSTGJ68GmfeVodQ9/MDSNE1YblIPbbVBR/eFOfpcVKYLAIxaobkiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114697; c=relaxed/simple;
	bh=KowDJLlEkfi/aydE2rcjItRSORmHokir7LGxDFTw0+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUTxcwOVdNsOiPu+JalAzqXgEHrevpliTH6kP7UPk3Glno8DNwkk8lnghcbEmGAFn8/mNAhmbtZDVVM2CkKQh14aNUyAyBwjG6GJong8hqrFoxDau4coBfWTQ1+aFdFK/OKiOMvcVigpbn+7kpRs8+w5g04D0O6CnFGug9OO8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVbYWOiQ; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so1828724276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711114695; x=1711719495; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rm06Pm0qxCAJG4WaEyynyhO+EGvdCO+QoEXFmaLzGV8=;
        b=hVbYWOiQPeQqePavX4DO/9xF+6KwCYjAGJ0jyIw9D68o4ZfDI9im/igWzt+RHkIP6C
         U4ZyUCBD1irVW7+MOtkehG620qnTEBHMjZD5jCZcf6nrhBcMk50YwVMZelh89MTTyemG
         vMrEhTwKj1I+LpCiEv9/rLqnjWpPzQ0iRxBIXps2cTwrzjZBY/nbR4ON5Fn4m+T4Mafz
         bPQs/5fWCcIOtDupyuNzCVPxAMdWT7hURgH31ZrBGMU6tUJoqXPVLeACttFaWj8iLgUT
         FketKyNd7b3avsJPk0l2TJPmsOpegVFHhMDit2ocmclSchM0Hm9ZyVXAUiyqW9r/HMnz
         2Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711114695; x=1711719495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rm06Pm0qxCAJG4WaEyynyhO+EGvdCO+QoEXFmaLzGV8=;
        b=AdXpamTNv46HzRXVwGNYyylpRwC6kHc2QXSOaj6A8YbfeYLUTbX4WnFsQs6078b0Hk
         z2Ck15lOmGY0L3TjIPT4Vq06y+azYhhiy4hnEGLjO3C6NtSj2xoKqz6KAaRSclm9PtzM
         BGpnokl4CWd69fuPlNuFCJGhXSGhXLHKJ8x9QYdc6hEReUlMQu/bOXZBN44DuC1/00y6
         4s4oKxSMBo2CrhT12MseGhQKJwUzRAtRKrBgsnnctPmh2Fbl3qQHmzvglmw/0f8XbwdM
         E0KmhLf4rrdSoAYVmCOhSQrqb6MWX87J74S3BLCPUg8D1nQbVPjsRtyRtrMuvyjjUkdG
         G2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV71R+iqY1y3NjimrQIVvi/bHsD9Gh6wrtiD29WnEb/8hhk3IP3ImczIslXUlX+6pKO3ro3rf1rwWhkGMT9tMiJA7xUtED0Z2p6lxTqaQ==
X-Gm-Message-State: AOJu0YxWXaJi+fG/RjHdTRTYei5DOzR1MC47+zogajJA0jf6IWRsULmL
	Pg93+7zGgpRdvz/YU8jIbd1mrkm09a/H/5wn9PrCglHeexKCD/2mHEizArcsTtBC2dycCpXTko4
	IsrQ+z2aBF4oB5JWHWpV5h12peOdm4oGvkqDTLg==
X-Google-Smtp-Source: AGHT+IEkmHjU0hm7QDKg5iiD/rL1+CfoGmxy3DO50mPYMlb1WNPLGwILi3SX+SAGciMY2+MIq+t9wX021nQx5hltJ4Q=
X-Received: by 2002:a5b:911:0:b0:dcf:3ef2:6182 with SMTP id
 a17-20020a5b0911000000b00dcf3ef26182mr2103274ybq.0.1711114694919; Fri, 22 Mar
 2024 06:38:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
 <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com> <Zf2JYmm3DEaR8vB5@linaro.org>
In-Reply-To: <Zf2JYmm3DEaR8vB5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:38:03 +0200
Message-ID: <CAA8EJppT2VAXMxAbMztbi=-QZj8nP++_Zy4RQHkY-DrO5W_3EQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 15:36, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-03-22 15:30:54, Dmitry Baryshkov wrote:
> > On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > Instead of relying on different compatibles for eDP and DP, lookup
> > > the panel node in devicetree to figure out the connector type and
> > > then pass on that information to the PHY. External DP is not described
> >
> > Nit: External DP doesn't have a panel described in DT...
> >
>
> Will fix.
>
> > > in DT, therefore, assume it's eDP if panel node is present.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
> > >  1 file changed, 39 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index c4cb82af5c2f..c9763f77c832 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > >         if (IS_ERR(phy))
> > >                 return PTR_ERR(phy);
> > >
> > > +       rc = phy_set_mode_ext(phy, PHY_MODE_DP,
> > > +                             dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> > > +       if (rc) {
> > > +               DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
> > > +               dp->catalog = NULL;
> > > +               goto error;
> > > +       }
> > > +
> > >         dp->catalog = dp_catalog_get(dev);
> > >         if (IS_ERR(dp->catalog)) {
> > >                 rc = PTR_ERR(dp->catalog);
> > > @@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > >                 goto error;
> > >         }
> > >
> > > -       dp->aux = dp_aux_get(dev, dp->catalog,
> > > -                            phy,
> > > -                            dp->dp_display.is_edp);
> > > +       dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);
> >
> > Unrelated
> >
>
> Yep, will drop the change.
>
> > >         if (IS_ERR(dp->aux)) {
> > >                 rc = PTR_ERR(dp->aux);
> > >                 DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
> > > @@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> > >         return dp_display_probe_tail(aux->dev);
> > >  }
> > >
> > > +static int dp_display_get_connector_type(struct platform_device *pdev,
> > > +                                        const struct msm_dp_desc *desc)
> > > +{
> > > +       struct device *dev = &pdev->dev;
> > > +       struct device_node *aux_bus;
> > > +       struct device_node *panel;
> > > +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> > > +
> > > +       /* legacy platforms specify connector type in match data */
> > > +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> > > +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> >
> > misaligned
> >
>
> Sure, will fix.
>
> > > +               return desc->connector_type;
> >
> > Can we drop this part completely?
> >
>
> You mean the whole if clause? How should we handle the legacy approach
> then?

Legacy platforms still have the aux-bus/panel. so they should be
handled by the check below.

>
> > > +
> > > +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> > > +       if (!aux_bus)
> > > +               goto out;
> > > +
> > > +       panel = of_get_child_by_name(aux_bus, "panel");
> > > +       if (!panel)
> > > +               goto out;
> > > +
> > > +       ret = DRM_MODE_CONNECTOR_eDP;
> > > +
> > > +out:
> > > +       of_node_put(panel);
> > > +       of_node_put(aux_bus);
> > > +       return ret;
> > > +}
> > > +
> > >  static int dp_display_probe(struct platform_device *pdev)
> > >  {
> > >         int rc = 0;
> > > @@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > >         dp->dp_display.pdev = pdev;
> > >         dp->name = "drm_dp";
> > >         dp->id = desc->id;
> > > -       dp->dp_display.connector_type = desc->connector_type;
> > > +       dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
> > >         dp->wide_bus_supported = desc->wide_bus_supported;
> > >         dp->dp_display.is_edp =
> > >                 (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

