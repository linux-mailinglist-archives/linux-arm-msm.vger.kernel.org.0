Return-Path: <linux-arm-msm+bounces-19723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6A8C2AC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 21:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD109B21B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 19:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F124AEC3;
	Fri, 10 May 2024 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEFa/KBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829C48CE0;
	Fri, 10 May 2024 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715370531; cv=none; b=Pues8mvEY8A6PPreMxWKj1zy+cpzTQUvvcSW1XhNyqIWSsC09SEhAL7CCzfef4XQGj1xcvW72ksQ/yyHzDbbdg199/idzxqLbxbDLSJnbg2IAmdxtMjGoPOgdaN4G0CNuDgYgIP3gVZlPNFDXWlArg6QozoutEAXMjfdgVU1wh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715370531; c=relaxed/simple;
	bh=3XqgSEObDOCeJPpka9l8ocfh+GOn8nUFYBHjQqb8m+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ep2blxkFRAoKrFe0mD4+/N8pg0dJB9Eh+QnEt6ZyVW7g9mO/66IG9ZIyx1UXsN0hcbdExESEkl3+SQyPNeK8EUiGv3IDUXOdz5pKzduDIQSXe3fcvr871V+9PCnosuhaXtjE3kN3ifdGUX29DnjbipTwOeJwXcfebTaaEPizEG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEFa/KBl; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a599a298990so587787066b.2;
        Fri, 10 May 2024 12:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715370528; x=1715975328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAF1txzMebY/xPXBik7+S3gqJe3LUJLfPmgTaHM48fg=;
        b=JEFa/KBl1UZ35Jrc7d0FMHoMrLvN5KDf0YofuQflZ6kBBcCTiMrRx0utzWWNG9BzfZ
         w91GenV4O83SGJYBDPIlxtDUu8OPEr+6IVVL7gNKuFsaCPASH50g9Tj+qAMlDTtqLsmM
         FXvAmn5QNUPh0YK9fGNGSFASk/+33kTdIiaN5MFHQf8KMzielDBRM1FddY1xNFHdj/l1
         Iw8i7qQkYW9yKXTyuOiKIr+smdZX9f73PRXCNWzRBy3beV3Vi1MJ+X4Ouwtw0mrn9DGh
         g6o2jPUsI1kMDDOOfuXvVk4dz/ygmjyssBXQB+i54lIjcZzCpvHIIILT9c5bZ5d8fALa
         NIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715370528; x=1715975328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAF1txzMebY/xPXBik7+S3gqJe3LUJLfPmgTaHM48fg=;
        b=PtE9fyWoM04HeihLmJaE7SZcKfDKT1ikARacPVLKSXpfbM0Rux75S2qn43UIduZtTS
         /zCrzJcY4z3sGwe72I5QvwGRQDfcr4Op40NGqnEDWrzK9bL4MOJV4EZg0C8NFs/HzgQ2
         9Od1L1uvrX06izlpTAReNimrYoBd5w/ga8NBQEzFv7WL6aaIqFQHznqlrqW2aFzdfcAX
         +FqLO+BSjc0D0mevolVNbS45XtCwwbP8UmnOqLOmSntMIirCpedLLEBIuMcXmN/XBiwq
         nXEuAoZL/RnRIvSBnQh+lW8UoRbudRPrX56Iebc4fdQ9JOyzkEWPRfcReet+raT5l52a
         IAog==
X-Forwarded-Encrypted: i=1; AJvYcCXKxtsZP5Amgq//LloZzlXlW+lUP3h1QxpuJSAGBwaT2eVAMOXwIP0KHvxNh64HHnuURp/8EKOYfwOd4PCm0S+DHMt5iAkgyM6WRjFkkD0WBAGDHNAXgcGoXiBe2Za+0/iIVf21LugSGJ5/sA==
X-Gm-Message-State: AOJu0YxmznLXQXwwIWPYxqXN6rN/ODKooNEawuUnidR6FxKE/eQOMs+6
	NFzQRxeWwwEmCD7X/YR4raX4LDZF6Xt79Mv8r+LZvd7kbGdamSAEECVWwZeF9TRe2mktk6KlyfS
	uuox3DXq0NNHwt0sxJxw7Ozr94yg=
X-Google-Smtp-Source: AGHT+IEChyfEy75A1yLV7r286DTdXiPj99++sZ6PpOSlu7hC0fo011UDBXquc6NgqpTc6nmkLuXvpsBlDu/hiTHYjlw=
X-Received: by 2002:a50:d496:0:b0:572:93fa:d6fa with SMTP id
 4fb4d7f45d1cf-5734d43e905mr2321977a12.0.1715370527239; Fri, 10 May 2024
 12:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-4-quic_bibekkum@quicinc.com> <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
 <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
