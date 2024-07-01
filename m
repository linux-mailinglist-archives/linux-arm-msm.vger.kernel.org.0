Return-Path: <linux-arm-msm+bounces-24830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F391E8AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44EC8B20FAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E235416EBE7;
	Mon,  1 Jul 2024 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UkYrT3Z+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6131116D9BA
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862447; cv=none; b=EYI1JOdMIXfs0ET9pZjSCKJU2UTeZA6CPafyFPu4iZEbQ0sQfo0CYb1Pxd14utlM6EX+TE9qjSGCTkjHQ7Bi7pqcY46e3DBlQ0NCXgBb7chiQVaP8yPm/T5jP0hWf9O0Ub12eMaeA5t3KnGyPQyczwzLkIfqpFbeNjgwahUHm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862447; c=relaxed/simple;
	bh=GqWUmN8vicjOeJLEWfrNOVZ7nMrI1gyKg60+lcC4I1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtGQxU//2OYZygQIX1Jq7ZWrSGy2+tCT4txl0cOjzm3zcbWdOB2BKnpENFM7q/jwuS6jf611MAzlUMc3GePiMeOyi7L64OSWvxrLu2waiFUyA9wSmqziIjzwgYyrA1BGanUQ0iSZLHiwdnDwug6BluYayxOcZw1HMAbhyYQjQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UkYrT3Z+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d00a51b71so10919a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719862445; x=1720467245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLv8nBE8MAPhTzu4Pe0VYjku1Tl2AHNOOkQcp9/ZdEI=;
        b=UkYrT3Z+TEeHrV78imRJgHbDy8CT1OVHRqGhXNg+5ATAbTL3UH/C4ewstxiqyPZp7A
         aczq0w5SpV3trPgfrzNI7jBSQqFdFbfBow9l6Im4m66vk0oEPkLGt1LfkZ7jCJXDKzzQ
         //BrzNfnG4N0cdqi9rHqvqPL94qoYJWlTU+xYqPggQ9W5sswxNNvN3VAFt54bB91cepn
         q8BIpZh82cq0z1+0lOT4jxR/7yMzDS8qoDZLRElRR7eYz47BNd76XCbh+7qqG2uU7VRf
         h4hSHI96jdo5/CQagFlXbhZKFtUxUbO+WtAiKePC3deik3cWfrk4sEjNLLNkmkSucWC6
         mtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719862445; x=1720467245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLv8nBE8MAPhTzu4Pe0VYjku1Tl2AHNOOkQcp9/ZdEI=;
        b=ulyrwqTN2Pa8eOw3pbfzS5BuFz/8xTkhleeaZU/oHV/LZfEvvKmor4/Bhi+uQqC5Ne
         x0B/P41LEpvNM6d3wY3358u4SCljkLesix2sTD5pE7nLUrfmHK4Z87VZnGOZ2/lRRqnS
         mPCDp9h46MQ84sX1G65dybgD/429iZHOuEMGkBYzUyjiQtpk7gPhhJrkDpFXpsECs1FY
         jXzqu1xRQyVeB+XE1w4NTus7AwLbRlvH/L9jw3GGqYkVeA+B6NOTtxHU8qCg/qoHRlaP
         MeDZ4phRrRi4repb5FLUnCFQtKAe+ZCVNyxQmymB6sd3KLlQyq8qlyEnLG9FERVT4VOH
         qv2w==
X-Forwarded-Encrypted: i=1; AJvYcCVY9kSRzsvl4RnAoeTm+Vg7hL/qccrIeo0hSb8KafUzG/HNTswlbFM0raTnrblwmJIrZ7U7XDbNt8PAsS2Gg9HVp+HLo7Y5DkEBkO9YBw==
X-Gm-Message-State: AOJu0YyP6cle7B6UeRON+zNNiDaTFxp8C0RdrRaM7O2MZxyJNUAbD7X6
	HOQiJQEYBz1c+sNwNu3GYMGNtRN4Mm3p2ueCY7oUV7+Uk/yjCX0pmX4TxfgraCVuYcana+8wJFX
	WsuoT9wpabCpVxeFoijiX9bknIwLT+8i8Zv2b
X-Google-Smtp-Source: AGHT+IHXcfFF7nEh7bzw1aPRlCKzpCzTU07EXQDKT9/pl7Y576hP+SUgYE1Vu8uRmhB5tC6qEWbDsk816Q4QLs3uQtc=
X-Received: by 2002:a50:9308:0:b0:57d:32ff:73ef with SMTP id
 4fb4d7f45d1cf-5872f79a720mr442372a12.6.1719862444542; Mon, 01 Jul 2024
 12:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701162025.375134-1-robdclark@gmail.com> <20240701162025.375134-3-robdclark@gmail.com>
In-Reply-To: <20240701162025.375134-3-robdclark@gmail.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Tue, 2 Jul 2024 01:03:52 +0530
Message-ID: <CAN6iL-TV3OGN4eDx6yG9u9Y-2tEn6NS9B3Vq5ijAoFvJ71PssQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iommu/arm-smmu-qcom-debug: Do not print for
 handled faults
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 9:50=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Handled faults can be "normal", don't spam dmesg about them.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index e4ee78fb6a66..681fbdfc325d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -419,10 +419,6 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *d=
ev)
>         tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
>                                  fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_F=
AULT_WRITE : IOMMU_FAULT_READ);
>         if (!tmp || tmp =3D=3D -EBUSY) {
> -               dev_dbg(smmu->dev,
> -                       "Context fault handled by client: iova=3D0x%08lx,=
 fsr=3D0x%x, fsynr=3D0x%x, cb=3D%d\n",
> -                       iova, fsr, fsynr, idx);
> -               dev_dbg(smmu->dev, "soft iova-to-phys=3D%pa\n", &phys_sof=
t);
>                 ret =3D IRQ_HANDLED;
>                 resume =3D ARM_SMMU_RESUME_TERMINATE;
>         } else {
> --
> 2.45.2
>
Seems consistent with the arm_smmu_context_fault handler.
Reviewed-by: Pranjal Shrivastava <praan@google.com>

