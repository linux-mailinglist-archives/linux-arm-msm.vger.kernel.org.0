Return-Path: <linux-arm-msm+bounces-22338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691B90442B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 21:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C84F1C24C76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 19:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C5F4D8BB;
	Tue, 11 Jun 2024 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrO7KCsO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A69475;
	Tue, 11 Jun 2024 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718132576; cv=none; b=Lq+y151gdnahx+oMvv2TkJqF8VMQp0aU/MyuiPVtoF41CVX7gg5zuMStuYstCOJcLkzfflZ5Qn/JuIRw13Gg1zVM2OxPOMaeIZiUtPwCjLto82Zhr6Q43AasKt4OglcqXh9KOF+QiLNmR3RvG2hsCDEKiZy4ARPE18uwM1drzUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718132576; c=relaxed/simple;
	bh=RIS6P99i8/ouYRhPvVg/OSG179LKXiF0MDZ0AvmtDTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy1a5effNPEU8qJ02XIML5UsUtaMCQTBavxle2auCOqRvCPosXcepH4wmT/+BcczfTbBVUe+j63ozWrlM1RzFZflpPEtP0tfsgHH4tKOyi6rRoycFxIIVdn+ivLDcOtnlai2xGcVeJVMfNPnSelBknNx3abHSYUpHoVb3pZJEVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrO7KCsO; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-43ff9d1e0bbso29040781cf.3;
        Tue, 11 Jun 2024 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718132573; x=1718737373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCLHIpP4L7kT0Gd2rI5jF/Z5JVF4JbWL3evtRJjU49M=;
        b=NrO7KCsOFiYafhYW+jKGnoBNZjWg/EGxtfl47lMx2xOA5E48G6X2fbhxpxv088dcqN
         XlnvnCqoyQBRyQpGnGvZq03zdMW4LJkA+gYX3p0fvpf515qaDgdOPqRH0Akt9YiJyFbs
         sh2LwuavBFwXq9RfE+zwMGtf6eSIq+D0M3sKViqwAxlHoEaGd4qYk/WoGyHbWfLWfmc1
         PF3FELVES9SKqiPs3xvOGogbrUDQ/0csOKvHX4OOypajj1cZax7mznTGxNweLBV+XHLu
         ip0tWjZoe4sfdjpjjW4HmmcfTRZabtAc0B+6trJpCqFqzsYyNMaAQNQnm+s6g8jbRNI6
         hSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718132573; x=1718737373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCLHIpP4L7kT0Gd2rI5jF/Z5JVF4JbWL3evtRJjU49M=;
        b=NDlSwqQuURf63TpQcru+VUqLQbFJeiz3jYXMAz6TtBoYxYY+wtWTmpMW+qEg7QZFOQ
         gw9iqzeOwXEcojjBe0mgXJeuAiy8cQqqM3r2jQ15fANebi7+8q02Ynh45j1WGqZgMcM7
         7+Rf7VJTHAmQZNvuELzvZJsLNVjD90xyn1JGzTquNUgJNAoExgn0kWv4w11T3lTlatw9
         iDjiJGWIYhCbHB6awCVVdqsBPRGZAs0I4ryO1QQXzEJ/f3POouHTWbo8f4ZaNOTNdkq0
         Otqx8p78xgNTTavS1AeZlrz5cFM0bSPBI6gASe5miO67XqhcuoZSdePzWytQGB8m1A+N
         nvBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeoyBDLrzUS7J/MKSZQLU/gaWvautLMX4+Xg4FrLReX2e9SQBwrcNpnPlV1ej1lxtg01jjHEMH7ye7JSiXI9t7+0fu8IL3y/oEQi2FwEbff0dZSGxOknfty8SpiSYbdNPwAvqSdxdQeVv0cw==
X-Gm-Message-State: AOJu0Ywpgb3q12vn+2HAn8WONc9qB/jRAhA2DS96xRPTEy4ynpIx4kmv
	YeiNpwJJMCvFEcqmh3MKohNPLNjKr1+RVWcxBwUB/VLndajSpacWxDepUsOgQcjSy+OJ3ekAbZk
	ncmntCln8s41XiZoqRkU7VGbSCro=
