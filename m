Return-Path: <linux-arm-msm+bounces-36228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 523519B3C87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 22:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25991F229E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8BF1E103C;
	Mon, 28 Oct 2024 21:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qejtj4GK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5EB1E1326;
	Mon, 28 Oct 2024 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150007; cv=none; b=OjXIYov02G1/FS3IRf6KeH0Hm9V6Dg/jNjfGFeeQq/gpzFw03QP9u7kYEuL9lNHabdiKRF7KlsSLu/9fr9w63bTFuKcXPpIuHH/G4Mz1M/I+KP8lVhm3mAmnGTGVEE6Qw+1CV36Tfagb/Jhqtu1bRxUo9sJpHnFqjwonZnKR+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150007; c=relaxed/simple;
	bh=d5BFcXNUqFTM8OurXCjOwxs5acS94lCrZaglLt2fauQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED/tg657l4LXaLMbNhx/BlcRrvpoAmGZ6M4o3dGw1j4HhtuhHOAoZLkW7XOLcbvaOtdDgwOg4snhRE8BbZkSsbNtVGD4PCEjRVQr0nqNcBzvH26u+ux4/PeZGTkDk2wQTBKIdrBGg9yf9h3zClyId+AQxlOgVT0wTdMPBCcPmu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qejtj4GK; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a4e40a1d7eso12734395ab.1;
        Mon, 28 Oct 2024 14:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150004; x=1730754804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGj4nvrYi+UV4BMXSEK74nk2UvFueWrFMbcWim1QgII=;
        b=Qejtj4GKTWGJIqSPA1FWTYX6lKw1oiFrXQTng22mBYvlLcMfsLuh3nS82uBD3rkw3Z
         349f49az9Q49HnpCCypC6/UNjR0wI3t2O2DBtuf4Kehd307ddtjd818zoy+//24KbRMC
         rFNwqHZzAPXf50LJL3ZgBZiHPRyEgNpARb913h6NV6iMOsPJ2eLjUqeTja/Y+93wqGAp
         0lZw39ClBmMQfZTYHM3hc5cQq6uKISsx/+c5mlcuUlf2ncufOgReMIAn32PnnZZALl9W
         HPXnGu/oDojISH0biuzkNvdfpymoTouuYKPpZURfyi7KGGoVgeFmIG0MzDebwR+pPH9Y
         wOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150004; x=1730754804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGj4nvrYi+UV4BMXSEK74nk2UvFueWrFMbcWim1QgII=;
        b=STOxGFMH/LwkUiwYCIG3HCf6g90F8ayyuUHaF/4rgdX8eZCdcncGUJNTFgYC0eVIHn
         4xc8zvM1VmOVabWg3fVWj+ii6hELRnXMzK/oK15JuifglpyCbp8NXN1Mpt6ddNZTUQv1
         O3QQk/aL90b5lgVrV5IUWh2UVfU9b0Hklu2TR+zn5iqbRk9jtH75Q1P9+xvhnjVXcwQ1
         Pu6dZ32VKbD+8AaRBnskXWGY3nq3/0qKX9jaoUuNvkbRQLGdmSG/UroFDOu/PWyHrk9Z
         zidr+UbRJhaxL20hdibk8RG3La8guEHL3r9vOp7RJGeJ79M0voyOoaMMiP7FN0lYTSry
         SxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+u/w7W0nytqGX4xvsSmYRr1jC/qcg6IAcyklcSmTSq0v3Eil8xJfUleScQMASTDn5TCx09G7MlhLCVjkg@vger.kernel.org, AJvYcCWN56GvgakkbgQxUykKV9aHiLPYz1pz2XuWQh9n421/VLjiCBpxOJDLeQ3pDmUYhN3738LcKhjm/1nvCo9R@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMF6NpEJarUbFIW0Efq281rTC0FjclnQxef8/ojkTKDCh7Wqd
	wu0ReLTD/8apbhAzJJq/Hkp/M+6QGi5hcBKaB26HStOfm0aqykY29XKot7LMNDz26IIR41G/zN0
	5Fyo8QkuIi2rzd74fqHrPi7VS7M8=
X-Google-Smtp-Source: AGHT+IHkAip3QtvMIsGAcSCjbt25YJnHoEeUIt+TrlK362ycmT+j63k00KWrpG0VJyorocPL41G3lK8a2TaMD61ih3E=
X-Received: by 2002:a92:ca4a:0:b0:3a4:e308:2f5 with SMTP id
 e9e14a558f8ab-3a4ed1ba8camr91673605ab.0.1730150004074; Mon, 28 Oct 2024
 14:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-3-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-3-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:13:12 -0700
Message-ID: <CAF6AEGt6xNe5VpHq=fiz03M1_m+psn8ouX_uuRgRV6=kthfF+w@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] iommu/arm-smmu: refactor qcom_smmu structure to
 include single pointer
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 5:54=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> qcom_smmu_match_data is static and constant so refactor qcom_smmu
> to store single pointer to qcom_smmu_match_data instead of
> replicating multiple child members of the same and handle the further
> dereferences in the places that want them.
>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e8..d03b2239baad 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -73,7 +73,7 @@ void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *s=
mmu)
>         if (__ratelimit(&rs)) {
>                 dev_err(smmu->dev, "TLB sync timed out -- SMMU may be dea=
dlocked\n");
>
> -               cfg =3D qsmmu->cfg;
> +               cfg =3D qsmmu->data->cfg;
>                 if (!cfg)
>                         return;
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 0cb10b354802..6e0a2a43e45a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -534,7 +534,7 @@ static struct arm_smmu_device *qcom_smmu_create(struc=
t arm_smmu_device *smmu,
>                 return ERR_PTR(-ENOMEM);
>
>         qsmmu->smmu.impl =3D impl;
> -       qsmmu->cfg =3D data->cfg;
> +       qsmmu->data =3D data;
>
>         return &qsmmu->smmu;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.h
> index 3c134d1a6277..b55cd3e3ae48 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -8,7 +8,7 @@
>
>  struct qcom_smmu {
>         struct arm_smmu_device smmu;
> -       const struct qcom_smmu_config *cfg;
> +       const struct qcom_smmu_match_data *data;
>         bool bypass_quirk;
>         u8 bypass_cbndx;
>         u32 stall_enabled;
> --
> 2.34.1
>

