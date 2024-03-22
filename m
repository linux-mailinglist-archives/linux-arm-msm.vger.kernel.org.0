Return-Path: <linux-arm-msm+bounces-14848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8221F886E47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 15:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4391F23352
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA5547796;
	Fri, 22 Mar 2024 14:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Le97hOeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C646521
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711116930; cv=none; b=iS7PnspC/CYyFHA2ug8bb1WUXV12ZGXWYyltSNqxP/Eghmhh93cnfgDMf/KqmePpIUnV7ptXzkPhMBhVsxdPX3+BJ0IFSK8cTA4IDpRU6z5iPfEk8PjfowstoqYShXUc2sbnCYqo1gPa97GbjQMFRNvdV5R5HarwZY3tr2wABEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711116930; c=relaxed/simple;
	bh=yq2FCZ7BDtnwq9/GdpQNTw4vo/wcUEKbHk02cMYXJSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/It4sJ8Rl9mUegxh28ocAw6/GmJnLvuQJJ324bS43/18dotGvPc5rsrAO5nBAxeZf9vuqRZptZ8EMwbz9mM+rmoDug1nkJgqP9iHAymQ1eZhi3D0KJ8QLqviv7A5uCDSfSq6KCfew26KBmQYWS4hChk1MFxUSoopGI0BPCQkpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Le97hOeu; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51381021af1so3469176e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711116926; x=1711721726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9R3moE1H3kTWDrKb5bQHdR7IixtcbXzUsAraj0W58Qo=;
        b=Le97hOeu5GfIbh9Hql6RbS8FbDz6TIm6J5shrDEtawQMsdVNLaM5UrXXPqQHu6QVPW
         oyzMi9dGSIppHmaPks07DnKEX6+Kr7B/QXjajQ95xSDFeS0awK7DO5oE6/7CLsDsmk6d
         pjyaL0ODvtbfHjbVTQseMlZ9IDbSUivOPdX6/+hmwjJzn48saxCGHAFLQ4VwGBwH1cuy
         BwXijKZXbvSbOy+skuZF6wizIstAjKcJQFtfB7KziZK8IAHl7xd8nP7AkZscwiuaXSar
         l8rNYtcCMVk/G+qLG3vFFUCLoaT0SPhnxU1MP8DGsVnKZRBRAwo+u7QLc1X4A12T1ddd
         lMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711116926; x=1711721726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9R3moE1H3kTWDrKb5bQHdR7IixtcbXzUsAraj0W58Qo=;
        b=B0NsThJPeedRiyjwMs1CR3ahAaW9LfdAEkokt+prKo7YDRUR3sntRIiBCazw766PUx
         0CAXp/Q9jzzz31lGZvfxkdHGdN2ga4r2eCEbpjpIchNpyauDqEmGHn0Sf3TMw3GwUaaD
         tStg3ZG0YNAGSLPQrPus45451kC7bTwD3HnnP3jcXtvtlGnuDj3kuog+Vy3FvSRqU7j+
         j+o/Ql0hOufPjG9hLg6InTcCgNLqhD0sq6RUvGvgEPvO4eskaelOvM9ZdRl+bt2AYU9o
         s2yTz9yaobVsq7ECcRcuZMRp9GAoZX0FqRu5zfaB4oMglSO35o1YemCplXWHUZcH7Krz
         6eNw==
X-Forwarded-Encrypted: i=1; AJvYcCUD1TQIMT7mmWn7WakTq7JFpkKAAcdBb8XglwYveFSvauCQhW+Mn/VTczCkr3o7dcqGndsILrlzJPjlXYpTwAihi+2ULIxJeiPp1zHtJg==
X-Gm-Message-State: AOJu0YxentYnTgTW+GEZ5Ogj1PZKX00iD9SWSAI+UjdSg0ub6ACkD3eC
	fLy6cCi/dMeOGryrMEyqDUXnhwczjCRdykexfstfW2pjup/6GlNFHYCxz9YKWXk=
X-Google-Smtp-Source: AGHT+IGOZKuMHViSi5fe+DQzsM7hBtZbHvu8a8ckWU7iav+adCl5d6BjwZ4KEmwhFjIWKg/9PLIaQQ==
X-Received: by 2002:ac2:4d9b:0:b0:512:fe25:550b with SMTP id g27-20020ac24d9b000000b00512fe25550bmr2266661lfe.47.1711116926198;
        Fri, 22 Mar 2024 07:15:26 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id rp20-20020a170906d97400b00a46a2779475sm1059066ejb.101.2024.03.22.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 07:15:25 -0700 (PDT)
