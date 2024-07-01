Return-Path: <linux-arm-msm+bounces-24827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E891E85C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8291F22A0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B43216F26E;
	Mon,  1 Jul 2024 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sp5IB6H8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7371741D0
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861209; cv=none; b=P9FDTr3oQ1BftqYbpNUu2ZL8VmV7BKYO8SVMbrirX0og3QYuGO3GPKxQ7TwSZ/8ww/BKacdO8BGfcj6/bjFBhkkcZsKV2wR6Mq/mnNY2vZs6THfxecBwPXtkh4yUtfF9SlWGApzlS6emNNInq3FDL0TThNCA480k8KHTX8MIEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861209; c=relaxed/simple;
	bh=gupexbpiAL3ERI6YIxBbES/GTXD1sqpimnc8/MRuhRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tt1nhGXenrVDR+Z4gtWl2YM054PQHLOjwjcHPS7jpCe3ccU0sC5igvy+WOEs+nRkzccW51mPgelCs6zNuYlBVACM8F9Avh3Z/VWyCf3aH2ZfAegUo4TzeIMst0xsdbWABhv3pddIow2DBwmwKVGeYBZQaWGp88R+Ag1hY3HwcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sp5IB6H8; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso11416a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719861204; x=1720466004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTwR81k/C6TuKDXD1gSrH19luO0XpCqAMdsSecTdwzo=;
        b=Sp5IB6H8Y5bfOsPucptstZYE5WAXODObavQOUkDnCrrv5uQpb2iu/VLieq+wIMxj3F
         QXr8E/UE+EbS6ycX7wHaQUMo1L4OSBDdUL31FTfmhsvGUCt/bH3ojgSHh68s6kI5eCq0
         YMk0d16X97Vpmc9AHjBWxM2gLm0fSES7Kr6LPcu/8LOsftT07A8H/t+FKE9ErK2I1BVD
         yLgRaLo2cTqZy4cuaGvsoUsqjrLs/ZbGG31r7TBxlT66Adu/8FVImXvM5QfjumtKQEvd
         goPDjHkpI8Y1tEKD0qZwczmLpmt8GIDcam5foXajvgmUukWV1KPFWPkm3m4aPFJm/0jZ
         ApJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719861204; x=1720466004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTwR81k/C6TuKDXD1gSrH19luO0XpCqAMdsSecTdwzo=;
        b=EBF2ofjJoxIIbq7XvwNSZ7p1R6IvsqYqamCB01oHmC6ucvE83qLwPXXyB/wqqiFtwm
         qywt/Awspq1/HCPRIoqcS1aZzkU8QFVhfYhO8FoxToDr8qdUeH2kLe/N16Tn91Kolsgt
         PP1lV+QE8V2jm6VSWYOVJ3c8Dpy4DLOJCxCJvWr4gj2+drNNUqqQmtadNPBbSQqMIimV
         uFbu2hDaFDHXTaKIi6GODzm3VhOUREAs2AWjUrLTtQu48EYVqZT4i2L3tcFQeLB/rVnb
         adGjB6WnHIxLI5MvNumblJyvcXxM01rNpPd49L/D+WrCH2Ng05tPYYVascPz1YNmtAdg
         kCZw==
X-Forwarded-Encrypted: i=1; AJvYcCX1wkBSyhj5S7KmZjBryYN9QaD6/toJ1/BMixu/wiq89JnoHvK3PkDD6gth/L6MoLZwCLULJECthN/EtsSqRKipWc9RV/qocCERVvGh2Q==
X-Gm-Message-State: AOJu0YwvdsoeN9QIwXqVi6xqS3O38JDhvigQeO7TDLCe9oR3ZKEQAZcl
	lA+97FVTeP2ZAtP1BKcpG9Ljp0P9OsQJIyHUgZ7I0F3F0WQGHRE+p5654i17y9YJAP8zKeKvTzU
	d/d+pm2ce3Zt7vTgRQOQWw6XCqBr3r4O1SnI/
