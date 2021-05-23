Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA95038D93B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 May 2021 08:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhEWGGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 02:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhEWGGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 02:06:39 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562C2C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 23:05:12 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x18so13868965pfi.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 23:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=csGLr+TPRSaesVp+pLDCPAxv5f52IL07+7qSuKKfT4U=;
        b=hl/Cc7/o3SbtJXsvK2IDLrJvO7F4/vCDVugF/rngNU6CA/j5AwJc/se12THbzFaciV
         4h5JX/YxcebPocf6BumqT8oM1TG9rwmSsrH5XcI19PjrIJgGRP3AzdjAW7qAv4uP9VlU
         v1AHUXMm/IouPKjifulK30MlDKG0NklOo/TtU/08WqIGADkuJuEwrzWjnqSZY9xjIh+m
         /uPvis8rJxf0rsngO7A5+lia4Tbb1vrmQCQkHfaqyOIGTF+GPA4jgtA3ENyi6lglmXXb
         N7LkiKaGBdU6dZKwgIrtrIR6VpxiFq3vy7j8Iddw0k37xyQhQbYkxLj/f+nYGpP5zEeB
         YWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=csGLr+TPRSaesVp+pLDCPAxv5f52IL07+7qSuKKfT4U=;
        b=KLZFaTND2zOQRlF/LG6NEpsd3yZbinIhms2VlotUL7QeGva2LehXSA2aI+6DMZNV4T
         7148YM4xdaPx6WEA3zLQtDye+cmGrfrqplT4gCxk5gcpknVk9wRp5B3se5SymBmlncGW
         Uhqn+qfC0lIP0zO6eULQHhRDzpfJ+Ik60kU9xtv71GHPjs7COFjfpnsuvAJ7v2ksTQ1A
         YpH6cIt4yd6PIhU53xtd1MD3ikcDaRKer/ajMHJyseU11YdsRDQExgEvM95kxHaS3QRG
         tpXExUs4yV6I9YIn+TgLRHjYt3wsvXPEevHVG9Wlwkw8c42+ABXdQOh6JK2BsOK9ZxOn
         0W/A==
X-Gm-Message-State: AOAM531hvOFUJqlDst0XmVkF/rJoNQXnF2+3w+2lYvtb7jvDJ3zZTWIM
        YLOZwQQRjLQoINUSLJB9XNRW3w==
X-Google-Smtp-Source: ABdhPJwi3UqwjLuznY5enwHu8cfXccUM/d95Nyw4XH7+A0EGAQ94i92P7B5eDHF7uRi2IzA7GA45bg==
X-Received: by 2002:a63:5a5d:: with SMTP id k29mr7270030pgm.215.1621749911778;
        Sat, 22 May 2021 23:05:11 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g72sm7828495pfb.33.2021.05.22.23.05.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 May 2021 23:05:11 -0700 (PDT)
Date:   Sun, 23 May 2021 14:05:06 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI
 boot
Message-ID: <20210523060505.GB29015@dragon>
References: <20210509022607.17534-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509022607.17534-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 09, 2021 at 10:26:07AM +0800, Shawn Guo wrote:
> The hookup with qcom_smmu_impl is required to do ACPI boot on SC8180X
> based devices like Lenovo Flex 5G laptop and Microsoft Surface Pro X.
> Define acpi_platform_list for these platforms and match them using
> acpi_match_platform_list() call, and create qcom_smmu_impl accordingly.
> 
> (np == NULL) is used to check ACPI boot, because fwnode of SMMU device
> is a static allocation and thus helpers like has_acpi_companion() don't
> work here.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v3:
>  - Call acpi_match_platform_list() to match platform in qcom smmu
>    driver rather than IORT code.

Hi Robin,

How does this version look?

Shawn

> 
> Changes for v2:
>  - Rather than using asl_compiler_id in IORT table, follow suggestion
>    from Robin Murphy to use acpi_match_platform_list() to match platform.
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 98b3a1c2a181..f7e187f3fa66 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/adreno-smmu-priv.h>
>  #include <linux/of_device.h>
>  #include <linux/qcom_scm.h>
> @@ -339,10 +340,22 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ }
>  };
>  
> +static struct acpi_platform_list qcom_acpi_platlist[] = {
> +	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
> +	{ "QCOM  ", "QCOMEDK2", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
> +	{ }
> +};
> +
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
>  	const struct device_node *np = smmu->dev->of_node;
>  
> +	if (np == NULL) {
> +		/* Match platform for ACPI boot */
> +		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
> +			return qcom_smmu_create(smmu, &qcom_smmu_impl);
> +	}
> +
>  	if (of_match_node(qcom_smmu_impl_of_match, np))
>  		return qcom_smmu_create(smmu, &qcom_smmu_impl);
>  
> -- 
> 2.17.1
> 
