Return-Path: <linux-arm-msm+bounces-24651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 823CB91C281
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027E41F2326A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 15:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A9E1C68B9;
	Fri, 28 Jun 2024 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lsgwlGCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623521C68BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719588056; cv=none; b=Xc4Hs8JVxPyhj6r5b3/59Lea+yNv0eihk5jk+trFpjKoPYIJzUNVJ7yQk1/m2HaT98zrrHGGvUNNAJ8ky/hOAyqYsyqL1jb+tZ1M7hCOAgE18zroeCC6nwdFUhXqPX+FEmEnEBI0SVBGDuZLpFXRaqYSnuGV4yivluN3yjmAwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719588056; c=relaxed/simple;
	bh=v/fYmrYVn/9LcUiOkFv/Ot0ysfqqFNx1uvmDr5lLIpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eopESwd9gxoUqV0PcPaoHP5nlOlWJQMDvKpF07VY4KoXOMGo/pn2w5YyuQY5cr3l052cdCAuwsEcVgCBHw4PWLKvPVaoC3slJoS7xTidKn24EuI46ni0wUqbgD2pOPlMD36H3T3DUUi0CBtEUiqh9WHiQ8+GY3s03TIMxNh6RHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lsgwlGCk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57d16251a07so12694a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719588053; x=1720192853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7p1urVA8K5sCvk9JL4ySBHd4kgubJNI6HMtuJEbzO4=;
        b=lsgwlGCkjl9JWT8lXS2NJpfGqXJ0b44/JxMX45ExQ2FAoHDFyTch7H4x3/Kii805xl
         j/cGpkNTi+ltx4F54DP315crFqaBOoxq7slQF48H+zsIlubwoZKkr9HG0M937AMww8EM
         aGO1bxZ5d696dV8OsRhf6cwdfoWMCyKn1ct9hL7dwtwIMGfAYK0XriGJGjFlhLDpM7qD
         rXLTwNbm8zKuuOMwWha0l5QcvHw5ESYNqG8hK/vtC6oe/myzqc0PdNWRgarn0Ztpj0Cb
         OREP3BlA0GFyP/cU4+SP/NVrpRH6fQEvNxzuROqOKtqL9JSojmzBhPci7fgmwlTPNNTW
         /1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719588053; x=1720192853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7p1urVA8K5sCvk9JL4ySBHd4kgubJNI6HMtuJEbzO4=;
        b=WvNH+9LVkDeX1F0jlZW3VgyK3ho2U7zdmQeZdP29ekH48MAFKihLXKrBoAKAxlSH7Y
         p8a5c/GoNabx2tc8D+Fa32PcICC2ZVN+HN9QSsXveUk/h9LFDDfadUF7ZqIus0QQDMxv
         pTDabVwrT2O5ylRB88o8DB+rvOs8SZvsdYsO9QqBEV/VbhL0wwSxB3VGFB4+UmRrKFKY
         AytMoZejcAiGIjBGvIM7udP9e4Pvk6+wIgEGs4XirXtHxTnhMYzuezhr1Uv/iCNd5Lu3
         x+W3MQ0S22AUbizcdD8py9kP6wnlYlaXA+RjIUunHJV2EOlq6da66c7CJsxr2bFtmUF/
         B2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXqcgGm3LvAd4xV4YvfMFmbSDSmh8uFfA3jQwW84VSXu6VUJuZFQX+9NZDwuvx3pdlwuO1rwn0N+Pymj4udPUKNFv73IDhcIByBlfA5pg==
X-Gm-Message-State: AOJu0Yw81tiu5v4yLPeecOtrGnOepjzk6zxGhcGZcqg/roxCkr5PVpiZ
	9i6tZrzOPfZKWkaFVH8NFKuspR6OsLLGISBJLzbMWeWNElCre+LuEIJXGpGg2wc96D00nyHSV+h
	SYe3vsdKI+t5QNOpb1f6f0Plhu3lKzURsDBil
X-Google-Smtp-Source: AGHT+IFpDqqhvhvHv4j/iFICWtsGGYUCSjbLftj1RaYEadZ5cXGIbEmM5GoEYAcg1YzL6B/V4SSWY8qEXU1Pd71+qcY=
X-Received: by 2002:a50:ab0a:0:b0:57d:6e52:fff6 with SMTP id
 4fb4d7f45d1cf-5862fa1dd57mr196958a12.5.1719588052153; Fri, 28 Jun 2024
 08:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627221613.393060-1-robdclark@gmail.com>
