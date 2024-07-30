Return-Path: <linux-arm-msm+bounces-27425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D097941A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 18:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 067331F232F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 16:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D86914D29B;
	Tue, 30 Jul 2024 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaL309I2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD01A6192;
	Tue, 30 Jul 2024 16:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722357599; cv=none; b=WXGsFXtZX2cnfflgqtD+RHLnBTkxUDwTrywChmjWzW41Sc6XSTXD4oYuo8Qxr/e/LD+McgrMK6/+c5cqdXcoN4bd7rhYwOYy7LUhPVvfQiPmdFPTD45M6l1I5QL56vHYUUKMwcZY9v5zNnyn9j+LALpYwH1kJvzVHgHE1dW6n8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722357599; c=relaxed/simple;
	bh=qLxZqKuTsUhXJlp4omzcBe+y0yee7AHKrukmb8NNlRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYrLM5h2kyESWMb4tNGbuNk+3yI8YedGMX0Va8fkpmBofpyKlrK+G6lIBWqaSDM2uBvre1nMfgA2LmdX+0FYML+ct8Vxr7ikXMOqpmi+k1OMZA3wnvLRoZZb3+5wWjvTXam6fFcU55k979ZAtL4pRLVfTyxh/HrylwlY8yq9ehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaL309I2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so62337331fa.1;
        Tue, 30 Jul 2024 09:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722357594; x=1722962394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fO87RtbN6Fg9vcoOtB0cm5t0/OE3a9XN2G9gEOAZms=;
        b=AaL309I2ydnmhCJFv4ocKSqAwEZIqk8SMdqPh8+xrFX6gGg9SP4y2f0+w5HGEdn2pk
         c4zN1RvXv9LR00sOZ4uOiNOoT5DgjkCEHWmI/bzju4i1Y2SHPqH9YCX7oNZe7Dynhnkz
         ZSUTzxW6JpvT6fcAG57/PKVmI6/YAcBuJVOdXoqRk8J3ayv3TNyYkoxPytSx0eyP0oSF
         27KeFL+qUbrAvd4/Uu8VPhOzaT+piwc9MiPrwec7h6+zsTsQcqO6rHTRyT0jmfmiQNOf
         GdkRY90Rd+UjRaSOpAvluiJJ2tCO/0ZAHrmEXqX+AYBjL0zljK6HyfeINYeHf8xjbwGV
         B8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722357594; x=1722962394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fO87RtbN6Fg9vcoOtB0cm5t0/OE3a9XN2G9gEOAZms=;
        b=X7nyXtFIb0PO8lJUbFX/XinUdeejNRwQLIm2N+Vt3M/qlThuuTQJ+8zS6kj2utZFL0
         rKH9T/GHWnQnRsmxsM80l7PQaSyeEfu5+0su5VgyT1dRPKn5BkiW0jI6AQotYTowlUxF
         wlG+3Jjkm4NJfXX1VZoml9npMvq1EuwnSab/a+MMdeJpb1Oxj1+7SBxSniYqXvu5hEUp
         CdPKaWldEMniEvy6+aDzR72KVKQuiFl1TAgGXeggBo9bMl9Ix0GToMB3vr3JuXMwTpNs
         Vv0FGUos/+pXOVZe1vG7eCpLfalh5nxXCc7WUqs03FZ1rDbHaChBGtiA5GJRtA0by7QJ
         6h/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUy3ZvM9XtBdYFjSlrF5LWZd8olXGZ2NETHdtuWPfncV6ZvIAdaihXhtwt8PmtLoa7BaU9+jFfEZw/5LJ5DrdxwAdCZHpnBCYVyDz8RVFjiKdYZOh5oM8vIsbyuqdLRmmpy5arENLL9drQuVg==
X-Gm-Message-State: AOJu0YxpUr+MGTWVHrPqwXtYtCVeev5SKCTNr7RBM/7UP3qYZukcS7xc
	DgFs5Uy9BmsVqplPYwjkwNZYN2ltPX2K+MF2KCKdHl/77rWwFFswDoIF6okydbTxxXeidOrLnfX
	n3HPDQLhBKsAnjrY5TvWQGXbTPJE=
X-Google-Smtp-Source: AGHT+IFmBof/Y6IZmxQHisPWxkUedNGPtjOQevzn3NPqM7iEjaGbYOOIkNDYQLhLGKx5sDWlwamk3WSJCvg5Sqdqdmk=
X-Received: by 2002:a2e:7a11:0:b0:2ef:1f51:c4ee with SMTP id
 38308e7fff4ca-2f12ebcafaemr83664291fa.9.1722357593713; Tue, 30 Jul 2024
 09:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
In-Reply-To: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 30 Jul 2024 09:39:42 -0700
Message-ID: <CAF6AEGsV7xfknnJ+-sQdHvzqCMc9=TFy6L3e6cM52MaaE3HNfw@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 1:37=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> SDM845's Adreno SMMU is unique in that it actually advertizes support
> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
>
> This however, seems either broken in the hardware implementation, the
> hypervisor middleware that abstracts the SMMU, or there's a bug in the
> Linux kernel somewhere down the line that nobody managed to track down.
>
> Booting SDM845 with 16K page sizes and drm/msm results in:
>
> *** gpu fault: ttbr0=3D0000000000000000 iova=3D000100000000c000 dir=3DREA=
D
> type=3DTRANSLATION source=3DCP (0,0,0,0)
>
> right after loading the firmware. The GPU then starts spitting out
> illegal intstruction errors, as it's quite obvious that it got a
> bogus pointer.
>
> Hide 16K support on SDM845's Adreno SMMU to work around this.
>
> Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> There's a mismatch in sender/committer addresses but that's "fine":
> https://lore.kernel.org/linux-usb/2024072734-scenic-unwilling-71ea@gregkh=
/
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 36c6b36ad4ff..d25825c05817 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -338,6 +338,15 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_devic=
e *smmu)
>         return 0;
>  }
>
> +static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +       /* SDM845 Adreno SMMU advertizes 16K pages support, but something=
 is broken */
> +       if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu=
-v2"))
> +               smmu->features &=3D ~ARM_SMMU_FEAT_FMT_AARCH64_16K;

jfwiw, it looks like we need this for sc7180 as well.. probably just
remove the "if" and mask out 16K for all smmu-v2, until we know that
there is somewhere that it _does_ work?

BR,
-R


> +
> +       return 0;
> +}
> +
>  static void qcom_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
>  {
>         struct arm_smmu_s2cr *s2cr =3D smmu->s2crs + idx;
> @@ -436,6 +445,7 @@ static const struct arm_smmu_impl sdm845_smmu_500_imp=
l =3D {
>
>  static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
>         .init_context =3D qcom_adreno_smmu_init_context,
> +       .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
>         .def_domain_type =3D qcom_smmu_def_domain_type,
>         .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
>         .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
>
> ---
> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
> change-id: 20240726-topic-845_gpu_smmu-ab738f7a013c
>
> Best regards,
> --
> Konrad Dybcio <konradybcio@kernel.org>
>

