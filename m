Return-Path: <linux-arm-msm+bounces-38552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB369D40F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 18:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0061F2179F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 17:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BD5156F21;
	Wed, 20 Nov 2024 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko328PnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC113C3D3;
	Wed, 20 Nov 2024 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123071; cv=none; b=RvJyql8ZWRIAsvE/yDOa/Gt0khbp8f70hFOrzHqznVY8TVwSyZle80BEHpMPVE0oB37NQOUnH90y+d/oHGP5b+gtS2RoJX+pFtRkGOugveRkyBhIxoqUMi4jcAe+KoXG5pfyXtX+GloqjjPO4nTLq6bGxFCrIK8MG0V3H7HlIRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123071; c=relaxed/simple;
	bh=aHkB2P7LBqNUQeRMlV7ZNvx7uRrbVOTigs2ZANkpDtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AK4CgG3KNoTCchV8HnU7ZeyaZvE6MVcfVxqtAoeQq2PLy8HJ7XKAfscZxxEQXpAp5mGFwyjR3HoM69pIIYiUQxkdQaKTdld1F65yp+T74aqcNpoc0qov6ex3R4yImOLKj8SzkXx4uxTgjMd/OkFj/Csf6UOCSJqScyIRXfqOOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko328PnV; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a75eaaab59so3723255ab.0;
        Wed, 20 Nov 2024 09:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732123068; x=1732727868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YotYROQz9q7K4a1uqa09vfaK/NLFHZZ6F+0KivLlFwA=;
        b=Ko328PnVKHrQYdaY5JenSd23ed54MYA5oqFZNmxKrHPtteHas+5Qh2ffdQ9nIjwTIn
         XS8KDRUhqVOWpUqyZ6nDQXQCTlKvR3qPlQMOCB/7WPw9gNwVxnQiigmptk2xZvUCgwul
         JEbH+MN3HLz+Icln6sHPv6qVDiEiJD2yOCGvYTboYkmSVAoE/nkOku2AW8QRV6dwFSN8
         4k5LvMVURbBbuKqVbpP1nBirRdnfqW8hF3WgpftrfeeHEXtZPn9Xxy3f8qguYxBuiEiJ
         LNCEBLepoAcX5aa3yd220LeHq11Hw4B4xNz3KdJDb6v2DrufB7CjrmEE0YFtV4Do+UDw
         gkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123068; x=1732727868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YotYROQz9q7K4a1uqa09vfaK/NLFHZZ6F+0KivLlFwA=;
        b=e5vQnfrgtMLcbG2MsIVf5IMFrR5eX2a7krjHgf6qZdDkd8hir/BTuD8B075uOOApFS
         DOB2ZV8HqewPDayVvi/uYaGMvgVwywRj6SIRRpv4Vv/0kddBZSsoz1Du47IeERAzOX7K
         /xDzCo3LOJ2ac9GrPDZZUAmmaXgSU7ZWG2V/uPPvNY2Aju9KVkKlFedkDNWIIvp9ZpJb
         l2ZeQNOpEUnEwiyacOhD5XAksgVuE83jpRZ4xGGiRyUngS3h1Bvb974Vk3fNPbQ2sPvF
         F2eqS2HtfNbOL13VKfz+taBDpBEMmuLGaO5EQxkMySmSQfM8X5NnjJGNpBxT1iDaKIEm
         Vlfw==
X-Forwarded-Encrypted: i=1; AJvYcCUECeV48S3C53n41QdhcXO5DOnq6w8sgcT8M7LBD0374jQydcbLUqypJyzJaHYa/aVu4Gf3M69k+aWs0WWq@vger.kernel.org, AJvYcCWkh2qt8p9mUEUrCjH29qGppqLsOmX0jidBT1x/fSq0pJSY4qHCkDc+dzzwaW4kenniqM6KOzr5dhj2YFt8@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoNJmM6GHdy3n91UsVsONspuDPK6nlaj/STd4lrTbyOdtYejX
	WpHuv48RelnQmNX3EAJhh85pu8Rw+HbRAWB7x44WmsNOWWHethh5uUJlz0bcQEM/UtVhtoSxHHC
	W5/C51kGxQnIqFn0pOWQSeUJ+o0M=
X-Google-Smtp-Source: AGHT+IEQqACmV5bTss4ZQRq/AUvYO6p57dtsbTHt1WKWyBcA2XHLrvjSK/y820pL7jrWk7vayySKaeaXQiBG13rvst4=
X-Received: by 2002:a05:6602:15d5:b0:83a:ac2a:922 with SMTP id
 ca18e2360f4ac-83ec1a2e6bcmr12202939f.7.1732123068356; Wed, 20 Nov 2024
 09:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com> <20241114160721.1527934-4-quic_bibekkum@quicinc.com>
In-Reply-To: <20241114160721.1527934-4-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 09:17:36 -0800
Message-ID: <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Add an adreno-smmu-priv interface for drm/msm to call
> into arm-smmu-qcom and initiate the PRR bit setup or reset
> sequence as per request.
>
> This will be used by GPU to setup the PRR bit and related
> configuration registers through adreno-smmu private
> interface instead of directly poking the smmu hardware.
>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           | 14 ++++++++
>  3 files changed, 53 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index d26f5aea248e..0e4f3fbda961 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -16,6 +16,8 @@
>
>  #define QCOM_DUMMY_VAL -1
>
> +#define GFX_ACTLR_PRR          (1 << 5)
> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>         return container_of(smmu, struct qcom_smmu, smmu);
> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(const=
 void *cookie, bool termina
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>  }
>
> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> +{
> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> +       u32 reg =3D 0;
> +
> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> +       reg &=3D ~GFX_ACTLR_PRR;
> +       if (set)
> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> +}
> +
> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_=
t page_addr)
> +{
> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +
> +       writel_relaxed(lower_32_bits(page_addr),
> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> +
> +       writel_relaxed(upper_32_bits(page_addr),
> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_=
device *smmu)
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_do=
main,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> +       const struct device_node *np =3D smmu_domain->smmu->dev->of_node;
>         struct adreno_smmu_priv *priv;
>
>         smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct arm_=
smmu_domain *smmu_domain,
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
>         priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> +       priv->set_prr_bit =3D NULL;
> +       priv->set_prr_addr =3D NULL;
> +
> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{

fwiw, it seems like PRR actually works on sc7180, which is _not_
mmu-500, so I guess the support actually goes back further.

I'm curious if we can just rely on this being supported by any hw that
has a6xx or newer?

BR,
-R

> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> +       }
>
>         return 0;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index e2aeb511ae90..2dbf3243b5ad 100644
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
> index c637e0997f6d..614665153b3e 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
>   *                 the GPU driver must call resume_translation()
>   * @resume_translation: Resume translation after a fault
>   *
> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL termina=
ted for
> + *             targets without PRR support. Exercise caution and verify =
target
> + *             capabilities before invoking these callbacks to prevent p=
otential
> + *             runtime errors or unexpected behavior.
> + *
> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
> + *                ACTLR register bits, currently used to configure
> + *                Partially-Resident-Region (PRR) bit for feature's
> + *                setup and reset sequence as requested.
> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> + *                physical address of PRR page passed from
> + *                GPU driver.
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controllin=
g
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directl=
y
> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
>      void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_=
info *info);
>      void (*set_stall)(const void *cookie, bool enabled);
>      void (*resume_translation)(const void *cookie, bool terminate);
> +    void (*set_prr_bit)(const void *cookie, bool set);
> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>  };
>
>  #endif /* __ADRENO_SMMU_PRIV_H */
> --
> 2.34.1
>

