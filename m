Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11AF1FBECC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 21:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbgFPTNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 15:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730214AbgFPTNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 15:13:48 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4993C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 12:13:47 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id o5so23279332iow.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rd339jSyZO9e0MBPwSkvBtVbgK+6Hgu2h9HW8JUmTxo=;
        b=j+BZyUWIZ9BkiVUaVnHbyFoRqGPtj2prpfWzHv8VN68a4Xm/xD+MjDyBKueUxK04wW
         CfHbD1o8JhGMj7ljit2CpHjCboR9aaZ4OR0hNMocLvtVz/r61IN5J5Up7cuV4vr37enC
         JC3jv/Re0Gx/b++AbVuln9cpeO/W1W8+IFFIySQ9N9XbPFMSoe1iuvuJiAp6SwWum93R
         LwpCgsHyJoIa+R47UX/45WdtKLw674L1WT6UkIM3MVmNg6u93/Ttj9ldvOlybVc2sNGl
         juYrPEP/uL7qmcTQHKYeOX4ewC95txwrt/m37zjqa7apdAXYXI1/cLrLR1mSv88GjTnc
         V8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rd339jSyZO9e0MBPwSkvBtVbgK+6Hgu2h9HW8JUmTxo=;
        b=pxdG3TT5L7wMxxEtbYoBR5LXgXAVEM0FsSZU7c0+364sm43ve8E+5KbxytBaWp7s2q
         T2k2vXa3Qg7HR3i/gE0uOOaw9sRL6GvZoBdvV7ZrkjeBVYoqqW4fWx5WE5CZIhOHFijD
         T9Om3ESrFAJD2xsNyYdrLN5Ad495LW12AF9EzbGqSfcsCbMLnKxjDxXL1v2D/+MFDdW4
         fAX/1/wvGwb3Fy/HDx7uYEsbT/oYtrScExOWIAHQxw8v6WmTIB0wmKlTfzc1qpOdnxGx
         LkHX0gEgG7eQDU1prJvtDdJizGg3bWmYGDL5fDVdohpp+0njp6g2wBjUhUiP9k+suIFT
         FsYQ==
X-Gm-Message-State: AOAM53215IArxdSj57CNmp/BSRrsfZUU80V2ZDuTYfFIZbgSEb5Acch/
        J9Ri2Cha79XRCW6tFEuz1nElh0mc1wRFtApw60OZnBsn
X-Google-Smtp-Source: ABdhPJx0LPs09ef2dU9wwdz8g2nJ5chxYyM8DHgpvMTkP8oRUMucmYwVeptcXIv1dfCFn7K0HAheYVppBd3P4mm+29Y=
X-Received: by 2002:a05:6602:2e96:: with SMTP id m22mr4283091iow.165.1592334827011;
 Tue, 16 Jun 2020 12:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200611185012.23815-1-cleger@kalray.eu> <20200616171011.GA461427@xps15>
 <1643320865.7759489.1592327984836.JavaMail.zimbra@kalray.eu>