In-Reply-To: <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 May 2024 12:48:22 -0700
Message-ID: <CAF6AEGtm-KweFdMFvahH1pWmpOq7dW_p0Xe_13aHGWt0jSbg8w@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org, jsnitsel@redhat.com, 
	quic_bjorande@quicinc.com, mani@kernel.org, quic_eberman@quicinc.com, 
	robdclark@chromium.org, u.kleine-koenig@pengutronix.de, robh@kernel.org, 
	vladimir.oltean@nxp.com, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 5:52=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 5/1/2024 12:30 AM, Rob Clark wrote:
> > On Tue, Jan 23, 2024 at 7:00=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >> Currently in Qualcomm  SoCs the default prefetch is set to 1 which all=
ows
> >> the TLB to fetch just the next page table. MMU-500 features ACTLR
> >> register which is implementation defined and is used for Qualcomm SoCs
> >> to have a custom prefetch setting enabling TLB to prefetch the next se=
t
> >> of page tables accordingly allowing for faster translations.
> >>
> >> ACTLR value is unique for each SMR (Stream matching register) and stor=
ed
> >> in a pre-populated table. This value is set to the register during
> >> context bank initialisation.
> >>
> >> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >> ---
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 61 ++++++++++++++++++++=
++
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h | 16 +++++-
> >>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +-
> >>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 ++
> >>   4 files changed, 84 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu-qcom.c
> >> index 333daeb18c1c..6004c6d9a7b2 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -215,10 +215,42 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_=
smmu_device *smmu)
> >>          return true;
> >>   }
> >>
> >> +static void qcom_smmu_set_actlr(struct device *dev, struct arm_smmu_d=
evice *smmu, int cbndx,
> >> +               const struct actlr_config *actlrcfg, const size_t num_=
actlrcfg)
> >> +{
> >> +       struct arm_smmu_master_cfg *cfg =3D dev_iommu_priv_get(dev);
> >> +       struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> >> +       struct arm_smmu_smr *smr;
> >> +       u16 mask;
> >> +       int idx;
> >> +       u16 id;
> >> +       int i;
> >> +       int j;
> >> +
> >> +       for (i =3D 0; i < num_actlrcfg; i++) {
> >> +               id =3D actlrcfg[i].sid;
> >> +               mask =3D actlrcfg[i].mask;
> >> +
> >> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
> >> +                       smr =3D &smmu->smrs[idx];
> >> +                       if (smr_is_subset(smr, id, mask)) {
> >> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMM=
U_CB_ACTLR,
> >> +                                               actlrcfg[i].actlr);
> >
> > So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
> > downstream kgsl's PRR thing (which we'll need to implement vulkan
> > sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
> > to enable PRR.
> >
> >          val =3D KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
> >          val |=3D FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
> >          KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
> >
> > Any idea how this works?  And does it need to be done before or after
> > the ACTLR programming done in this patch?
> >
> > BR,
> > -R
> >
>
> Hi Rob,
>
> Can you please help provide some more clarification on the FIFO part? By
> FIFO are you referring to the storing of ACTLR data in the table?

Yeah, I mean it is writing the same ACTLR register multiple times to
program the table.  I'm wondering if that means we need to program the
table in a particular order compared to setting the PRR bit?  Like do
we need to program PRR bit first, or last?

I'm planning on adding an adreno_smmu_priv interface so that drm/msm
can call into arm-smmu-qcom to setup the PRR bit and the related
PRR_CFG_LADDR/PRR_CFG_UADDR registers.  And I'm just wondering if
there is an ordering constraint wrt. when qcom_smmu_set_actlr() is
called?

BR,
-R

> Thanks for pointing to the downstream implementation of kgsl driver for
> the PRR bit. Since kgsl driver is already handling this PRR bit's
> setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
> Thanks for bringing up this point.
> I will send v10 patch series removing this BIT(5) setting from the ACTLR
> table.
>
> Thanks & regards,
> Bibek
>
> >> +                               break;
> >> +                       }
> >> +               }
> >> +       }
> >> +}
> >> +
> >>   static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smm=
u_domain,
> >>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> >>   {
> >> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >> +       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> >> +       const struct actlr_variant *actlrvar;
> >> +       int cbndx =3D smmu_domain->cfg.cbndx;
> >>          struct adreno_smmu_priv *priv;
> >> +       int i;
> >>
> >>          smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >>
> >> @@ -248,6 +280,18 @@ static int qcom_adreno_smmu_init_context(struct a=
rm_smmu_domain *smmu_domain,
> >>          priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>          priv->resume_translation =3D qcom_adreno_smmu_resume_translat=
ion;
> >>
> >> +       actlrvar =3D qsmmu->data->actlrvar;
> >> +       if (!actlrvar)
> >> +               return 0;
> >> +
> >> +       for (i =3D 0; i < qsmmu->data->num_smmu ; i++) {
> >> +               if (actlrvar[i].io_start =3D=3D smmu->ioaddr) {
> >> +                       qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar=
[i].actlrcfg,
> >> +                                      actlrvar[i].num_actlrcfg);
> >> +                       break;
> >> +               }
> >> +       }
> >> +
> >>          return 0;
> >>   }
> >>
> >> @@ -274,7 +318,24 @@ static const struct of_device_id qcom_smmu_client=
_of_match[] __maybe_unused =3D {
> >>   static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domai=
n,
> >>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> >>   {
> >> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >> +       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> >> +       const struct actlr_variant *actlrvar;
> >> +       int cbndx =3D smmu_domain->cfg.cbndx;
> >> +       int i;
> >> +
> >>          smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >> +       actlrvar =3D qsmmu->data->actlrvar;
> >> +       if (!actlrvar)
> >> +               return 0;
> >> +
> >> +       for (i =3D 0; i < qsmmu->data->num_smmu ; i++) {
> >> +               if (actlrvar[i].io_start =3D=3D smmu->ioaddr) {
> >> +                       qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar=
[i].actlrcfg,
> >> +                                      actlrvar[i].num_actlrcfg);
> >> +                       break;
> >> +               }
> >> +       }
> >>
> >>          return 0;
> >>   }
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iomm=
u/arm/arm-smmu/arm-smmu-qcom.h
> >> index f3b91963e234..3f651242de7c 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> >> @@ -1,6 +1,6 @@
> >>   /* SPDX-License-Identifier: GPL-2.0-only */
> >>   /*
> >> - * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights re=
served.
> >> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All righ=
ts reserved.
> >>    */
> >>
> >>   #ifndef _ARM_SMMU_QCOM_H
> >> @@ -24,8 +24,22 @@ struct qcom_smmu_config {
> >>          const u32 *reg_offset;
> >>   };
> >>
> >> +struct actlr_config {
> >> +       u16 sid;
> >> +       u16 mask;
> >> +       u32 actlr;
> >> +};
> >> +
> >> +struct actlr_variant {
> >> +       const resource_size_t io_start;
> >> +       const struct actlr_config * const actlrcfg;
> >> +       const size_t num_actlrcfg;
> >> +};
> >> +
> >>   struct qcom_smmu_match_data {
> >> +       const struct actlr_variant * const actlrvar;
> >>          const struct qcom_smmu_config *cfg;
> >> +       const size_t num_smmu;
> >>          const struct arm_smmu_impl *impl;
> >>          const struct arm_smmu_impl *adreno_impl;
> >>   };
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm=
/arm-smmu/arm-smmu.c
> >> index d6d1a2a55cc0..0c7f700b27dd 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >> @@ -990,9 +990,10 @@ static int arm_smmu_find_sme(struct arm_smmu_devi=
ce *smmu, u16 id, u16 mask)
> >>                   * expect simply identical entries for this case, but=
 there's
