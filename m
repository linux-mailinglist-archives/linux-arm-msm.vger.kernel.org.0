Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311AA38F919
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 05:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhEYEAS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 00:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhEYEAS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 00:00:18 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A54C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 20:58:48 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so16173619otk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PYCLMkEW+70ZigxLY6fmQ8dsM2q44x8Y2+ykUv3XIXI=;
        b=H/DNaR8iAlpSqa0esisrNprCRmPr13QukJqyvgKoswi/uVSRceh8FbYO0f0yn8wWr2
         5CxdFWvAqaandf7G4vv2VMokMy8X5uWVh4cXcK4HAER3PBoCW0Y4HtzoeDWl66MO6dJG
         Wauw5mQMhH1SEPq3IdTEFF0NJMZkCP7B0dHxRU0jZhmyZTl1QFYwILexn5De6rQ3wGw6
         DY1TkP7fHk+5dhtVBzIdhBKmFXi8aQaD8jyGRx55FyI+l/g0EVHIZZZYx9IaGFFpgrRt
         0EeC6i/xjruU4te9J3va4X8xT62jGLkA8yfvhNCQ/kLabt6QioFKbJENa2+UGEOImzdY
         jXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PYCLMkEW+70ZigxLY6fmQ8dsM2q44x8Y2+ykUv3XIXI=;
        b=VqB5SKGRB5xXSfBXxDMF7/sJHTtF8NzlXsp1dRqJdtVarYbHTwLYJMv6KlIXUgvOYl
         VGibN3SBlR7z5n505gNtZzqkYaJMtsPHDRt72fTCq2pbLs34c6tdtqJHFucdTUQmHNeR
         /3Duzv6e9E8rKUmTnH3mxuDyLfFxgdvlKWjAcZIFCzGZaSxO/66gy2WUxinh3ShEbKOl
         uyN6yJwER6DZ+HbXrCCqMgycz+fX8PPgnwkTn7iZrEb6gBLIMzz8rDbJ6H2w/u1CkhYr
         g8rgkAMEIb6b8aJovRo0OQhSzeqUl9LQKMcqx4biuygJ52EXzAI9yS9ilQXOjCMZBPTZ
         50og==
X-Gm-Message-State: AOAM533ZGrI0bW9BEyNo+tJomkiqqe3uRKzmBpsrrAqn/4khm5W8v5cc
        qp+vKq6ELDhe9skBkx3jeBfQbg==
X-Google-Smtp-Source: ABdhPJyZXjYefLWliDSQvzVJp/OI2fPtOpIRZ7Tdcbr5odCMqVIiAaZVb8gEVfZxmY1u5CrCa2S9kg==
X-Received: by 2002:a05:6830:1687:: with SMTP id k7mr22164926otr.220.1621915128032;
        Mon, 24 May 2021 20:58:48 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 35sm3587790oth.49.2021.05.24.20.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:58:47 -0700 (PDT)
Date:   Mon, 24 May 2021 22:58:45 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI
 boot
Message-ID: <YKx19fppKVGXhH45@yoga>
References: <20210509022607.17534-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509022607.17534-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 08 May 21:26 CDT 2021, Shawn Guo wrote:

> The hookup with qcom_smmu_impl is required to do ACPI boot on SC8180X
> based devices like Lenovo Flex 5G laptop and Microsoft Surface Pro X.
> Define acpi_platform_list for these platforms and match them using
> acpi_match_platform_list() call, and create qcom_smmu_impl accordingly.
> 
> (np == NULL) is used to check ACPI boot, because fwnode of SMMU device
> is a static allocation and thus helpers like has_acpi_companion() don't
> work here.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v3:
>  - Call acpi_match_platform_list() to match platform in qcom smmu
>    driver rather than IORT code.
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
