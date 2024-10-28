Return-Path: <linux-arm-msm+bounces-36232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D23469B3C95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 22:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 637841F22F9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DA31E0DD9;
	Mon, 28 Oct 2024 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNLY9pTv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CDF1E230E;
	Mon, 28 Oct 2024 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150198; cv=none; b=Uz/erCfjqZn8D+JvOpEGXQYgqIx5nvNXpUusb5gZsmaBZnr199QofIA8e0rzJEFrt7jqJdfzwSQzQImcLu3CG4evbJq+RlTPo4ih+UqbtYGi3sYYwtCYi5Bd626/7WrAQCVz+NZoXwez2P2hW9tu5Iyhodhw5h2vdLXERLZIEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150198; c=relaxed/simple;
	bh=TB/aR6e8qqZZ/NbQWYKoSmUDPWYT7mmVzJZlaNyn1Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1U21oXVlIeeucaAVlSEkPH8OdOoPv9E+q9zM2NBiFCdhW4Apf09s4/ozH3Yn+dAnWPJcqA/rG26GhuTVYtIzy611nyXMb4Vwyd8kdKdsKwgtnyxY9XjzZA8P0fNt/9av7n78LcAMb5FzYedtOKmIbU6e2oIdFQ7sp/m1ux+xzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNLY9pTv; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a3a6abcbf1so19036955ab.2;
        Mon, 28 Oct 2024 14:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150194; x=1730754994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktS5JZlVOvEaixmraj14grQIGS0mOTMVZfsZ8ze71Ik=;
        b=QNLY9pTv2nfTzLOwYKn+SlblMm7RVI3vfd1hNUfhhhnqhLS5Sy1Me1z488asMr096a
         xPERt9Sr+llVogyUV2qE3GiyC0MWfamD0UUuiReARlJIsh1uM0ndc2joL5qX1SqBE3Nj
         8cUbzSFSSKyjwwBalLB4xvFUzOX/HR4W+lDI/Jt4X6WLlLeVp6WRIsMb8tz2QzoaQnAx
         jrrt/KqD5it+/GXnX6h0kL29PCNLksKM6xrgZyJPh1xO4nLFgg7npCNJHkq7JxXBm55U
         zBygiI2gwoSvfcfy2BjSsgI3WsfapHtzP5YuV0ZkA+Hqiypoz8UltGwn7cGAZ15waSoT
         kTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150194; x=1730754994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktS5JZlVOvEaixmraj14grQIGS0mOTMVZfsZ8ze71Ik=;
        b=YAQL94noBJFA96KXPp/3in+jJHWwNOxjVFysR4Q8EIca0cF+MJQAq2WVrtk2SOoQZk
         d2mNx/R+QBIqSnuqbUfackrwJlZOdP8sSLl+lJZXcOV+HqQsJRutqX3bUbNsu89acmfR
         JpgcECNVRW3RPZorEu/R+51ZywVJqkiIK0PCG7Jn/bQEF2iJGva/K2hqhO4zGzblMUnr
         MRHm4Nlc5vaOUiYNoiLqgquKtxCVACLQDYI/b9b499IEc4k+f1KT3UMwI7DI92dJDThM
         Vjabljg2jtDlRrvzLIDmRDqm5BJRLTQJvtC1tHHQ56GTJqLOTB6xAUot1VXILieYgiEU
         zZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCWP2uVdJErQR2parsNsX3FufHyYOtX0yizGplRTV8OIfdsQfRArqYYRg0FcwMX2nGMiV5AsgSg5zzbrA5TK@vger.kernel.org, AJvYcCXF8nJjIjfCRhHcyrqkSMCzwBtQa+bvRJmvoh1DwA4smRUC3kedO0NUZXYhVhaNi6lfXZtX0Bg3fTEA+3Le@vger.kernel.org
X-Gm-Message-State: AOJu0YyYF4AYhltHc4m4gzon5holaJfbw2luJwxHTNRwvnmkR/hJK4s6
	y48qO7XTFKHVRXGHnuOoOt1L2cW/927PpQg+KaBJm0YKt8kGL132Q/hvpvvX4puWSiXAfZCn85D
	dJph8dPfQuuxYX2ciciUMYUA/MuWH123V
X-Google-Smtp-Source: AGHT+IG9XrLh5NKIexOxyfcazqPge3CPHDgNBsyKjId3gtC/MJJHMtgd1LcfGFYvXzXYtIB2lAVzQZdmZdFDCxa0qBU=
X-Received: by 2002:a05:6e02:20c8:b0:3a0:8c68:7705 with SMTP id
 e9e14a558f8ab-3a4ed3012b2mr68380955ab.21.1730150194399; Mon, 28 Oct 2024
 14:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:16:22 -0700
Message-ID: <CAF6AEGtOn3+99KMVRvpH=8Qs-g52ajVQyeBkxThSES_dEdVH+Q@mail.gmail.com>
Subject: Re: [PATCH v16 5/5] iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
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
> Add ACTLR data table for qcom_smmu_500 including
> corresponding data entry and set prefetch value by
> way of a list of compatible strings.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 2d2c1e75632c..dd4fb883ebcd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,8 +25,31 @@
>
>  #define CPRE                   (1 << 1)
>  #define CMTLB                  (1 << 0)
> +#define PREFETCH_SHIFT         8
> +#define PREFETCH_DEFAULT       0
> +#define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> +#define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> +#define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
>  #define GFX_ACTLR_PRR          (1 << 5)
>
> +static const struct of_device_id qcom_smmu_actlr_client_of_match[] =3D {
> +       { .compatible =3D "qcom,adreno",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,adreno-gmu",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,adreno-smmu",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,fastrpc",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,sc7280-mdss",
> +                       .data =3D (const void *) (PREFETCH_SHALLOW | CPRE=
 | CMTLB) },
> +       { .compatible =3D "qcom,sc7280-venus",
> +                       .data =3D (const void *) (PREFETCH_SHALLOW | CPRE=
 | CMTLB) },
> +       { .compatible =3D "qcom,sm8550-mdss",
> +                       .data =3D (const void *) (PREFETCH_DEFAULT | CMTL=
B) },
> +       { }
> +};

I guess by now there are some more entries to add
("qcom,x1e80100-mdss", for example), but I guess those could be
followup patches

Reviewed-by: Rob Clark <robdclark@gmail.com>

> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>         return container_of(smmu, struct qcom_smmu, smmu);
> @@ -640,6 +663,7 @@ static const struct qcom_smmu_match_data qcom_smmu_50=
0_impl0_data =3D {
>         .impl =3D &qcom_smmu_500_impl,
>         .adreno_impl =3D &qcom_adreno_smmu_500_impl,
>         .cfg =3D &qcom_smmu_impl0_cfg,
> +       .client_match =3D qcom_smmu_actlr_client_of_match,
>  };
>
>  /*
> --
> 2.34.1
>

