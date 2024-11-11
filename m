Return-Path: <linux-arm-msm+bounces-37478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D039C417F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 16:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ECA8280A13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 15:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B97745016;
	Mon, 11 Nov 2024 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K70FXtUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE738F83;
	Mon, 11 Nov 2024 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731337679; cv=none; b=dV6uugW/YUiGH7TuUe5LDp76nLRNYC8MrnCZhigS+CvswU0HXVLdt8HxD3aI+pPZa2RvrYw5AVUFWqzkIvwBlmVNUQkz0zANfiueEf7PoKQZVabQCrvl6y8nLrtJLYnOH5jX3IvHcrPgpA44g43mz6QInN3nbeSfWzEwWONpCQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731337679; c=relaxed/simple;
	bh=DFA6e+xG2l4ocSoL/PES99Km7srJ7ImJq4+jXxU9eAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGVje5nWgkMg4ZIg1N4evcUoccjIfkDPs145rfFpwnMhO4PM/jX9b1n6X577tT3NtWMB02ZxmhPfBHY/RUMiMhsrbP8acVWkxHk6CEbr84w/qdzNdAqX4LlnhfL/cqdts/HcHOX+MFydKVh6vb4e0A2+QJyVADLJuxTQYjsvYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K70FXtUF; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83a9cd37a11so190536039f.3;
        Mon, 11 Nov 2024 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731337677; x=1731942477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+GB5tRv8BnowN5d0hYSrEc6wH0fHehQmpMwfq55PFY=;
        b=K70FXtUFPlZAvBUQ4JoSwsWS8vGYhF6160c1D3X/oZlbFEnsWVVoCAI2fbwS4j+uYZ
         fe0lszsMMcObN31MN23YZaAvZWc4o+GYDWBHeT3LwiKr/ZIvGYAIT5nbBRglJVbI+CWW
         gJzKh5Z8wEoMIVt3GcPal3MYtYbBPdW/klUJP1DQi4GTl+0J1D2aCku3RYXX1L5LPqOt
         tAWJmsTUFwIJPtX9tmMmviI+1uxFYpt1k3FyI8O9PO1cmT/TPH7tHP86pwIQYExFRLBO
         JPQf1+dN3ls06547kNuNQyhoXn9flYb0n0GgaoxxvJmfFmZcM8+Hor2XUlzV4EuzT/TL
         ceaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731337677; x=1731942477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+GB5tRv8BnowN5d0hYSrEc6wH0fHehQmpMwfq55PFY=;
        b=Fo6MR7Yiu9Bp6ZgvH9Ep90wdwTDQhxwBrSLr8NZWFv7fXq8+qzNFYtLkQ4bFiUyBEf
         0ueFE4FaS7TumDv+te3diW0HK1b2trxtlFz99AovILHKuVIXaKmKiVR+M/GegfGmyIsU
         fT9dE2pS7RyUhhIVFP01p3PajZry0fP0B1W3npcTc2jXJF1xFLc5/oVx6WLcLpoYhkQH
         G8EB5lX2L5iU+w5SW3JTUy6CkKRsbTHUYizgFAg/zU2iEhiXWdD/JOU+AS8uTxehZ/b7
         KHi0BhnIzuDv88QdAaFYzDtgcdwAkLzuZvOw7SdTcl4uznckkGD0QKW37b8dQem6JGSI
         dsDA==
X-Forwarded-Encrypted: i=1; AJvYcCWHJT1+rsWB5PfxP3xy83jP9tOsOi7FcDdyM8mZ7u0rexmxeZ2CB3hUSkvY6EZeL6H8FqkZ73OSzicyO5cI@vger.kernel.org, AJvYcCWceVvjy81dey821QFMd6quI2HwF9y6x6BC66/KdXA90JtVqo4kyjFPtph8QllbAd2wQlMUDS7ULFLvIbD0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3dIlS1sCAvGXbFKz75QTlJkOJM2zGGPlEFN7+3xdC1QjNGCIg
	P2Sh30xENpOxlAQugewa7W426YyNglT1wzgeCdrYv64lJxRGvGQMd5T4ygfWeFpID6E9B7p3/tj
	1ICaZ9xaVtkEU7Lb+m75pV+WH4F6+UQ==
