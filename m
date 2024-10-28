Return-Path: <linux-arm-msm+bounces-36230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 200089B3C8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 22:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AC3AB20AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1121E1338;
	Mon, 28 Oct 2024 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICfdgjwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4021E0E1D;
	Mon, 28 Oct 2024 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150073; cv=none; b=I4IPxy9qZnFymcqMiv7C7dJ2sX5qSiRVHq4p9e5sX39QGhFo+QObUTMtQ8FXf5E33Z0GmZcRwTMa6HpmKYHOmvxKvWfGm+1o9PXg83RMvxNYXo3kOeRSUR9XF8yc/9+6vPHkLlsE3zXw6AmCDs13a71KtTeGHOcybK5Rr23RviQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150073; c=relaxed/simple;
	bh=rZhScPc2Nc5Y3pNHL0+OmFCL6crYpBArEAI1UBEDPX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dK18vZLWX53uwA2lSiNyFCW99EZcz2rcg9HyJGNjSydNP5+P79k0um5xSIBtdwcVYQzXBSAB4cdKjUHI52kKyhesF95Hei/qtpUgJpr1yS4277ugN76PAuB2TC2Y+972hOlCUseh3cFAseSRAxVUQsd0MZwuKS/vMZgDKZt1TM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICfdgjwO; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a3c00f2c75so18039575ab.2;
        Mon, 28 Oct 2024 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150070; x=1730754870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VhBTgRcvoEu0iow72UBK8g23QXw3BQ0zWkKZeXjZxc=;
        b=ICfdgjwOW3vvMJTnRmPdJPukq+8NGT6DPb5QHgLQU7XIjB9lSwEeoJsthaVcKYIU2g
         8Oi3nvH3Ihx/S1Ze7v1wLpDc7jRCGZFwli0SDrJYOBQikUXtxFgf5OkZvqv+mue1aUlT
         U6JRI9CTJSRFG5cHKQsSGOXEwlT7f4mHXCHe+Qvu0BaEGU9xV8icKExYGIxFAb/bonKz
         zF06FeImatUmeiEZAJEC4S6w67+hqUoj+FUsSXaH2/1l5PPq8IfjxGycSTjGsMzjVF1p
         fZbxgSh54oHKPUG5h6l5alQLS3SVb2C40nXsBJ95YadcBJJxX8X8FPn9w4OU9LVSNWlT
         lc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150070; x=1730754870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VhBTgRcvoEu0iow72UBK8g23QXw3BQ0zWkKZeXjZxc=;
        b=IvG63140VgErcQ7lJ6VwRt+toUfp6VV/7ClBWpezBPP3A8pGX7GW+k7hezx6jHmq/+
         FfUnDX4XNui2YoqqA0od5R6KjQ/2h+cB2L94npc9F47mPXps89c1pnrl3//BgRsSOW5O
         fI8XeXamknpaGOWqEn5jWWfax326ToVr1RppL5H3o/+eYMSZtgvFESvnwsTXj69pVjBG
         EFuvEIoXXJp++ohsARiQGa8J6jfLne95poMX1NEZxa0IT5ZzDETQc2NytVHzMsBDu2j2
         ggPcIXJb1SthRUn7Xzz3oPU5OobUhb4U7KSpn1rvMTU78od5AgsFNS8UgIbwwK7XR4bv
         VQDg==
X-Forwarded-Encrypted: i=1; AJvYcCW3X6PjW+EaqGWzu6ecp7kKa7YvOlfXAwokcSZeT8G+1lorUjYy59kQKNevdssvrKcnxAmyGLt50x9FRFcn@vger.kernel.org, AJvYcCX1Fjx4a6uBaBthxIx0orOe5hrzAti/UK8kbj0zUAzutMuatmJ0wjhCi/v9h3+WWCcOdCuArJ32FBAwGLLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeriHyDN8ymnNE3m1E0a4WRn48Kmz56eydMHGqr03l+1h7twD
	QF/UEYzdl/SzxLxV6p3LyNCI7tOOj9IGKy58F77BRFsdnp43zvYek7VjLlJ8+Vgnp/OtnCoC5kX
	IQLHrp7ZYRSb2nn0FAECqOGmYfJTGhuVc
X-Google-Smtp-Source: AGHT+IHhFCxiRxfNhtJxV/D4dzofAyWTuWm7f9BRM/ecWCIKcKlpSKo+pbKgNvyJlnuEuFMGIZ+4UAGr/b4EGAEODzw=
X-Received: by 2002:a05:6e02:1c0d:b0:3a3:968b:4e3f with SMTP id
 e9e14a558f8ab-3a4ed2f67a0mr85108735ab.18.1730150070444; Mon, 28 Oct 2024
 14:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-5-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-5-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:14:17 -0700
Message-ID: <CAF6AEGtZ=7KmfYjOXRHZx4nxdnh3VDr+UAGqKY_y_=pmfo3b=Q@mail.gmail.com>
Subject: Re: [PATCH v16 4/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 5:55=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> the TLB to fetch just the next page table. MMU-500 features ACTLR
> register which is implementation defined and is used for Qualcomm SoCs
> to have a custom prefetch setting enabling TLB to prefetch the next set
> of page tables accordingly allowing for faster translations.
>
> ACTLR value is unique for each SMR (Stream matching register) and stored
> in a pre-populated table. This value is set to the register during
> context bank initialisation.
>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 38ac9cab763b..2d2c1e75632c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -252,6 +252,20 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu=
_device *smmu)
>         return true;
>  }
>
> +static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_=
device *smmu, int cbndx,
> +               const struct of_device_id *client_match)
> +{
> +       const struct of_device_id *match =3D
> +                       of_match_device(client_match, dev);
> +
> +       if (!match) {
> +               dev_dbg(dev, "no ACTLR settings present\n");
> +               return;
> +       }
> +
> +       arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (unsigned long)=
match->data);
> +}
> +
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_do=
main,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> @@ -316,8 +330,20 @@ static const struct of_device_id qcom_smmu_client_of=
_match[] __maybe_unused =3D {
>  static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       const struct of_device_id *client_match;
> +       int cbndx =3D smmu_domain->cfg.cbndx;
> +
>         smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
>
> +       client_match =3D qsmmu->data->client_match;
> +
> +       if (!client_match)
> +               return 0;
> +
> +       qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
> +
>         return 0;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.h
> index b55cd3e3ae48..8addd453f5f1 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -28,6 +28,7 @@ struct qcom_smmu_match_data {
>         const struct qcom_smmu_config *cfg;
>         const struct arm_smmu_impl *impl;
>         const struct arm_smmu_impl *adreno_impl;
> +       const struct of_device_id * const client_match;
>  };
>
>  irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
> --
> 2.34.1
>

