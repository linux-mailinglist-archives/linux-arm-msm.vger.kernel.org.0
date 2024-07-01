Return-Path: <linux-arm-msm+bounces-24843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E7191E9BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 22:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DACB11C21A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE4A17164C;
	Mon,  1 Jul 2024 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdrK11dp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064318635;
	Mon,  1 Jul 2024 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719866488; cv=none; b=jcW+5DBa86kYln4Z+NVzIsBdH2HTLl3uvRop1dW2EIdvem7hlFZMX08ylxzapkeTskeXjPAurs5jdNqzZiFl0BOmfaM3UqEIy7Nbadujw5+K3c7D3i6bUVgLS2suwwdMmHy8BondXc4AEM7dV2388KYUtGzMMHE22R6BLIByQ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719866488; c=relaxed/simple;
	bh=dODezE65U1g0imimGz4sZnYSrGehBka7giUMK0ch29U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=He5PVAYFT+4xu0jWc9PFDyD8KFAL9wx6V7ygdt++dZoKv8CRyZjLrgbB77KPSrwCTzMrffhByjcz+FaF/Np7Nky5pOtMT/6WrRODcA2UGAN6gSkd+nu/PmMMl6dRCjGc4zVduBDEi2JjVuRfTduUDs1TmSkugecf1V1Us8kLPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdrK11dp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d1d614049so1002605a12.1;
        Mon, 01 Jul 2024 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719866485; x=1720471285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzj8Z3HbuiJuMSPBjE+mSOU8JyhOC/fKZmPOTRp5tZ4=;
        b=CdrK11dpgN9w9eVcqRGvMWrDRVcF+2oRkAsH5gezni5DC4rr+AZSroFBFRCtdaymOY
         3F4yArolWdQXTz5Rlw5mw1CfEE3x4UHDQ4+152FC2bpzdSrGcUNSr44SxQniwVM/7ImK
         maDokeG7I9Py46muXLAles+S/APEYLW3xKVgo0s3VKRvfIMAG/5Pzcdg1g5Dl+qZZBJb
         qed0Spcc42OxvLNNXX8HUHZFC5VpPS7UeEDX+iRi+ZnRSXbozGS1/4ShhR6v1Q+Vk5jJ
         t+Fxlm/KBaA3eVzIpPJE7c5LZMm4cF9JCghIchDsrJ8R0Dg4lD9tPUaHkO73OYgbISou
         mY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719866485; x=1720471285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzj8Z3HbuiJuMSPBjE+mSOU8JyhOC/fKZmPOTRp5tZ4=;
        b=JEghX6MaeCXLti8dkz1TpXtHP+aj9BDoUV2F/ZF89p9OhcjWX2TC8KS+eux2gUG8HO
         TDMWnbMcHwf4rwUP1UpApTSqoWyJjRqb5b7lExMbQeNFe2RcVDCRh0syI6OEN8V6EgYe
         ahkJs6TiLAxwGoPswhEtXf0Z4Vz577NhVQr2FCLngTYFAjmdBy74107t17yCVp9gkGAm
         t7/Ng9TKWD9ww8JsuDJ8CLddnl7ML15r1fisyT6FCvbxTFvSSJ00r8fnikn0bSPd4t5O
         mUSj4g31zMpggLEYYkrZn59Ht8ujlEtLFYhTCjqZJFKSY+Jv27DYbFSpEsUF0PMGwFB3
         Yi/w==
X-Forwarded-Encrypted: i=1; AJvYcCWwiJZZjD9/jm5hZyQ8W5BW8yQw/mFWimpZfF/DH7LlsZLO+2PBaoTqg6z+Qz9YmzTG7UK4hMZBW8uG3Fwy59iPZQxFAehCwmOlr/BmQ71hR4yWqIt9pbqjUTyZOEe0oY3vSrmCVCFdzVQQOg==
X-Gm-Message-State: AOJu0YxiL9IGuUmdqtp7ddayNR9FLW9qjg15z7LXRigfbKCc8If0revC
	LP7xukkHuANXqB9Hqd6v4DwdnEaVX8GrdW0HO2pteGwu/Rt4S1ml7U/sghX56HsK6Yofxe/uMXU
	LnQUu5BKnKiR6KiEREayCMVhKShI=
X-Google-Smtp-Source: AGHT+IE9uDJq3G5ntysqFKKv18zGU7mP9ARbny08OKRkjg7To2BLgG0cfYT92khriItZCFxEBInnfZHBNEl1caa/d8I=
X-Received: by 2002:a05:6402:11c8:b0:57c:6d1c:3cee with SMTP id
 4fb4d7f45d1cf-5879f3ac6f6mr5350840a12.14.1719866485011; Mon, 01 Jul 2024
 13:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com> <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
In-Reply-To: <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2024 13:41:13 -0700
Message-ID: <CAF6AEGt2zX5anreTLnMFEiPToGFJdgYZHHpqJfUtaOkdr+Wbbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:49=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> Introduce a new API msm_iommu_disp_new() for display use-cases.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_io=
mmu.c
> index a79cd18bc4c9..0420bdc4a224 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -343,6 +343,17 @@ static int msm_gpu_fault_handler(struct iommu_domain=
 *domain, struct device *dev
>         return 0;
>  }
>
> +static int msm_disp_fault_handler(struct iommu_domain *domain, struct de=
vice *dev,
> +                                 unsigned long iova, int flags, void *ar=
g)
> +{
> +       struct msm_iommu *iommu =3D arg;
> +
> +       if (iommu->base.handler)
> +               return iommu->base.handler(iommu->base.arg, iova, flags, =
NULL);
> +
> +       return -ENOSYS;
> +}
> +
>  static void msm_iommu_resume_translation(struct msm_mmu *mmu)
>  {
>         struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(mmu->dev=
);
> @@ -434,6 +445,21 @@ struct msm_mmu *msm_iommu_new(struct device *dev, un=
signed long quirks)
>         return &iommu->base;
>  }
>
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long qui=
rks)
> +{
> +       struct msm_iommu *iommu;
> +       struct msm_mmu *mmu;
> +
> +       mmu =3D msm_iommu_new(dev, quirks);
> +       if (IS_ERR_OR_NULL(mmu))
> +               return mmu;
> +
> +       iommu =3D to_msm_iommu(mmu);
> +       iommu_set_fault_handler(iommu->domain, msm_disp_fault_handler, io=
mmu);
> +
> +       return mmu;
> +}

Hmm, are we using dev drvdata for the display pdev?  If
dev_get_drvdata() returns NULL for display pdev, we could get away
without having a different fault handler.

BR,
-R

> +
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gp=
u, unsigned long quirks)
>  {
>         struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.=
h
> index 88af4f490881..730458d08d6b 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -42,6 +42,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, st=
ruct device *dev,
>
>  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gp=
u, unsigned long quirks);
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long qui=
rks);
>
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *=
arg,
>                 int (*handler)(void *arg, unsigned long iova, int flags, =
void *data))
> --
> 2.44.0
>

