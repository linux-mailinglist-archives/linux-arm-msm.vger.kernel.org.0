Return-Path: <linux-arm-msm+bounces-637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E847EB1F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 15:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A60D281196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D228405FA;
	Tue, 14 Nov 2023 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbAlNibz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF019405DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 14:15:57 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2CE2116
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:15:35 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-da077db5145so5645413276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699971334; x=1700576134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H9gudHAzsoMl11k13t49Tgymd183FsAsDTQ4+MjrDYg=;
        b=bbAlNibzizenVc/GiI7oZ2Lxv3dFWQHerEbDYP/icmoKExqVtfUvs+PGVqvvSbLp70
         mnxgR4I4kz2zv/ZDnBFn+gmncz0NrGxmg098rI9gPLEt05M4teSZ+wdjHDQ+xxlHKnnw
         KuzgcA9jHBry+og95VpUBmSZCvZ8/3QeH9UUw5cy4ehDqps0t5JWy+mcNUotJ6lE0XBs
         qRreYq/itJ22Q5Wp5Gkw+LONiHp++kRPAZ0Agnz62aRXwCIewQvRyxgWoX4ZnhorByx9
         nHWbr4UqRQed3APfs72KEdmU6oy+0iAwXO6aNF9S+sAb7XTn0SrbIeaKEdJajoIBZeYL
         xFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971334; x=1700576134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9gudHAzsoMl11k13t49Tgymd183FsAsDTQ4+MjrDYg=;
        b=h/fz1Ki7UUf3PxYwklqjyk+275PBvOx2OA8q4ORIYhNfGQg7tYjbBMK86olQrL8yIV
         M7dva8y75S8o2fw+FL3qev3LneWEKmF5lWCHB/UFe4Ms4DXXawhH/i9CCpPrtrv30nhq
         TdAHmwB/hRSnbohlcBW8hxV5FwiPdsvvhvt2loVampYNadj+auZ0UZI7LM5vmZSiGpWJ
         IDTjAUw6NsKWcqpgSG64BDECgQSBKz/tTIvxbyOTC9naxO2h02oOJbilbs7/XX+2MXqI
         8cCcCRJ8Y/V7Ud/g9IqHwNn88T8KxG4pW1Hr+JniTPAeb47DPKhTebCD64cV8N/fdbAQ
         mIkg==
X-Gm-Message-State: AOJu0YwanKBz0WFn/+IEDthP+LjcEXchgbk1hnsCE+5pbrEK6JNo5gPl
	8rolIgCb7jqdcUgD/dbUN4AlD4pzOuQaIpjqBT/P6w==
X-Google-Smtp-Source: AGHT+IE70nxRhJcbYkoU42dNYejri2XOGgM/Ozf5+wgTTc0YFE0/tNgIkF23HXIk8rTgfCLbOps33kblQnJHdqvFWjU=
X-Received: by 2002:a25:414c:0:b0:da0:5775:fd77 with SMTP id
 o73-20020a25414c000000b00da05775fd77mr7966567yba.63.1699971334217; Tue, 14
 Nov 2023 06:15:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com> <20231114135654.30475-4-quic_bibekkum@quicinc.com>
In-Reply-To: <20231114135654.30475-4-quic_bibekkum@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 16:15:23 +0200
Message-ID: <CAA8EJpoRmm42aAvyX61o3tMWXszUZmfFvJEtnNDEfYdDqy4Y0g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Context caching is re-enabled in the prefetch buffer for Qualcomm SoCs
> through SoC specific reset ops, which is disabled in the default MMU-500
> reset ops, but is expected for context banks using ACTLR register to
> retain the prefetch value during reset and runtime suspend.

Please refer to Documentation/process/submitting-patches.rst and
rephrase this following the rules there.

>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 25 ++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 0eaf6f2a2e49..fa867b1d9d16 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -478,11 +478,28 @@ static int qcom_smmu_def_domain_type(struct device *dev)
>         return match ? IOMMU_DOMAIN_IDENTITY : 0;
>  }
>
> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +       int i;
> +       u32 reg;
> +
> +       arm_mmu500_reset(smmu);
> +
> +       /* Re-enable context caching after reset */
> +       for (i = 0; i < smmu->num_context_banks; ++i) {
> +               reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> +               reg |= CPRE;
> +               arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, reg);
> +       }
> +
> +       return 0;
> +}
> +
>  static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>  {
>         int ret;
>
> -       arm_mmu500_reset(smmu);
> +       qcom_smmu500_reset(smmu);

Is this applicable for sdm845? For all other platforms supported by
qcom_smmu_500 implementation?

>
>         /*
>          * To address performance degradation in non-real time clients,
> @@ -509,7 +526,7 @@ static const struct arm_smmu_impl qcom_smmu_500_impl = {
>         .init_context = qcom_smmu_init_context,
>         .cfg_probe = qcom_smmu_cfg_probe,
>         .def_domain_type = qcom_smmu_def_domain_type,
> -       .reset = arm_mmu500_reset,
> +       .reset = qcom_smmu500_reset,
>         .write_s2cr = qcom_smmu_write_s2cr,
>         .tlb_sync = qcom_smmu_tlb_sync,
>  };
> @@ -528,7 +545,7 @@ static const struct arm_smmu_impl sm8550_smmu_500_impl = {
>         .init_context = qcom_smmu_init_context,
>         .cfg_probe = qcom_smmu_cfg_probe,
>         .def_domain_type = qcom_smmu_def_domain_type,
> -       .reset = arm_mmu500_reset,
> +       .reset = qcom_smmu500_reset,
>         .write_s2cr = qcom_smmu_write_s2cr,
>         .tlb_sync = qcom_smmu_tlb_sync,
>  };
> @@ -544,7 +561,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>  static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>         .init_context = qcom_adreno_smmu_init_context,
>         .def_domain_type = qcom_smmu_def_domain_type,
> -       .reset = arm_mmu500_reset,
> +       .reset = qcom_smmu500_reset,
>         .alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>         .write_sctlr = qcom_adreno_smmu_write_sctlr,
>         .tlb_sync = qcom_smmu_tlb_sync,
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