X-Google-Smtp-Source: AGHT+IGSP2VVqjRRz2TZ1caHxDiFbN51sCjnGEO9YadMPHzDxZxvp8SfD4moXFhISu9PeRhnmZVniT7dJVwEYK+RZVE=
X-Received: by 2002:ac8:5253:0:b0:440:4619:ee75 with SMTP id
 d75a77b69052e-4404619fa0bmr109549121cf.0.1718132573566; Tue, 11 Jun 2024
 12:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605121713.3596499-1-quic_bibekkum@quicinc.com> <20240605121713.3596499-7-quic_bibekkum@quicinc.com>
In-Reply-To: <20240605121713.3596499-7-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Jun 2024 12:02:39 -0700
Message-ID: <CAF6AEGtSCfQVtNTmwB4Jkec5rDmZsr59z2717H76kwWu0wovsw@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, 
	konrad.dybcio@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 5:18=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Add an adreno-smmu-priv interface for drm/msm to call
> into arm-smmu-qcom and initiate the PRR bit setup or reset
> sequence as per request.
>
> This will be used by GPU side to setup the PRR bit and
> related configuration registers through adreno-smmu private
> interface instead of directly poking the smmu hardware.
>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 21 +++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           |  5 ++++-
>  3 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 8dabc26fa10e..2f4ee22f740a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -28,6 +28,7 @@
>  #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
>  #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
>  #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> +#define GFX_ACTLR_PRR          (1 << 5)
>
>  static const struct actlr_config sc7280_apps_actlr_cfg[] =3D {
>         { 0x0800, 0x24e1, PREFETCH_DEFAULT | CMTLB },
> @@ -212,6 +213,25 @@ static void qcom_adreno_smmu_resume_translation(cons=
t void *cookie, bool termina
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>  }
>
> +static void qcom_adreno_smmu_set_actlr_bit(const void *cookie, phys_addr=
_t page_addr, bool set)
> +{

_set_actlr_bit() is a bit more of an implementation detail.  Maybe
_set_prr() would be a better name?

Also, the version of this patch that I typed up (but haven't sent to
list yet) took a `struct page *` instead of a phys_addr_t.. passing
NULL would disable PRR, so I didn't need the third arg

> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       u32 reg =3D 0;
> +
> +       writel_relaxed(lower_32_bits(page_addr),
> +                               (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_C=
FG_LADDR);
> +
> +       writel_relaxed(upper_32_bits(page_addr),
> +                               (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_C=
FG_UADDR);

I know downstream writes it as upper+lower, but I'd guess we could
just writeq, couldn't we?

> +
> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> +       reg |=3D FIELD_PREP(GFX_ACTLR_PRR, set ? 1 : 0);

this won't clear the ENABLE_PRR bit if we try to disable it after
enabling (unless this bit is read-as-zero

Also, can we give a name to PRR?  I'm guessing it is something like
physical-range-remap?

BR,
-R

> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> +
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -384,6 +404,7 @@ static int qcom_adreno_smmu_init_context(struct arm_s=
mmu_domain *smmu_domain,
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
>         priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> +       priv->set_actlr_bit =3D qcom_adreno_smmu_set_actlr_bit;
>
>         actlrvar =3D qsmmu->data->actlrvar;
>         if (!actlrvar)
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index d9c2ef8c1653..3076bef49e20 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_SCTLR_M               BIT(0)
>
>  #define ARM_SMMU_CB_ACTLR              0x4
> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>
>  #define ARM_SMMU_CB_RESUME             0x8
>  #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu=
-priv.h
> index c637e0997f6d..448e191eeb52 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -49,7 +49,9 @@ struct adreno_smmu_fault_info {
>   *                 before set_ttbr0_cfg().  If stalling on fault is enab=
led,
>   *                 the GPU driver must call resume_translation()
>   * @resume_translation: Resume translation after a fault
> - *
> + * @set_actlr_bits: Extendible interface to be used  by GPU to modify th=
e
> + *                 ACTLR bits, currently used to intitate PRR bit setup =
or
> + *                 reset sequence for ACTLR registers as requested.
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controllin=
g
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directl=
y
> @@ -67,6 +69,7 @@ struct adreno_smmu_priv {
>      void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_=
info *info);
>      void (*set_stall)(const void *cookie, bool enabled);
>      void (*resume_translation)(const void *cookie, bool terminate);
> +    void (*set_actlr_bit)(const void *cookie, phys_addr_t page_addr, boo=
l set);
>  };
>
>  #endif /* __ADRENO_SMMU_PRIV_H */
> --
> 2.34.1
>

