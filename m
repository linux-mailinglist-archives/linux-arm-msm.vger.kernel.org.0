Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA9E717EB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 13:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbjEaLok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 07:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbjEaLoi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 07:44:38 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65974E5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 04:44:37 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96f818c48fbso997257266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685533475; x=1688125475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svKD27iZMk4zyWq87M1jIaqad9dY92z+5caQ3b4G/Oo=;
        b=lkOSzA3x66/W0DJhOWpWsvZZMMcnJu851cgoRTjaqDtyIEYaOT4MMjDhn9qXFoeC3N
         xdC+rI6wDrFHCxySubqwCx+WqGM6wgreQ2kaHDdzKGtKKuF6MchkJ+W1Dxy4z7KRHSnF
         0nU9PSDgX+UEw4bb3CWXBeO+qJpPiJ9+zA5oJBKLQBrYPtgkizHLzX+sb6DGtTxMJTAc
         ZgVM7CvE+zaF65G09fAqm1Z9CK94ttVBxBxDorADkIbc4Rczao/qbwURELJYPYhjG563
         nNvDUN+Nnb3Q/DslVTr0sf7F80kRNJiwqacBAr0+0qKftfyh+XwvZwC5UzhuwDV4dGAk
         k0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685533475; x=1688125475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svKD27iZMk4zyWq87M1jIaqad9dY92z+5caQ3b4G/Oo=;
        b=ee3qNjBWwR3SwbxbtwPbBUlt18hotqaSts3nEFCJXR4SmdIjh7JSOh+UfZ8riQhuo3
         TUEilI1tPSvQG5ROeaZjOpW4lcGHEO0pkHBmhUimsGpFQz8PVatt9DQhgSXipvoFmibk
         ojTC7pkkbm3lrV6oBx6QIXI8dmYdcpy/NyoRhYj/SQlD7SAACNoRCpdRTvyLv6HhKtIK
         RFVvMxOrjC8N341sJ0IjhVgesySExzMJDvNumH/XD4DlzBRQJs8sLARyGExVGMm9p8yc
         mJyfwyzwrPKsjyP4QP2hu5XdKsGmtwBkXLHwd1gR4zN2wjlufwQT0tD1dfITtMxyV9vy
         UcQA==
X-Gm-Message-State: AC+VfDzBLOIGN6CTDYqI70pN9hpeu/CIHfNolbdhrBgiU6jSRfvYvyUb
        TuFe2B1Qr1PI+/0V9ENCeG37MGrUpTFyO/o0mrY=
X-Google-Smtp-Source: ACHHUZ5yQz8JQSWl1YMxa6iFOryzSAw5Tyfe214N6f4yEYnFbH7Zt2+DmSEYmJuDiMJ2DDby5IxAtKyrhRLfKArwKTQ=
X-Received: by 2002:a17:907:6e28:b0:94a:56ec:7f12 with SMTP id
 sd40-20020a1709076e2800b0094a56ec7f12mr5073041ejc.30.1685533475255; Wed, 31
 May 2023 04:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230530091340.3513141-1-dnlplm@gmail.com> <20230530103103.GB6379@thinkpad>
 <CAGRyCJGR4YsUgWekf_DgYHJqoXNfmFpL-N_virvqE18aU=Ovkg@mail.gmail.com> <20230530135620.GA2313@thinkpad>
In-Reply-To: <20230530135620.GA2313@thinkpad>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Wed, 31 May 2023 13:44:24 +0200
Message-ID: <CAGRyCJG6+k4PZq0V3h-c-SiEm_7ExjoACTtbgCOEeSt3AQjM3g@mail.gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: allow SBL as initial EE
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno mar 30 mag 2023 alle ore 15:56 Manivannan Sadhasivam
<mani@kernel.org> ha scritto:
>
> On Tue, May 30, 2023 at 01:12:59PM +0200, Daniele Palmas wrote:
> > Hi Mani,
> >
> > Il giorno mar 30 mag 2023 alle ore 12:31 Manivannan Sadhasivam
> > <mani@kernel.org> ha scritto:
> > >
> > > On Tue, May 30, 2023 at 11:13:40AM +0200, Daniele Palmas wrote:
> > > > There are situations in which SBL is a legitimate initial execution
> > > > environment (e.g. modem stuck in SBL due to a firmware failure...),=
 but
> > > > mhi refuses to start:
> > > >
> > > > mhi-pci-generic 0000:01:00.0: MHI PCI device found: foxconn-sdx55
> > > > mhi-pci-generic 0000:01:00.0: BAR 0: assigned
> > > > mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> > > > mhi mhi0: Requested to power ON
> > > > mhi mhi0: SECONDARY BOOTLOADER is not a valid EE for power on
> > > > mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> > > > mhi-pci-generic: probe of 0000:01:00.0 failed with error -5
> > > >
> > > > Fix this by adding SBL as an allowed initial execution environment.
> > > >
> > >
> > > What can you do with the modem when firmware failure happens? If ther=
e is a
> > > usecase, please explain.
> >
> > (removing Siddartha and Sujeev due to addresses not working)
> >
>
> Both left Qualcomm a while ago...
>
> > A possible scenario for a Telit modem not being able to go to mission
> > mode is when a firmware update does not work properly: in this case it
> > remains stuck in SBL, but the SAHARA device can be used for retrying
> > the firmware update.
> >
>
> So IIUC, while updating SBL over SAHARA channel, the firmware update coul=
d be
> corrupted and the device would get stuck in SBL EE. In that case, the SAH=
ARA
> channel exposed by PBL will still be open and that could be used to retry=
 the
> firmware update. Am I right?
>
> Looks like PBL is doing a fail safe upgrade!
>

Yes, the scenario is a broken firmware update.

Telit has implemented custom code in the SBL for allowing the firmware
update through a custom protocol using the SAHARA channels: this has
been mainly done to avoid sharing with customers Qualcomm IP about
firmware update, since it is usually problematic.

Firmware update is fail safe in the sense that it is guaranteed that
the modem will always power-up at least in SBL, in which the firmware
update can always be retried. I don't have the exact details of what
is happening inside the modem, but, if required, I can get them.

> > Telit FN990 supports the SAHARA channels in pci_generic. It's true
> > that there's still missing the exposed device for userspace, something
> > that we are currently managing with out of tree patches, but I see
> > that there's some ongoing effort for that
> > https://lore.kernel.org/mhi/20230522190459.13790-1-quic_jhugo@quicinc.c=
om/
> >
> > I'm not sure if non-Telit modems have other reasonable use-cases.
> >
>
> If my above understanding is correct, then this patch will benefit other
> platforms too.
>

Well... I can't comment on that, since I don't know if the above
described behavior is due to Telit custom SBL.

Anyway, maybe there could be other scenarios like, for example, modem
falling into core dump mode in a very early stage? Not sure...

Regards,
Daniele

> - Mani
>
> > Regards,
> > Daniele
> >
> > >
> > > - Mani
> > >
> > > > Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM oper=
ations")
> > > > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > > > ---
> > > >  drivers/bus/mhi/host/internal.h | 2 +-
> > > >  drivers/bus/mhi/host/pm.c       | 3 ++-
> > > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host=
/internal.h
> > > > index 2e139e76de4c..3bdcd2321aa5 100644
> > > > --- a/drivers/bus/mhi/host/internal.h
> > > > +++ b/drivers/bus/mhi/host/internal.h
> > > > @@ -56,7 +56,7 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
> > > >
> > > >  #define MHI_IN_PBL(ee) (ee =3D=3D MHI_EE_PBL || ee =3D=3D MHI_EE_P=
THRU || \
> > > >                       ee =3D=3D MHI_EE_EDL)
> > > > -#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee =3D=3D MHI_=
EE_AMSS)
> > > > +#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee =3D=3D MHI_=
EE_AMSS || ee =3D=3D MHI_EE_SBL)
> > > >  #define MHI_FW_LOAD_CAPABLE(ee) (ee =3D=3D MHI_EE_PBL || ee =3D=3D=
 MHI_EE_EDL)
> > > >  #define MHI_IN_MISSION_MODE(ee) (ee =3D=3D MHI_EE_AMSS || ee =3D=
=3D MHI_EE_WFW || \
> > > >                                ee =3D=3D MHI_EE_FP)
> > > > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> > > > index 083459028a4b..18872c5017be 100644
> > > > --- a/drivers/bus/mhi/host/pm.c
> > > > +++ b/drivers/bus/mhi/host/pm.c
> > > > @@ -1203,10 +1203,11 @@ int mhi_sync_power_up(struct mhi_controller=
 *mhi_cntrl)
> > > >
> > > >       wait_event_timeout(mhi_cntrl->state_event,
> > > >                          MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
> > > > +                        mhi_cntrl->ee =3D=3D MHI_EE_SBL ||
> > > >                          MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)=
,
> > > >                          msecs_to_jiffies(mhi_cntrl->timeout_ms));
> > > >
> > > > -     ret =3D (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT=
;
> > > > +     ret =3D (MHI_IN_MISSION_MODE(mhi_cntrl->ee) || mhi_cntrl->ee =
=3D=3D MHI_EE_SBL) ? 0 : -ETIMEDOUT;
> > > >       if (ret)
> > > >               mhi_power_down(mhi_cntrl, false);
> > > >
> > > > --
> > > > 2.37.1
> > > >
> > >
> > > --
> > > =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
