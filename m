Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2DD2F4E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 16:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbhAMPDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 10:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbhAMPDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 10:03:23 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80947C061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 07:02:43 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id x126so1369204pfc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 07:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rPRSuHtzx2N5glmiiegQCcxitzlx/8sULN8vX19VzJM=;
        b=piKPw7mULMlt99PLa5jQVh6jTydYvFgHT/lzqNvuW//U710cJT6VdSVcDiXLJbJiR7
         zP+MvvJPdD5zeCY3k+bgN8M4jpWJQHdgIq7SdYobZsSVL5rqSH0Ql9okD8B5T+KGCq6j
         jeGGrledgtgsNgqIDUrbbBM//0QQkW36Q+rEiiPdviDZf1IZOqImVewYWA9qhmPDvQpP
         Qsti8e5BP1IyK3VtmpJyGi8E3j5A1riYg9863wHjFUVe3dOByopcI+TJTMIS+ELH2XA2
         hvSlrBMB1PtkbufP5QUWJqShukXyp96akb+DAqMPO35FnsVLUBlTyDw/JBQwcmEpW7Vp
         cz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rPRSuHtzx2N5glmiiegQCcxitzlx/8sULN8vX19VzJM=;
        b=SvmxT3KuwGxDvt6P5zrhRpQ+e3/WdVMZXpxE4K0WHYSVhLuk7e/uIm2a6SuYE0udiR
         BVNDUiu2RGhFeU3m66cyNaqphAscLWpZ0bmssUWQjYO7ozQmYwJWs04fBNBEo0Fn2t/p
         X5d6aD5etxBrPvO7k19XDrcNXeDKYBkXFz43kdlA7hBfsYAfuaSfBiMgqyzDhUi/sbkF
         AtEuC8RV7tIjvBpPleNl6rIuV5F/8lBKJatYBkag4kh79O4FwmcsuZ/TOzSVCutl80eT
         h+wJ+UDlBdQwNBBI7WWl8V7gXhaKosuhSq0pkvISdeWP3KY1X1Kda8IjUVQ4c1e/c4qR
         /aZA==
X-Gm-Message-State: AOAM5336S9GbqBHSFKEHq7dj66Oy08kVqUYw0eN+U3jm9XKafsq0bP9L
        /wZYWCt6kVUSyuoqUNWUQ/xffRBaJfCKkAbhIgHp6A==
X-Google-Smtp-Source: ABdhPJx73/ardZl0Utkhso9MLKEdBSvkEDbWEPITy7Dv8jQ7BtrCFi9cZAclHQrOS728/A3ALst1xa5Y1Zcwppi9jXU=
X-Received: by 2002:a65:654e:: with SMTP id a14mr2415756pgw.265.1610550162411;
 Wed, 13 Jan 2021 07:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-5-robert.foss@linaro.org> <X/itZVFeM0XeV9Sx@builder.lan>
In-Reply-To: <X/itZVFeM0XeV9Sx@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 13 Jan 2021 16:02:31 +0100
Message-ID: <CAG3jFyvVBFLX_1vobyBHtEnVkN0QFSRX3MdwtUnBCXbVwDQ4DQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/17] media: camss: Make ISPIF subdevice optional
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, arnd@arndb.de, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Bj=C3=B6rn!

On Fri, 8 Jan 2021 at 20:07, Bjorn Andersson <bjorn.andersson@linaro.org> w=
rote:
>
> On Fri 08 Jan 06:04 CST 2021, Robert Foss wrote:
>
> > This driver supports multiple architecture versions of the Qualcomm ISP=
.
> > The CAMSS architecure which this driver is name after, and with the
> > introduction of this series, the Titan architecture.
> >
> > The ISPIF is IP-block that is only present in the CAMSS architecture.
>
> "is an IP-block"

Ack

I cleaned up the message a little bit further in order to be more
clear about camss & titan being the names of architecture generations.

>
> > In order to support the Titan architecture, make the ISPIF an optional
> > subdevice.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  .../media/platform/qcom/camss/camss-ispif.c   | 144 ++++++++++--------
> >  .../media/platform/qcom/camss/camss-ispif.h   |   3 +-
> >  drivers/media/platform/qcom/camss/camss.c     | 113 +++++++++-----
> >  drivers/media/platform/qcom/camss/camss.h     |   2 +-
> >  4 files changed, 160 insertions(+), 102 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/=
media/platform/qcom/camss/camss-ispif.c
> [..]
> > -int msm_ispif_subdev_init(struct ispif_device *ispif,
> > +int msm_ispif_subdev_init(struct camss *camss,
> >                         const struct resources_ispif *res)
> >  {
> > -     struct device *dev =3D to_device(ispif);
> > -     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct ispif_device *ispif =3D camss->ispif;
> > +     struct platform_device *pdev =3D to_platform_device(camss->dev);
>
> It seems like several of the changes in this function is replacing
> dev with camss->dev. If you retained a struct device *dev =3D camss->dev;
> you would avoid this.

Ack.

>
> >       struct resource *r;
> >       int i;
> >       int ret;
> >
> > +     if (res =3D=3D NULL && ispif =3D=3D NULL)
>
> Afaict this function is called conditional on camss->ispif !=3D NULL, and
> I don't see anything that would cause res to becomes NULL if is hasn't
> been before this change.
>
> So I think this check is unnecessary?

Nice catch, thank you!

>
> > +             return 0;
> > +
> > +     ispif->camss =3D camss;
> > +
> >       /* Number of ISPIF lines - same as number of CSID hardware module=
s */
> > -     if (to_camss(ispif)->version =3D=3D CAMSS_8x16)
> > +     if (camss->version =3D=3D CAMSS_8x16)
> >               ispif->line_num =3D 2;
> > -     else if (to_camss(ispif)->version =3D=3D CAMSS_8x96 ||
> > -              to_camss(ispif)->version =3D=3D CAMSS_660)
> > +     else if (camss->version =3D=3D CAMSS_8x96 ||
> > +              camss->version =3D=3D CAMSS_660)
> >               ispif->line_num =3D 4;
> >       else
> >               return -EINVAL;
> >
> > -     ispif->line =3D devm_kcalloc(dev, ispif->line_num, sizeof(*ispif-=
>line),
> > -                                GFP_KERNEL);
> > +     ispif->line =3D devm_kcalloc(camss->dev, ispif->line_num,
> > +                     sizeof(*ispif->line), GFP_KERNEL);
> >       if (!ispif->line)
> >               return -ENOMEM;
> >
> [..]
> > @@ -1393,6 +1410,9 @@ void msm_ispif_unregister_entities(struct ispif_d=
evice *ispif)
> >  {
> >       int i;
> >
> > +     if (!ispif)
> > +             return;
>
> I like this, but later in the patch you make the calls to this function
> conditional on ispif !=3D NULL. You should only need one of the checks.

Ack, removing the external checks and keeping the internal one then.
