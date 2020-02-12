Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF1915A693
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 11:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBLKhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 05:37:05 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:58864 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbgBLKhF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 05:37:05 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 07B0927E06A4;
        Wed, 12 Feb 2020 11:37:02 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ZY5SN3r02JQh; Wed, 12 Feb 2020 11:37:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 94CDD27E077C;
        Wed, 12 Feb 2020 11:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 94CDD27E077C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1581503820;
        bh=HHbBRqHom3SlEJSMY3m7eLVS9bgXrm+OwMRi13Mly2A=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=XewgQTR+1w4PwMcITdG+IxDEgqeyEUfLPPj3gGGp6D8huMPffzRb7fktPjr3cko/x
         nxwzH+Uy23mUmxz+ZT0yVMZBG/kLF/eenV3AJnyBbVJboVKRM/LxWHWSahBLvce5KC
         pOl1gX7N62StgePA+a8AQT8ggqItCJOsASa5k4hg=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id asQ--wGbO4iF; Wed, 12 Feb 2020 11:37:00 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 761E727E06A4;
        Wed, 12 Feb 2020 11:37:00 +0100 (CET)
Date:   Wed, 12 Feb 2020 11:37:00 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Message-ID: <296765414.3763778.1581503820255.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200211223715.GA27770@xps15>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu> <20200210162209.23149-1-cleger@kalray.eu> <20200210162209.23149-2-cleger@kalray.eu> <4465bade-e3de-88b8-63a5-e5410de9adc0@st.com> <884697376.3644142.1581439161953.JavaMail.zimbra@kalray.eu> <20200211223715.GA27770@xps15>
Subject: Re: [PATCH v4 1/5] remoteproc: Use u64 len for da_to_va
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC75 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Use u64 len for da_to_va
Thread-Index: L6JqKTWnzN9gUOgdOuQK2gV7aZnJpQ==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

----- On 11 Feb, 2020, at 23:37, Mathieu Poirier mathieu.poirier@linaro.org=
 wrote:

