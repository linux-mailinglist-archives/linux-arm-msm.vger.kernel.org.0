Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5408C151EF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgBDRKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:10:18 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:39618 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgBDRKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:10:18 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 72EE427E058F;
        Tue,  4 Feb 2020 18:10:15 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id tWmizHw9Mp2y; Tue,  4 Feb 2020 18:10:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id A546827E10DF;
        Tue,  4 Feb 2020 18:10:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu A546827E10DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1580836214;
        bh=t2I5VrasNCpg/bVWI+w5mpBHXs5yOnPEN+vv+NXjL5Y=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=qBAQ07UH15YRT/Zd98AiZSeIKHoXjvoLAi7YnW9qtiBk6hKDnNpwnDljjBaXjP7jT
         bHlIqu+q9zjxruFyzjNVkb2Sc41rqaGe0fe4xauoZFRTaD7e3z7K6QBGT49A+3BKkQ
         dpkWk68l6/GNeghGjuEwNjKQ8XuiVpXWNCAE8glM=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Ta12bEIF-mSt; Tue,  4 Feb 2020 18:10:14 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 8114527E058F;
        Tue,  4 Feb 2020 18:10:14 +0100 (CET)
Date:   Tue, 4 Feb 2020 18:10:14 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
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
        linux-doc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <108760116.2187488.1580836214364.JavaMail.zimbra@kalray.eu>
In-Reply-To: <81ef1572-1913-e9a8-5002-f7d565d6ac37@st.com>
References: <20200129163013.GA16538@xps15> <20200204143343.7011-1-cleger@kalray.eu> <81ef1572-1913-e9a8-5002-f7d565d6ac37@st.com>
Subject: Re: [PATCH v2 1/2] remoteproc: Use u64 len for da_to_va
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC75 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Use u64 len for da_to_va
Thread-Index: 5K7u5OAIaUmvpT6QRrt1veihrLkS9g==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnaud,

My bad, I thought it was only V1.
I will resend it as a V3 with a cover letter.

----- On 4 Feb, 2020, at 17:27, Arnaud Pouliquen arnaud.pouliquen@st.com wr=
ote:

> Hi Cl=C3=A9ment,
>=20
> Is it v2 or V3?
> I also suggest you add a cover letter when you post more than one patch i=
n a
> thread.
>=20
> On 2/4/20 3:33 PM, Clement Leger wrote:
>> With upcoming changes in elf loader for elf64 support, section size will
>> be a u64. When used with da_to_va, this will potentially lead to
>> overflow if using the current "int" type for len argument. Change
>> da_to_va prototype to use a u64 for len and fix all users of this
>> function.
>>=20
>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> ---
>> V2:
>>  - Change len type from int to u64
>>=20
>>  drivers/remoteproc/imx_rproc.c           | 5 +++--
>>  drivers/remoteproc/keystone_remoteproc.c | 2 +-
>>  drivers/remoteproc/qcom_q6v5_adsp.c      | 2 +-
>>  drivers/remoteproc/qcom_q6v5_mss.c       | 2 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c       | 2 +-
>>  drivers/remoteproc/qcom_q6v5_wcss.c      | 2 +-
>>  drivers/remoteproc/qcom_wcnss.c          | 2 +-
>>  drivers/remoteproc/remoteproc_core.c     | 2 +-
>>  drivers/remoteproc/remoteproc_internal.h | 2 +-
>>  drivers/remoteproc/st_slim_rproc.c       | 2 +-
>>  drivers/remoteproc/wkup_m3_rproc.c       | 2 +-
>>  include/linux/remoteproc.h               | 2 +-
>>  12 files changed, 14 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpr=
oc.c
>> index 3e72b6f38d4b..7ec79be5eb5d 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -208,7 +208,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *pri=
v, u64
>> da,
>>  =09return -ENOENT;
>>  }
>> =20
>> -static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> +static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
> I wonder if you could use size_t instead?

I wondered too but size_t is a unsigned int on 32 bits system. So if they l=
oad
a elf64 binary (which might be in 32bits zone), the segment size will be
a u64 type.

> Does it make sense for 32-bit system to have a physical address space hig=
her?
> it's an open question I won't pretend to have the answer...:)

I agree that it does not make a lot of sense... But when we discussed it in
OpenAMP WG, it was mentionned that this should be supported.=20

>=20
>=20
>>  {
>>  =09struct imx_rproc *priv =3D rproc->priv;
>>  =09void *va =3D NULL;
>> @@ -235,7 +235,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc,=
 u64 da,
>> int len)
> len type to update

I missed this one and I will double check all other callers

Thanks,

Cl=C3=A9ment.=20

>=20
> Regards,
> Arnaud
>>  =09=09}
>>  =09}
>> =20
>> -=09dev_dbg(&rproc->dev, "da =3D 0x%llx len =3D 0x%x va =3D 0x%p\n", da,=
 len, va);
