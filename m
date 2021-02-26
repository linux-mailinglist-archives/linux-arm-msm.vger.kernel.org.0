Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB54326501
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 16:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhBZPwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 10:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhBZPwj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 10:52:39 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACD3C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 07:51:56 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id k2so4631290ioh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 07:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=PmQJ/wCqtIlu3S88Te9ir+UW9MMaqsG5GrPeEyYHyh0=;
        b=aZY/J7anpYuk/uRjqkDTGMWbd9MZU4rUpdc7WUZU1OEKm9FUJhYZXTkGrFOY3dWy+A
         I8HBk0MTBD2QSpQ9AqUcnTdY7xPqYuYBzsk/UEshMmR5zD7WpAZDeFQLagx8Rwm9lDxB
         G4IM/pwK4tHUcx5btcObn3Em5OMwtuaHj7keYF/iYrxZpFX3KyTLutncyzOWfY18zS/x
         +wvwWmKRQWh6Ar2k40OiAjrkhlteJfCQ8nfv3ZJXCKRnb4/qQuJn4Y//y4gyjXhM39Bd
         v/f1yryI5vqGtfeTwqsFf8jyEJW5BUvwgSh1+H/tg1I6TYe5vN8vokcGbP270w9phUSd
         49Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=PmQJ/wCqtIlu3S88Te9ir+UW9MMaqsG5GrPeEyYHyh0=;
        b=k2anoLKyqBDW/zbvF3jLIjCyBFX5DaehJtlAUhZ/qVisDrJeGiU/pnTDgdO+snVXYn
         iQ1bmCZXIHJW0w2xcMkr7OQAR/KTPDFkz3Jtu+DoECecxpTMUaNOjTRUtOfvpjkpdyFo
         8l5ExQ5cPO0TERqXP+Godi2lTRNC5TSh4VzO1T4zrCYBl8YxTPY9tETaRfEKMUfZOwnT
         TFe46zJtC61sANAM6aGehLclGTMEWW38RtP47xQOyZNtFdU7B3tcwy/V0fIn2JCuz3RQ
         juFfAIOoH5MfRQwMnpWNTa3vRSl5+GR1H375U7LMxFpdD6RFjwdMrzlZAwEOsfz7c+pZ
         su9g==
X-Gm-Message-State: AOAM531+DgD9wtX3b4C3oLdTs36BJ4t6gr8VBqq89SJrE6vONQngEKNk
        0Ni5QVK6KQNsffDgbI0YjdWcVg==
X-Google-Smtp-Source: ABdhPJybY+lyWGeUH63O9EiT5RbFYk40RqM956Cpnw1zMp2nsbHLSjayPHOEFz7mm78dvhz8ZRfB1g==
X-Received: by 2002:a05:6638:bcb:: with SMTP id g11mr784354jad.96.1614354716291;
        Fri, 26 Feb 2021 07:51:56 -0800 (PST)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id e2sm5451041iov.26.2021.02.26.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:51:55 -0800 (PST)
Date:   Fri, 26 Feb 2021 08:51:53 -0700
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
Message-ID: <20210226155153.hzcesc2gr2qmleh2@cosmicpenguin.net>
Mail-Followup-To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <c607d71eb0fe507c8b83cc0ea9b393777f22149a.1614332994.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c607d71eb0fe507c8b83cc0ea9b393777f22149a.1614332994.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 26, 2021 at 03:25:40PM +0530, Sai Prakash Ranjan wrote:
> Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
> both implement "arm,mmu-500" in some QTI SoCs and to run through
> adreno smmu specific implementation such as enabling split pagetables
> support, we need to match the "qcom,adreno-smmu" compatible first
> before apss smmu or else we will be running apps smmu implementation
> for adreno smmu and the additional features for adreno smmu is never
> set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
> and adreno smmu implementing "arm,mmu-500", so the adreno smmu
> implementation is never reached because the current sequence checks
> for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
> specific impl and we never reach adreno smmu specific implementation.
> 
> Suggested-by: Akhil P Oommen <akhilpo@codeaurora.org>

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index bea3ee0dabc2..03f048aebb80 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -345,11 +345,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
>  	const struct device_node *np = smmu->dev->of_node;
>  
> -	if (of_match_node(qcom_smmu_impl_of_match, np))
> -		return qcom_smmu_create(smmu, &qcom_smmu_impl);
> -
> +	/*
> +	 * Do not change this order of implementation, i.e., first adreno
> +	 * smmu impl and then apss smmu since we can have both implementing
> +	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
> +	 * features if the order is changed.
> +	 */
>  	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
>  		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
>  
> +	if (of_match_node(qcom_smmu_impl_of_match, np))
> +		return qcom_smmu_create(smmu, &qcom_smmu_impl);
> +
>  	return smmu;
>  }
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
