Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D86132147E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 11:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhBVKwW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 05:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhBVKwV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 05:52:21 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01904C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 02:51:41 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id d2so8769496pjs.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 02:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lkr5dLB81IFIdhy/pc7K0qClWqgFlqG2/UfbKnqJ/Mc=;
        b=QCiiwxLXYga89au9LkJdz/Is5odVu9UG1SSkl44ZNcl81AGd6NHHVgfaFFArnLlYHB
         3F4uGoL/hy/wbnt1r+zpy6ZHJbooU2zRW3X9udEu2o4TnCA5pwAffx9DbCLEYuVKeKM6
         Ejr53M0RaucEG8HWEs7aUCgO8i88X3atiDP5gx5ipextCj6TIi7vN8olyMC76OaLxbsA
         ADl+tdz4hEIR5CZgqbwE52E99x11oPncRx+AbZRoiadhPeqAu3Bkb+JjyVG0j52Rfq3u
         9dfgyvdYaEer/4Ll0SWOiF5FGoZfWG5vmlmql3pRw7ADgsX4pkS2HqdOjldRvOM1uxyl
         /Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lkr5dLB81IFIdhy/pc7K0qClWqgFlqG2/UfbKnqJ/Mc=;
        b=PUl2yUPNQFuGKESkFytyYSkUggOl9rUN7SnylxyZtimgzKbjTqiARJRwPDFrXOt54n
         zK1n1Ve/4wYOaDMHvgODoK9GbXRntMoupz3XofeZ8blcOcwuFB1REFj5pas7yv3lGb+u
         cDqZWpydD8v6E8UlOLtqJgl3CitQklhSxOQwyuVAlLmYb6q+maKquAKvGfj0ngwLCV/q
         uuimS5Qs9Q35XMMSKXJA1FUcQ7x+7kXaOyU1eoRCKB9qVEQih9jEbrIlx3UkGm3G51Bp
         V0YxGpr+ja0uDnhN/Jg7ED8VvJt2YOVyKP8UllZMd5xzmsgz/cNCDaIJZSwx9JFWURaV
         2Xwg==
X-Gm-Message-State: AOAM532OOcYj2LdJq8pM3tPOCnu4wTzmn65uku+v7g+LkXbqINu2IIqx
        mmZYXJWFjEGJZnnhmKum8MpOfuihTPYHo6qtUGd24g==
X-Google-Smtp-Source: ABdhPJw4LMP0wd3rtHSJG+Yixa6wpQx6JYuOQu44s0vFN6qaW+pwWtVIYdWrY3lPccnJdJlaB4FpZ6rQLmMMhDM/DY4=
X-Received: by 2002:a17:902:b610:b029:e3:2b1e:34ff with SMTP id
 b16-20020a170902b610b02900e32b1e34ffmr14279977pls.69.1613991100602; Mon, 22
 Feb 2021 02:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-2-robert.foss@linaro.org> <39f17656195110cc5298f53840ca02f790d7e4af.camel@ndufresne.ca>
In-Reply-To: <39f17656195110cc5298f53840ca02f790d7e4af.camel@ndufresne.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 22 Feb 2021 11:51:29 +0100
Message-ID: <CAG3jFyvNigAZrwAEQOvKac2Sdu5rjtBDWrMjwhXkMmDpZXBUDg@mail.gmail.com>
Subject: Re: [PATCH v5 01/22] media: camss: Fix vfe_isr_comp_done() documentation
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 19 Feb 2021 at 22:05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Hi Robert,
>
> not really a review, but I noticed ....
>
> Le mercredi 17 f=C3=A9vrier 2021 =C3=A0 12:21 +0100, Robert Foss a =C3=A9=
crit :
> > Function name is comment is wrong, and was changed to be
>
>                 in

Thanks bud!

>
> > the same as the actual function name.
> >
> > The comment was changed to kerneldoc format.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> > Changes since v1
> >  - Bjorn: Fix function doc name & use kerneldoc format
> >
> >
> >  drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c
> > b/drivers/media/platform/qcom/camss/camss-vfe.c
> > index fae2b513b2f9..94c9ca7d5cbb 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vf=
e, u8
> > wm)
> >         spin_unlock_irqrestore(&vfe->output_lock, flags);
> >  }
> >
> > -/*
> > - * vfe_isr_wm_done - Process composite image done interrupt
> > +/**
> > + * vfe_isr_comp_done() - Process composite image done interrupt
> >   * @vfe: VFE Device
> >   * @comp: Composite image id
> >   */
>
>