In-Reply-To: <20240627221613.393060-1-robdclark@gmail.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Fri, 28 Jun 2024 20:50:40 +0530
Message-ID: <CAN6iL-SxhwWAn+q02mVtQXaVVf4rmKa4_1_TzZuKg5=5QRxO4Q@mail.gmail.com>
Subject: Re: [PATCH v3] iommu/arm-smmu: Pretty-print context fault related regs
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jerry Snitselaar <jsnitsel@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 3:46=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Parse out the bitfields for easier-to-read fault messages.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 62 ++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 +++++++++++++++----
>  drivers/iommu/arm/arm-smmu/arm-smmu.h         | 67 ++++++++++++------
>  3 files changed, 119 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 552199cbd9e2..da2e605014a5 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -141,7 +141,7 @@ static int qcom_tbu_halt(struct qcom_tbu *tbu, struct=
 arm_smmu_domain *smmu_doma
>         writel_relaxed(val, tbu->base + DEBUG_SID_HALT_REG);
>
>         fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       if ((fsr & ARM_SMMU_FSR_FAULT) && (fsr & ARM_SMMU_FSR_SS)) {
> +       if ((fsr & ARM_SMMU_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS)) {
>                 u32 sctlr_orig, sctlr;
>
>                 /*
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
> @@ -324,7 +324,7 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_=
domain *smmu_domain,
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
> @@ -383,68 +383,46 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
>         struct arm_smmu_domain *smmu_domain =3D dev;
>         struct io_pgtable_ops *ops =3D smmu_domain->pgtbl_ops;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -       u32 fsr, fsynr, cbfrsynra, resume =3D 0;
> +       struct arm_smmu_context_fault_info cfi;
> +       u32 resume =3D 0;
>         int idx =3D smmu_domain->cfg.cbndx;
>         phys_addr_t phys_soft;
> -       unsigned long iova;
>         int ret, tmp;
>
>         static DEFINE_RATELIMIT_STATE(_rs,
>                                       DEFAULT_RATELIMIT_INTERVAL,
>                                       DEFAULT_RATELIMIT_BURST);
>
> -       fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       if (!(fsr & ARM_SMMU_FSR_FAULT))
> -               return IRQ_NONE;
> +       arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>
> -       fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> -       iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> -       cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx)=
);
> +       if (!(cfi.fsr & ARM_SMMU_FSR_FAULT))
> +               return IRQ_NONE;
>
>         if (list_empty(&tbu_list)) {
> -               ret =3D report_iommu_fault(&smmu_domain->domain, NULL, io=
va,
> -                                        fsynr & ARM_SMMU_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +               ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> +                                        cfi.fsynr & ARM_SMMU_CB_FSYNR0_W=
NR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>
>                 if (ret =3D=3D -ENOSYS)
> -                       dev_err_ratelimited(smmu->dev,
> -                                           "Unhandled context fault: fsr=
=3D0x%x, iova=3D0x%08lx, fsynr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> -                                           fsr, iova, fsynr, cbfrsynra, =
idx);
> +                       arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
>
> -               arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> +               arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
>                 return IRQ_HANDLED;
>         }
>
> -       phys_soft =3D ops->iova_to_phys(ops, iova);
> +       phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
>
> -       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
> -                                fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAUL=
T_WRITE : IOMMU_FAULT_READ);
> +       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> +                                cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOM=
MU_FAULT_WRITE : IOMMU_FAULT_READ);
>         if (!tmp || tmp =3D=3D -EBUSY) {
> -               dev_dbg(smmu->dev,
> -                       "Context fault handled by client: iova=3D0x%08lx,=
 fsr=3D0x%x, fsynr=3D0x%x, cb=3D%d\n",
> -                       iova, fsr, fsynr, idx);
> +               arm_smmu_print_context_fault_info(smmu, idx, &cfi);

Not sure if we'd want to remove the original log here.
I don't think adding the log "Context fault handled by client" in the
`arm_smmu_print_context_fault_info` function would be correct.
Since the same message would be logged even when the context fault
is unhandled whereas it seems we log this only when report_iommu_fault
returns NULL or -EBUSY. I like the approach to break out a print helper,
but let's not log "Context fault handled by client" as a part of it.

>                 dev_dbg(smmu->dev, "soft iova-to-phys=3D%pa\n", &phys_sof=
t);
>                 ret =3D IRQ_HANDLED;
>                 resume =3D ARM_SMMU_RESUME_TERMINATE;
>         } else {
> -               phys_addr_t phys_atos =3D qcom_smmu_verify_fault(smmu_dom=
ain, iova, fsr);
> +               phys_addr_t phys_atos =3D qcom_smmu_verify_fault(smmu_dom=
ain, cfi.iova, cfi.fsr);
>
>                 if (__ratelimit(&_rs)) {
> -                       dev_err(smmu->dev,
> -                               "Unhandled context fault: fsr=3D0x%x, iov=
a=3D0x%08lx, fsynr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> -                               fsr, iova, fsynr, cbfrsynra, idx);
> -                       dev_err(smmu->dev,
> -                               "FSR    =3D %08x [%s%s%s%s%s%s%s%s%s], SI=
D=3D0x%x\n",
> -                               fsr,
> -                               (fsr & 0x02) ? "TF " : "",
> -                               (fsr & 0x04) ? "AFF " : "",
> -                               (fsr & 0x08) ? "PF " : "",
> -                               (fsr & 0x10) ? "EF " : "",
> -                               (fsr & 0x20) ? "TLBMCF " : "",
> -                               (fsr & 0x40) ? "TLBLKF " : "",
> -                               (fsr & 0x80) ? "MHF " : "",
> -                               (fsr & 0x40000000) ? "SS " : "",
> -                               (fsr & 0x80000000) ? "MULTI " : "",
> -                               cbfrsynra);
> +                       arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
>
>                         dev_err(smmu->dev,
>                                 "soft iova-to-phys=3D%pa\n", &phys_soft);
> @@ -478,10 +456,10 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
>          */
>         if (tmp !=3D -EBUSY) {
>                 /* Clear the faulting FSR */
> -               arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> +               arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
>
>                 /* Retry or terminate any stalled transactions */
> -               if (fsr & ARM_SMMU_FSR_SS)
> +               if (cfi.fsr & ARM_SMMU_CB_FSR_SS)
>                         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME, =
resume);
>         }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 87c81f75cf84..246a39081879 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -405,32 +405,72 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb=
_ops_v1 =3D {
>         .tlb_add_page   =3D arm_smmu_tlb_add_page_s2_v1,
>  };
>
> +
> +void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int =
idx,
> +                                     struct arm_smmu_context_fault_info =
*cfi)
> +{
> +       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> +       cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> +}
> +
> +void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int=
 idx,
> +                                      const struct arm_smmu_context_faul=
t_info *cfi)

