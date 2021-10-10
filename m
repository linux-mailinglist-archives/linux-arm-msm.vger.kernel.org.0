Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8EA427EF3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Oct 2021 06:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhJJEgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Oct 2021 00:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhJJEgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Oct 2021 00:36:11 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D93AC061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 21:34:13 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id w9-20020a4adec9000000b002b696945457so3710288oou.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 21:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oS3/7Iu8XaPwbDFyRTMleM8YCizK9D6llJsSxGhaoZk=;
        b=SEDuDwvxsH2QVF7SHxwlWidbjjslBC9HcB3wX9ErK+x+/nEFa2IyjzOhtAu1kLxXet
         buQvB5yR3jH4Q+FPja2FK8Vux56XYLiMAQyXzqeUjb0PKQmCpimI+LPw4KDEmycjRKop
         lkK/5Zv3g7COM7QSep84giDmz4EviwuZcExXjSdXPK9xDCT4LzulXS3XavDIAhklXGDG
         +BGXHHzpl2hNhnxOnyHV/0Tk95v4FJ/K1PBY0/ClBvjBMhYJp3yiqvrMXjQMX8k+RVvO
         z6InxZihbD8YYZ+EoHjwvjh4Y/J+n61Veqk129gbKC6lCs5BRQa9QSInnB4HWyjyY2Bg
         RGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oS3/7Iu8XaPwbDFyRTMleM8YCizK9D6llJsSxGhaoZk=;
        b=18vN1KkDj6oGKkBrlQFegNEWVDGcBsDgU3uFJEfihZu7UbioooIYqRNYZHMffJxirV
         0vtjd0e21LIz6XeqAXjNvX4SAiwknpua30qpbv6XdWYd42PgPTR5tbXu9aoO0o31fPWW
         NMSJystulbYXr1wvzuUXqiJ/HKdVzpxgSWVTpBrKrrKWIB+qcOf2WPbOBPr3Sgr6GBeb
         2FVyXX7gT7FVhTLXjYdg6/RoyH2Q14zJo6jUpqXpqbss699ix0IdLs52dBvqDEOpru5T
         +kzRSaDOhl8mSCzglcyjQS3xRdJYFpN9UeXCp+VBdBzMWLFxVJzql+x6jYQTpQeBWQOA
         6SaA==
X-Gm-Message-State: AOAM530mKZ3uNEFLoC1QudrmOZpP3gzVfZLjwxtRNOuBIYXU1FE33hTz
        cwyK16roMtRlYsOd75eQ4SOoCQ==
X-Google-Smtp-Source: ABdhPJzrwmeoXn6Y5xr6p12gTvhnt86mUjAglqoTyIVyPu75x5wt5v/wozGrKV4qeXn1YjW2BaTrBw==
X-Received: by 2002:a4a:b64b:: with SMTP id f11mr14083092ooo.18.1633840452285;
        Sat, 09 Oct 2021 21:34:12 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id n7sm899946oij.46.2021.10.09.21.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 21:34:11 -0700 (PDT)
Message-ID: <defac383-4a87-9a1c-86f1-4dde49dd9d2f@kali.org>
Date:   Sat, 9 Oct 2021 23:34:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <treding@nvidia.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/9/21 9:33 PM, Dmitry Baryshkov wrote:
> After commit 424953cf3c66 ("qcom_scm: hide Kconfig symbol") arm-smmu got
> qcom_smmu_impl_init() call guarded by IS_ENABLED(CONFIG_ARM_SMMU_QCOM).
> However the CONFIG_ARM_SMMU_QCOM Kconfig entry does not exist, so the
> qcom_smmu_impl_init() is never called.
>
> So, let's fix this by always calling qcom_smmu_impl_init(). It does not
> touch the smmu passed unless the device is a non-Qualcomm one. Make
> ARM_SMMU select QCOM_SCM for ARCH_QCOM.
>
> Fixes: 424953cf3c66 ("qcom_scm: hide Kconfig symbol")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/iommu/Kconfig                      | 1 +
>   drivers/iommu/arm/arm-smmu/Makefile        | 3 +--
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 9 +++++++--
>   3 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index c5c71b7ab7e8..a4593e53fe7d 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -309,6 +309,7 @@ config ARM_SMMU
>   	tristate "ARM Ltd. System MMU (SMMU) Support"
>   	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
>   	select IOMMU_API
> +	select QCOM_SCM
>   	select IOMMU_IO_PGTABLE_LPAE
>   	select ARM_DMA_USE_IOMMU if ARM
>   	help
> diff --git a/drivers/iommu/arm/arm-smmu/Makefile b/drivers/iommu/arm/arm-smmu/Makefile
> index b0cc01aa20c9..e240a7bcf310 100644
> --- a/drivers/iommu/arm/arm-smmu/Makefile
> +++ b/drivers/iommu/arm/arm-smmu/Makefile
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_QCOM_IOMMU) += qcom_iommu.o
>   obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
> -arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o
> -arm_smmu-$(CONFIG_ARM_SMMU_QCOM) += arm-smmu-qcom.o
> +arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o arm-smmu-qcom.o
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 2c25cce38060..8199185dd262 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -215,8 +215,13 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
>   		return nvidia_smmu_impl_init(smmu);
>   
> -	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
> -		smmu = qcom_smmu_impl_init(smmu);
> +	/*
> +	 * qcom_smmu_impl_init() will not touch smmu if the device is not
> +	 * a Qualcomm one.
> +	 */
> +	smmu = qcom_smmu_impl_init(smmu);
> +	if (IS_ERR(smmu))
> +		return smmu;
>   
>   	if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
>   		smmu->impl = &mrvl_mmu500_impl;

Without this applied, my Lenovo Yoga C630 just boot loops with 
424953cf3c66 applied when it gets to the smmu.  This fixes it.

Tested-By: Steev Klimaszewski <steev@kali.org>

