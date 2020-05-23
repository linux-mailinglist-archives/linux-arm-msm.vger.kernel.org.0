Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F241DFBA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 01:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388106AbgEWXSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 19:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388016AbgEWXSn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 19:18:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7B8C061A0E;
        Sat, 23 May 2020 16:18:42 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h21so16950664ejq.5;
        Sat, 23 May 2020 16:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qTudC0kHsQhaAnF/cig67ZtgOuZShJYIz5n75777QI0=;
        b=nR7VJUtBYdfY7cZfN+bMTyk9xVMDKht+TU3DEdUb3kXBwElFsd6R9+g4zVO4qYGjND
         j3ExNebSDQansXRRAUMWm6XOapUtBjPUSJ7tHvL35C2foTZ+nl6S/qEbhEuE/nPSU3wi
         AVY66IrjmaHc1lSHqRphxZvFfNCLN2K9uH6rGUGVH21aIPaEwn71KM2mtPe3xYwHAP15
         2ecZeBo+JFYQvl/cYqwAcybMbgYjRvDz+Eva1HQsY/dHHZvj5G1e3UXLNygrki7r6jXN
         t2DnbijuggGFY3Ewha8JmDqLNZ2+5YGJ3XHag4vNPWGbUAGIvA0Jnu5O/C9V33Mx6oga
         PBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qTudC0kHsQhaAnF/cig67ZtgOuZShJYIz5n75777QI0=;
        b=U/K99c4onOjV9zyZfoky7zFqUUDbbS6gfp96hcZ3fxUcxEy9rmTMF0MZmcr3/Z2siR
         FA27Koibl+8BZ7s7dAeYDp+H5a9DTKzb4EyMYiagnbmB+FPiJ/MqqyapYI/99/AZNYvK
         mNct8I/TnX3qVwd0C9tfqDShD1PEIxxelUEHPZcrValPF9RqtUenRDpgy4zgwvBw/spc
         oDZOL52kbxXkPhv+8eLfGWxKTj3Hy4DL944lOntTBGeUIN49hk/DSQomKD+sl33rLzwT
         nrH66ytQNWS9i1zrT0c44ORlZl3A230RUHOGK4NVacbteTNrGiwmGNwMaYwzjlkMUyi0
         dFqQ==
X-Gm-Message-State: AOAM532FKxjGC9aac46q4mP5mbOqsj4YUVePo9LUSr74G7YOTTv99Yyh
        XnFDRSLXbYj6mT4/s1nxGIPgzMQ3QscsO8dyWhY=
X-Google-Smtp-Source: ABdhPJwzMx/jVFuTDLKRDebwIdmlbU6Vpg2xa3/LcsOdKTMjNBXwRaLoF5JgX+ThsXGDyFVVS7kntTFfz4vPb72aNas=
X-Received: by 2002:a17:906:6843:: with SMTP id a3mr12943995ejs.245.1590275921497;
 Sat, 23 May 2020 16:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200522220316.23772-1-jcrouse@codeaurora.org>
 <20200522220316.23772-2-jcrouse@codeaurora.org> <20200523072300.GB28198@dragon>
In-Reply-To: <20200523072300.GB28198@dragon>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 23 May 2020 16:19:02 -0700
Message-ID: <CAF6AEGsrH4PvhBHcVgkVWTk4+wXnRQqiusQA18MrZ-dX-oFRcg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm: Attach the IOMMU device during initialization
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tongtiangen <tongtiangen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 23, 2020 at 12:23 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Fri, May 22, 2020 at 04:03:14PM -0600, Jordan Crouse wrote:
> > diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm=
_gpummu.c
> > index 34980d8eb7ad..0ad0f848560a 100644
> > --- a/drivers/gpu/drm/msm/msm_gpummu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> > @@ -21,11 +21,6 @@ struct msm_gpummu {
> >  #define GPUMMU_PAGE_SIZE SZ_4K
> >  #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_S=
IZE)
> >
> > -static int msm_gpummu_attach(struct msm_mmu *mmu)
> > -{
> > -     return 0;
> > -}
> > -
> >  static void msm_gpummu_detach(struct msm_mmu *mmu)
> >  {
> >  }
> > @@ -85,7 +80,6 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
> >  }
> >
> >  static const struct msm_mmu_funcs funcs =3D {
> > -             .attach =3D msm_gpummu_attach,
> >               .detach =3D msm_gpummu_detach,
> >               .map =3D msm_gpummu_map,
> >               .unmap =3D msm_gpummu_unmap,
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_=
iommu.c
> > index ad58cfe5998e..e35dab5792cf 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -66,7 +66,6 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
> >  }
> >
> >  static const struct msm_mmu_funcs funcs =3D {
> > -             .attach =3D msm_iommu_attach,
>
> It causes an unused function warning as below.
>
> drivers/gpu/drm/msm/msm_iommu.c:26:12: warning: =E2=80=98msm_iommu_attach=
=E2=80=99 defined but not used [-Wunused-function]
>  static int msm_iommu_attach(struct msm_mmu *mmu)
>             ^~~~~~~~~~~~~~~~
>
> Not sure if you will use it again in future patches though.

looks like this was removed in msm_gpummu (a2xx) but not msm_iommu
(a3xx+).. I've squashed a fixup and pushed to msm-next

thx

BR,
-R

> Shawn
>
> >               .detach =3D msm_iommu_detach,
> >               .map =3D msm_iommu_map,
> >               .unmap =3D msm_iommu_unmap,
> > @@ -76,6 +75,7 @@ static const struct msm_mmu_funcs funcs =3D {
> >  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain =
*domain)
> >  {
> >       struct msm_iommu *iommu;
> > +     int ret;
> >
> >       iommu =3D kzalloc(sizeof(*iommu), GFP_KERNEL);
> >       if (!iommu)
> > @@ -85,5 +85,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, st=
ruct iommu_domain *domain)
> >       msm_mmu_init(&iommu->base, dev, &funcs);
> >       iommu_set_fault_handler(domain, msm_fault_handler, iommu);
> >
> > +     ret =3D iommu_attach_device(iommu->domain, dev);
> > +     if (ret) {
> > +             kfree(iommu);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> >       return &iommu->base;
> >  }
> > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mm=
u.h
> > index 67a623f14319..bae9e8e67ec1 100644
> > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > @@ -10,7 +10,6 @@
> >  #include <linux/iommu.h>
> >
> >  struct msm_mmu_funcs {
> > -     int (*attach)(struct msm_mmu *mmu);
> >       void (*detach)(struct msm_mmu *mmu);
> >       int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *s=
gt,
> >                       unsigned len, int prot);
> > --
> > 2.17.1
> >