X-Google-Smtp-Source: AGHT+IHTfIqlgcD2XKYGf2RKEMfl9C8IIiYjp31xSXeesmufP9858DAQdQl8IxPXotfWKb+wOlGIb7o99W1tYFqYnlQ=
X-Received: by 2002:a05:6e02:20cd:b0:3a6:c716:ab29 with SMTP id
 e9e14a558f8ab-3a6f19e383amr161829735ab.14.1731337676449; Mon, 11 Nov 2024
 07:07:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com> <20241110-adreno-smmu-aparture-v2-1-9b1fb2ee41d4@oss.qualcomm.com>
In-Reply-To: <20241110-adreno-smmu-aparture-v2-1-9b1fb2ee41d4@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 11 Nov 2024 07:07:44 -0800
Message-ID: <CAF6AEGvVeDLtca0q300BMPYXgs00auBCDPAC=yk9J7cPRgkUQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 9:31=E2=80=AFAM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:
>
> The QCOM_SCM_SVC_MP service provides QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
> which is used to trigger the mapping of register banks into the SMMU
> context for per-processes page tables to function (in case this isn't
> statically setup by firmware).
>
> This is necessary on e.g. QCS6490 Rb3Gen2, in order to avoid "CP | AHB
> bus error"-errors from the GPU.
>
> Introduce a function to allow the msm driver to invoke this call.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |  1 +
>  include/linux/firmware/qcom/qcom_scm.h |  2 ++
>  3 files changed, 29 insertions(+)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 95815e64e1e6..72bf87ddcd96 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -904,6 +904,32 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spar=
e)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
>
> +#define QCOM_SCM_CP_APERTURE_CONTEXT_MASK      GENMASK(7, 0)
> +
> +bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
> +{
> +       return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
> +                                           QCOM_SCM_MP_CP_SMMU_APERTURE_=
ID);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture_is_available);
> +
> +int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
> +{
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_MP,
> +               .cmd =3D QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
> +               .arginfo =3D QCOM_SCM_ARGS(4),
> +               .args[0] =3D 0xffff0000 | FIELD_PREP(QCOM_SCM_CP_APERTURE=
_CONTEXT_MASK, context_bank),
> +               .args[1] =3D 0xffffffff,
> +               .args[2] =3D 0xffffffff,
> +               .args[3] =3D 0xffffffff,
> +               .owner =3D ARM_SMCCC_OWNER_SIP
> +       };
> +
> +       return qcom_scm_call(__scm->dev, &desc, NULL);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
> +
>  int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
>  {
>         struct qcom_scm_desc desc =3D {
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qco=
m_scm.h
> index 685b8f59e7a6..e36b2f67607f 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -116,6 +116,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)=
;
>  #define QCOM_SCM_MP_IOMMU_SET_CP_POOL_SIZE     0x05
>  #define QCOM_SCM_MP_VIDEO_VAR                  0x08
>  #define QCOM_SCM_MP_ASSIGN                     0x16
> +#define QCOM_SCM_MP_CP_SMMU_APERTURE_ID                0x1b
>  #define QCOM_SCM_MP_SHM_BRIDGE_ENABLE          0x1c
>  #define QCOM_SCM_MP_SHM_BRIDGE_DELETE          0x1d
>  #define QCOM_SCM_MP_SHM_BRIDGE_CREATE          0x1e
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmw=
are/qcom/qcom_scm.h
> index 9f14976399ab..4621aec0328c 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -85,6 +85,8 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int v=
al);
>
>  bool qcom_scm_restore_sec_cfg_available(void);
>  int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
> +int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
> +bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
>  int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
>  int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
>  int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size);
>
> --
> 2.45.2
>