Maybe add a "isHandled" bool in the parameter based on which we either prin=
t
"Context fault handled by client" or "Unhandled context fault" before
logging registers.

> +{
> +       dev_dbg(smmu->dev,
> +               "Context fault handled by client: iova=3D0x%08lx, fsr=3D0=
x%x, fsynr=3D0x%x, cb=3D%d\n",

As mentioned above, let's print if the fault was handled or not based
on a handled flag.

> +               cfi->iova, cfi->fsr, cfi->fsynr, idx);
> +
> +       dev_err(smmu->dev, "FSR    =3D %08x [%s%sFormat=3D%u%s%s%s%s%s%s%=
s%s], SID=3D0x%x\n",

I liked the " | " separators too (sorry!) but I'm okay unless someone
else feels the same.

> +               cfi->fsr,
> +               (cfi->fsr & ARM_SMMU_CB_FSR_MULTI)  ? "MULTI " : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_SS)     ? "SS " : "",

Nit: Let's be consistent with the spacing, either add a space before or aft=
er.

> +               (u32)FIELD_GET(ARM_SMMU_CB_FSR_FORMAT, cfi->fsr),
> +               (cfi->fsr & ARM_SMMU_CB_FSR_UUT)    ? " UUT" : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_ASF)    ? " ASF" : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_TLBLKF) ? " TLBLKF" : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_TLBMCF) ? " TLBMCF" : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_EF)     ? " EF" : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_PF)     ? " PF" : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_AFF)    ? " AFF" : "",
> +               (cfi->fsr & ARM_SMMU_CB_FSR_TF)     ? " TF" : "",
> +               cfi->cbfrsynra);
> +
> +       dev_err(smmu->dev, "FSYNR0 =3D %08x [S1CBNDX=3D%u%s%s%s%s%s%s PLV=
L=3D%u]\n",
> +               cfi->fsynr,
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
> +               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> +               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> +               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : ""=
,
> +               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> +               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> +               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
> +}
> +
>  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  {
> -       u32 fsr, fsynr, cbfrsynra;
> -       unsigned long iova;
> +       struct arm_smmu_context_fault_info cfi;

I like this, it looks clean!

>         struct arm_smmu_domain *smmu_domain =3D dev;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> +                                     DEFAULT_RATELIMIT_BURST);
>         int idx =3D smmu_domain->cfg.cbndx;
>         int ret;
>
> -       fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       if (!(fsr & ARM_SMMU_FSR_FAULT))
> -               return IRQ_NONE;
> +       arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>
> -       fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> -       iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> -       cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx)=
);
> +       if (!(cfi.fsr & ARM_SMMU_FSR_FAULT))
> +               return IRQ_NONE;
>
> -       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
> -               fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_F=
AULT_READ);
> +       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> +               cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : =
IOMMU_FAULT_READ);
>
> -       if (ret =3D=3D -ENOSYS)
> -               dev_err_ratelimited(smmu->dev,
> -               "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsy=
nr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> -                           fsr, iova, fsynr, cbfrsynra, idx);

