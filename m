Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159132D9948
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 14:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407987AbgLNNza (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 08:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407984AbgLNNzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 08:55:21 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54996C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 05:54:39 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id x16so22568696ejj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KavFDEMA9/ZirRk8Ds/NYxqEWaXTgiQCpzuUFNvH5CM=;
        b=nXv0urLmVW0flpBTalWMcISFpg8rwCRgojAm95fNn2Qr5h/wALMHFUc3XWy/QMFhAB
         +IRKfG47RlGkWQc0Gvz/a4zo2yFcHrnS8mb62ykantCEi9ieoajbGEDMs43D3/ZBs7hx
         EZxwmpual6RASwb8aOopU+o8UK3Q448uAE4alRQQeu3nXZrU7jLsULnXM7wx7CyIlg1C
         eNG8wC9X1aUnHseIWbHDHQmxkAvx2bH/P0E0u/Bh3Cv0ezqHqYVOvEMr0rmNTkn9ZUoY
         icqg4zIHJdve9Cbe068QaTYU5IDObs9WTNIoL5KewteCPN9L7oIimipoVxAAvyvZKwhk
         nVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KavFDEMA9/ZirRk8Ds/NYxqEWaXTgiQCpzuUFNvH5CM=;
        b=e957+qrpSs6uhe6vVJnml+epcaxTPPTm2J36KBC1Z0N2lCl5lcSTyRAzVulyGcox6H
         rtCGuiAbo4czIOAuAqafO7Ko5zNxokkVExtJSXjLQop2qHIE7unPcOLk3weyPTgRBAPT
         7akWEL5Afctj50NJXw7OB5i1cA1sJb8z3mL+a74rWelt9iSWZsuFTKWjUjMA8vrfYkVe
         6U9OU9v462Q7g7gQ46xexX96jpTv4pG6OEPuV0t84I9KqXR/oom71a7JQX3wz8JwRxMX
         I2tJxUuFynbB07LvI8yTKuGF5OxSuAgl0UhD3o9+OBTcpQMgN81Tuk8AEN0kH3HrqfJy
         0Xqg==
X-Gm-Message-State: AOAM532uDGFTQxmASBmbsW6Y8HeCJ9SWZsoDE6h/S/TVriCL6iqNVWah
        Zst9PuxF+sLT//MMLKO3EBbqJyS9pjTfMUmGP8mfSlpxB/w=
X-Google-Smtp-Source: ABdhPJxGBQ7/aEzk5v8vmXxwsleNQXdsxcmFaNkyJdRDp0XxEuuy2uDv6GXT91Xr3juZre5DUwyKaiR0ZhkC+8JfeCk=
X-Received: by 2002:a17:906:2798:: with SMTP id j24mr2946287ejc.328.1607954077979;
 Mon, 14 Dec 2020 05:54:37 -0800 (PST)
MIME-Version: 1.0
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
 <1607594575-31590-2-git-send-email-loic.poulain@linaro.org>
 <bb994dcd-854b-e33c-1b08-ac71348fa851@codeaurora.org> <CAMZdPi8+UFmTOeivvZXefm-UHuN+v5zNJBQuZAOw0omiWY-ifw@mail.gmail.com>
 <2c756db7-563b-2af8-e9b3-324a58770d96@codeaurora.org>
In-Reply-To: <2c756db7-563b-2af8-e9b3-324a58770d96@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 14 Dec 2020 15:01:14 +0100
Message-ID: <CAMZdPi9O29PDK8S3UEe=xDjJNmUjEUcztmD2HukryCiTN5HkYA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] mhi: Add mhi_controller_initialize helper
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Dec 2020 at 21:01, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 12/11/20 11:13 AM, Loic Poulain wrote:
> > Hi Hemant,
> >
> > Le ven. 11 d=C3=A9c. 2020 =C3=A0 19:57, Hemant Kumar <hemantk@codeauror=
a.org
> > <mailto:hemantk@codeaurora.org>> a =C3=A9crit :
> >
> >
> >
> >     On 12/10/20 2:02 AM, Loic Poulain wrote:
> >      > This function allows to initialize a mhi_controller structure.
> >      > Today, it only zeroing the structure.
> >      >
> >      > Use this function from mhi_alloc_controller so that any further
> >      > initialization can be factorized in initalize function.
> >      >
> >      > Signed-off-by: Loic Poulain <loic.poulain@linaro.org
> >     <mailto:loic.poulain@linaro.org>>
> >      > ---
> >      >   drivers/bus/mhi/core/init.c | 7 +++++++
> >      >   include/linux/mhi.h         | 6 ++++++
> >      >   2 files changed, 13 insertions(+)
> >      >
> >      > diff --git a/drivers/bus/mhi/core/init.c
> >     b/drivers/bus/mhi/core/init.c
> >      > index 96cde9c..4acad28 100644
> >      > --- a/drivers/bus/mhi/core/init.c
> >      > +++ b/drivers/bus/mhi/core/init.c
> >      > @@ -1021,11 +1021,18 @@ void mhi_unregister_controller(struct
> >     mhi_controller *mhi_cntrl)
> >      >   }
> >      >   EXPORT_SYMBOL_GPL(mhi_unregister_controller);
> >      >
> >      > +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl=
)
> >      > +{
> >      > +     memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
> >      > +}
> >      > +EXPORT_SYMBOL_GPL(mhi_initialize_controller);
> >      > +
> >      >   struct mhi_controller *mhi_alloc_controller(void)
> >      >   {
> >      >       struct mhi_controller *mhi_cntrl;
> >      >
> >      >       mhi_cntrl =3D kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
> >      > +     mhi_initialize_controller(mhi_cntrl);
> >     Considering the kzalloc, do we really need to call here as well ?
> >
> >
> > To summary back and forth on that change, the point is that mhi_cntrl
> > may have some extra initialization in the futur (e.g mutex init...) and
> > so a helper is needed to correctly initialize the structure, though
> > today it does nothing except zeroing.
> I am aware of the discussion and reason for introducing new exported
> API. Based on my understanding, as of now you are going to call the new
> exported API in MHI controller driver. I was thinking of adding new API
> in mhi_alloc_controller only after introducing extra initialization in
> future, without that it was looking redundant to me at this point of time=
.

Ok, will remove that line.

Loic