X-Google-Smtp-Source: AGHT+IG4fl/B90e8BsNKHT04HFecbPppNUeued91constonNbbT9xRg4qeU5lwJhMIMzw5b1exUJ8PHDuDq+XulfAKQ=
X-Received: by 2002:a50:f68d:0:b0:57c:bb0d:5e48 with SMTP id
 4fb4d7f45d1cf-5872f673e4bmr450741a12.2.1719861204259; Mon, 01 Jul 2024
 12:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701162025.375134-1-robdclark@gmail.com> <20240701162025.375134-2-robdclark@gmail.com>
In-Reply-To: <20240701162025.375134-2-robdclark@gmail.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Tue, 2 Jul 2024 00:43:12 +0530
Message-ID: <CAN6iL-TdLdtoK2Cz4qyf6z8x=7c=Adzwi0GuC=-3CVeOzBZ_bA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Add CB prefix to register bitfields
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar <jsnitsel@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"open list:TEGRA IOMMU DRIVERS" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 9:50=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> For consistency, add the "CB" prefix to the bitfield defines for context
> registers.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c  |  2 +-
>  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 18 +++----
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         |  8 +--
>  drivers/iommu/arm/arm-smmu/arm-smmu.h         | 50 +++++++++----------
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  4 +-
>  5 files changed, 41 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-nvidia.c
> index 957d988b6d83..4b2994b6126d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> @@ -200,7 +200,7 @@ static irqreturn_t nvidia_smmu_context_fault_bank(int=
 irq,
>         void __iomem *cb_base =3D nvidia_smmu_page(smmu, inst, smmu->nump=
age + idx);
>
>         fsr =3D readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
> -       if (!(fsr & ARM_SMMU_FSR_FAULT))
> +       if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
>         fsynr =3D readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 552199cbd9e2..e4ee78fb6a66 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -141,7 +141,7 @@ static int qcom_tbu_halt(struct qcom_tbu *tbu, struct=
 arm_smmu_domain *smmu_doma
>         writel_relaxed(val, tbu->base + DEBUG_SID_HALT_REG);
>
>         fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       if ((fsr & ARM_SMMU_FSR_FAULT) && (fsr & ARM_SMMU_FSR_SS)) {
> +       if ((fsr & ARM_SMMU_CB_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS)) =
{
>                 u32 sctlr_orig, sctlr;
>
>                 /*
> @@ -298,7 +298,7 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_=
domain *smmu_domain,
>         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, sctlr);
>
>         fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       if (fsr & ARM_SMMU_FSR_FAULT) {
> +       if (fsr & ARM_SMMU_CB_FSR_FAULT) {
>                 /* Clear pending interrupts */
>                 arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>
> @@ -306,7 +306,7 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_=
domain *smmu_domain,
>                  * TBU halt takes care of resuming any stalled transcatio=
n.
>                  * Kept it here for completeness sake.
>                  */
> -               if (fsr & ARM_SMMU_FSR_SS)
> +               if (fsr & ARM_SMMU_CB_FSR_SS)
>                         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
>                                           ARM_SMMU_RESUME_TERMINATE);
>         }
> @@ -320,11 +320,11 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smm=
u_domain *smmu_domain,
>                         phys =3D qcom_tbu_trigger_atos(smmu_domain, tbu, =
iova, sid);
>
>                         fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_F=
SR);
> -                       if (fsr & ARM_SMMU_FSR_FAULT) {
> +                       if (fsr & ARM_SMMU_CB_FSR_FAULT) {
>                                 /* Clear pending interrupts */
>                                 arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_=
FSR, fsr);
>
> -                               if (fsr & ARM_SMMU_FSR_SS)
> +                               if (fsr & ARM_SMMU_CB_FSR_SS)
>                                         arm_smmu_cb_write(smmu, idx, ARM_=
SMMU_CB_RESUME,
>                                                           ARM_SMMU_RESUME=
_TERMINATE);
>                         }
> @@ -394,7 +394,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>                                       DEFAULT_RATELIMIT_BURST);
>
>         fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       if (!(fsr & ARM_SMMU_FSR_FAULT))
> +       if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
>         fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> @@ -403,7 +403,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>
>         if (list_empty(&tbu_list)) {
>                 ret =3D report_iommu_fault(&smmu_domain->domain, NULL, io=
va,
> -                                        fsynr & ARM_SMMU_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +                                        fsynr & ARM_SMMU_CB_FSYNR0_WNR ?=
 IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>
>                 if (ret =3D=3D -ENOSYS)
>                         dev_err_ratelimited(smmu->dev,
> @@ -417,7 +417,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>         phys_soft =3D ops->iova_to_phys(ops, iova);
>
>         tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
> -                                fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAUL=
T_WRITE : IOMMU_FAULT_READ);
> +                                fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_F=
AULT_WRITE : IOMMU_FAULT_READ);
>         if (!tmp || tmp =3D=3D -EBUSY) {
>                 dev_dbg(smmu->dev,
>                         "Context fault handled by client: iova=3D0x%08lx,=
 fsr=3D0x%x, fsynr=3D0x%x, cb=3D%d\n",
> @@ -481,7 +481,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>                 arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>
>                 /* Retry or terminate any stalled transactions */
> -               if (fsr & ARM_SMMU_FSR_SS)
> +               if (fsr & ARM_SMMU_CB_FSR_SS)
>                         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME, =
resume);
>         }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 87c81f75cf84..23cf91ac409b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -415,7 +415,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, vo=
id *dev)
>         int ret;
>
>         fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       if (!(fsr & ARM_SMMU_FSR_FAULT))
> +       if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
>         fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> @@ -423,7 +423,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, vo=
id *dev)
>         cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx)=
);
>
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
> -               fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_F=
AULT_READ);
> +               fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMM=
U_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS)
>                 dev_err_ratelimited(smmu->dev,
> @@ -1306,7 +1306,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struc=
t iommu_domain *domain,
>                 arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_ATS1PR, va);
>
>         reg =3D arm_smmu_page(smmu, ARM_SMMU_CB(smmu, idx)) + ARM_SMMU_CB=
_ATSR;
> -       if (readl_poll_timeout_atomic(reg, tmp, !(tmp & ARM_SMMU_ATSR_ACT=
IVE),
> +       if (readl_poll_timeout_atomic(reg, tmp, !(tmp & ARM_SMMU_CB_ATSR_=
ACTIVE),
>                                       5, 50)) {
>                 spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>                 dev_err(dev,
> @@ -1642,7 +1642,7 @@ static void arm_smmu_device_reset(struct arm_smmu_d=
evice *smmu)
>         /* Make sure all context banks are disabled and clear CB_FSR  */
>         for (i =3D 0; i < smmu->num_context_banks; ++i) {
>                 arm_smmu_write_context_bank(smmu, i);
> -               arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_FSR_=
FAULT);
> +               arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_F=
SR_FAULT);
>         }
>
>         /* Invalidate the TLB, just in case */
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index 4765c6945c34..b04a00126a12 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -196,34 +196,34 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_PAR_F              BIT(0)
>
>  #define ARM_SMMU_CB_FSR                        0x58
> -#define ARM_SMMU_FSR_MULTI             BIT(31)
> -#define ARM_SMMU_FSR_SS                        BIT(30)
> -#define ARM_SMMU_FSR_UUT               BIT(8)
> -#define ARM_SMMU_FSR_ASF               BIT(7)
> -#define ARM_SMMU_FSR_TLBLKF            BIT(6)
> -#define ARM_SMMU_FSR_TLBMCF            BIT(5)
> -#define ARM_SMMU_FSR_EF                        BIT(4)
> -#define ARM_SMMU_FSR_PF                        BIT(3)
> -#define ARM_SMMU_FSR_AFF               BIT(2)
> -#define ARM_SMMU_FSR_TF                        BIT(1)
> -
> -#define ARM_SMMU_FSR_IGN               (ARM_SMMU_FSR_AFF |             \
> -                                        ARM_SMMU_FSR_ASF |             \
> -                                        ARM_SMMU_FSR_TLBMCF |          \
> -                                        ARM_SMMU_FSR_TLBLKF)
> -
> -#define ARM_SMMU_FSR_FAULT             (ARM_SMMU_FSR_MULTI |           \
> -                                        ARM_SMMU_FSR_SS |              \
> -                                        ARM_SMMU_FSR_UUT |             \
> -                                        ARM_SMMU_FSR_EF |              \
> -                                        ARM_SMMU_FSR_PF |              \
> -                                        ARM_SMMU_FSR_TF |              \
> -                                        ARM_SMMU_FSR_IGN)
> +#define ARM_SMMU_CB_FSR_MULTI          BIT(31)
> +#define ARM_SMMU_CB_FSR_SS             BIT(30)
> +#define ARM_SMMU_CB_FSR_UUT            BIT(8)
> +#define ARM_SMMU_CB_FSR_ASF            BIT(7)
> +#define ARM_SMMU_CB_FSR_TLBLKF         BIT(6)
> +#define ARM_SMMU_CB_FSR_TLBMCF         BIT(5)
> +#define ARM_SMMU_CB_FSR_EF             BIT(4)
> +#define ARM_SMMU_CB_FSR_PF             BIT(3)
> +#define ARM_SMMU_CB_FSR_AFF            BIT(2)
> +#define ARM_SMMU_CB_FSR_TF             BIT(1)
> +
> +#define ARM_SMMU_CB_FSR_IGN            (ARM_SMMU_CB_FSR_AFF |          \
> +                                        ARM_SMMU_CB_FSR_ASF |          \
> +                                        ARM_SMMU_CB_FSR_TLBMCF |       \
> +                                        ARM_SMMU_CB_FSR_TLBLKF)
> +
> +#define ARM_SMMU_CB_FSR_FAULT          (ARM_SMMU_CB_FSR_MULTI |        \
> +                                        ARM_SMMU_CB_FSR_SS |           \
> +                                        ARM_SMMU_CB_FSR_UUT |          \
> +                                        ARM_SMMU_CB_FSR_EF |           \
> +                                        ARM_SMMU_CB_FSR_PF |           \
> +                                        ARM_SMMU_CB_FSR_TF |           \
> +                                        ARM_SMMU_CB_FSR_IGN)
>
>  #define ARM_SMMU_CB_FAR                        0x60
>
>  #define ARM_SMMU_CB_FSYNR0             0x68
> -#define ARM_SMMU_FSYNR0_WNR            BIT(4)
> +#define ARM_SMMU_CB_FSYNR0_WNR         BIT(4)
>
>  #define ARM_SMMU_CB_FSYNR1             0x6c
>
> @@ -237,7 +237,7 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_ATS1PR             0x800
>
>  #define ARM_SMMU_CB_ATSR               0x8f0
> -#define ARM_SMMU_ATSR_ACTIVE           BIT(0)
> +#define ARM_SMMU_CB_ATSR_ACTIVE                BIT(0)
>
>  #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index e079bb7a993e..b98a7a598b89 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -194,7 +194,7 @@ static irqreturn_t qcom_iommu_fault(int irq, void *de=
v)
>
>         fsr =3D iommu_readl(ctx, ARM_SMMU_CB_FSR);
>
> -       if (!(fsr & ARM_SMMU_FSR_FAULT))
> +       if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
>         fsynr =3D iommu_readl(ctx, ARM_SMMU_CB_FSYNR0);
> @@ -274,7 +274,7 @@ static int qcom_iommu_init_domain(struct iommu_domain=
 *domain,
>
>                 /* Clear context bank fault address fault status register=
s */
>                 iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
> -               iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_FSR_FAULT);
> +               iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT)=
;
>
>                 /* TTBRs */
>                 iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
> --
> 2.45.2
>
Reviewed-by: Pranjal Shrivastava <praan@google.com>

