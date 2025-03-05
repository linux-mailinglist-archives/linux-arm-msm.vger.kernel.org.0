Return-Path: <linux-arm-msm+bounces-50403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A182A50B10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 20:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61DEF1886269
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 19:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099E916426;
	Wed,  5 Mar 2025 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZHS0xn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987B19F436
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201764; cv=none; b=q2pjq/w46Aw9Lc+LgzrRzJIaR7IFdvLy+k+0rJ3xSEW7kqJCwbwcxuK6bv6W8WQRLGl+W3vTwwUFs/dG3X25Fvpfl0CqV6J4imsCceRcoNPooaznlnW2cvUD4Dra0LIg+ZKmqdZPwxHTwGcQHGRo1yMLdIQNZaGvIbs3MrDwXGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201764; c=relaxed/simple;
	bh=KoCOx8tGVU+Ild3WgNfYOoj4eT9QRnRz/1/DrWsauic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ce2VcWzgplu+YyTV40/PnYx7as19woQoDCIsxKqK+HGDvbucQyYyfb1JAX8ohUVT9USq8LZiP5SECtuJ/o08fcih7ltfHBNjrB4zuCjGllm0sCqQLuUZrS1QCydVeDbpcTKIEDK/kt17WS/BQz2OBnOv5edOMEMwjmAXEHPW2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZHS0xn5; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ce868498d3so22995195ab.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741201762; x=1741806562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iKupqP90kjHe611IT/Qp+RTzNpRKLP4Ly+rzhT8HFQ=;
        b=aZHS0xn56omVS9+HZSKzBgJf1mHRuXrdZ1K8D3M3BsaSIV8C8eJgSOfCKZU0EDzW+M
         rR3PgizD6YGwqe6IjWl2Hg5NEFVV9uFSK/oLI4meuXy2T9NVQpk/o+RfCZmLaixjml52
         umd7VrNn8cTaMn0R4IrKxipiArhifRsQDpYswyxDmNYxjfSem0FOkDVYB+miXH5GHzlc
         9S1ou0XZZA58/fiwzm8+JD6Kzrh7sUBlCDUcGPU5Y52TS6FQ1Uz+Z9Apq/MiWZzsoVbs
         eZGJeu45Rg3jvxI6GqtY7R+S15Z0As1/YFoAnbygIlv7zvDmuXMXsgMudmn/A8zyNcp8
         ecIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201762; x=1741806562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iKupqP90kjHe611IT/Qp+RTzNpRKLP4Ly+rzhT8HFQ=;
        b=gVhmA/DrK3aYAvA6XIPIAfI/1vCWwnh/yu+NNH1PCMlF5nPuHinLCBExRGYs1xRHZ5
         WpKiWsepRvBSSAGHnueNum1SK3uUE7bhgLWofwxz63ZmOqxNZKbBN6+XSvMfnQnInVJ1
         2ZP7GWYM7UNHkpfSv7z/oG3ruKBeUJM7W6gJ6RUqXFAk6gqkacfQxDVdaDoNowg+Kxbt
         sDbBYDQdTCpqEU98Ob4bJoVAfHDPsoa7BA1Q3NVnLyEAploJQm80Aubd3ehVCocXAjf+
         wTu/PaZNvxamsc5/fu4CO+Hlc6qlO0mUVlNwj3dSlcnZb2B2RcshD0mWbRJDhQXnCnXe
         HKLA==
X-Forwarded-Encrypted: i=1; AJvYcCViDy90X+ctZ3uOQ6uR3WHct5kcZexKWzm0s5rv41HPENBXbZswRsN3wFLM5EDvXCVLV+92ibM9JowZzkm4@vger.kernel.org
X-Gm-Message-State: AOJu0YyyL0/43epkJDC+lC+MfiUnRs4meVn2Wtp38PnGyqEjjJnU9qrY
	0w2huEdz5ajrKYjpmw0DHBYPttsmAn37cpcIzIosWJw9v35NN5oiRsxhB6hWEqNdlittFZTyGGI
	HkB89fsAfzsDZTl4M6fFPCvmmiFI=
