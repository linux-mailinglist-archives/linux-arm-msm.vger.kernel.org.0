Return-Path: <linux-arm-msm+bounces-24643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14691C0AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 16:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C5DFB2345D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 14:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FD21C004E;
	Fri, 28 Jun 2024 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrRG0XFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961D1C0047;
	Fri, 28 Jun 2024 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584253; cv=none; b=QYLxsuBQNbv99NyXyqk2WZk+dvwx8ujyt5g7wxnjEh2H4QvbNa+P5/YMLJdmMzW4QJ07Sk0QLWLhqgf/NtvzBIfRPBo+F7yb2XOs/3s58UECZeQpMd/9C2H0gYmWV1ECuhy1yeDj7LiZcf7RP6drLm3bwpbVk5IyMrqyCycHaaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584253; c=relaxed/simple;
	bh=Ydmge2jXvUltuSBS3uDjrxGcWKj6zkL+i043pry6h80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ys+ITEPtpp57WjXFEheJeIuN1h16amBkURpahDTUCc5z1alirmLLaBqTOModvX+JGNjsbyNLG+WpJBZH5HfTDH1HY+UuJmZfKKmeShNt2a3L9GB5t/zyJ4aNQLciy//oDRXbCf+ubPNAGoWQWFmPpzDtBWPQqUe4aiObhNs/++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrRG0XFG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6fe61793e2so36993966b.0;
        Fri, 28 Jun 2024 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719584250; x=1720189050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUZfsgVRZxSnQOE+V7qWG65GlTuqoj2VVa3LE3t/3OE=;
        b=XrRG0XFGwMF4spM0z07MaF7e+f7ln4MGpw0smZiLI3Za0Lwrubg3pSml1H8/3ODTzD
         ux53IwL2iv5dfw2MqHlDE6VOTsR/buJrOxi4oQd4WE3dztVYA1GbiyXnymJrZVewpwW7
         UPPxHGbYWFQij/fXND8HmnqL2bYbPSlxF0EDXR0BowpoSXnr0GxGzmhhbRodWoRW0jP/
         cLHSjGvQ97nYQLhOJhkP4epSkInMFPt7528d3TCMXg2poP1NjglA1438D/KsScXYtHXF
         U/KcFGYeh1tXoVBl0aVt+JIK7VtGitLlhGnC2/CRCO2+TUL51GkMAh96dY2lXGQio0rN
         5c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584250; x=1720189050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUZfsgVRZxSnQOE+V7qWG65GlTuqoj2VVa3LE3t/3OE=;
        b=oA5nWBsPa+owOU+DOGOSlmyUEjjGpyipMynl/rcTHCRODwbAiwK1Yli8E/jcF2Dfgi
         AgXUF0mviAnMuWaIrjy5PM2XOoaGCXgOMn3V5QmNpxmBO4V9sKTi1QAmJmqbKQtlXS/f
         XvxI54KSMEwr5TdvLWJkPn4a6kG6vPqKc9uXYkO198E+hltFHJkDUrT3ARivjdpusfFx
         ygzMTEneREOCV0B743xejiiu4r+WdISlY/xcEe0/31l+9SBTctkVxQqUiu84n/4bA2zK
         hkjJWXUyWZ+fE7ZoM9n87zMvl9MQax1ro4w94xcNfOILHe+CRArIT1CZm7dMVxWfRDlU
         Ylww==
X-Forwarded-Encrypted: i=1; AJvYcCUX0Ejo3O1lCyj6IYnRqxpW4NHE5XWzC5XXjo3p4St7YzNzVe0hTJjClgkEPk2MsVtg4KwuQtFHEWnAypEcj/8lftOAqxtV7ISOUIq4iyHc4N62OsfGgdwteShCylLVOL4kBEqPQXX1jVIzzw==
X-Gm-Message-State: AOJu0YynlefmEbwwwnz2t3KYG0479Qg6NnEHeT1DcA0oWkryIZxEmd+G
	Yn37zIsyUWJFuCJ7vl9sy/Z8DAhuUCHYtFzJYfICzO5Fpv/wu1WfE9ZUvwIGbCQxbj0r9EwC0OL
	Y2N4TSZfVUuz4IZH7tpCjYB6j//Y=
X-Google-Smtp-Source: AGHT+IFuP1Mc9O5IzSHeKzAD4lyy6B7kIx7ruZTd+TTFQ6LgZ8Bny0sYM+gfTL0wj7e4jUrhs5wD+k3GzQg3LDmK3N4=
X-Received: by 2002:a50:ab5b:0:b0:57d:2659:9143 with SMTP id
 4fb4d7f45d1cf-57d4bde078cmr13706394a12.37.1719584249785; Fri, 28 Jun 2024
 07:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com> <20240628140435.1652374-7-quic_bibekkum@quicinc.com>
In-Reply-To: <20240628140435.1652374-7-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jun 2024 07:17:17 -0700
Message-ID: <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
Subject: Re: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, 
	konrad.dybcio@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 7:05=E2=80=AFAM Bibek Kumar Patro
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
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           |  6 +++++-
>  3 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index bd101a161d04..64571a1c47b8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -28,6 +28,7 @@
>  #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
>  #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
>  #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> +#define GFX_ACTLR_PRR          (1 << 5)
>
>  static const struct actlr_config sc7280_apps_actlr_cfg[] =3D {
>         { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_translation(cons=
t void *cookie, bool termina
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>  }
>
> +static void qcom_adreno_smmu_set_prr(const void *cookie, phys_addr_t pag=
e_addr, bool set)
> +{
> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       u32 reg =3D 0;
> +
> +       writel_relaxed(lower_32_bits(page_addr),
> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> +
> +       writel_relaxed(upper_32_bits(page_addr),
> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> +
> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> +       reg &=3D ~GFX_ACTLR_PRR;
> +       if (set)
> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> +

nit, extra line

Also, if you passed a `struct page *` instead, then you could drop the
bool param, ie. passing NULL for the page would disable PRR.  But I
can go either way if others have a strong preference for phys_addr_t.

Otherwise, lgtm

BR,
-R

> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -407,6 +429,7 @@ static int qcom_adreno_smmu_init_context(struct arm_s=
mmu_domain *smmu_domain,
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
>         priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> +       priv->set_prr =3D qcom_adreno_smmu_set_prr;
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
> index c637e0997f6d..d6e2ca9f8d8c 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -49,7 +49,10 @@ struct adreno_smmu_fault_info {
>   *                 before set_ttbr0_cfg().  If stalling on fault is enab=
led,
>   *                 the GPU driver must call resume_translation()
>   * @resume_translation: Resume translation after a fault
> - *
> + * @set_prr:      Extendible interface to be used by GPU to modify the
> + *                 ACTLR register bits, currently used to configure
> + *                 Partially-Resident-Region (PRR) feature's
> + *                 setup and reset sequence as requested.
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controllin=
g
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directl=
y
> @@ -67,6 +70,7 @@ struct adreno_smmu_priv {
>      void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_=
info *info);
>      void (*set_stall)(const void *cookie, bool enabled);
>      void (*resume_translation)(const void *cookie, bool terminate);
> +    void (*set_prr)(const void *cookie, phys_addr_t page_addr, bool set)=
;
>  };
>
>  #endif /* __ADRENO_SMMU_PRIV_H */
> --
> 2.34.1
>

