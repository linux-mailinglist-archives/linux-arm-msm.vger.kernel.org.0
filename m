Return-Path: <linux-arm-msm+bounces-21566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C728FAEEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CCCFB23DD4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 09:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B051D143C4C;
	Tue,  4 Jun 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RE3DV9PC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6175C143C41
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717493674; cv=none; b=kVR3UWGs5UzBGoewQu1PxKpO55R4E1L1hTUJxzELX1wMVQAkIeflA6qIU6qcBH9R++lgu43w1oDbXVi9DuXcFFwLlZmqtmfWTnKebkzSMKYoKBsVDKMGxd/JsonT6rg9Ld7IjgfTIcuphRMpLwsCgsbzvVmd+541QJY0OOcC7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717493674; c=relaxed/simple;
	bh=gJAdKcRuNMQW2l9HW8qdO/Tj6cHdhSHHZGZ7EJMDVDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRmJMwOp4nfjztbZu3oYT2qJ1qHHyvWsjU7RY5fBjjwgATCfj6+bJoZlogqsJaqOjGaIAntBFDC9y4DLNeTeHiouZA3uxCE59edh1qXjntYmU8vIpFuZl1X8k0LDCE2qXPCDBibefw1Ti1ZZDRHAZybDWuEARBga96Bx+6GTr4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RE3DV9PC; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfa682a4025so4814020276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717493671; x=1718098471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjUiMjbQYKJ3oAn33XJLeAigCffOjsG9ikaBsqFwqOk=;
        b=RE3DV9PCuMWq+lDOmn4KF839+/5+q+9yH7mQyR/PTK7l67GcvRYSPgdJ9yIuJkIf+H
         UcJzH7u4MXYgzwNYdQDrQDKGLuryGWyW4o5d2YpkMozNUdZVLyTeWm+6Pxq0NF/af0V+
         +kDAmQ9PYtIg232JghNTCsv8Mb1RtNoY85u5dfkZyhlHdI0i41sngTynSF/QQOv1ZREU
         gqemexARH93dPeKc8lxgIgFm1Vf87eR0FdgjeCmkFeZSh/WzschfHzHBuVLVlhdBUAVT
         aGmMjNdwR2334tpUaHYvt5lbk6OVCSNThGA3rgMyG0+8DRt11P5MeHjSI+aWdi7gQGJx
         t/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717493671; x=1718098471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjUiMjbQYKJ3oAn33XJLeAigCffOjsG9ikaBsqFwqOk=;
        b=gmlCqdXWvDFLy2W9GRGHjofMQB+BSGtf1ijEDlmLKUX3wE0B+CdNPPluPHpawO4OTf
         Q7ggDMmqg/6IQ5eCJRRAje2XPiWwMCq5AjvHmHmM8BY40kshumc+mXzwFN50jR6SjN/Q
         2OL/eFge9abM3+O7ZvWn/4P629gA64yKelOY78WqD7eGgUl9vtJXgN+KBIpPMKIPNqTe
         aNF9sZY6z97gtG+FxbTkxIRB0DMAK6RoJSpM9XI+wDuoNSJkwJhQau3XKYGOwuGV+ndz
         GB+l3ju5JS2VdsSMv4YLgohv3S7uAlX0Yh2ty0jrA2UR7dCDdZrKlq/c9oq7THEay/e1
         krbw==
X-Forwarded-Encrypted: i=1; AJvYcCUQlTeng6xF+xOT0hsKJ2a2gK0T5KexDDXJ+4McxpCF7NR18D/Z53FIF2goZG+oZrf1unX/pJfU9h8sobUdB6wKMsUlKN97wfr4s2pwvA==
X-Gm-Message-State: AOJu0YxWeBSZ9BJ+7nv8eoJxAKTvzOFP4yzjDYYjgRB9Z2NlNjte+Vjg
	7aVGYdfngYuQx+DiIw3E8pCqnwNBa+L8ICCmnWSRO0f3zv8cv4l5N4jxIV3e4tVSYLqNWFVQF4j
	GKXnXMWKsVRlG42ncpm4AJkn3+QgnpBjfeCPGIA==
X-Google-Smtp-Source: AGHT+IHrvxBMm7Xf/LeuMbr29HzpprNLKO736EJNVQsIeub3Kz4JKrX20s4kWx2XOkZcvQ0lrRWwyftI0/YuvbUz1bA=
X-Received: by 2002:a5b:bd1:0:b0:de5:4b1f:7e00 with SMTP id
 3f1490d57ef6-dfa73bf3832mr11005822276.15.1717493671164; Tue, 04 Jun 2024
 02:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-5-quic_ekangupt@quicinc.com> <f0dbb385-6aea-4721-92fa-a1f560fc7c5a@linaro.org>
 <2f52b206-3fd9-4508-b9bd-23efc5fb637e@quicinc.com>
In-Reply-To: <2f52b206-3fd9-4508-b9bd-23efc5fb637e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jun 2024 12:34:19 +0300
Message-ID: <CAA8EJprGqUzgo7BN0LgoUy7APZuGBZkRdPJhwJyEQgtRmuAtAg@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] misc: fastrpc: Add static PD restart support
To: Bharath Kumar V <quic_bkumar@quicinc.com>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Ekansh Gupta <quic_ekangupt@quicinc.com>, 
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Jun 2024 at 12:23, Bharath Kumar V <quic_bkumar@quicinc.com> wrot=
e:
>
>
>
> On 6/3/2024 4:23 PM, Caleb Connolly wrote:
> > Hi Ekansh,
> >
> > On 30/05/2024 12:20, Ekansh Gupta wrote:
> >> Static PDs on the audio and sensor domains are expected to support
> >> PD restart. The kernel resource handling for the PDs are expected
> >> to be handled by fastrpc driver. For this, there is a requirement
> >> of PD service locator to get the event notifications for static PD
> >> services. Also when events are received, the driver needs to handle
> >> based on PD states. Added changes to add service locator for audio
> >> and sensor domain static PDs and handle the PD restart sequence.
> >
> > Thanks for the patch, I wanted to bring up a larger issue which I've
> > been noticing with the fastrpc driver.
> >
> > This file is now >2.5k LOC, and to my knowledge it features:
> >
> > * Two different memory mapping/unmapping interfaces to the DSP (three i=
f
> > you count dmabufs!)
> > * Different branching codepaths for static vs dynamic processes (with
> > totally different lifetimes).
> > * Over 8 structs just for state management, with the largest being >150=
0
> > bytes
> > * Zero context for which code paths are relevant for which contexts
> >
> > Your series is a combination of bug fixes and cleanup which span most o=
f
> > the file -- suggesting that the state management is also spread all ove
> > rthe file. Even for someone with some familiarity with the driver these
> > patches are really non-trivial to review (patch 5 being a good example
> > of this), while in addition you introduce new features like this in
> > patch. This doesn't make for a coherent story for reviewers.
> >
> > On top of that, there is very minimal, if any comments in this hugely
> > complex code, and seemingly zero consideration for how to model state o=
r
> > the lifetime of objects.
> >
> > Finally, there is next-to-no public documentation or easily obtained
> > (and used) userspace for this driver. Certainly nothing that I could us=
e
> > to offer a Tested-by on your patches.
> >
> > I am not the maintainer, so while it's not my place, I want to offer
> > some suggestions here:
> >
> > 1. Split the fastrpc driver up into more bite-size chunks which can
> > actually be reasoned about (I would start by splitting the
> > implementation details out from the business logic, and then further
> > abstracting out the static PD support, PDR, etc. Just the "invoke"
> > mechanism should be in it's own file with it's own state...).
> >
> > 2. Add detailed documentation explaining fastrpc from at least a high
> > level (ideally with lower level and driver details too), and code
> > comments (where relevant).
> >
> > 3. Release (and maintain) a reference tool(s) that can be used to
> > validate the driver and better understand proposed new features (you
> > could take inspiration from https://gitlab.com/flamingradian/sensh/).
> >
> > A mechanism to test at least parts of this driver without needing a DSP
> > on the other end would likely help a lot here, but that's obviously a
> > much larger scope.
> >
> > Please let me know your thoughts.
> >
> > Kind Regards,
>
> Thank you for reviewing the driver and the patches. Your feedback is
> greatly appreciated.
> As you mentioned, our current driver is a large file containing various
> APIs to support multiple features. We are actively discussing
> modularizing the driver to enhance clarity and improve understanding.

Please consider dropping the FastRPC interface completely and
switching to drm/accel instead. This is the API that should be used by
accelerators (including, but not limited to AI accelerators).

> Additionally, we are in the process of creating basic documentation, as
> well as feature-specific documentation for better clarity.
> Our latest user space code is available on GitHub at
> github.com/quic/fastrpc. Feel free to explore it, and please let us know
> if you have any feedback or need further assistance. We=E2=80=99re commit=
ted to
> continuous improvement.

Note, this is not what is usually expected from open source. This is
just a code drop, dumped to a git repository. It doesn't have
development history, it doesn't answer the most typical comment that
we as open source developers have: "why was it developed in this
way?". Please consider replacing this code drop with the Git tree that
contains development history.

> For testing purposes, we=E2=80=99ve the Hexagon SDK by Qualcomm to the pu=
blic.
> You can download it from the Qualcomm developer network.

What is the licence for the SDK? What is the licence for the binaries
(including skel.so) generated using the SDK?
Is there an open-source toolchain?
The requirement for any kernel driver using dma-buf is to have
completely functional open source userspace implementation (it doesn't
have to be fully optimal or exercise all hardware features, but it
should be possible to understand what is being passed around and how
the user API interface is supposed to work.

> The SDK
> includes examples covering all the features of fastRPC, along with
> comprehensive documentation. If you encounter any issues accessing the
> Hexagon SDK or have suggestions for improving the documentation, feel
> free to reach out.

A typical problem that we have is if it is possible to integrate
userspace tools into an OE build infrastructure. We want to be able to
build simple test programs and include them into OE images.

This requires being able to download the files without any additional
package managers or click-through licences.

>
> Best Regards,
> Bharath
>
> >>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>   drivers/misc/Kconfig   |   2 +
> >>   drivers/misc/fastrpc.c | 205 ++++++++++++++++++++++++++++++++++++++-=
--
> >>   2 files changed, 195 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> >> index faf983680040..e2d83cd085b5 100644
> >> --- a/drivers/misc/Kconfig
> >> +++ b/drivers/misc/Kconfig
> >> @@ -280,8 +280,10 @@ config QCOM_FASTRPC
> >>       tristate "Qualcomm FastRPC"
> >>       depends on ARCH_QCOM || COMPILE_TEST
> >>       depends on RPMSG
> >> +    depends on NET
> >>       select DMA_SHARED_BUFFER
> >>       select QCOM_SCM
> >> +    select QCOM_PDR_HELPERS
> >>       help
> >>         Provides a communication mechanism that allows for clients to
> >>         make remote method invocations across processor boundary to
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 3e1ab58038ed..d115860fc356 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -22,6 +22,7 @@
> >>   #include <linux/firmware/qcom/qcom_scm.h>
> >>   #include <uapi/misc/fastrpc.h>
> >>   #include <linux/of_reserved_mem.h>
> >> +#include <linux/soc/qcom/pdr.h>
> >>   #define ADSP_DOMAIN_ID (0)
> >>   #define MDSP_DOMAIN_ID (1)
> >> @@ -29,6 +30,7 @@
> >>   #define CDSP_DOMAIN_ID (3)
> >>   #define FASTRPC_DEV_MAX        4 /* adsp, mdsp, slpi, cdsp*/
> >>   #define FASTRPC_MAX_SESSIONS    14
> >> +#define FASTRPC_MAX_SPD        4
> >>   #define FASTRPC_MAX_VMIDS    16
> >>   #define FASTRPC_ALIGN        128
> >>   #define FASTRPC_MAX_FDLIST    16
> >> @@ -105,6 +107,18 @@
> >>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device,
> >> miscdev)
> >> +#define AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME   "audio_pdr_adsp"
> >> +#define AUDIO_PDR_ADSP_SERVICE_NAME              "avs/audio"
> >> +#define ADSP_AUDIOPD_NAME                        "msm/adsp/audio_pd"
> >> +
> >> +#define SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME
> >> "sensors_pdr_adsp"
> >> +#define SENSORS_PDR_ADSP_SERVICE_NAME              "tms/servreg"
> >> +#define ADSP_SENSORPD_NAME                       "msm/adsp/sensor_pd"
> >> +
> >> +#define SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME "sensors_pdr_sl=
pi"
> >> +#define SENSORS_PDR_SLPI_SERVICE_NAME
> >> SENSORS_PDR_ADSP_SERVICE_NAME
> >> +#define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
> >> +
> >>   static const char *domains[FASTRPC_DEV_MAX] =3D { "adsp", "mdsp",
> >>                           "sdsp", "cdsp"};
> >>   struct fastrpc_phy_page {
> >> @@ -259,6 +273,15 @@ struct fastrpc_session_ctx {
> >>       bool valid;
> >>   };
> >> +struct fastrpc_static_pd {
> >> +    char *servloc_name;
> >> +    char *spdname;
> >> +    void *pdrhandle;
> >> +    struct fastrpc_channel_ctx *cctx;
> >> +    struct fastrpc_user *fl;
> >> +    bool ispdup;
> >> +};
> >> +
> >>   struct fastrpc_channel_ctx {
> >>       int domain_id;
> >>       int sesscount;
> >> @@ -266,6 +289,7 @@ struct fastrpc_channel_ctx {
> >>       struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
> >>       struct rpmsg_device *rpdev;
> >>       struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
> >> +    struct fastrpc_static_pd spd[FASTRPC_MAX_SPD];
> >>       spinlock_t lock;
> >>       struct idr ctx_idr;
> >>       struct list_head users;
> >> @@ -297,10 +321,12 @@ struct fastrpc_user {
> >>       struct fastrpc_channel_ctx *cctx;
> >>       struct fastrpc_session_ctx *sctx;
> >>       struct fastrpc_buf *init_mem;
> >> +    struct fastrpc_static_pd *spd;
> >>       int tgid;
> >>       int pd;
> >>       bool is_secure_dev;
> >> +    char *servloc_name;
> >>       /* Lock for lists */
> >>       spinlock_t lock;
> >>       /* lock for allocations */
> >> @@ -1230,12 +1256,33 @@ static bool is_session_rejected(struct
> >> fastrpc_user *fl, bool unsigned_pd_reques
> >>       return false;
> >>   }
> >> +static struct fastrpc_static_pd *fastrpc_get_spd_session(
> >> +                struct fastrpc_user *fl)
> >> +{
> >> +    int i;
> >> +    struct fastrpc_static_pd *spd =3D NULL;
> >> +    struct fastrpc_channel_ctx *cctx =3D fl->cctx;
> >> +
> >> +    for (i =3D 0; i < FASTRPC_MAX_SPD ; i++) {
> >> +        if (!cctx->spd[i].servloc_name)
> >> +            continue;
> >> +        if (!strcmp(fl->servloc_name, cctx->spd[i].servloc_name)) {
> >> +            spd =3D &cctx->spd[i];
> >> +            spd->fl =3D fl;
> >> +            break;
> >> +        }
> >> +    }
> >> +
> >> +    return spd;
> >> +}
> >> +
> >>   static int fastrpc_init_create_static_process(struct fastrpc_user *f=
l,
> >>                             char __user *argp)
> >>   {
> >>       struct fastrpc_init_create_static init;
> >>       struct fastrpc_invoke_args *args;
> >>       struct fastrpc_phy_page pages[1];
> >> +    struct fastrpc_static_pd *spd =3D NULL;
> >>       char *name;
> >>       int err;
> >>       struct {
> >> @@ -1270,6 +1317,19 @@ static int
> >> fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>           goto err_name;
> >>       }
> >> +    fl->servloc_name =3D AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME;
> >> +
> >> +    spd =3D fastrpc_get_spd_session(fl);
> >> +    if (!spd) {
> >> +        err =3D -EUSERS;
> >> +        goto err_name;
> >> +    }
> >> +
> >> +    if (!spd->ispdup) {
> >> +        err =3D -ENOTCONN;
> >> +        goto err_name;
> >> +    }
> >> +    fl->spd =3D spd;
> >>       if (!fl->cctx->remote_heap) {
> >>           err =3D fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.me=
mlen,
> >>                           &fl->cctx->remote_heap);
> >> @@ -1645,6 +1705,7 @@ static int fastrpc_dmabuf_alloc(struct
> >> fastrpc_user *fl, char __user *argp)
> >>   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
> >>   {
> >>       struct fastrpc_invoke_args args[1];
> >> +    struct fastrpc_static_pd *spd =3D NULL;
> >>       int tgid =3D fl->tgid;
> >>       u32 sc;
> >> @@ -1654,6 +1715,22 @@ static int fastrpc_init_attach(struct
> >> fastrpc_user *fl, int pd)
> >>       sc =3D FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> >>       fl->pd =3D pd;
> >> +    if (pd =3D=3D SENSORS_PD) {
> >> +        if (fl->cctx->domain_id =3D=3D ADSP_DOMAIN_ID)
> >> +            fl->servloc_name =3D
> >> SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME;
> >> +        else if (fl->cctx->domain_id =3D=3D SDSP_DOMAIN_ID)
> >> +            fl->servloc_name =3D
> >> SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME;
> >> +
> >> +        spd =3D fastrpc_get_spd_session(fl);
> >> +        if (!spd)
> >> +            return -EUSERS;
> >> +
> >> +        if (!spd->ispdup)
> >> +            return -ENOTCONN;
> >> +
> >> +        fl->spd =3D spd;
> >> +    }
> >> +
> >>       return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >>                          sc, &args[0]);
> >>   }
> >> @@ -2129,6 +2206,64 @@ static long fastrpc_device_ioctl(struct file
> >> *file, unsigned int cmd,
> >>       return err;
> >>   }
> >> +static void fastrpc_notify_users(struct fastrpc_user *user)
> >> +{
> >> +    struct fastrpc_invoke_ctx *ctx;
> >> +
> >> +    spin_lock(&user->lock);
> >> +    list_for_each_entry(ctx, &user->pending, node) {
> >> +        ctx->retval =3D -EPIPE;
> >> +        complete(&ctx->work);
> >> +    }
> >> +    spin_unlock(&user->lock);
> >> +}
> >> +
> >> +static void fastrpc_notify_pdr_drivers(struct fastrpc_channel_ctx *cc=
tx,
> >> +        char *servloc_name)
> >> +{
> >> +    struct fastrpc_user *fl;
> >> +    unsigned long flags;
> >> +
> >> +    spin_lock_irqsave(&cctx->lock, flags);
> >> +    list_for_each_entry(fl, &cctx->users, user) {
> >> +        if (fl->servloc_name && !strcmp(servloc_name, fl->servloc_nam=
e))
> >> +            fastrpc_notify_users(fl);
> >> +    }
> >> +    spin_unlock_irqrestore(&cctx->lock, flags);
> >> +}
> >> +
> >> +static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
> >> +{
> >> +    struct fastrpc_static_pd *spd =3D (struct fastrpc_static_pd *)pri=
v;
> >> +    struct fastrpc_channel_ctx *cctx;
> >> +
> >> +    if (!spd)
> >> +        return;
> >> +
> >> +    cctx =3D spd->cctx;
> >> +    switch (state) {
> >> +    case SERVREG_SERVICE_STATE_DOWN:
> >> +        dev_info(&cctx->rpdev->dev,
> >> +            "%s: %s (%s) is down for PDR on %s\n",
> >> +            __func__, spd->spdname,
> >> +            spd->servloc_name,
> >> +            domains[cctx->domain_id]);
> >> +        spd->ispdup =3D false;
> >> +        fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
> >> +        break;
> >> +    case SERVREG_SERVICE_STATE_UP:
> >> +        dev_info(&cctx->rpdev->dev,
> >> +            "%s: %s (%s) is up for PDR on %s\n",
> >> +            __func__, spd->spdname,
> >> +            spd->servloc_name,
> >> +            domains[cctx->domain_id]);
> >> +        spd->ispdup =3D true;
> >> +        break;
> >> +    default:
> >> +        break;
> >> +    }
> >> +}
> >> +
> >>   static const struct file_operations fastrpc_fops =3D {
> >>       .open =3D fastrpc_device_open,
> >>       .release =3D fastrpc_device_release,
> >> @@ -2248,6 +2383,39 @@ static int fastrpc_device_register(struct
> >> device *dev, struct fastrpc_channel_ct
> >>       return err;
> >>   }
> >> +static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx
> >> *cctx, char *client_name,
> >> +            char *service_name, char *service_path, int domain, int
> >> spd_session)
> >> +{
> >> +    int err =3D 0;
> >> +    struct pdr_handle *handle =3D NULL;
> >> +    struct pdr_service *service =3D NULL;
> >> +
> >> +    /* Register the service locator's callback function */
> >> +    handle =3D pdr_handle_alloc(fastrpc_pdr_cb, &cctx->spd[spd_sessio=
n]);
> >> +    if (IS_ERR(handle)) {
> >> +        err =3D PTR_ERR(handle);
> >> +        goto bail;
> >> +    }
> >> +    cctx->spd[spd_session].pdrhandle =3D handle;
> >> +    cctx->spd[spd_session].servloc_name =3D client_name;
> >> +    cctx->spd[spd_session].spdname =3D service_path;
> >> +    cctx->spd[spd_session].cctx =3D cctx;
> >> +    service =3D pdr_add_lookup(handle, service_name, service_path);
> >> +    if (IS_ERR(service)) {
> >> +        err =3D PTR_ERR(service);
> >> +        goto bail;
> >> +    }
> >> +    pr_info("fastrpc: %s: pdr_add_lookup enabled for %s (%s, %s)\n",
> >> +        __func__, service_name, client_name, service_path);
> >> +
> >> +bail:
> >> +    if (err) {
> >> +        pr_warn("fastrpc: %s: failed for %s (%s, %s)with err %d\n",
> >> +                __func__, service_name, client_name, service_path, er=
r);
> >> +    }
> >> +    return err;
> >> +}
> >> +
> >>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >>   {
> >>       struct device *rdev =3D &rpdev->dev;
> >> @@ -2326,6 +2494,25 @@ static int fastrpc_rpmsg_probe(struct
> >> rpmsg_device *rpdev)
> >>           goto fdev_error;
> >>       }
> >> +    if (domain_id =3D=3D ADSP_DOMAIN_ID) {
> >> +        err =3D fastrpc_setup_service_locator(data,
> >> AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME,
> >> +            AUDIO_PDR_ADSP_SERVICE_NAME, ADSP_AUDIOPD_NAME,
> >> domain_id, 0);
> >> +        if (err)
> >> +            goto populate_error;
> >> +
> >> +        err =3D fastrpc_setup_service_locator(data,
> >> +            SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME,
> >> +            SENSORS_PDR_ADSP_SERVICE_NAME, ADSP_SENSORPD_NAME,
> >> domain_id, 1);
> >> +        if (err)
> >> +            goto populate_error;
> >> +    } else if (domain_id =3D=3D SDSP_DOMAIN_ID) {
> >> +        err =3D fastrpc_setup_service_locator(data,
> >> +            SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME,
> >> +            SENSORS_PDR_SLPI_SERVICE_NAME, SLPI_SENSORPD_NAME,
> >> domain_id, 0);
> >> +        if (err)
> >> +            goto populate_error;
> >> +    }
> >> +
> >>       kref_init(&data->refcount);
> >>       dev_set_drvdata(&rpdev->dev, data);
> >> @@ -2355,24 +2542,13 @@ static int fastrpc_rpmsg_probe(struct
> >> rpmsg_device *rpdev)
> >>       return err;
> >>   }
> >> -static void fastrpc_notify_users(struct fastrpc_user *user)
> >> -{
> >> -    struct fastrpc_invoke_ctx *ctx;
> >> -
> >> -    spin_lock(&user->lock);
> >> -    list_for_each_entry(ctx, &user->pending, node) {
> >> -        ctx->retval =3D -EPIPE;
> >> -        complete(&ctx->work);
> >> -    }
> >> -    spin_unlock(&user->lock);
> >> -}
> >> -
> >>   static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
> >>   {
> >>       struct fastrpc_channel_ctx *cctx =3D dev_get_drvdata(&rpdev->dev=
);
> >>       struct fastrpc_buf *buf, *b;
> >>       struct fastrpc_user *user;
> >>       unsigned long flags;
> >> +    int i;
> >>       /* No invocations past this point */
> >>       spin_lock_irqsave(&cctx->lock, flags);
> >> @@ -2393,6 +2569,11 @@ static void fastrpc_rpmsg_remove(struct
> >> rpmsg_device *rpdev)
> >>       if (cctx->remote_heap)
> >>           fastrpc_buf_free(cctx->remote_heap);
> >> +    for (i =3D 0; i < FASTRPC_MAX_SPD; i++) {
> >> +        if (cctx->spd[i].pdrhandle)
> >> +            pdr_handle_release(cctx->spd[i].pdrhandle);
> >> +    }
> >> +
> >>       of_platform_depopulate(&rpdev->dev);
> >>       fastrpc_channel_ctx_put(cctx);
> >



--=20
With best wishes
Dmitry