X-Gm-Gg: ASbGncuTsVRb86BOKH13wwBOm0D7V28NeRmp+An+7I1ZE9KnjFgRO3uJ4PzGFHx7KG/
	blL9KeoGmGnWL+XdqkyJuPYFTEnixhBSaTfuykqQ+HMP7Z/Sox54IYiFyqbg1qYvYUQ+RO65T3w
	YpsSNjhLlmcSAGg7Ty/fu3ONGhWw==
X-Google-Smtp-Source: AGHT+IHXSq8mWw3KY8YoLCBCIFRQJmRjg67dMe+0ZPdRqaHGrvPtLaHOP4skAGzoNpcXGSt7lkAets5eLSq4yACekVE=
X-Received: by 2002:a05:6e02:1a6b:b0:3d1:78f1:8a9e with SMTP id
 e9e14a558f8ab-3d42b9aca8dmr52094955ab.20.1741201762171; Wed, 05 Mar 2025
 11:09:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com> <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:09:10 -0800
X-Gm-Features: AQ5f1Jq4dtaQy1zNSNrep0WaI-YiXYB1_xIUUY21RnpPU0GevSqQZgpgVwJN9cQ
Message-ID: <CAF6AEGvPvQuptuA07kDYdUDQh4iQA=g+c3t0OCjR1HfWZ6mSbg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> This will be used by drm/msm for GPU page faults, replacing the manual
> register reading it does.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----=
------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
>  3 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a=
39866a932360d4e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>
>         if (list_empty(&tbu_list)) {
>                 ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> -                                        cfi.fsynr & ARM_SMMU_CB_FSYNR0_W=
NR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +                                        cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_=
WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>
>                 if (ret =3D=3D -ENOSYS)
>                         arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>         phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
>
>         tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -                                cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOM=
MU_FAULT_WRITE : IOMMU_FAULT_READ);
> +                                cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
>         if (!tmp || tmp =3D=3D -EBUSY) {
>                 ret =3D IRQ_HANDLED;
>                 resume =3D ARM_SMMU_RESUME_TERMINATE;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75=
eea1d5de23117de 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smm=
u_device *smmu, int idx,
>                                       struct arm_smmu_context_fault_info =
*cfi)
>  {
>         cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +       cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>         cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +       cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +       cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>         cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> +       cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTE=
XTIDR);
>  }
>
>  void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int=
 idx,
> @@ -419,7 +422,7 @@ void arm_smmu_print_context_fault_info(struct arm_smm=
u_device *smmu, int idx,
>  {
>         dev_err(smmu->dev,
>                 "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsy=
nr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> -               cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
> +               cfi->fsr, cfi->iova, cfi->fsynr0, cfi->cbfrsynra, idx);
>
>         dev_err(smmu->dev, "FSR    =3D %08x [%s%sFormat=3D%u%s%s%s%s%s%s%=
s%s], SID=3D0x%x\n",
>                 cfi->fsr,
> @@ -437,15 +440,15 @@ void arm_smmu_print_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
>                 cfi->cbfrsynra);
>
>         dev_err(smmu->dev, "FSYNR0 =3D %08x [S1CBNDX=3D%u%s%s%s%s%s%s PLV=
L=3D%u]\n",
> -               cfi->fsynr,
> -               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : ""=
,
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> -               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
> +               cfi->fsynr0,
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr0),
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "=
",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr0));
>  }
>
>  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> @@ -464,7 +467,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, vo=
id *dev)
>                 return IRQ_NONE;
>
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -               cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : =
IOMMU_FAULT_READ);
> +               cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE :=
 IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
>                 arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index e2aeb511ae903302e3c15d2cf5f22e2a26ac2346..d3bc77dcd4d40f25bc70f3289=
616fb866649b022 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -543,9 +543,12 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu);
>
>  struct arm_smmu_context_fault_info {
>         unsigned long iova;
> +       u64 ttbr0;
>         u32 fsr;
> -       u32 fsynr;
> +       u32 fsynr0;
> +       u32 fsynr1;
>         u32 cbfrsynra;
> +       u32 contextidr;
>  };
>
>  void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int =
idx,
>
> --
> 2.47.1
>

