Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED53427EB0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Oct 2021 06:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhJJESk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Oct 2021 00:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhJJESk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Oct 2021 00:18:40 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4A7C061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 21:16:42 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id o4so19482431oia.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 21:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9dKksHyZGIoBAPrBU/GqwD12Fnz5BhKh8zQvkAEnzwI=;
        b=iCjZiCxoSer6nwXKtggrDTz0n8s8SkVXF46eVVf+dAXR7iAWmg2pOFnaz+uVwYkvcR
         8r/6AvZwj+EfCRbp3HGARx5fYbAxihUt6E+Frj2tjhGXpfgMKKn5CZMd1RxmMpW9QdVt
         dXTbLisBUVmNM6Wdyhbgny2tJnO6R5EF4qqH5xTBbfvGCr6FIHoUwiISBgEWodBNl+Mb
         //n8m5+LA2xS9jwEkiXTxHsVZtLeeYM1OanjAvYd1xRdnlcA7HvDjCQH2IyTvcMCUCBt
         q3SDVuwNDLKDrfRJmpBg+F5Ety22YhHWZsbkgTfcKBe1FD8ZYqLbziAGwiT2warMuoMO
         7L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9dKksHyZGIoBAPrBU/GqwD12Fnz5BhKh8zQvkAEnzwI=;
        b=55vpPFzWROU547eF7eyOyHNGvVVYNkFLYhy31VwrBmseNasstJSlQEz84IlcjtBu+X
         PFCqO/+GszoFJwMoTnKTw+6erIyzso1PMxCwVDiNh189uA0rPOANtmoobWAdauW1oD/Y
         f9jd5ARlrMgn7wxbDV6Pw7MeyzsiceI53LPjcFkndZ6AHwZ4RftCRKsiMK4liAlpWtlh
         16SE1PT7lpzM/Vs4wTH0xIzJxM3OWoczwwmcJvrZOmqdBNlswYkNTJc/xXzCNzvUly53
         XGsltZkWNA1Ova5BvnYt54MT+4A1qF0ttYk8N/5UQ7+/AA0b1JZ4RxhzcrAhCaoAMSZy
         h2cw==
X-Gm-Message-State: AOAM533PqOpGaAVxVdP/c30Rzn/wsz5dUIhQhbdHK6N2BSXdSzlUJQF/
        POLOiJoAvCICM1IEm83CI38QEw==
X-Google-Smtp-Source: ABdhPJxnOE3APNnnhnQmDWVAu7V3BvKoUVtdoeSGZ4XRGgWVmuQ54HqxcfsBWYHkiC1jZ4YcsSvprA==
X-Received: by 2002:a05:6808:1816:: with SMTP id bh22mr13248863oib.69.1633839401460;
        Sat, 09 Oct 2021 21:16:41 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:c84c:8eff:fe1e:256f])
        by smtp.gmail.com with ESMTPSA id 38sm907603oti.13.2021.10.09.21.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 21:16:40 -0700 (PDT)
Date:   Sat, 9 Oct 2021 23:16:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <treding@nvidia.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
Message-ID: <YWJpJnaQ2Nr4PUwr@yoga>
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 09 Oct 21:33 CDT 2021, Dmitry Baryshkov wrote:

> After commit 424953cf3c66 ("qcom_scm: hide Kconfig symbol") arm-smmu got
> qcom_smmu_impl_init() call guarded by IS_ENABLED(CONFIG_ARM_SMMU_QCOM).
> However the CONFIG_ARM_SMMU_QCOM Kconfig entry does not exist, so the
> qcom_smmu_impl_init() is never called.
> 
> So, let's fix this by always calling qcom_smmu_impl_init(). It does not
> touch the smmu passed unless the device is a non-Qualcomm one. Make
> ARM_SMMU select QCOM_SCM for ARCH_QCOM.
> 

Arnd's intention was to not force QCOM_SCM to be built on non-Qualcomm
devices. But as Daniel experienced, attempting to boot most Qualcomm
boards without this results in a instant reboot.

I think it's okay if we tinker with CONFIG_ARM_SMMU_QCOM for v5.16, but
we're getting late in v5.15 so I would prefer if we make sure this works
out of the box.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 424953cf3c66 ("qcom_scm: hide Kconfig symbol")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/iommu/Kconfig                      | 1 +
>  drivers/iommu/arm/arm-smmu/Makefile        | 3 +--
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 9 +++++++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index c5c71b7ab7e8..a4593e53fe7d 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -309,6 +309,7 @@ config ARM_SMMU
>  	tristate "ARM Ltd. System MMU (SMMU) Support"
>  	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
>  	select IOMMU_API
> +	select QCOM_SCM
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select ARM_DMA_USE_IOMMU if ARM
>  	help
> diff --git a/drivers/iommu/arm/arm-smmu/Makefile b/drivers/iommu/arm/arm-smmu/Makefile
> index b0cc01aa20c9..e240a7bcf310 100644
> --- a/drivers/iommu/arm/arm-smmu/Makefile
> +++ b/drivers/iommu/arm/arm-smmu/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_QCOM_IOMMU) += qcom_iommu.o
>  obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
> -arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o
> -arm_smmu-$(CONFIG_ARM_SMMU_QCOM) += arm-smmu-qcom.o
> +arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o arm-smmu-qcom.o
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 2c25cce38060..8199185dd262 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -215,8 +215,13 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
>  		return nvidia_smmu_impl_init(smmu);
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
>  	if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
>  		smmu->impl = &mrvl_mmu500_impl;
> -- 
> 2.30.2
> 
