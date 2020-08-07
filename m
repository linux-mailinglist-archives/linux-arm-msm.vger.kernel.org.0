Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B0423F3BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 22:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgHGUYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 16:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGUYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 16:24:04 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0F0C061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2020 13:24:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t10so1649018plz.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=8kRWK6mpY0yuzrMz6VeBLLcMrpVG8ZtSX/iAsw+ut4A=;
        b=WEQMKsvxL+jGuutK/BX9GjKhG9V6iqjN0wIPhLgvikM+b48e3QcXAaeBfnLsnUbVQM
         sEPO5cpmUWUqe4CGQPLKERNzawMZGhiNtw2+3gnBjmoKN8srnzPI9ngJ2NslwuAjvSVk
         RgOZqa5CfaRROKBbMjMpTLlU7cxtbupJL0vwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=8kRWK6mpY0yuzrMz6VeBLLcMrpVG8ZtSX/iAsw+ut4A=;
        b=TcrW6CgxbwFlKT78QAk1Gm+A4xHhp+SZaiohmfJIIB/Y9aGCJOj3BOs/SI9gqJ6XA6
         H7G92oAbDoHsO4IaAjdiKpm6cf7QVnk2mqCYBRod67CxHWF7Vb4xlw5h1F9V1SHQ9Jbh
         ZFCt0NAe4fqpADty4Bym+amV2lJpZXeZumOmukTIatCxrJQl3UmsI42WJUnp4IuaIWtt
         349TkEzctsrXnXdfUSaDo6TRm2Sdbz2veZAXEJx/NxE/HIen/2YawxYEgH1KJvkqACXJ
         nqMcrog1sTnL5Wm/w3JfsKgtEa+tTQUFgab8yQDicCH66jgcZMcacdjul4/FxddRInBg
         07Sw==
X-Gm-Message-State: AOAM531fndYkv78rvH8qtZITyKsKPo1PD6KOoEsKxcVLnd2TEUDRQye7
        GutgbLRBm8Q2Ui1ItXFogXH1lQ==
X-Google-Smtp-Source: ABdhPJwUCMA+qcCj4NBJ6bH6GJrNHolYmVbC63o7ey2y7ucXrSodd1KiH1QHhuAQODHYrQ6iqRsEPQ==
X-Received: by 2002:a17:902:b089:: with SMTP id p9mr13616774plr.52.1596831843666;
        Fri, 07 Aug 2020 13:24:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z23sm11490482pgv.57.2020.08.07.13.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 13:24:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
References: <20200807071718.17937-1-tanmay@codeaurora.org> <20200807071718.17937-4-tanmay@codeaurora.org> <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org> <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Rob Clark <robdclark@gmail.com>
Date:   Fri, 07 Aug 2020 13:24:01 -0700
Message-ID: <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2020-08-07 08:51:48)
> On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > > index ea3c4d094d09..cc1392b29022 100644
> > > --- a/drivers/gpu/drm/msm/Kconfig
> > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
> > >  config DRM_MSM_DP
> > >       bool "Enable DP support in MSM DRM driver"
> > >       depends on DRM_MSM
> > > +     default y
> > >       help
> > >         Compile in support for DP driver in msm drm driver. DP extern=
al
> > >         display support is enabled through this config option. It can
> >
> > Hi,
> >
> > You need a very strong justification to make an optional part of a driv=
er
> > to be "default y".
>=20
> My opinion is that if the driver is built, everything should be built.
> This is what makes sense for distro's.  It is only the embedded case
> where you want to trim down unneeded features where you might want to
> disable some parts.  So 'default y' makes sense to me.
>=20

Maybe use 'default DRM_MSM' so that it doesn't trigger the 'default y'
filters people have?
