Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFEAD03A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 00:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfJHW5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 18:57:47 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40182 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfJHW5q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 18:57:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id d22so66945pll.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=1iVg1bgTgNlX0dVm1aEShQI+wslCHb8bQCi8jJ4tNNc=;
        b=QDUlhMJXKqmHUqSjPCk5eUuvJMAi05vnUZjLZXoyWt4EJdXtiOz2Y6Nr/MuLSLI04w
         0toDdOgS4ewieZ4KychKuLMMZDFwLqkjBPNmy/f7ti9npdfWUKH4nlcvtVwvuKRgpJ6J
         r20qPnrBvGNsk7IEz5JRvMz4WuJpc2KtWI6Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=1iVg1bgTgNlX0dVm1aEShQI+wslCHb8bQCi8jJ4tNNc=;
        b=dz2YI28MBXgSE+bOEazJNmumwF5BSjjO2WCOBhPG882Noju8Cw2yFfPKqFwP6seXtp
         s/VpTcvc+7CKQXu51dI+QbU97xhp9WI0AKEvCHXtrDcHz4v8HDb/bIA2vmUBaGWI7B09
         x1RSy0YjYeWztTh3v7nv2qgggZVX5Em/G59J75TgG2N/xMHkUctfrHQqPga8dCgy19Dx
         jHNjUTIDuWYxpCyQ2AlTG3aMLMdfaRy2oNMZfRkPpB1QgLJYwYGBeblkV9TsDezZvbVG
         BgZI+Iyb5DXmCeG7eEEX+RxJgXl+6iLxoN5HUCRBc4r8FJHtqvUvwqlDd+cBXmEJ3YVW
         zLXQ==
X-Gm-Message-State: APjAAAVSBXBvpwdfIQ027NLh+GcZudqKjVs8/5Ih2VXMLtvQH+hK2CmT
        CHD3buG0FfemjUlgZR58a1KLPA==
X-Google-Smtp-Source: APXvYqzV5T/dDRhxX/AyCWGZl/1A1CtlsmcvDIFOotNiWyYZfmr0klgV6tsCqwZoGEkXP0gf/1Z7gA==
X-Received: by 2002:a17:902:a704:: with SMTP id w4mr37148337plq.177.1570575465981;
        Tue, 08 Oct 2019 15:57:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d4sm205853pjs.9.2019.10.08.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 15:57:44 -0700 (PDT)
Message-ID: <5d9d1468.1c69fb81.1bb45.193a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAE=gft4Rp_GmoVc1iRFH3tiu_taC=i72_Y+xXzk6eU6J80YhQw@mail.gmail.com>
References: <20191004233132.194336-1-swboyd@chromium.org> <CAE=gft4Rp_GmoVc1iRFH3tiu_taC=i72_Y+xXzk6eU6J80YhQw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: llcc: Name regmaps to avoid collisions
User-Agent: alot/0.8.1
Date:   Tue, 08 Oct 2019 15:57:43 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Evan Green (2019-10-07 14:20:47)
> On Fri, Oct 4, 2019 at 4:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > We'll end up with debugfs collisions if we don't give names to the
> > regmaps created inside this driver. Copy the template config over into
> > this function and give the regmap the same name as the resource name.
> >
> > Fixes: 7f9c136216c7 ("soc: qcom: Add broadcast base for Last Level Cach=
e Controller (LLCC)")
> > Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> > Cc: Evan Green <evgreen@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/soc/qcom/llcc-slice.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-slic=
e.c
> > index 9090ea12eaf3..aa342938c403 100644
> > --- a/drivers/soc/qcom/llcc-slice.c
> > +++ b/drivers/soc/qcom/llcc-slice.c
> > @@ -48,13 +48,6 @@
> >
> >  static struct llcc_drv_data *drv_data =3D (void *) -EPROBE_DEFER;
> >
> > -static const struct regmap_config llcc_regmap_config =3D {
> > -       .reg_bits =3D 32,
> > -       .reg_stride =3D 4,
> > -       .val_bits =3D 32,
> > -       .fast_io =3D true,
> > -};
> > -
> >  /**
> >   * llcc_slice_getd - get llcc slice descriptor
> >   * @uid: usecase_id for the client
> > @@ -314,6 +307,12 @@ static struct regmap *qcom_llcc_init_mmio(struct p=
latform_device *pdev,
> >  {
> >         struct resource *res;
> >         void __iomem *base;
> > +       static struct regmap_config llcc_regmap_config =3D {
> > +               .reg_bits =3D 32,
> > +               .reg_stride =3D 4,
> > +               .val_bits =3D 32,
> > +               .fast_io =3D true,
> > +       };
>=20
> Why did you move this to be a static local? I think it works, but it
> makes it look like this is a local variable that's possibly used out
> of scope. Maybe leave it as a global?

And have a followup patch to move it to a static local? Sounds ok to me
if you prefer.