> >>                   * no harm in accommodating the generalisation.
> >>                   */
> >> -               if ((mask & smrs[i].mask) =3D=3D mask &&
> >> -                   !((id ^ smrs[i].id) & ~smrs[i].mask))
> >> +
> >> +               if (smr_is_subset(&smrs[i], id, mask))
> >>                          return i;
> >> +
> >>                  /*
> >>                   * If the new entry has any other overlap with an exi=
sting one,
> >>                   * though, then there always exists at least one stre=
am ID
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm=
/arm-smmu/arm-smmu.h
> >> index 703fd5817ec1..2e4f65412c6b 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >> @@ -501,6 +501,11 @@ static inline void arm_smmu_writeq(struct arm_smm=
u_device *smmu, int page,
> >>                  writeq_relaxed(val, arm_smmu_page(smmu, page) + offse=
t);
> >>   }
> >>
> >> +static inline bool smr_is_subset(struct arm_smmu_smr *smrs, u16 id, u=
16 mask)
> >> +{
> >> +       return (mask & smrs->mask) =3D=3D mask && !((id ^ smrs->id) & =
~smrs->mask);
> >> +}
> >> +
> >>   #define ARM_SMMU_GR0           0
> >>   #define ARM_SMMU_GR1           1
> >>   #define ARM_SMMU_CB(s, n)      ((s)->numpage + (n))
> >> --
> >> 2.17.1
> >>
> >>

