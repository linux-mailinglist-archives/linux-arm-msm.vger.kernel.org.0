Return-Path: <linux-arm-msm+bounces-21169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF178D560D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A43287C3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C44674042;
	Thu, 30 May 2024 23:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXOPQRE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74818399B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717110675; cv=none; b=BVF0GB3+JSzBQXjz8k7dszGN+JvGpqW/sX6PbUAB9QSK13KsuUolv+L6Iw5GMdr9h6Bak/k0V1nledNDQd8wREhfQrMSenMyVhy4WHgVMvJi9AFJ9iEEAvGX0pWyJkBCxNFcCul19FoZli1Yr275EqXiZUK/BNMlhN1HT0sPIW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717110675; c=relaxed/simple;
	bh=MBFCW274J0YqTTxvu3B4tCqGsCfhBgX47D2Q/GYGEqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcS33h5MHaPGwASC84LHMeOePp6/5qUsxIgT/pvKs6LwEbu5RefU0tLSCIIQxRIc5EBgQNWzj3DmCueCvRb9+MyIohM1USi1J+fTb4XmkecUTcbam/ccy3ftjPD78rj2JdXj0Bqu9zXjN7nCI44KSWXAUonLvTFB5PTSc9qjtdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXOPQRE7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b86cfcbcaso488633e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717110672; x=1717715472; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rtVeYQ5u84CD0AA2JcRrrPlaJCkNb/Fj7mnCC/lgjg=;
        b=NXOPQRE7bVcUXqATFyFTvlycGAV6aTQ25lNZHPJbocPea2960r7zbxoUyBxEq16yQy
         /t4rhX1Htr7vkIL/KOu5EEh9Xd3dD34B4vll3RRAQgG8ItPS79ux2GFFboukoaS9FrMR
         JPPXZ9W6TpN4zAAqKPKqOjqJrUtzqnxsloTAcnKXT6vXRtKFO+vkFuoH/09auRITC+lR
         TjpXSroDPgXzDi4CxzJPXkeQT2FZZNEIzrW5O4B4faT/RqjRfbUHvh6VYxvEt0qERXER
         aNdFGe6zXJBjokYMKZo272/8y6i8jbkXLAr0gPGl65prRiea3JOmCK83Lxuap8TSsdEp
         UI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717110672; x=1717715472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rtVeYQ5u84CD0AA2JcRrrPlaJCkNb/Fj7mnCC/lgjg=;
        b=dzZ5vzkyO21DUaDztHHL1P2PMuwQGHmkasf4/8W18tfSmO345dStS2Gd75t3Q5yVM9
         6p8po/4UP0qXoWmoTKsqu9ThIpVZN5wfoWRWmv3Ed8CDgNkaeqriVdslY0aCkdBxvB+P
         EK1ycvbLuqNy2+eW3/bWq8b2Wv+F5r8Bsbzkpidwebo6vXwQ5nNyBg/PPtRgahO/CVUK
         3A7hd6frceZapcWzMBkhbNXwPfyYcrKjEEFVNzcXzYsmMUoDan3lrxUIBpeLm91jkJ6N
         5Fu5P1vZJcKMLe8DgXtNQqYGjUf2uD+YYd/BX7nO9FxxGY/DG46zny5qEmVjH/pQQY8m
         7uwg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfSSP0eMNlUJxSGX4Lp1YmNiosQxZ5mgZIdZTloOy2ZIw9ac2Qk03E5PouXd+4uqvYTznaDkQnXdsbf7AuDtulYT1smSHR1xvRpo4Cw==
X-Gm-Message-State: AOJu0Yzer0qV60N+oJ92aVa8xP+7XrOaB9eBntG1gj4qwdOlSuRMnLKt
	ujXVLmVB0FSPjI7CwIM2D0q4z7j9jYsnQ0Y+Dqv5eIk6oim4/4Y93m498Qr8LbM=
X-Google-Smtp-Source: AGHT+IG0t3rZTPhtJybKaUF15LVmYhDBWgz6POuiQcknG9wUsiCJYYjByHxxMrF/IH17dhoIvEgTyA==
X-Received: by 2002:ac2:51b0:0:b0:51f:9549:9c0d with SMTP id 2adb3069b0e04-52b895a4043mr42465e87.48.1717110671620;
        Thu, 30 May 2024 16:11:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d34d76sm120623e87.10.2024.05.30.16.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:11:11 -0700 (PDT)
Date: Fri, 31 May 2024 02:11:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
Message-ID: <kxfuvsmi6eblpavtevwllqmkdnzdih7kfc73wlos7yozikerjv@si6jshczffjy>
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
 <20240529-edp-panel-drop-v2-1-fcfc457fc8dd@linaro.org>
 <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>

On Thu, May 30, 2024 at 07:33:59AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, May 28, 2024 at 4:52 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add a fat warning against adding new panel compatibles to the panel-edp
> > driver. All new users of the eDP panels are supposed to use the generic
> > "edp-panel" compatible device on the AUX bus. The remaining compatibles
> > are either used by the existing DT or were used previously and are
> > retained for backwards compatibility.
> >
> > Suggested-by: Doug Anderson <dianders@chromium.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 6db277efcbb7..95b25ec67168 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match[] = {
> >         {
> >                 /* Must be first */
> >                 .compatible = "edp-panel",
> > -       }, {
> > +       },
> > +       /*
> > +        * Do not add panels to the list below unless they cannot be handled by
> > +        * the generic edp-panel compatible.
> > +        *
> > +        * The only two valid reasons are:
> > +        * - because of the panel issues (e.g. broken EDID or broken
> > +        *   identification),
> > +        * - because the platform which uses the panel didn't wire up the AUX
> > +        *   bus properly.
> > +        *
> > +        * In all other cases the platform should use the aux-bus and declare
> > +        * the panel using the 'edp-panel' compatible as a device on the AUX
> > +        * bus. The lack of the aux-bus support is not a valid case. Platforms
> > +        * are urged to be converted to declaring panels in a proper way.
> 
> I'm still at least slightly confused by the wording. What is "the lack
> of the aux-bus support". I guess this is different from the valid
> reason of "the platform which uses the panel didn't wire up the AUX
> bus properly" but I'm not sure how. Maybe you can explain?
> 
> I guess I'd write it like this:
> 
>     /*
>      * Do not add panels to the list below unless they cannot be handled by
>      * the generic edp-panel compatible.
>      *
>      * The only two valid reasons are:
>      * - because of the panel issues (e.g. broken EDID or broken
>      *   identification).
>      * - because the platform which uses the panel didn't wire up the AUX
>      *   bus properly. NOTE that, though this is a marginally valid reason,
>      *   some justification needs to be made for why the platform can't
>      *   wire up the AUX bus properly.
>      *
>      * In all other cases the platform should use the aux-bus and declare
>      * the panel using the 'edp-panel' compatible as a device on the AUX
>      * bus.
>      */
> 
> What do you think? In any case, it probably doesn't matter much. The
> important thing is some sort of warning here telling people not to add
> to the table. In that sense:

Ack, I'l update the wording in a similar way.

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

-- 
With best wishes
Dmitry

