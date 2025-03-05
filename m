Return-Path: <linux-arm-msm+bounces-50404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1521A50B1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 20:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F08EC18868A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 19:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E35253333;
	Wed,  5 Mar 2025 19:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM/NkfJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D616426
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201809; cv=none; b=BnOVP6+XnPJfNHvYeImmftFigwhTrOafw19gev/5StMSlYeHxTceCwtrLd82fkkN110TcA7q2X9CqVxuIW0A23EumPaVvkRp5QWXlRB73t1I8nNF9ZouCEOKRPfq/ixLdfPsllQ8QliAJT/spmF5trJa8kPlPdTLIZD+gSZX3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201809; c=relaxed/simple;
	bh=9sg2W0Xm8LswKwh5NENYu0yag2aaKtRAfhaYjEk0Giw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kwxc1Wdo372/Bu82srIcal7j4YYKFQUFs4CsUVzRYP3QNsNAH0IEuDZp6ub7RdxNLk/g9pvkfp8SCYzFeLnaF6/zR39f5YcOQIuyf++KfU5HXh9nvmTJhxklh2Z4uHjIwUq6b24/I5ywIemG1onGuaT/LjVLpKNnJc9/KXvW1xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM/NkfJ+; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d04932a36cso70367185ab.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741201805; x=1741806605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaiMyt+dgXQn1FXtXZ4qzvS0McmvnfMbhAjNl5s0fqs=;
        b=UM/NkfJ+jK8zZ4PPzaNJYvRgDDwiG2FWiGzIAf1WFaTy9WYIk2v+qbjj4HapAgwRwN
         anQ1aquMFAD/UjPypfz2gX1KcESxzzNlBrYixcFSfsC7vvs5n3OH+/NyWpRtFubiHGov
         HhgplDEFKbNafK3zaTrwZ1/FzZJcLpWrNUQ0ewB2o8PhotPsczKwljQnNc08ElaOjUbh
         qcSEsG9G2XJYmxyHxrtlFFyDJqeBUZ0TEj4oiV4DL0W03iOTw31irKJPFUtBcYyBszf7
         XETDAOokQPXE2Mz8p6kCFjRzcb0ltWmoZgFGHGSRJf+cc5x8UAMunefgtkKhod4sT029
         eR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201805; x=1741806605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaiMyt+dgXQn1FXtXZ4qzvS0McmvnfMbhAjNl5s0fqs=;
        b=Iv6hSr3Q3x7KFT1EEaPYyOe8dyxPV+2abH5dMn/i9Fqe1eH48m3XHJR3aMWfleRnui
         wE56Qpp+6Hq80oOjDYdRe8zTHIN5WkRlJgk6dh4m0X9JgeHZEf9KvAluppJDN8xWekUO
         NHbJgsUYfcklLI3+7ErV9LOCdNBRpGpu28ugntTLA/rCqmymWYJEANBvIkrlk8/GVHc3
         56GjtDa7sqItSOZOxfI7LDJRCfdUyMcfYdT4CgPnbIVniiUqBSue3OY1Te+zwH8+63zr
         QgWWNeFUNb2TbGaXiX3NVv+MqIxC8Z0aRcANdbpS0LyDjJL12poVoXj+C+IjFXopgWBA
         eZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVux1ADcL1BXxs3VYJyNzYBMi/3kO1JXoP9B9h06RRH5QIwrbD3kQZqiDbi0MdpieeeZmMl8djd401Uvxzc@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVXa4WtyJpqIzr+1CCr1TokdNT9pHi2z64k8tJPSQ/7maTZMj
	lLcyuKSQKVtvy2w7fnosutpI0SbaAYz/iZDUS6MKkV4gBS6HKip1neJA5iEAWk7NBK0uoQPr/9v
	kLSqzA1HQJhWfej4JWpCfawMrhQrPHQ==
X-Gm-Gg: ASbGncsvtDJaAoMGWeKIPfZbz2CkD6z0Sg1SxaX58og/vH7U7NZyo+Y5VhCqndPT6So
	0V2PthdSdaGitjXTken3zca6o9xY0+K6qJJiDNr5CyRpTdSe1rGckDsdzRhODafKtxL3NjTcVvl
	UlSMkwb2vKu1tH+RYeYUKzWvkIjA==
X-Google-Smtp-Source: AGHT+IHwXUPkcwmz1dEZv6qs1mqFyRbKWhc6VLppFLp13raa+hash9p1l8om7PD+XzyVVCshzoOtuLCzkfE1/WnrK9s=
X-Received: by 2002:a92:c54e:0:b0:3d3:dfc2:912f with SMTP id
 e9e14a558f8ab-3d42b8a6723mr65466505ab.7.1741201805384; Wed, 05 Mar 2025
 11:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com> <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:09:52 -0800
X-Gm-Features: AQ5f1JraaawwkUmCt4yL_sk7YXrsKqREgeX17Qs1rzauOQ1SG0Q4PNOpFqsI15E
Message-ID: <CAF6AEGszbZ_2J_LkkPMuCeQwma1xtO2=ZwWQcyrsxb+=qb-koQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
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
> Up until now we have only called the set_stall callback during
> initialization when the device is off. But we will soon start calling it
> to temporarily disable stall-on-fault when the device is on, so handle
> that by checking if the device is on and writing SCTLR.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++++++++=
+++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce7=
2f48e3b38474da2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *co=
okie, bool enabled)
>  {
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> -       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       u32 mask =3D BIT(cfg->cbndx);
> +       bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D enabl=
ed;
> +       unsigned long flags;
>
>         if (enabled)
> -               qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> +               qsmmu->stall_enabled |=3D mask;
>         else
> -               qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> +               qsmmu->stall_enabled &=3D ~mask;
> +
> +       /*
> +        * If the device is on and we changed the setting, update the reg=
ister.
> +        */
> +       if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> +               spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
> +               u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_C=
B_SCTLR);
> +
> +               if (enabled)
> +                       reg |=3D ARM_SMMU_SCTLR_CFCFG;
> +               else
> +                       reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> +
> +               arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, re=
g);
> +
> +               spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
> +
> +               pm_runtime_put_autosuspend(smmu->dev);
> +       }
>  }
>
>  static void qcom_adreno_smmu_resume_translation(const void *cookie, bool=
 terminate)
>
> --
> 2.47.1
>