> On Tue, Feb 11, 2020 at 05:39:21PM +0100, Cl=C3=A9ment Leger wrote:
>> Hi Arnaud,
>>=20
>> ----- On 11 Feb, 2020, at 16:53, Arnaud Pouliquen arnaud.pouliquen@st.co=
m wrote:
>>=20
>> > On 2/10/20 5:22 PM, Clement Leger wrote:
>> >> With upcoming changes in elf loader for elf64 support, section size w=
ill
>> >> be a u64. When used with da_to_va, this will potentially lead to
>> >> overflow if using the current "int" type for len argument. Change
>> >> da_to_va prototype to use a u64 for len and fix all users of this
>> >> function.
>> >>=20
>> >> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> >> ---
>> >>  drivers/remoteproc/imx_rproc.c           | 11 ++++++-----
>> >>  drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>> >>  drivers/remoteproc/qcom_q6v5_adsp.c      |  2 +-
>> >>  drivers/remoteproc/qcom_q6v5_mss.c       |  2 +-
>> >>  drivers/remoteproc/qcom_q6v5_pas.c       |  2 +-
>> >>  drivers/remoteproc/qcom_q6v5_wcss.c      |  2 +-
>> >>  drivers/remoteproc/qcom_wcnss.c          |  2 +-
>> >>  drivers/remoteproc/remoteproc_core.c     |  2 +-
>> >>  drivers/remoteproc/remoteproc_internal.h |  2 +-
>> >>  drivers/remoteproc/st_slim_rproc.c       |  4 ++--
>> >>  drivers/remoteproc/wkup_m3_rproc.c       |  4 ++--
>> >>  include/linux/remoteproc.h               |  2 +-
>> >>  12 files changed, 20 insertions(+), 19 deletions(-)
>> >>=20
>> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_=
rproc.c
>> >> index 3e72b6f38d4b..f497f5b49b18 100644
>> >> --- a/drivers/remoteproc/imx_rproc.c
>> >> +++ b/drivers/remoteproc/imx_rproc.c
>> >> @@ -186,7 +186,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>> >>  }
>> >> =20
>> >>  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>> >> -=09=09=09       int len, u64 *sys)
>> >> +=09=09=09       u64 len, u64 *sys)
>> >>  {
>> >>  =09const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
>> >>  =09int i;
>> >> @@ -203,19 +203,19 @@ static int imx_rproc_da_to_sys(struct imx_rproc=
 *priv, u64
>> >> da,
>> >>  =09=09}
>> >>  =09}
>> >> =20
>> >> -=09dev_warn(priv->dev, "Translation failed: da =3D 0x%llx len =3D 0x=
%x\n",
>> >> +=09dev_warn(priv->dev, "Translation failed: da =3D 0x%llx len =3D 0x=
%llx\n",
>> >>  =09=09 da, len);
>> >>  =09return -ENOENT;
>> >>  }
>> >> =20
>> >> -static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len=
)
>> >> +static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len=
)
>> >>  {
>> >>  =09struct imx_rproc *priv =3D rproc->priv;
>> >>  =09void *va =3D NULL;
>> >>  =09u64 sys;
>> >>  =09int i;
>> >> =20
>> >> -=09if (len <=3D 0)
>> >> +=09if (len =3D=3D 0)
>> >>  =09=09return NULL;
>> >> =20
>> >>  =09/*
>> >> @@ -235,7 +235,8 @@ static void *imx_rproc_da_to_va(struct rproc *rpr=
oc, u64 da,
>> >> int len)
>> >>  =09=09}
>> >>  =09}
>> >> =20
>> >> -=09dev_dbg(&rproc->dev, "da =3D 0x%llx len =3D 0x%x va =3D 0x%p\n", =
da, len, va);
>> >> +=09dev_dbg(&rproc->dev, "da =3D 0x%llx len =3D 0x%llx va =3D 0x%p\n"=
,
>> >> +=09=09da, len, va);
>> >> =20
>> >>  =09return va;
>> >>  }
>> >> diff --git a/drivers/remoteproc/keystone_remoteproc.c
>> >> b/drivers/remoteproc/keystone_remoteproc.c
>> >> index 5c4658f00b3d..466093f48814 100644
>> >> --- a/drivers/remoteproc/keystone_remoteproc.c
>> >> +++ b/drivers/remoteproc/keystone_remoteproc.c
>> >> @@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rpr=
oc, int
>> >> vqid)
>> >>   * can be used either by the remoteproc core for loading (when using=
 kernel
>> >>   * remoteproc loader), or by any rpmsg bus drivers.
>> >>   */
>> >> -static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, in=
t len)
>> >> +static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, u6=
4 len)
>> >>  {
>> >>  =09struct keystone_rproc *ksproc =3D rproc->priv;
>> >>  =09void __iomem *va =3D NULL;
>> >> @@ -255,7 +255,7 @@ static void *keystone_rproc_da_to_va(struct rproc=
 *rproc,
>> >> u64 da, int len)
>> >>  =09size_t size;
>> >>  =09int i;
>> >> =20
>> >> -=09if (len <=3D 0)
>> >> +=09if (len =3D=3D 0)
>> >>  =09=09return NULL;
>> >> =20
>> >>  =09for (i =3D 0; i < ksproc->num_mems; i++) {
>> >> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> b/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> index e953886b2eb7..7518e67a49e5 100644
>> >> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> @@ -270,7 +270,7 @@ static int adsp_stop(struct rproc *rproc)
>> >>  =09return ret;
>> >>  }
>> >> =20
>> >> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >>  {
>> >>  =09struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
>> >>  =09int offset;
>> >> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
>> >> b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> index 471128a2e723..248febde6fc1 100644
>> >> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> >> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> @@ -1148,7 +1148,7 @@ static int q6v5_stop(struct rproc *rproc)
>> >>  =09return 0;
>> >>  }
>> >> =20
>> >> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >>  {
>> >>  =09struct q6v5 *qproc =3D rproc->priv;
>> >>  =09int offset;
>> >> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
>> >> b/drivers/remoteproc/qcom_q6v5_pas.c
>> >> index db4b3c4bacd7..cf2cd609c90d 100644
>> >> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> >> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> >> @@ -159,7 +159,7 @@ static int adsp_stop(struct rproc *rproc)
>> >>  =09return ret;
>> >>  }
>> >> =20
>> >> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >>  {
>> >>  =09struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
>> >>  =09int offset;
>> >> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> b/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> index f93e1e4a1cc0..3a6b82a16961 100644
>> >> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> @@ -406,7 +406,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>> >>  =09return 0;
>> >>  }
>> >> =20
>> >> -static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len=
)
>> >> +static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, u64 len=
)
>> >>  {
>> >>  =09struct q6v5_wcss *wcss =3D rproc->priv;
>> >>  =09int offset;
>> >> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qco=
m_wcnss.c
>> >> index dc135754bb9c..f893219e45a8 100644
>> >> --- a/drivers/remoteproc/qcom_wcnss.c
>> >> +++ b/drivers/remoteproc/qcom_wcnss.c
>> >> @@ -287,7 +287,7 @@ static int wcnss_stop(struct rproc *rproc)
>> >>  =09return ret;
>> >>  }
>> >> =20
>> >> -static void *wcnss_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> +static void *wcnss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >>  {
>> >>  =09struct qcom_wcnss *wcnss =3D (struct qcom_wcnss *)rproc->priv;
>> >>  =09int offset;
>> >> diff --git a/drivers/remoteproc/remoteproc_core.c
>> >> b/drivers/remoteproc/remoteproc_core.c
>> >> index 307df98347ba..9e6d3c6a60ee 100644
>> >> --- a/drivers/remoteproc/remoteproc_core.c
>> >> +++ b/drivers/remoteproc/remoteproc_core.c
>> >> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>> >>   * here the output of the DMA API for the carveouts, which should be=
 more
>> >>   * correct.
>> >>   */
>> >> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >=20
>> > This function is exported, don't see any update in consequence...
>> > references:
>> > https://elixir.bootlin.com/linux/v5.6-rc1/ident/rproc_da_to_va
>> > For instance the function rproc_trace_read use it. it quite strange th=
at my gcc
>> > does not warns for the cast but i suppose that some could.
>>=20
>> Agreed, even if len should never have been a signed type since it can't =
be
>> negative. I will try to fix all callers.
>>=20
>> > An indirect consequence is that the len field in rproc_mem_entry struc=
t should
>> > probably been updated to u64 to be aligned.
>>=20
>> Ok, I will do that once we settle on the type of len.
>>=20
>> >=20
>> > I'm still wondering about the use of size_t instead,which seems more r=
ational
>> > from my window.
>> > So i you or Mathieu remember it was decided to use u64, please could r=
emind me
>> > the arguments?
>>=20
>> I tried to find the notes of a meeting we had for OpenAMP but I did not =
found
>> them. Anyway, the argument was coming from Tomas or someone else, (I can=
't
>> remember) talking about a 32 bits CPU executing code on a 64 bits accele=
rator.
>> In that case, the size_t type could fail due to being only 32bits on the=
 host
>> CPU but larger than 4G.
>>=20
>> However, I can't say if it's a real usecase or not... All I can say is
>> that keeping it open is probably better if one day somebody comes with s=
uch
>> architecture.
>=20
> In order to support a 32bit AP with a 64bit MCU we'd also have to deal wi=
th all
> the dma_attr_t in the structure we use.

Totally ok with that...=20

>=20
> Also something that became very clear to me while thinking about this pat=
chset
> is that supporting elf64 does __not__ mean we support 64bit MCU.  As long=
 as
> the addresses conveyed by the elf64 image fit within 32 bits we are fine.
> Supporting 64bit MCUs is a completely different topic, one that will dema=
nd
> serious refactoring.

Exactly, an elf64 can potentially contain an executable fitting in 32 bits.

>=20
> So moving from "int len" to "u64 len" doesn't give us much.  It doesn't h=
urt to
> do it but if @len ever becomes bigger than 31 bits we'll have other probl=
ems to
> deal with.

Agreed, so what would be your recommendation reagrding the type of len ?
I'm ok with Arnaud statement too and using a size_t is probably more
"type-safe" than a u64. At least it adds some information.

Thanks,

Cl=C3=A9ment

>=20
>>=20
>> > As an alternative a check should be added for 32 bits processors to en=
sure that
>> > the size is not higher than
>> > its address range capability...
>>=20
>> Agreed.
>> I was even thinking about a mecanism for remoteproc drivers to declare t=
he type
>> of supported elfs files (such as EM_*, ELFCLASS* and other needed thing)=
.
>> Or should it be supported by overriding .sanity_check in drivers  to rej=
ect
>> elf64 for instance ?
>>=20
>> Since elf is a "specific format" and that rproc can support other format=
s,
>> I did not want to add a specific elf_sanity_check field to rproc ops.
>>=20
>> Regards,
>>=20
>> Cl=C3=A9ment
>>=20
>> >=20
>> > Regards
>> > Arnaud
>> >=20
>> >>  {
>> >>  =09struct rproc_mem_entry *carveout;
>> >>  =09void *ptr =3D NULL;
>> >> diff --git a/drivers/remoteproc/remoteproc_internal.h
>> >> b/drivers/remoteproc/remoteproc_internal.h
>> >> index 493ef9262411..004867061721 100644
>> >> --- a/drivers/remoteproc/remoteproc_internal.h
>> >> +++ b/drivers/remoteproc/remoteproc_internal.h
>> >> @@ -50,7 +50,7 @@ void rproc_exit_sysfs(void);
>> >>  void rproc_free_vring(struct rproc_vring *rvring);
>> >>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>> >> =20
>> >> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>> >> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len);
>> >>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>> >>  int rproc_trigger_recovery(struct rproc *rproc);
>> >> =20
>> >> diff --git a/drivers/remoteproc/st_slim_rproc.c
>> >> b/drivers/remoteproc/st_slim_rproc.c
>> >> index 04492fead3c8..fc01cd879b60 100644
>> >> --- a/drivers/remoteproc/st_slim_rproc.c
>> >> +++ b/drivers/remoteproc/st_slim_rproc.c
>> >> @@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
>> >>  =09return 0;
>> >>  }
>> >> =20
>> >> -static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int le=
n)
>> >> +static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, u64 le=
n)
>> >>  {
>> >>  =09struct st_slim_rproc *slim_rproc =3D rproc->priv;
>> >>  =09void *va =3D NULL;
>> >> @@ -191,7 +191,7 @@ static void *slim_rproc_da_to_va(struct rproc *rp=
roc, u64
>> >> da, int len)
>> >>  =09=09}
>> >>  =09}
>> >> =20
>> >> -=09dev_dbg(&rproc->dev, "da =3D 0x%llx len =3D 0x%x va =3D 0x%pK\n",
>> >> +=09dev_dbg(&rproc->dev, "da =3D 0x%llx len =3D 0x%llx va =3D 0x%pK\n=
",
>> >>  =09=09da, len, va);
>> >> =20
>> >>  =09return va;
>> >> diff --git a/drivers/remoteproc/wkup_m3_rproc.c
>> >> b/drivers/remoteproc/wkup_m3_rproc.c
>> >> index 3984e585c847..91485b467407 100644
>> >> --- a/drivers/remoteproc/wkup_m3_rproc.c
>> >> +++ b/drivers/remoteproc/wkup_m3_rproc.c
>> >> @@ -80,14 +80,14 @@ static int wkup_m3_rproc_stop(struct rproc *rproc=
)
>> >>  =09return 0;
>> >>  }
>> >> =20
>> >> -static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, int=
 len)
>> >> +static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, u64=
 len)
>> >>  {
>> >>  =09struct wkup_m3_rproc *wkupm3 =3D rproc->priv;
>> >>  =09void *va =3D NULL;
>> >>  =09int i;
>> >>  =09u32 offset;
>> >> =20
>> >> -=09if (len <=3D 0)
>> >> +=09if (len =3D=3D 0)
>> >>  =09=09return NULL;
>> >> =20
>> >>  =09for (i =3D 0; i < WKUPM3_MEM_MAX; i++) {
>> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> >> index 16ad66683ad0..f84bd5fe0211 100644
>> >> --- a/include/linux/remoteproc.h
>> >> +++ b/include/linux/remoteproc.h
>> >> @@ -374,7 +374,7 @@ struct rproc_ops {
>> >>  =09int (*start)(struct rproc *rproc);
>> >>  =09int (*stop)(struct rproc *rproc);
>> >>  =09void (*kick)(struct rproc *rproc, int vqid);
>> >> -=09void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
>> >> +=09void * (*da_to_va)(struct rproc *rproc, u64 da, u64 len);
>> >>  =09int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>> >>  =09int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
> > >>  =09=09=09  int offset, int avail);
