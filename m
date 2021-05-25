Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EBF38F92C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 06:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhEYEEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 00:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhEYEEz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 00:04:55 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D1CC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 21:03:25 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id y76so19818822oia.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 21:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6tmkFwE9gEojemy41RKVeGqItGxaoarfu1zkeWiXbe4=;
        b=hf0kiOizuF9L+wlT35AN8K5vbzNTM0goou8lM4qeIntSrU77A/Ea8njGkzZIlhDOWD
         JUhK6rDcHXUyVeurIBsKcMsVwoHmCBRGWnRDLqB7tPMaDEf6caRX/Rnmjb+elcQiqZX9
         w9SvrroR00FtL2rgqcACAZbj8XxvLUO7K9xtZvKMc/ceJFLJb0+7H6Xami1qx5huAmzp
         6LjkYCl1Ruj9IBHmYl0N63J1JQ2KxjLewROEOUwDehf15OTob/+u1FHb3+ySeIxbLag9
         kWcdT5pfvtjQRmP+ue2wLNPoEdX2hKCCyVhm1SyVfeagU/slCOUyiLybB7M2D9fTz8cW
         piiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6tmkFwE9gEojemy41RKVeGqItGxaoarfu1zkeWiXbe4=;
        b=EcwRUQhpqJlIu21+Bg7bntKjBFDCnOQJKQAegdB8J2/LA9Du4/UkgRgXUYWEtxmVx8
         YwEcVmoJXFkctuDtkQzaPGPwLM3TPUiWKYvR9aQDBty575kdFPnRjFh1NUg7KamMF/pz
         E0VT5qDCaU6cq4GavxJ792vfTSf7/qn5qo3IfFTd914QU4Z240Q7/RLDH5i+UxFXplpz
         /tFH+V0yT1zNccmZjtMecvPbwmctnDVV2Byd4dqgd5pAwzt1tguG0DoADY9GC6BRv4eT
         NRRK1pHc/HxEChZ3wonSyCetacICvwGlUNA8NhIEVbtcyFD8tL2Ys9QVi5FRaETmwKvS
         2R+w==
X-Gm-Message-State: AOAM531s9341vBMCbS99mBLtjWJ4qaNts/KrJfFDxCKmLqhzjti0mXpW
        3XGPsFDfN7jj11TenTEfhwGoFg==
X-Google-Smtp-Source: ABdhPJxPc5Dt8YG6neMXiB44kx2vOieWPtfSC1+ziJQvCr9LXCWJR5tIEr7OzJ1Mw6NeT8EhwXgVag==
X-Received: by 2002:aca:d596:: with SMTP id m144mr1480959oig.172.1621915404846;
        Mon, 24 May 2021 21:03:24 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k21sm3454117otr.3.2021.05.24.21.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 21:03:24 -0700 (PDT)
Date:   Mon, 24 May 2021 23:03:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCHv3 1/2] iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
Message-ID: <YKx3CiSYshq6BM1f@yoga>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
 <b1ab02b5bcb5e0aab71e2649468ce82bd6d5ca49.1618898456.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1ab02b5bcb5e0aab71e2649468ce82bd6d5ca49.1618898456.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 20 Apr 01:04 CDT 2021, Sai Prakash Ranjan wrote:

> Add compatible for SC7280 SMMU to use the Qualcomm Technologies, Inc.
> specific implementation.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 98b3a1c2a181..bea3ee0dabc2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -166,6 +166,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7180-mss-pil" },
> +	{ .compatible = "qcom,sc7280-mdss" },
>  	{ .compatible = "qcom,sc8180x-mdss" },
>  	{ .compatible = "qcom,sdm845-mdss" },
>  	{ .compatible = "qcom,sdm845-mss-pil" },
> @@ -330,6 +331,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,msm8998-smmu-v2" },
>  	{ .compatible = "qcom,sc7180-smmu-500" },
> +	{ .compatible = "qcom,sc7280-smmu-500" },
>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>  	{ .compatible = "qcom,sdm630-smmu-v2" },
>  	{ .compatible = "qcom,sdm845-smmu-500" },
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
