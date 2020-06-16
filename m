Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926311FBCAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 19:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgFPRTr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 13:19:47 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:36548 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgFPRTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 13:19:47 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id AD54027E0DCF;
        Tue, 16 Jun 2020 19:19:45 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id xuJ4XXtLGiIV; Tue, 16 Jun 2020 19:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1A13E27E0E1C;
        Tue, 16 Jun 2020 19:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1A13E27E0E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1592327985;
        bh=RJx8rdTmBEGjGF7+meLMqUMFBM+UIVoG0vgdabAHYGI=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=mx9JATAnjdUh28JDX+vo1ed+ISscZOInjvN+FqtSEKVJ1qyryH4wuqmJVV9Qa6oQ0
         UqUfBwRpdEgAp0xj0k8K9QFJR/qMMO5FonQ3wnpNAkUdkM37D7a72sE1Sdot2Q58Dc
         2OTzD2fJewNI4lTreqISpJDcTSyuypAn6C5hU9eI=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5umFI8WMxyVv; Tue, 16 Jun 2020 19:19:45 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 0421327E0DCF;
        Tue, 16 Jun 2020 19:19:45 +0200 (CEST)
Date:   Tue, 16 Jun 2020 19:19:44 +0200 (CEST)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1643320865.7759489.1592327984836.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200616171011.GA461427@xps15>
References: <20200611185012.23815-1-cleger@kalray.eu> <20200616171011.GA461427@xps15>
Subject: Re: [PATCH] rpmsg: fix driver_override memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC81 (Linux)/8.8.15_GA_3895)
Thread-Topic: rpmsg: fix driver_override memory leak
Thread-Index: Q4cxPoNNoJgdXDXKUVTMTEQx1KTYvQ==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

----- On 16 Jun, 2020, at 19:10, Mathieu Poirier mathieu.poirier@linaro.org=
 wrote:

> Hi Cl=C3=A9ment,
>=20
> On Thu, Jun 11, 2020 at 08:50:12PM +0200, Clement Leger wrote:
>> rpmsg_core allows to override driver using driver_override sysfs
>> attribute. When used, the sysfs store function will duplicate the user
>> provided string using kstrndup. However, when the rpdev is released,
>> the driver_override attribute is not freed. In order to have a
>> consistent allocation and release, use kstrdup in
>> rpmsg_chrdev_register_device and move it in rpmsg_core.c to avoid
>> header dependencies. Moreover, add a rpmsg_release_device function to
>> be called in device release. Drivers using rpmsg have been modified to
>> use this function and ensure there will be no more memory leak when
>> releasing rpmsg devices.
>> This was found with kmemleak while using remoteproc and virtio.
>>=20
>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> ---
>>  drivers/rpmsg/qcom_glink_native.c |  1 +
>>  drivers/rpmsg/qcom_smd.c          |  1 +
>>  drivers/rpmsg/rpmsg_core.c        | 22 ++++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h    | 15 ++-------------
>>  drivers/rpmsg/virtio_rpmsg_bus.c  |  1 +
>>  5 files changed, 27 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/rpmsg/qcom_glink_native.c
>> b/drivers/rpmsg/qcom_glink_native.c
>> index 1995f5b3ea67..076997afc638 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -1373,6 +1373,7 @@ static void qcom_glink_rpdev_release(struct device=
 *dev)
>>  =09struct glink_channel *channel =3D to_glink_channel(rpdev->ept);
>> =20
>>  =09channel->rpdev =3D NULL;
>> +=09rpmsg_release_device(rpdev);
>>  =09kfree(rpdev);
>>  }
>> =20
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index 4abbeea782fa..f01174d0d4d9 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -1047,6 +1047,7 @@ static void qcom_smd_release_device(struct device =
*dev)
>>  =09struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
>>  =09struct qcom_smd_device *qsdev =3D to_smd_device(rpdev);
>> =20
>> +=09rpmsg_release_device(rpdev);
>>  =09kfree(qsdev);
>>  }
>> =20
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index a6361cad608b..31de89c81b27 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -554,6 +554,28 @@ int rpmsg_unregister_device(struct device *parent,
>>  }
>>  EXPORT_SYMBOL(rpmsg_unregister_device);
>> =20
>> +void rpmsg_release_device(struct rpmsg_device *rpdev)
>> +{
>> +=09kfree(rpdev->driver_override);
>> +}
>> +EXPORT_SYMBOL(rpmsg_release_device);
>> +
>> +/**
>> + * rpmsg_chrdev_register_device() - register chrdev device based on rpd=
ev
>> + * @rpdev:=09prepared rpdev to be used for creating endpoints
>> + *
>> + * This function wraps rpmsg_register_device() preparing the rpdev for =
use as
>> + * basis for the rpmsg chrdev.
>> + */
>> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
>> +{
>> +=09strcpy(rpdev->id.name, "rpmsg_chrdev");
>> +=09rpdev->driver_override =3D kstrdup("rpmsg_chrdev", GFP_KERNEL);
>=20
> Have you considered using devm_kstrdup() instead?  Since the same rpdev i=
s
> available here and in field##_store(), proceeding that way would prevent =
the
> need to add a new rpmsg_release_device() function.  Depending on header
> dependencies rpmsg_chrdev_register_device() may also be able to remain in
> rpmsg_internal.h.

Indeed, using devm_kstrdup would be better. Regarding the use of kstrdup in
headers, I only found a really really few occurences of such usage in the
whole kernel. If you think it's ok, I can go go with it though.

Thanks,

Cl=C3=A9ment

>=20
> Thanks,
> Mathieu
>=20
>> +
>> +=09return rpmsg_register_device(rpdev);
>> +}
>> +EXPORT_SYMBOL(rpmsg_chrdev_register_device);
>> +
>>  /**
>>   * __register_rpmsg_driver() - register an rpmsg driver with the rpmsg =
bus
>>   * @rpdrv: pointer to a struct rpmsg_driver
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_intern=
al.h
>> index 3fc83cd50e98..043b28f912fd 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -75,19 +75,8 @@ int rpmsg_unregister_device(struct device *parent,
>>  struct device *rpmsg_find_device(struct device *parent,
>>  =09=09=09=09 struct rpmsg_channel_info *chinfo);
>> =20
>> -/**
>> - * rpmsg_chrdev_register_device() - register chrdev device based on rpd=
ev
>> - * @rpdev:=09prepared rpdev to be used for creating endpoints
>> - *
>> - * This function wraps rpmsg_register_device() preparing the rpdev for =
use as
>> - * basis for the rpmsg chrdev.
>> - */
>> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpd=
ev)
>> -{
>> -=09strcpy(rpdev->id.name, "rpmsg_chrdev");
>> -=09rpdev->driver_override =3D "rpmsg_chrdev";
>> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev);
>> =20
>> -=09return rpmsg_register_device(rpdev);
>> -}
>> +void rpmsg_release_device(struct rpmsg_device *rpdev);
>> =20
>>  #endif
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpm=
sg_bus.c
>> index 07d4f3374098..af4ea6170f89 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -381,6 +381,7 @@ static void virtio_rpmsg_release_device(struct devic=
e *dev)
>>  =09struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
>>  =09struct virtio_rpmsg_channel *vch =3D to_virtio_rpmsg_channel(rpdev);
>> =20
>> +=09rpmsg_release_device(rpdev);
>>  =09kfree(vch);
>>  }
>> =20
>> --
>> 2.17.1