In-Reply-To: <1643320865.7759489.1592327984836.JavaMail.zimbra@kalray.eu>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 16 Jun 2020 13:13:36 -0600
Message-ID: <CANLsYkxq+P3H0GojN3yjQbNPSjAQttD+4EjjuKmGV-tgfkHJ0A@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: fix driver_override memory leak
To:     =?UTF-8?Q?Cl=C3=A9ment_Leger?= <cleger@kalray.eu>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Jun 2020 at 11:19, Cl=C3=A9ment Leger <cleger@kalray.eu> wrote:
>
> Hi Mathieu,
>
> ----- On 16 Jun, 2020, at 19:10, Mathieu Poirier mathieu.poirier@linaro.o=
rg wrote:
>
> > Hi Cl=C3=A9ment,
> >
> > On Thu, Jun 11, 2020 at 08:50:12PM +0200, Clement Leger wrote:
> >> rpmsg_core allows to override driver using driver_override sysfs
> >> attribute. When used, the sysfs store function will duplicate the user
> >> provided string using kstrndup. However, when the rpdev is released,
> >> the driver_override attribute is not freed. In order to have a
> >> consistent allocation and release, use kstrdup in
> >> rpmsg_chrdev_register_device and move it in rpmsg_core.c to avoid
> >> header dependencies. Moreover, add a rpmsg_release_device function to
> >> be called in device release. Drivers using rpmsg have been modified to
> >> use this function and ensure there will be no more memory leak when
> >> releasing rpmsg devices.
> >> This was found with kmemleak while using remoteproc and virtio.
> >>
> >> Signed-off-by: Clement Leger <cleger@kalray.eu>
> >> ---
> >>  drivers/rpmsg/qcom_glink_native.c |  1 +
> >>  drivers/rpmsg/qcom_smd.c          |  1 +
> >>  drivers/rpmsg/rpmsg_core.c        | 22 ++++++++++++++++++++++
> >>  drivers/rpmsg/rpmsg_internal.h    | 15 ++-------------
> >>  drivers/rpmsg/virtio_rpmsg_bus.c  |  1 +
> >>  5 files changed, 27 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/qcom_glink_native.c
> >> b/drivers/rpmsg/qcom_glink_native.c
> >> index 1995f5b3ea67..076997afc638 100644
> >> --- a/drivers/rpmsg/qcom_glink_native.c
> >> +++ b/drivers/rpmsg/qcom_glink_native.c
> >> @@ -1373,6 +1373,7 @@ static void qcom_glink_rpdev_release(struct devi=
ce *dev)
> >>      struct glink_channel *channel =3D to_glink_channel(rpdev->ept);
> >>
> >>      channel->rpdev =3D NULL;
> >> +    rpmsg_release_device(rpdev);
> >>      kfree(rpdev);
> >>  }
> >>
> >> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> >> index 4abbeea782fa..f01174d0d4d9 100644
> >> --- a/drivers/rpmsg/qcom_smd.c
> >> +++ b/drivers/rpmsg/qcom_smd.c
> >> @@ -1047,6 +1047,7 @@ static void qcom_smd_release_device(struct devic=
e *dev)
> >>      struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
> >>      struct qcom_smd_device *qsdev =3D to_smd_device(rpdev);
> >>
> >> +    rpmsg_release_device(rpdev);
> >>      kfree(qsdev);
> >>  }
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> >> index a6361cad608b..31de89c81b27 100644
> >> --- a/drivers/rpmsg/rpmsg_core.c
> >> +++ b/drivers/rpmsg/rpmsg_core.c
> >> @@ -554,6 +554,28 @@ int rpmsg_unregister_device(struct device *parent=
,
> >>  }
> >>  EXPORT_SYMBOL(rpmsg_unregister_device);
> >>
> >> +void rpmsg_release_device(struct rpmsg_device *rpdev)
> >> +{
> >> +    kfree(rpdev->driver_override);
> >> +}
> >> +EXPORT_SYMBOL(rpmsg_release_device);
> >> +
> >> +/**
> >> + * rpmsg_chrdev_register_device() - register chrdev device based on r=
pdev
> >> + * @rpdev:  prepared rpdev to be used for creating endpoints
> >> + *
> >> + * This function wraps rpmsg_register_device() preparing the rpdev fo=
r use as
> >> + * basis for the rpmsg chrdev.
> >> + */
> >> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> >> +{
> >> +    strcpy(rpdev->id.name, "rpmsg_chrdev");
> >> +    rpdev->driver_override =3D kstrdup("rpmsg_chrdev", GFP_KERNEL);
> >
> > Have you considered using devm_kstrdup() instead?  Since the same rpdev=
 is
> > available here and in field##_store(), proceeding that way would preven=
t the
> > need to add a new rpmsg_release_device() function.  Depending on header
> > dependencies rpmsg_chrdev_register_device() may also be able to remain =
in
> > rpmsg_internal.h.
>
> Indeed, using devm_kstrdup would be better. Regarding the use of kstrdup =
in
> headers, I only found a really really few occurences of such usage in the
> whole kernel. If you think it's ok, I can go go with it though.

I don't see an issue with using devm_kstrdup() in a header file.

>
> Thanks,
>
> Cl=C3=A9ment
>
> >
> > Thanks,
> > Mathieu
> >
> >> +
> >> +    return rpmsg_register_device(rpdev);
> >> +}
> >> +EXPORT_SYMBOL(rpmsg_chrdev_register_device);
> >> +
> >>  /**
> >>   * __register_rpmsg_driver() - register an rpmsg driver with the rpms=
g bus
> >>   * @rpdrv: pointer to a struct rpmsg_driver
> >> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_inte=
rnal.h
> >> index 3fc83cd50e98..043b28f912fd 100644
> >> --- a/drivers/rpmsg/rpmsg_internal.h
> >> +++ b/drivers/rpmsg/rpmsg_internal.h
> >> @@ -75,19 +75,8 @@ int rpmsg_unregister_device(struct device *parent,
> >>  struct device *rpmsg_find_device(struct device *parent,
> >>                               struct rpmsg_channel_info *chinfo);
> >>
> >> -/**
> >> - * rpmsg_chrdev_register_device() - register chrdev device based on r=
pdev
> >> - * @rpdev:  prepared rpdev to be used for creating endpoints
> >> - *
> >> - * This function wraps rpmsg_register_device() preparing the rpdev fo=
r use as
> >> - * basis for the rpmsg chrdev.
> >> - */
> >> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *r=
pdev)
> >> -{
> >> -    strcpy(rpdev->id.name, "rpmsg_chrdev");
> >> -    rpdev->driver_override =3D "rpmsg_chrdev";
> >> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev);
> >>
> >> -    return rpmsg_register_device(rpdev);
> >> -}
> >> +void rpmsg_release_device(struct rpmsg_device *rpdev);
> >>
> >>  #endif
> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_r=
pmsg_bus.c
> >> index 07d4f3374098..af4ea6170f89 100644
> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> @@ -381,6 +381,7 @@ static void virtio_rpmsg_release_device(struct dev=
ice *dev)
> >>      struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
> >>      struct virtio_rpmsg_channel *vch =3D to_virtio_rpmsg_channel(rpde=
v);
> >>
> >> +    rpmsg_release_device(rpdev);
> >>      kfree(vch);
> >>  }
> >>
> >> --
> >> 2.17.1