Date: Fri, 22 Mar 2024 16:15:23 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/msm/dp: Add support for determining the
 eDP/DP mode from DT
Message-ID: <Zf2Se84QnWccpiM/@linaro.org>
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
 <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
 <Zf2JYmm3DEaR8vB5@linaro.org>
 <CAA8EJppT2VAXMxAbMztbi=-QZj8nP++_Zy4RQHkY-DrO5W_3EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppT2VAXMxAbMztbi=-QZj8nP++_Zy4RQHkY-DrO5W_3EQ@mail.gmail.com>

On 24-03-22 15:38:03, Dmitry Baryshkov wrote:
> On Fri, 22 Mar 2024 at 15:36, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-03-22 15:30:54, Dmitry Baryshkov wrote:
> > > On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > >
> > > > Instead of relying on different compatibles for eDP and DP, lookup
> > > > the panel node in devicetree to figure out the connector type and
> > > > then pass on that information to the PHY. External DP is not described
> > >
> > > Nit: External DP doesn't have a panel described in DT...
> > >
> >
> > Will fix.
> >
> > > > in DT, therefore, assume it's eDP if panel node is present.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
> > > >  1 file changed, 39 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > index c4cb82af5c2f..c9763f77c832 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > @@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > > >         if (IS_ERR(phy))
> > > >                 return PTR_ERR(phy);
> > > >
> > > > +       rc = phy_set_mode_ext(phy, PHY_MODE_DP,
> > > > +                             dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> > > > +       if (rc) {
> > > > +               DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
> > > > +               dp->catalog = NULL;
> > > > +               goto error;
> > > > +       }
> > > > +
> > > >         dp->catalog = dp_catalog_get(dev);
> > > >         if (IS_ERR(dp->catalog)) {
> > > >                 rc = PTR_ERR(dp->catalog);
> > > > @@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > > >                 goto error;
> > > >         }
> > > >
> > > > -       dp->aux = dp_aux_get(dev, dp->catalog,
> > > > -                            phy,
> > > > -                            dp->dp_display.is_edp);
> > > > +       dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);
> > >
> > > Unrelated
> > >
> >
> > Yep, will drop the change.
> >
> > > >         if (IS_ERR(dp->aux)) {
> > > >                 rc = PTR_ERR(dp->aux);
> > > >                 DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
> > > > @@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> > > >         return dp_display_probe_tail(aux->dev);
> > > >  }
> > > >
> > > > +static int dp_display_get_connector_type(struct platform_device *pdev,
> > > > +                                        const struct msm_dp_desc *desc)
> > > > +{
> > > > +       struct device *dev = &pdev->dev;
> > > > +       struct device_node *aux_bus;
> > > > +       struct device_node *panel;
> > > > +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> > > > +
> > > > +       /* legacy platforms specify connector type in match data */
> > > > +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> > > > +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> > >
> > > misaligned
> > >
> >
> > Sure, will fix.
> >
> > > > +               return desc->connector_type;
> > >
> > > Can we drop this part completely?
> > >
> >
> > You mean the whole if clause? How should we handle the legacy approach
> > then?
> 
> Legacy platforms still have the aux-bus/panel. so they should be
> handled by the check below.
> 

Oh, in that case we can drop the connector_type from every desc for all
platforms.

> >
> > > > +
> > > > +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> > > > +       if (!aux_bus)
> > > > +               goto out;
> > > > +
> > > > +       panel = of_get_child_by_name(aux_bus, "panel");
> > > > +       if (!panel)
> > > > +               goto out;
> > > > +
> > > > +       ret = DRM_MODE_CONNECTOR_eDP;
> > > > +
> > > > +out:
> > > > +       of_node_put(panel);
> > > > +       of_node_put(aux_bus);
> > > > +       return ret;
> > > > +}
> > > > +
> > > >  static int dp_display_probe(struct platform_device *pdev)
> > > >  {
> > > >         int rc = 0;
> > > > @@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > > >         dp->dp_display.pdev = pdev;
> > > >         dp->name = "drm_dp";
> > > >         dp->id = desc->id;
> > > > -       dp->dp_display.connector_type = desc->connector_type;
> > > > +       dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
> > > >         dp->wide_bus_supported = desc->wide_bus_supported;
> > > >         dp->dp_display.is_edp =
> > > >                 (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry

