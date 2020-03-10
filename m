Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B8C1807D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 20:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgCJTSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 15:18:12 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:44651 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgCJTSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 15:18:12 -0400
Received: by mail-il1-f196.google.com with SMTP id j69so13058188ila.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 12:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G9Ot2Xjszp51gBGx58sDCr2xmlbyP0UP+3fOehYA85Y=;
        b=X5aIYN6TebDU8ZPHAulU19T+56uXL0NNZOGsZ2yI255jZXTRhANUfEW0pdg3g6V4f+
         RnNpsMdAMBPeInxTjr5X6L3xe1VwWcKooWjXm6sO0/UwBTnGiFVEotJjAGy4W7WC9EOh
         X0/lmano+UjrwmxF4AyezAz3W3gJakMUwozQmF0xQ3xM1c979GC999/a6Vl0NNXX1X1+
         5GXYRtQib/gJQ0A6rJo+nu72qwxWwjUKmAm/vqYPnGGveYzqNCE32bBXOtRmpLK6wre5
         sXzh9F4Gz/wyWM8Y0MxqWuCUHQB0YLZWMbvqlconEwNe6FkfZNRrgaQE/mrA5B/z5Gsy
         cSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G9Ot2Xjszp51gBGx58sDCr2xmlbyP0UP+3fOehYA85Y=;
        b=WTjAp+Za0irTne4O2zTkHvX5uIp0WDeZNPkEQa5dfZH/iTW5rnCGsB2YOUJ0lOQoKw
         FhqRxsKLnYr5YrrBA2TtL1+8w7I0p5bUzjZtdcFXVH53fpS6QLDBULCq8pmscKbH7MmG
         wi4Te4XP7yGZmceuSNri9uoN+QiHG+qvLiA6v6ekpfVuugFItIygq0evtvoCm1vjfCX5
         2r+tm8ip+0M5cc1VQsEnrCUInc5JHHYi5ByEa0IRwSRpPOS1JxETJ/NAaFwno77Y5miV
         k7FvnUmwi6tb/wWfguDjYJyTgEPCqqej+tCocHJN4ceHgsRfGjOADDX21yFFwa64wpTK
         HrdQ==
X-Gm-Message-State: ANhLgQ3mGC25J1XuJn84RjLMTR4JxXD75iiVrXbUJ9pMR5upfCvSMBmG
        9URA60O9PGUG43yjojSPJ4uz5EwDyeE8Ncww+QukSw==
X-Google-Smtp-Source: ADFU+vuBl9jtZKrPN3uOSXR4Nv2qnd2K1O9u2s6kWhC90nd+WCfqnZMbV026ei3A9zreO8ZDOJ/03oYzKw2p+9VWrMk=
X-Received: by 2002:a92:8586:: with SMTP id f128mr10567161ilh.50.1583867891455;
 Tue, 10 Mar 2020 12:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200210162209.23149-1-cleger@kalray.eu> <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-6-cleger@kalray.eu> <20200302231342.GE262924@yoga>
 <482678048.7666348.1583222551942.JavaMail.zimbra@kalray.eu>
 <20200310000005.GF14744@builder> <20200310152031.GA25781@xps15> <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
In-Reply-To: <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 10 Mar 2020 13:18:00 -0600
Message-ID: <CANLsYkx8QhJTozKNpFXiVYGLPpbdBLLAh=arqANHL-xQKLwrew@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] remoteproc: Rename rproc_elf_sanity_check for elf32
To:     =?UTF-8?Q?Cl=C3=A9ment_Leger?= <cleger@kalrayinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Mar 2020 at 09:38, Cl=C3=A9ment Leger <cleger@kalrayinc.com> wro=
te:
>
> Hi Mathieu,
>
> ----- On 10 Mar, 2020, at 16:20, Mathieu Poirier mathieu.poirier@linaro.o=
rg wrote:
>
> > On Mon, Mar 09, 2020 at 05:00:05PM -0700, Bjorn Andersson wrote:
> >> On Tue 03 Mar 00:02 PST 2020, Cl?ment Leger wrote:
> >>
> >> > Hi Bjorn,
> >> >
> >> > ----- On 3 Mar, 2020, at 00:13, Bjorn Andersson bjorn.andersson@lina=
ro.org
> >> > wrote:
> >> >
> >> > > On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:
> >> > >
> >> > >> Since this function will be modified to support both elf32 and el=
f64,
> >> > >> rename the existing one to elf32 (which is the only supported for=
mat
> >> > >> at the moment). This will allow not to introduce possible side ef=
fect
> >> > >> when adding elf64 support (ie: all backends will still support on=
ly
> >> > >> elf32 if not requested explicitely using rproc_elf_sanity_check).
> >> > >>
> >> > >
> >> > > Is there a reason for preventing ELF64 binaries be loaded?
> >> >
> >> > I decided to go this way to let driver maintainer decide if they wan=
t
> >> > to support elf64 to avoid problems with 64bits addresses/sizes which=
 do
> >> > not fit in their native type (size_t for instance). This is probably
> >> > not going to happen and there are additionnal checks before calling
> >> > rproc_da_to_va. And addresses should be filtered by rproc_da_to_va.
> >> > So, actually it seems there is no reason to forbid supporting elf32/=
64
> >> > for all drivers.
> >> >
> >>
> >> I was hoping to hear some additional feedback on this from others.
> >
> > I didn't follow up on this one because I agreed with your assesment and=
 didn't
> > think it was needed.
> >
> > Simply put I would rather see rproc_elf_sanity_check() gain support for=
 elf64
> > and let the platform code decide what to do with format they don't supp=
ort
> > rather than spinning a new function.
> >
> >>
> >> I've merge the patch as is, but think it would be nice to clean this u=
p
> >> and just have the driver ignore if fed a 32 or 64-elf.
> >
> > It would be really nice to see this cleaned up in time for the coming m=
erge
> > window...
>
> I could have sent a V7, but Bjorn was faster than my comment ;)
> Bjorn, Is there any way to revert that or it's already pushed ?
> I already have a clean V7.

Just send another patchset that applies on top of this one.

>
> Thanks,
>
> Cl=C3=A9ment
>
> >
> > Thanks
> > Mathieu
> >
> >>
> >> Regards,
> >> Bjorn
> >>
> >> > Regards,
> >> >
> >> > Cl=C3=A9ment
> >> >
> >> > >
> >> > > Regards,
> >> > > Bjorn
> >> > >
> >> > >> Signed-off-by: Clement Leger <cleger@kalray.eu>
> >> > >> ---
> >> > >>  drivers/remoteproc/remoteproc_core.c       | 2 +-
> >> > >>  drivers/remoteproc/remoteproc_elf_loader.c | 6 +++---
> >> > >>  drivers/remoteproc/remoteproc_internal.h   | 2 +-
> >> > >>  drivers/remoteproc/st_remoteproc.c         | 2 +-
> >> > >>  drivers/remoteproc/st_slim_rproc.c         | 2 +-
> >> > >>  drivers/remoteproc/stm32_rproc.c           | 2 +-
> >> > >>  6 files changed, 8 insertions(+), 8 deletions(-)
> >> > >>
> >> > >> diff --git a/drivers/remoteproc/remoteproc_core.c
> >> > >> b/drivers/remoteproc/remoteproc_core.c
> >> > >> index 4bfaf4a3c4a3..99f0b796fbc7 100644
> >> > >> --- a/drivers/remoteproc/remoteproc_core.c
> >> > >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> > >> @@ -2055,7 +2055,7 @@ struct rproc *rproc_alloc(struct device *de=
v, const char
> >> > >> *name,
> >> > >>                 rproc->ops->load =3D rproc_elf_load_segments;
> >> > >>                 rproc->ops->parse_fw =3D rproc_elf_load_rsc_table=
;
> >> > >>                 rproc->ops->find_loaded_rsc_table =3D rproc_elf_f=
ind_loaded_rsc_table;
> >> > >> -               rproc->ops->sanity_check =3D rproc_elf_sanity_che=
ck;
> >> > >> +               rproc->ops->sanity_check =3D rproc_elf32_sanity_c=
heck;
> >> > >>                 rproc->ops->get_boot_addr =3D rproc_elf_get_boot_=
addr;
> >> > >>         }
> >> > >>
> >> > >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> >> > >> b/drivers/remoteproc/remoteproc_elf_loader.c
> >> > >> index c2a9783cfb9a..5a67745f2638 100644
> >> > >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> >> > >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> >> > >> @@ -25,13 +25,13 @@
> >> > >>  #include "remoteproc_internal.h"
> >> > >>
> >> > >>  /**
> >> > >> - * rproc_elf_sanity_check() - Sanity Check ELF firmware image
> >> > >> + * rproc_elf_sanity_check() - Sanity Check ELF32 firmware image
> >> > >>   * @rproc: the remote processor handle
> >> > >>   * @fw: the ELF firmware image
> >> > >>   *
> >> > >>   * Make sure this fw image is sane.
> >> > >>   */
> >> > >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct fir=
mware *fw)
> >> > >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct f=
irmware *fw)
> >> > >>  {
> >> > >>         const char *name =3D rproc->firmware;
> >> > >>         struct device *dev =3D &rproc->dev;
> >> > >> @@ -89,7 +89,7 @@ int rproc_elf_sanity_check(struct rproc *rproc,=
 const struct
> >> > >> firmware *fw)
> >> > >>
> >> > >>         return 0;
> >> > >>  }
> >> > >> -EXPORT_SYMBOL(rproc_elf_sanity_check);
> >> > >> +EXPORT_SYMBOL(rproc_elf32_sanity_check);
> >> > >>
> >> > >>  /**
> >> > >>   * rproc_elf_get_boot_addr() - Get rproc's boot address.
> >> > >> diff --git a/drivers/remoteproc/remoteproc_internal.h
> >> > >> b/drivers/remoteproc/remoteproc_internal.h
> >> > >> index 0deae5f237b8..28639c588d58 100644
> >> > >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> > >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> > >> @@ -54,7 +54,7 @@ void *rproc_da_to_va(struct rproc *rproc, u64 d=
a, size_t len);
> >> > >>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
> >> > >>  int rproc_trigger_recovery(struct rproc *rproc);
> >> > >>
> >> > >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct fir=
mware *fw);
> >> > >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct f=
irmware *fw);
> >> > >>  u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct fi=
rmware *fw);
> >> > >>  int rproc_elf_load_segments(struct rproc *rproc, const struct fi=
rmware *fw);
> >> > >>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct f=
irmware *fw);
> >> > >> diff --git a/drivers/remoteproc/st_remoteproc.c
> >> > >> b/drivers/remoteproc/st_remoteproc.c
> >> > >> index a3268d95a50e..a6cbfa452764 100644
> >> > >> --- a/drivers/remoteproc/st_remoteproc.c
> >> > >> +++ b/drivers/remoteproc/st_remoteproc.c
> >> > >> @@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops =
=3D {
> >> > >>         .parse_fw               =3D st_rproc_parse_fw,
> >> > >>         .load                   =3D rproc_elf_load_segments,
> >> > >>         .find_loaded_rsc_table  =3D rproc_elf_find_loaded_rsc_tab=
le,
> >> > >> -       .sanity_check           =3D rproc_elf_sanity_check,
> >> > >> +       .sanity_check           =3D rproc_elf32_sanity_check,
> >> > >>         .get_boot_addr          =3D rproc_elf_get_boot_addr,
> >> > >>  };
> >> > >>
> >> > >> diff --git a/drivers/remoteproc/st_slim_rproc.c
> >> > >> b/drivers/remoteproc/st_slim_rproc.c
> >> > >> index 09bcb4d8b9e0..3cca8b65a8db 100644
> >> > >> --- a/drivers/remoteproc/st_slim_rproc.c
> >> > >> +++ b/drivers/remoteproc/st_slim_rproc.c
> >> > >> @@ -203,7 +203,7 @@ static const struct rproc_ops slim_rproc_ops =
=3D {
> >> > >>         .da_to_va       =3D slim_rproc_da_to_va,
> >> > >>         .get_boot_addr  =3D rproc_elf_get_boot_addr,
> >> > >>         .load           =3D rproc_elf_load_segments,
> >> > >> -       .sanity_check   =3D rproc_elf_sanity_check,
> >> > >> +       .sanity_check   =3D rproc_elf32_sanity_check,
> >> > >>  };
> >> > >>
> >> > >>  /**
> >> > >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remotepro=
c/stm32_rproc.c
> >> > >> index a18f88044111..9a8b5f5e2572 100644
> >> > >> --- a/drivers/remoteproc/stm32_rproc.c
> >> > >> +++ b/drivers/remoteproc/stm32_rproc.c
> >> > >> @@ -505,7 +505,7 @@ static struct rproc_ops st_rproc_ops =3D {
> >> > >>         .load           =3D rproc_elf_load_segments,
> >> > >>         .parse_fw       =3D stm32_rproc_parse_fw,
> >> > >>         .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_tabl=
e,
> >> > >> -       .sanity_check   =3D rproc_elf_sanity_check,
> >> > >> +       .sanity_check   =3D rproc_elf32_sanity_check,
> >> > >>         .get_boot_addr  =3D rproc_elf_get_boot_addr,
> >> > >>  };
> >> > >>
> >> > >> --
> > > > >> 2.15.0.276.g89ea799