Same here, I wouldn't want the "Unhandled context fault" log to be
replaced by "Context fault handled by client".

> +       if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
> +               arm_smmu_print_context_fault_info(smmu, idx, &cfi);
>
> -       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> +       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
>         return IRQ_HANDLED;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index 4765c6945c34..faf475366d4d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -196,34 +196,42 @@ enum arm_smmu_cbar_type {
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
> +#define ARM_SMMU_CB_FSR_MULTI          BIT(31)
> +#define ARM_SMMU_CB_FSR_SS             BIT(30)
> +#define ARM_SMMU_CB_FSR_FORMAT         GENMASK(10, 9)
> +#define ARM_SMMU_CB_FSR_UUT            BIT(8)
> +#define ARM_SMMU_CB_FSR_ASF            BIT(7)
> +#define ARM_SMMU_CB_FSR_TLBLKF         BIT(6)
> +#define ARM_SMMU_CB_FSR_TLBMCF         BIT(5)
> +#define ARM_SMMU_CB_FSR_EF             BIT(4)
> +#define ARM_SMMU_CB_FSR_PF             BIT(3)
> +#define ARM_SMMU_CB_FSR_AFF            BIT(2)
> +#define ARM_SMMU_CB_FSR_TF             BIT(1)
> +
> +#define ARM_SMMU_FSR_IGN               (ARM_SMMU_CB_FSR_AFF |          \
> +                                        ARM_SMMU_CB_FSR_ASF |          \
> +                                        ARM_SMMU_CB_FSR_TLBMCF |       \
> +                                        ARM_SMMU_CB_FSR_TLBLKF)
> +
> +#define ARM_SMMU_FSR_FAULT             (ARM_SMMU_CB_FSR_MULTI |        \
> +                                        ARM_SMMU_CB_FSR_SS |           \
> +                                        ARM_SMMU_CB_FSR_UUT |          \
> +                                        ARM_SMMU_CB_FSR_EF |           \
> +                                        ARM_SMMU_CB_FSR_PF |           \
> +                                        ARM_SMMU_CB_FSR_TF |           \
>                                          ARM_SMMU_FSR_IGN)
>
>  #define ARM_SMMU_CB_FAR                        0x60
>
>  #define ARM_SMMU_CB_FSYNR0             0x68
> -#define ARM_SMMU_FSYNR0_WNR            BIT(4)
> +#define ARM_SMMU_CB_FSYNR0_PLVL                GENMASK(1, 0)
> +#define ARM_SMMU_CB_FSYNR0_WNR         BIT(4)
> +#define ARM_SMMU_CB_FSYNR0_PNU         BIT(5)
> +#define ARM_SMMU_CB_FSYNR0_IND         BIT(6)
> +#define ARM_SMMU_CB_FSYNR0_NSATTR      BIT(8)
> +#define ARM_SMMU_CB_FSYNR0_PTWF                BIT(10)
> +#define ARM_SMMU_CB_FSYNR0_AFR         BIT(11)
> +#define ARM_SMMU_CB_FSYNR0_S1CBNDX     GENMASK(23, 16)
>
>  #define ARM_SMMU_CB_FSYNR1             0x6c
>
> @@ -533,4 +541,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu);
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);
>
> +struct arm_smmu_context_fault_info {
> +       unsigned long iova;
> +       u32 fsr;
> +       u32 fsynr;
> +       u32 cbfrsynra;
> +};
> +
> +void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int =
idx,
> +                                     struct arm_smmu_context_fault_info =
*cfi);
> +
> +void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int=
 idx,
> +                                      const struct arm_smmu_context_faul=
t_info *cfi);
> +
>  #endif /* _ARM_SMMU_H */
> --
> 2.45.2
>