>> +=09dev_dbg(&rproc->dev, "da =3D 0x%llx len =3D 0x%llx va =3D 0x%p\n", d=
a, len,
>> +=09=09va);
>> =20
>>  =09return va;
>>  }
>> diff --git a/drivers/remoteproc/keystone_remoteproc.c
>> b/drivers/remoteproc/keystone_remoteproc.c
>> index 5c4658f00b3d..25c01df47eba 100644
>> --- a/drivers/remoteproc/keystone_remoteproc.c
>> +++ b/drivers/remoteproc/keystone_remoteproc.c
>> @@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc,=
 int
>> vqid)
>>   * can be used either by the remoteproc core for loading (when using ke=
rnel
>>   * remoteproc loader), or by any rpmsg bus drivers.
>>   */
>> -static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int l=
en)
>> +static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, u64 l=
en)
>>  {
>>  =09struct keystone_rproc *ksproc =3D rproc->priv;
>>  =09void __iomem *va =3D NULL;
>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
>> b/drivers/remoteproc/qcom_q6v5_adsp.c
>> index e953886b2eb7..7518e67a49e5 100644
>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>> @@ -270,7 +270,7 @@ static int adsp_stop(struct rproc *rproc)
>>  =09return ret;
>>  }
>> =20
>> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>  {
>>  =09struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
>>  =09int offset;
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 471128a2e723..248febde6fc1 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -1148,7 +1148,7 @@ static int q6v5_stop(struct rproc *rproc)
>>  =09return 0;
>>  }
>> =20
>> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>  {
>>  =09struct q6v5 *qproc =3D rproc->priv;
>>  =09int offset;
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
>> b/drivers/remoteproc/qcom_q6v5_pas.c
>> index db4b3c4bacd7..cf2cd609c90d 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -159,7 +159,7 @@ static int adsp_stop(struct rproc *rproc)
>>  =09return ret;
>>  }
>> =20
>> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>  {
>>  =09struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
>>  =09int offset;
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
>> b/drivers/remoteproc/qcom_q6v5_wcss.c
>> index f93e1e4a1cc0..3a6b82a16961 100644
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -406,7 +406,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>>  =09return 0;
>>  }
>> =20
>> -static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len)
>> +static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>  {
>>  =09struct q6v5_wcss *wcss =3D rproc->priv;
>>  =09int offset;
>> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_w=
cnss.c
>> index dc135754bb9c..f893219e45a8 100644
>> --- a/drivers/remoteproc/qcom_wcnss.c
>> +++ b/drivers/remoteproc/qcom_wcnss.c
>> @@ -287,7 +287,7 @@ static int wcnss_stop(struct rproc *rproc)
>>  =09return ret;
>>  }
>> =20
>> -static void *wcnss_da_to_va(struct rproc *rproc, u64 da, int len)
>> +static void *wcnss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>  {
>>  =09struct qcom_wcnss *wcnss =3D (struct qcom_wcnss *)rproc->priv;
>>  =09int offset;
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index 307df98347ba..9e6d3c6a60ee 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>>   * here the output of the DMA API for the carveouts, which should be mo=
re
>>   * correct.
>>   */
>> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>  {
>>  =09struct rproc_mem_entry *carveout;
>>  =09void *ptr =3D NULL;
>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>> b/drivers/remoteproc/remoteproc_internal.h
>> index 493ef9262411..004867061721 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -50,7 +50,7 @@ void rproc_exit_sysfs(void);
>>  void rproc_free_vring(struct rproc_vring *rvring);
>>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>> =20
>> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len);
>>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>>  int rproc_trigger_recovery(struct rproc *rproc);
>> =20
>> diff --git a/drivers/remoteproc/st_slim_rproc.c
>> b/drivers/remoteproc/st_slim_rproc.c
>> index 04492fead3c8..2fd14afb3157 100644
>> --- a/drivers/remoteproc/st_slim_rproc.c
>> +++ b/drivers/remoteproc/st_slim_rproc.c
>> @@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
>>  =09return 0;
>>  }
>> =20
>> -static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> +static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>  {
>>  =09struct st_slim_rproc *slim_rproc =3D rproc->priv;
>>  =09void *va =3D NULL;
>> diff --git a/drivers/remoteproc/wkup_m3_rproc.c
>> b/drivers/remoteproc/wkup_m3_rproc.c
>> index 3984e585c847..0e8082948489 100644
>> --- a/drivers/remoteproc/wkup_m3_rproc.c
>> +++ b/drivers/remoteproc/wkup_m3_rproc.c
>> @@ -80,7 +80,7 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>>  =09return 0;
>>  }
>> =20
>> -static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, int le=
n)
>> +static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, u64 le=
n)
>>  {
>>  =09struct wkup_m3_rproc *wkupm3 =3D rproc->priv;
>>  =09void *va =3D NULL;
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 16ad66683ad0..f84bd5fe0211 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -374,7 +374,7 @@ struct rproc_ops {
>>  =09int (*start)(struct rproc *rproc);
>>  =09int (*stop)(struct rproc *rproc);
>>  =09void (*kick)(struct rproc *rproc, int vqid);
>> -=09void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
>> +=09void * (*da_to_va)(struct rproc *rproc, u64 da, u64 len);
>>  =09int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>>  =09int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>>  =09=09=09  int offset, int avail);
