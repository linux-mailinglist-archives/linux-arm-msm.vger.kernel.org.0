Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA84A1FBF78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 21:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730609AbgFPT4m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 15:56:42 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:45344 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730393AbgFPT4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 15:56:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 98A3527E0DCF;
        Tue, 16 Jun 2020 21:56:39 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id LTbiuMdBaEpl; Tue, 16 Jun 2020 21:56:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id F1D2527E0FFC;
        Tue, 16 Jun 2020 21:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu F1D2527E0FFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1592337399;
        bh=tNhGzVS5hzsVXpGLOv5KkTxn1M+l5YJKPY8bp/jZoqQ=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=f/QJkxSCM/IUcHwlGEsTyYYKexQ38/2SPBHWVrISnCydKFAmOEqFMuAp9LCsbi8AO
         6Hp1TwYDJfNa8KxzWLdC7xDJHrXjzkC4L5UT/twvXMiO8bH/MopUz7EmnG+FsP/fjO
         pz2uhdvoMV0pSi5VnMcN7RP7z1mFHbJ/+gjPwjcc=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id x2HXLDCiy55D; Tue, 16 Jun 2020 21:56:38 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id DAAB427E0DCF;
        Tue, 16 Jun 2020 21:56:38 +0200 (CEST)
Date:   Tue, 16 Jun 2020 21:56:38 +0200 (CEST)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <503534188.7768107.1592337398478.JavaMail.zimbra@kalray.eu>
In-Reply-To: <CANLsYkxq+P3H0GojN3yjQbNPSjAQttD+4EjjuKmGV-tgfkHJ0A@mail.gmail.com>
References: <20200611185012.23815-1-cleger@kalray.eu> <20200616171011.GA461427@xps15> <1643320865.7759489.1592327984836.JavaMail.zimbra@kalray.eu> <CANLsYkxq+P3H0GojN3yjQbNPSjAQttD+4EjjuKmGV-tgfkHJ0A@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: fix driver_override memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC81 (Linux)/8.8.15_GA_3895)
Thread-Topic: rpmsg: fix driver_override memory leak
Thread-Index: 32a7qyFnFMvKD26Zqee2rTeRH7Wdcg==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


----- On 16 Jun, 2020, at 21:13, Mathieu Poirier mathieu.poirier@linaro.org=
 wrote:

> On Tue, 16 Jun 2020 at 11:19, Cl=C3=A9ment Leger <cleger@kalray.eu> wrote=
:
>>
>> Hi Mathieu,
>>
>> ----- On 16 Jun, 2020, at 19:10, Mathieu Poirier mathieu.poirier@linaro.=
org
>> wrote:
>>
>> > Hi Cl=C3=A9ment,
>> >
>> > On Thu, Jun 11, 2020 at 08:50:12PM +0200, Clement Leger wrote:
>> >> rpmsg_core allows to override driver using driver_override sysfs
>> >> attribute. When used, the sysfs store function will duplicate the use=
r
>> >> provided string using kstrndup. However, when the rpdev is released,
>> >> the driver_override attribute is not freed. In order to have a
>> >> consistent allocation and release, use kstrdup in
>> >> rpmsg_chrdev_register_device and move it in rpmsg_core.c to avoid
>> >> header dependencies. Moreover, add a rpmsg_release_device function to
>> >> be called in device release. Drivers using rpmsg have been modified t=
o
>> >> use this function and ensure there will be no more memory leak when
>> >> releasing rpmsg devices.
>> >> This was found with kmemleak while using remoteproc and virtio.
>> >>
>> >> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> >> ---
>> >>  drivers/rpmsg/qcom_glink_native.c |  1 +
>> >>  drivers/rpmsg/qcom_smd.c          |  1 +
>> >>  drivers/rpmsg/rpmsg_core.c        | 22 ++++++++++++++++++++++
>> >>  drivers/rpmsg/rpmsg_internal.h    | 15 ++-------------
>> >>  drivers/rpmsg/virtio_rpmsg_bus.c  |  1 +
>> >>  5 files changed, 27 insertions(+), 13 deletions(-)
>> >>
>> >> diff --git a/drivers/rpmsg/qcom_glink_native.c
>> >> b/drivers/rpmsg/qcom_glink_native.c
>> >> index 1995f5b3ea67..076997afc638 100644
>> >> --- a/drivers/rpmsg/qcom_glink_native.c
>> >> +++ b/drivers/rpmsg/qcom_glink_native.c
>> >> @@ -1373,6 +1373,7 @@ static void qcom_glink_rpdev_release(struct dev=
ice *dev)
>> >>      struct glink_channel *channel =3D to_glink_channel(rpdev->ept);
>> >>
>> >>      channel->rpdev =3D NULL;
>> >> +    rpmsg_release_device(rpdev);
>> >>      kfree(rpdev);
>> >>  }
>> >>
>> >> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> >> index 4abbeea782fa..f01174d0d4d9 100644
>> >> --- a/drivers/rpmsg/qcom_smd.c
>> >> +++ b/drivers/rpmsg/qcom_smd.c
>> >> @@ -1047,6 +1047,7 @@ static void qcom_smd_release_device(struct devi=
ce *dev)
>> >>      struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
>> >>      struct qcom_smd_device *qsdev =3D to_smd_device(rpdev);
>> >>
>> >> +    rpmsg_release_device(rpdev);
>> >>      kfree(qsdev);
>> >>  }
>> >>
>> >> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> >> index a6361cad608b..31de89c81b27 100644
>> >> --- a/drivers/rpmsg/rpmsg_core.c
>> >> +++ b/drivers/rpmsg/rpmsg_core.c
>> >> @@ -554,6 +554,28 @@ int rpmsg_unregister_device(struct device *paren=
t,
>> >>  }
>> >>  EXPORT_SYMBOL(rpmsg_unregister_device);
>> >>
>> >> +void rpmsg_release_device(struct rpmsg_device *rpdev)
>> >> +{
>> >> +    kfree(rpdev->driver_override);
>> >> +}
>> >> +EXPORT_SYMBOL(rpmsg_release_device);
>> >> +
>> >> +/**
>> >> + * rpmsg_chrdev_register_device() - register chrdev device based on =
rpdev
>> >> + * @rpdev:  prepared rpdev to be used for creating endpoints
>> >> + *
>> >> + * This function wraps rpmsg_register_device() preparing the rpdev f=
or use as
>> >> + * basis for the rpmsg chrdev.
>> >> + */
>> >> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
>> >> +{
>> >> +    strcpy(rpdev->id.name, "rpmsg_chrdev");
>> >> +    rpdev->driver_override =3D kstrdup("rpmsg_chrdev", GFP_KERNEL);
>> >
>> > Have you considered using devm_kstrdup() instead?  Since the same rpde=
v is
>> > available here and in field##_store(), proceeding that way would preve=
nt the
>> > need to add a new rpmsg_release_device() function.  Depending on heade=
r
>> > dependencies rpmsg_chrdev_register_device() may also be able to remain=
 in
>> > rpmsg_internal.h.
>>
>> Indeed, using devm_kstrdup would be better. Regarding the use of kstrdup=
 in
>> headers, I only found a really really few occurences of such usage in th=
e
>> whole kernel. If you think it's ok, I can go go with it though.
>=20
> I don't see an issue with using devm_kstrdup() in a header file.

Ok, anyway after looking more thoroughly in using devm_kstrndup, it will
be possible to make the modification really localized in sysfs store only.
I just have to add devm_kstrndup which does not exists yet.

>=20
>>
>> Thanks,
>>
>> Cl=C3=A9ment
>>
>> >
>> > Thanks,
>> > Mathieu
>> >
>> >> +
>> >> +    return rpmsg_register_device(rpdev);
>> >> +}
>> >> +EXPORT_SYMBOL(rpmsg_chrdev_register_device);
>> >> +
>> >>  /**
>> >>   * __register_rpmsg_driver() - register an rpmsg driver with the rpm=
sg bus
>> >>   * @rpdrv: pointer to a struct rpmsg_driver
>> >> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_int=
ernal.h
>> >> index 3fc83cd50e98..043b28f912fd 100644
>> >> --- a/drivers/rpmsg/rpmsg_internal.h
>> >> +++ b/drivers/rpmsg/rpmsg_internal.h
>> >> @@ -75,19 +75,8 @@ int rpmsg_unregister_device(struct device *parent,
>> >>  struct device *rpmsg_find_device(struct device *parent,
>> >>                               struct rpmsg_channel_info *chinfo);
>> >>
>> >> -/**
>> >> - * rpmsg_chrdev_register_device() - register chrdev device based on =
rpdev
>> >> - * @rpdev:  prepared rpdev to be used for creating endpoints
>> >> - *
>> >> - * This function wraps rpmsg_register_device() preparing the rpdev f=
or use as
>> >> - * basis for the rpmsg chrdev.
>> >> - */
>> >> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *=
rpdev)
>> >> -{
>> >> -    strcpy(rpdev->id.name, "rpmsg_chrdev");
>> >> -    rpdev->driver_override =3D "rpmsg_chrdev";
>> >> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev);
>> >>
>> >> -    return rpmsg_register_device(rpdev);
>> >> -}
>> >> +void rpmsg_release_device(struct rpmsg_device *rpdev);
>> >>
>> >>  #endif
>> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_=
rpmsg_bus.c
>> >> index 07d4f3374098..af4ea6170f89 100644
>> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> >> @@ -381,6 +381,7 @@ static void virtio_rpmsg_release_device(struct de=
vice *dev)
>> >>      struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
>> >>      struct virtio_rpmsg_channel *vch =3D to_virtio_rpmsg_channel(rpd=
ev);
>> >>
>> >> +    rpmsg_release_device(rpdev);
>> >>      kfree(vch);
>> >>  }
>> >>
>> >> --
> > >> 2.17.1
